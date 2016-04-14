package com.cci.oms.log.container;


import java.io.Serializable;
import java.util.Date;

import com.cci.oms.common.MaintenanceValueObject;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 *   信访维稳台账管理 - 记录信访维稳事项
 *   T_PETITION
 * @author wyc 2015/8/11
 *
 */
public class LogSystem extends MaintenanceValueObject implements Serializable, Cloneable
{
 
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String userName;
	private String hostName;
	private String handle;
	private Date handleTime;
	private String contents;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public String getHandle() {
		return handle;
	}
	public void setHandle(String handle) {
		this.handle = handle;
	}
	public Date getHandleTime() {
		return handleTime;
	}
	public void setHandleTime(Date handleTime) {
		this.handleTime = handleTime;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

}
