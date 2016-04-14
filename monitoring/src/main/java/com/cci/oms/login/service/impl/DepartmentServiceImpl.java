package com.cci.oms.login.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cci.core.generic.GenericDao;
import com.cci.core.generic.GenericServiceImpl;
import com.cci.core.generic.tree.AdditionalParameters;
import com.cci.core.generic.tree.Item;
import com.cci.oms.login.container.Department;
import com.cci.oms.login.container.DepartmentExample;
import com.cci.oms.login.container.Role;
import com.cci.oms.login.container.RoleExample;
import com.cci.oms.login.container.User;
import com.cci.oms.login.repository.DepartmentMapper;
import com.cci.oms.login.repository.RoleMapper;
import com.cci.oms.login.service.DepartmentService;
import com.cci.oms.login.service.RoleService;

/**
 * Created by chuanJiang.Feng on 2015年7月30日 下午9:00:33
 */
@Service
public class DepartmentServiceImpl extends
		GenericServiceImpl<Department, String> implements DepartmentService {

	@Resource
	private DepartmentMapper department;
	@Resource
	private RoleService roleservice;

	@Override
	public List<Item> selectDepartmen(String roleId) {
		// 所有部门
		List<Department> de = department.selectDepartmen();
		List<Item> ll=new ArrayList<Item>();
		Item itemAll = new Item();
		AdditionalParameters aps = new AdditionalParameters();
		itemAll.setName("总公司");
		itemAll.setType("folder");
		// 所有对象
		List<Item> items = new ArrayList<Item>();
        
		for (Department d : de) {
			Item item = new Item();
			// 得到部门的编号
			item.setId(d.getId());
			// 得到部门的名称
			item.setName("<i class=\"'+ace_icon+' fa fa-users blue\"></i> "+d.getName());
			// 树形菜单的类型
			item.setType("folder");
			// 得到部门的用户
			List<User> user = d.getUserlist();
			// 部门里面的对象
			List<Item> children = new ArrayList<Item>();
			// 部门信息
			AdditionalParameters ap = new AdditionalParameters();
			//是否展开树形菜单
			boolean itemSelected=false;
			// 循环用户
			for (User u : user) {
				// 用户对象信息
				Item i = new Item();
				AdditionalParameters additional = new AdditionalParameters();
				i.setId(u.getId());
				i.setName("<i class=\"'+ace_icon+' fa fa fa-user black\"></i> "+u.getUsername());
				i.setType("item");
				if (null != roleId) {
					// 根据权限编号得到用户
					List<User> users = roleservice.selectUsersByRoleId(roleId);
					// 循环有这个权限的用户
					for (User us : users) {
						// 有权限就显示
						if (u.getId().equals(us.getId())) {
							additional.setItemSelected(true);
							itemSelected = true;
						}
					}
				}
				i.setAdditionalParameters(additional);
				children.add(i);
			}
			ap.setChildren(children);
			ap.setItemSelected(itemSelected);
			item.setAdditionalParameters(ap);
			items.add(item);	
		}
		aps.setChildren(items);
		aps.setItemSelected(true);
		itemAll.setAdditionalParameters(aps);
		ll.add(itemAll);
		return ll;
	}

	@Override
	public GenericDao<Department, String> getDao() {
		// TODO Auto-generated method stub
		return null;
	}

}
