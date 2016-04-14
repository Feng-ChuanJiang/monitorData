package com.cci.oms.login.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cci.core.generic.GenericService;
import com.cci.core.generic.tree.Item;
import com.cci.oms.login.container.Role;
import com.cci.oms.login.container.RoleExample;
import com.cci.oms.login.container.User;

/**
 * 角色 业务接口
 * 
 * @author fcj
 * 
 **/
public interface RoleService extends GenericService<Role, String> {
    /**
     * 通过用户id 查询用户 拥有的角色
     * 
     * @param userId
     * @return
     */
    List<Role> selectRolesByUserId(String userId);
    
    /**
     * 通过角色id 查询角色拥有的用户
     * 
     * @param id
     * @return
     */
    List<User> selectUsersByRoleId(String roleId);
    List<Item>  selectRoleByTree();
    List<Role>  selectByExample(RoleExample example);
    /**
     * 插入用户和角色对应表数据
     * @param id
     * @param userId
     * @param RoleId
     * @return
     */
    int insertUserRole(String id, String userId, String RoleId);
    /**
     * 根据编号删除用户和角色对应表数据
     * @param id
     * @param userId
     * @param RoleId
     * @return
     */
    int deleteUserRoleByPrimaryKey(String roleId, String userId);
    /**
     * 插入角色和权限对应表数据
     * @param id
     * @param userId
     * @param RoleId
     * @return
     */
    int insertPermissionRole(String id, String userId, String perId);
    /**
     * 根据编号删除角色和权限对应表数据
     * @param userId
     * @param RoleId
     * @return
     */
    int deletePermissionRole(String roleId, String perId);
}
