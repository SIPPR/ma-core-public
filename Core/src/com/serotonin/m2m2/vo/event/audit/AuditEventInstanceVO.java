/**
 * Copyright (C) 2016 Infinite Automation Software. All rights reserved.
 * @author Terry Packer
 */
package com.serotonin.m2m2.vo.event.audit;

import com.serotonin.json.type.JsonObject;
import com.serotonin.m2m2.i18n.TranslatableMessage;
import com.serotonin.m2m2.vo.AbstractBasicVO;

/**
 * Container for Audit Events stored in Mango
 * 
 * @author Terry Packer
 *
 */
public class AuditEventInstanceVO extends AbstractBasicVO{
	
	public static final int CHANGE_TYPE_CREATE = 1;
	public static final int CHANGE_TYPE_MODIFY = 2;
	public static final int CHANGE_TYPE_DELETE = 3;
	
	private String typeName;
	private int alarmLevel;
	private int userId;
	private int changeType;
	private int objectId;
	private long timestamp;
	private TranslatableMessage message;
	private JsonObject context;
	
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getAlarmLevel() {
		return alarmLevel;
	}
	public void setAlarmLevel(int alarmLevel) {
		this.alarmLevel = alarmLevel;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getChangeType() {
		return changeType;
	}
	public void setChangeType(int changeType) {
		this.changeType = changeType;
	}
	public int getObjectId() {
		return objectId;
	}
	public void setObjectId(int objectId) {
		this.objectId = objectId;
	}
	public long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}
	public JsonObject getContext() {
		return context;
	}
	public void setContext(JsonObject context) {
		this.context = context;
	}
	public TranslatableMessage getMessage() {
		return message;
	}
	public void setMessage(TranslatableMessage message) {
		this.message = message;
	}
}