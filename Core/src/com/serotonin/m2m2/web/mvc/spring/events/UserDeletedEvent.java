/*
 * Copyright (C) 2018 Infinite Automation Software. All rights reserved.
 */
package com.serotonin.m2m2.web.mvc.spring.events;

import org.springframework.context.ApplicationEvent;

import com.infiniteautomation.mango.spring.eventMulticaster.PropagatingEvent;
import com.serotonin.m2m2.vo.User;

/**
 * @author Jared Wiltshire
 */
public class UserDeletedEvent extends ApplicationEvent implements PropagatingEvent {

    private static final long serialVersionUID = 1L;

    private final User user;

    public UserDeletedEvent(Object source, User user) {
        super(source);
        this.user = user;
    }

    public User getUser() {
        return user;
    }

}
