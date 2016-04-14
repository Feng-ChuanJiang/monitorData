package com.cci.oms.login.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cci.core.generic.GenericDao;
import com.cci.oms.login.container.Permission;
import com.cci.oms.login.container.PermissionExample;

/**
 * 权限 Dao 接口
 * 
 * @author fcj
 * 
 **/
public interface PermissionMapper extends GenericDao<Permission, String> {
    int countByExample(PermissionExample example);

    int deleteByExample(PermissionExample example);

    int deleteByPrimaryKey(String id);

    int insert(Permission record);

    int insertSelective(Permission record);

    List<Permission> selectByExample(PermissionExample example);
    /**
     * 根据用户编号得到权限
     * @param permissionId
     * @return
     */
    Permission selectByPrimaryKey(String id);
    /**
     * 根据树形菜单编号得到权限
     * @param menuId
     * @return
     */
    Permission selectByPermissionMenu(String menuId);
    
    int updateByExampleSelective(@Param("record") Permission record, @Param("example") PermissionExample example);

    int updateByExample(@Param("record") Permission record, @Param("example") PermissionExample example);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);
    
    List<String> getPermissionByMeunId(@Param("roleId") String roleId, @Param("list") List<String> list);

    /**
     * 通过角色id 查询角色 拥有的权限
     * 
     * @param roleId
     * @return
     */
    List<Permission> selectPermissionsByRoleId(String roleId);
}