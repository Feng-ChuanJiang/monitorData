package com.cci.oms.login.container;

import java.util.List;

/**
 * 角色模型
 * 
 * @author fcj
 * 
 **/
public class Role {
    private String id;

    private String roleName;

    private String roleSign;

    private String description;
    
    private List<User> userRole;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getRoleSign() {
        return roleSign;
    }

    public void setRoleSign(String roleSign) {
        this.roleSign = roleSign == null ? null : roleSign.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
    
    

    public List<User> getUserRole() {
		return userRole;
	}

	public void setUserRole(List<User> userRole) {
		this.userRole = userRole;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName + ", roleSign="
				+ roleSign + ", description=" + description + ", userRole="
				+ userRole + "]";
	}



}