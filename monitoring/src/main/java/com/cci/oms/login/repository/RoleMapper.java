package com.cci.oms.login.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cci.core.generic.GenericDao;
import com.cci.oms.login.container.Role;
import com.cci.oms.login.container.RoleExample;
import com.cci.oms.login.container.User;

/**
 * 角色Dao 接口
 * 
 * @author fcj
 * 
 **/
public interface RoleMapper extends GenericDao<Role, String> {
    int countByExample(RoleExample example);

    int deleteByExample(RoleExample example);

    int deleteByPrimaryKey(String id);

    int insert(Role record);

    int insertSelective(Role record);

    List<Role> selectByExample(RoleExample example);

    Role selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Role record, @Param("example") RoleExample example);

    int updateByExample(@Param("record") Role record, @Param("example") RoleExample example);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    int insertUserRole(String id, String userId, String roleId);
    
    int deleteUserRoleByPrimaryKey(String userId, String roleId);   

    int insertPermissionRole(String id, String roleId, String perId);
    
    int deletePermissionRole(String roleId, String perId);
    
    /**
     * 通过用户id 查询用户 拥有的角色
     * 
     * @param id
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
}