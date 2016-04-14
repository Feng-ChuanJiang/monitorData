
package com.cci.oms.login.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cci.core.expection.BusinessException;
import com.cci.core.generic.tree.Item;
import com.cci.core.util.ApplicationUtils;
import com.cci.oms.login.container.Role;
import com.cci.oms.login.container.RoleExample;
import com.cci.oms.login.service.RoleService;

/**
 * Created by chuanJiang.Feng on 2015年7月29日
 *下午2:58:57
 */
@Controller
@RequestMapping(value = "/role")
public class RoleController {
	@Resource
	private RoleService roleService;
	
	/**
	 * 创建角色
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/creat", method = RequestMethod.POST)
	@ResponseBody
	public int creatUser(@Validated Role role, BindingResult result) {

		if (result.hasErrors()) {
			throw new BusinessException(1,"error:" + " 参数错误！");
		}
		if(role.getRoleSign()==null||role.getRoleSign().equals("")){
			
			throw new BusinessException(1,"error:" + " 角色编码不能为空！");
		}
        if(role.getRoleName()==null||role.getRoleName().equals("")){
			
			throw new BusinessException(1,"error:" + " 角色名称不能为空！");
		}
		if(role.getId()==null||role.getId().equals("")){
			return roleService.insert(role);
		}else{
			return roleService.update(role);
		}
	 
	}
	/**
	 * 查询角色
	 * 
	 * @param session
	 * @return
	 */

	@RequestMapping(value = "/selectRole", method = RequestMethod.POST)
	@ResponseBody
	public List<Item> selectRole(@Validated String roleId) {	
		List<Item> role=roleService.selectRoleByTree();
		return role;
	}
	/**
	 * 根据编号查询角色
	 * 
	 * @param session
	 * @return
	 */

	@RequestMapping(value = "/selectRoleById", method = RequestMethod.POST)
	@ResponseBody
	public List<Role> selectRoleById(@Validated String roleId) {	
		RoleExample example =new RoleExample();
		example.createCriteria().andEqualTo("id", roleId);
		List<Role> role=roleService.selectByExample(example);
		return role;
	}
	/**
	 * 根据编号删除角色
	 * 
	 * @param session
	 * @return
	 */

	@RequestMapping(value = "/deleteRoleById", method = RequestMethod.POST)
	@ResponseBody
	public int deleteRoleById(@Validated String roleId) {	
		return roleService.delete(roleId);
	}
	
	/**
	 * 根据角色编号和用户编号，插入角色用户对应表
	 * 
	 * @param session
	 * @return
	 */

	@RequestMapping(value = "/insterRoleByRoleIdAndUserId", method = RequestMethod.POST)
	@ResponseBody
	public int insterRoleByRoleIdAndUserId(@Validated String roleId, String userId) {	
		
		
		return roleService.insertUserRole(ApplicationUtils.randomUUID(), userId, roleId);
	}
	/**
	 * 根据角色编号和用户编号，插入角色用户对应表
	 * 
	 * @param session
	 * @return
	 */

	@RequestMapping(value = "/deleteRoleByRoleIdAndUserId", method = RequestMethod.POST)
	@ResponseBody
	public int deleteRoleAndUserByRoleIdAndUserId(@Validated String roleId, String userId) {	
		return roleService.deleteUserRoleByPrimaryKey(userId,roleId);
	}
	/**
	 * 根据角色编号和权限编号，插入角色权限对应表
	 * 
	 * @param session
	 * @return
	 */

	@RequestMapping(value = "/insertPermissionRole", method = RequestMethod.POST)
	@ResponseBody
	public int insertPermissionRole(@Validated String roleId, String perId) {		
		return roleService.insertPermissionRole(ApplicationUtils.randomUUID(), roleId, perId);
	}
	/**
	 * 根据角色编号和权限编号，插入角色权限对应表
	 * 
	 * @param session
	 * @return
	 */

	@RequestMapping(value = "/deletePermissionRole", method = RequestMethod.POST)
	@ResponseBody
	public int deletePermissionRole(@Validated String roleId, String perId) {	
		return roleService.deletePermissionRole(roleId, perId);
	}
	
}
