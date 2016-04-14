package com.cci.oms.login.service;

import java.util.List;

import com.cci.core.generic.GenericService;
import com.cci.core.generic.tree.Item;
import com.cci.oms.login.container.Permission;

/**
 * 权限 业务接口
 * 
 * @author fcj
 * 
 **/
public interface PermissionService extends GenericService<Permission, String> {

    /**
     * 通过角色id 查询角色 拥有的权限
     * 
     * @param roleId
     * @return
     */
    List<Permission> selectPermissionsByRoleId(String roleId);
    List<Item>  getPermissionTreeByRoleId(String roleId);

}
