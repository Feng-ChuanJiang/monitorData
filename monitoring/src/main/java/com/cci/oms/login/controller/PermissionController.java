
package com.cci.oms.login.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cci.core.generic.tree.AdditionalParameters;
import com.cci.core.generic.tree.Item;
import com.cci.oms.login.container.Menu;
import com.cci.oms.login.service.PermissionService;

/**
 * Created by chuanJiang.Feng on 2015年8月15日
 *下午2:20:17
 */
@Controller
@RequestMapping(value="permission")
public class PermissionController {
	@Resource
	PermissionService permissionService;
	
	@RequestMapping(value="select",method=RequestMethod.POST)
	@ResponseBody
	public List<Item> getPermissionByRoleId(String roleId){
		List<Item> lists=new ArrayList<Item>();
		List<Item> list =permissionService.getPermissionTreeByRoleId(roleId);
		Item item=new Item();
    	item.setId("1");
    	item.setName("<i class=\"'+ace_icon+' fa fa-cogs blue\"></i> 模块");
    	AdditionalParameters aps = new AdditionalParameters();
    	aps.setChildren(list);
    	aps.setItemSelected(true);
    	item.setType("folder");
    	item.setAdditionalParameters(aps);
    	lists.add(item);
	    return lists;
		
	}

}
