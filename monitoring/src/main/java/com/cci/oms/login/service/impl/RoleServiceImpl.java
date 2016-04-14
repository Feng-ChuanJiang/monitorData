package com.cci.oms.login.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cci.core.expection.BusinessException;
import com.cci.core.generic.GenericDao;
import com.cci.core.generic.GenericServiceImpl;
import com.cci.core.generic.criteria.Criteria;
import com.cci.core.generic.tree.AdditionalParameters;
import com.cci.core.generic.tree.Item;
import com.cci.core.util.ApplicationUtils;
import com.cci.oms.login.container.Department;
import com.cci.oms.login.container.Permission;
import com.cci.oms.login.container.Role;
import com.cci.oms.login.container.RoleExample;
import com.cci.oms.login.container.User;
import com.cci.oms.login.repository.MenuMapper;
import com.cci.oms.login.repository.PermissionMapper;
import com.cci.oms.login.repository.RoleMapper;
import com.cci.oms.login.service.RoleService;

/**
 * 角色Service实现类
 *
 * @author fcj
 * 
 */
@Service
public class RoleServiceImpl extends GenericServiceImpl<Role, String> implements RoleService {

    @Resource
    private RoleMapper roleMapper;
    @Resource
    private PermissionMapper permission;
	@Resource
	private MenuMapper menuMapper;

    @Override
    public GenericDao<Role, String> getDao() {
        return roleMapper;
    }
    
    /**
     * 通过用户id 查询用户 拥有的角色
     */
    @Override
    public List<Role> selectRolesByUserId(String userId) {
        return roleMapper.selectRolesByUserId(userId);
    }
    /**
     * 查询所有角色在封装为树形菜单
     */
	@Override
	public List<Item>  selectRoleByTree() {	
		// 所有角色
		List<Role> role = roleMapper.selectByExample(new RoleExample());
		// 所有对象
		List<Item> items = new ArrayList<Item>();
			Item item = new Item();
			// 得到角色的名称
			item.setName("全部角色");
			// 树形菜单的类型
			item.setType("folder");
			List<Item> children = new ArrayList<Item>();
			// 部门信息
			AdditionalParameters ap = new AdditionalParameters();
			//是否展开树形菜单
			boolean itemSelected=true;
			// 循环角色
			for (Role r : role) {
				//角色对象信息
				Item i = new Item();
				AdditionalParameters additional = new AdditionalParameters();
				i.setId(r.getId());
				i.setName("<i class=\"'+ace_icon+' fa fa fa-lock black\"></i> "+r.getRoleName());
				i.setBakName(r.getRoleName());
				i.setType("item");
				i.setAdditionalParameters(additional);
				children.add(i);
			}
			ap.setChildren(children);
			ap.setItemSelected(itemSelected);
			item.setAdditionalParameters(ap);
			items.add(item);
		return items;
	}
	
    /**
     * 通过角色id 查询角色拥有的用户
     */
	@Override
	public List<User> selectUsersByRoleId(String roleId) {
		return roleMapper.selectUsersByRoleId(roleId);
	}
    /**
     * 插入角色
     */
	public int insert(Role role){
		//创立条件
		RoleExample re=new RoleExample();
		Criteria cr=  re.createCriteria();
		cr.andEqualTo("role_sign", role.getRoleSign());
		//得到role
		List<Role> roles = roleMapper.selectByExample(re);
		if(roles.size()>0){
			throw new BusinessException(1, "权限编码重复，请更换权限编码");
		}
		role.setId(ApplicationUtils.randomUUID());
		return getDao().insertSelective(role);
		
	}
    /**
     * 删除角色
     */
	public int delete(String roleId){
		//查询此角色绑定的用户和权限
		RoleExample re=new RoleExample();
		Criteria cr=  re.createCriteria();
		cr.andEqualTo("id", roleId);
		//还为实现
		List<User> user = roleMapper.selectUsersByRoleId(roleId);
		if(user.size()>0){
			throw new BusinessException(1, "此角色还绑定有用户，请先删除后在对此操作。");
		}
		List<Permission> permis= permission.selectPermissionsByRoleId(roleId);
		if(permis.size()>0){
			throw new BusinessException(1, "此角色还绑定有权限，请先删除后在对此操作。");			
		}
		return getDao().deleteByPrimaryKey(roleId);
		
	}
    /**
     * 根据条件查询角色
     */
	@Override
	public List<Role> selectByExample(RoleExample example) {
		return 	roleMapper.selectByExample(example);
	}

	@Override
	/**
	 * 根据角色编号插入用户角色
	 */
	public int insertUserRole(String id, String userId, String roleId) {
		return roleMapper.insertUserRole(id, userId, roleId);
		
	}

	@Override
	/**
	 * 根据角色编号删除角色
	 */
	public int deleteUserRoleByPrimaryKey( String userId, String roleId) {
		return roleMapper.deleteUserRoleByPrimaryKey(userId,roleId);
	}

	@Override
	/**
	 * 根据角色编号添加权限 如果菜单下添加了一个权限，给改菜单也附上权限
	 */
	public int insertPermissionRole(String id, String roleId, String perId) {
		Permission p=permission.selectByPermissionMenu(perId);
    	//根据编号得到所有子类编号
    	String parentId = menuMapper.getParentId(p.getPermissionMenu());
    	String[] menuOpen = parentId.substring(2).split(",");
		String[] menuState = new String[menuOpen.length];
		int j = 0;
		for (int i = menuOpen.length; i > 0; i--) {
			menuState[j] = menuOpen[i - 1];
			j++;
		}
    	if(menuState.length>1){
    		for(int i=1;i<menuState.length;i++){
    			//根据树形菜单编号查询权限表是否有权限
    			System.out.println(menuState[i]);
    			List<String> l= new ArrayList<String>();l.add(menuState[i]);
    			List<String> per=permission.getPermissionByMeunId(roleId,l);
    			if(per.size()==0){
    				Permission perm=permission.selectByPermissionMenu(menuState[i]);
    				roleMapper.insertPermissionRole(ApplicationUtils.randomUUID(), roleId, perm.getId());
    			}
    		}
    	}
    	
		return 0;
	}

	@Override
	/**
	 * 根据角色编号删除权限  如果菜单下没有一个权限，将删除该菜单
	 */
	public int deletePermissionRole(String roleId, String perId) {
		Permission p=permission.selectByPermissionMenu(perId);
		roleMapper.deletePermissionRole(roleId, p.getId());
		//根据编号得到所有子类编号
    	String parentId = menuMapper.getParentId(p.getPermissionMenu());
    	String[] menuOpen = parentId.substring(2).split(",");
    	for(int i=1;i<menuOpen.length-1;i++){
        	String childrenId = menuMapper.getChildren(menuOpen[i]);
        	String children=childrenId.substring(childrenId.indexOf(',', childrenId.indexOf(',')+1)+1);
        	List<String> list= new ArrayList<String>();
        	if(children!=null&&!children.equals("")){
        		String []ch=children.split(",");
        		for(String c:ch){
        			list.add(c);
        		}
        	}
        	List<String> per=permission.getPermissionByMeunId(roleId,list);
			if(per.size()==0){
		    Permission perm=permission.selectByPermissionMenu(menuOpen[i]);
			roleMapper.deletePermissionRole(roleId,perm.getId());
    	    }else{ 	    	
    	     break;
    	    }
    	 }
		return 0;
	}

}
