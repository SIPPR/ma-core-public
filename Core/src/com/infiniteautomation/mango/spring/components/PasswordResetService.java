/**
 * Copyright (C) 2017 Infinite Automation Software. All rights reserved.
 */
package com.infiniteautomation.mango.spring.components;

import java.io.IOException;
import java.net.InetAddress;
import java.net.URI;
import java.net.UnknownHostException;
import java.security.KeyPair;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.AddressException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponentsBuilder;

import com.infiniteautomation.mango.jwt.JwtSignerVerifier;
import com.infiniteautomation.mango.util.exception.NotFoundException;
import com.serotonin.m2m2.Common;
import com.serotonin.m2m2.db.dao.SystemSettingsDao;
import com.serotonin.m2m2.db.dao.UserDao;
import com.serotonin.m2m2.email.MangoEmailContent;
import com.serotonin.m2m2.i18n.TranslatableMessage;
import com.serotonin.m2m2.i18n.Translations;
import com.serotonin.m2m2.module.DefaultPagesDefinition;
import com.serotonin.m2m2.rt.maint.work.EmailWorkItem;
import com.serotonin.m2m2.vo.User;

import freemarker.template.TemplateException;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtBuilder;

/**
 * @author Jared Wiltshire
 */
@Service
public final class PasswordResetService extends JwtSignerVerifier<User> {
    public static final String PUBLIC_KEY_SYSTEM_SETTING = "jwt.passwordReset.publicKey";
    public static final String PRIVATE_KEY_SYSTEM_SETTING = "jwt.passwordReset.privateKey";
    public static final String EXPIRY_SYSTEM_SETTING = "jwt.passwordReset.expiry";

    public static final String PASSWORD_RESET_PAGE_TOKEN_PARAMETER = "resetToken";

    public static final int DEFAULT_EXPIRY_DURATION = 15 * 60; // 15 minutes

    public static final String TOKEN_TYPE_VALUE = "pwreset";
    public static final String USER_ID_CLAIM = "id";
    public static final String USER_PASSWORD_VERSION_CLAIM = "v";

    private final UserDao userDao;

    @Autowired
    public PasswordResetService(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    protected String tokenType() {
        return TOKEN_TYPE_VALUE;
    }

    @Override
    protected User verifyClaims(Jws<Claims> token) {
        Claims claims = token.getBody();

        String username = claims.getSubject();
        User user = this.userDao.getUser(username);
        if (user == null) {
            throw new NotFoundException();
        }

        Integer userId = user.getId();
        this.verifyClaim(token, USER_ID_CLAIM, userId);

        Integer pwVersion = user.getPasswordVersion();
        this.verifyClaim(token, USER_PASSWORD_VERSION_CLAIM, pwVersion);

        return user;
    }

    @Override
    protected void saveKeyPair(KeyPair keyPair) {
        SystemSettingsDao.instance.setValue(PUBLIC_KEY_SYSTEM_SETTING, keyToString(keyPair.getPublic()));
        SystemSettingsDao.instance.setValue(PRIVATE_KEY_SYSTEM_SETTING, keyToString(keyPair.getPrivate()));
    }

    @Override
    protected KeyPair loadKeyPair() {
        String publicKeyStr = SystemSettingsDao.instance.getValue(PUBLIC_KEY_SYSTEM_SETTING);
        String privateKeyStr = SystemSettingsDao.instance.getValue(PRIVATE_KEY_SYSTEM_SETTING);

        if (publicKeyStr != null && !publicKeyStr.isEmpty() && privateKeyStr != null && !privateKeyStr.isEmpty()) {
            return keysToKeyPair(publicKeyStr, privateKeyStr);
        }
        return null;
    }

    public void resetKeys() {
        this.generateNewKeyPair();
    }

    public String generateToken(User user) {
        return this.generateToken(user, null);
    }

    public String generateToken(User user, Date expirationDate) {
        if (expirationDate == null) {
            int expiryDuration = SystemSettingsDao.instance.getIntValue(EXPIRY_SYSTEM_SETTING, DEFAULT_EXPIRY_DURATION);
            expirationDate = new Date(System.currentTimeMillis() + expiryDuration * 1000);
        }

        JwtBuilder builder = this.newToken(user.getUsername(), expirationDate)
                .claim(USER_ID_CLAIM, user.getId())
                .claim(USER_PASSWORD_VERSION_CLAIM, user.getPasswordVersion());

        return this.sign(builder);
    }

    public URI generateResetUrl(String token) throws UnknownHostException {
        UriComponentsBuilder builder;
        String baseUrl = SystemSettingsDao.instance.getValue(SystemSettingsDao.PUBLICLY_RESOLVABLE_BASE_URL);
        if (!StringUtils.isEmpty(baseUrl)) {
            builder = UriComponentsBuilder.fromPath(baseUrl);
        } else {
            boolean sslOn = Common.envProps.getBoolean("ssl.on", false);
            int port = sslOn ? Common.envProps.getInt("ssl.port", 443) : Common.envProps.getInt("web.port", 8080);
            String hostname = SystemSettingsDao.instance.getValue(SystemSettingsDao.PUBLIC_HOSTNAME);
            if (hostname == null) {
                hostname = InetAddress.getLocalHost().getHostName();
            }

            builder = UriComponentsBuilder.newInstance()
                    .scheme(sslOn ? "https" : "http")
                    .host(hostname)
                    .port(port);
        }

        String resetPage = DefaultPagesDefinition.getPasswordResetUri();

        return builder.path(resetPage).queryParam(PASSWORD_RESET_PAGE_TOKEN_PARAMETER, token).build().toUri();
    }

    public URI generateRelativeResetUrl(String token) {
        String resetPage = DefaultPagesDefinition.getPasswordResetUri();
        return UriComponentsBuilder.fromPath(resetPage).queryParam(PASSWORD_RESET_PAGE_TOKEN_PARAMETER, token).build().toUri();
    }

    public User resetPassword(String token, String newPassword) {
        User user = this.verify(token);
        user.setPlainTextPassword(newPassword);
        user.ensureValid();
        this.userDao.saveUser(user);
        return user;
    }

    public void sendEmail(User user) throws TemplateException, IOException, AddressException {
        String token = this.generateToken(user);
        this.sendEmail(user, token);
    }

    public void sendEmail(User user, String token) throws TemplateException, IOException, AddressException {
        URI uri = null;
        try {
            uri = this.generateResetUrl(token);
        } catch (Exception e) {
        }

        Translations translations = Translations.getTranslations(user.getLocaleObject());

        Jws<Claims> parsed = this.parse(token);
        Date expiration = parsed.getBody().getExpiration();

        Map<String, Object> model = new HashMap<>();
        model.put("username", user.getUsername());
        model.put("resetUri", uri != null ? uri : "");
        model.put("token", token);
        model.put("expiration", expiration);

        TranslatableMessage subject = new TranslatableMessage("ftl.passwordReset.subject", user.getUsername());
        MangoEmailContent content = new MangoEmailContent("passwordReset", model, translations, subject.translate(translations), Common.UTF8);

        EmailWorkItem.queueEmail(user.getEmail(), content);
    }
}
