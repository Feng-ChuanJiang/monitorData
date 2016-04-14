package com.cci.oms.login.controller;

import com.cci.core.generic.criteria.Criteria;
import com.cci.oms.login.container.*;
import com.cci.oms.login.service.PermissionService;
import com.cci.oms.login.service.RoleService;
import com.cci.oms.login.service.UIstyleService;
import com.cci.oms.login.service.UserService;
import com.cci.oms.login.service.impl.MenuServiceImpl;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by chuanJiang.Feng on 2015年8月11日
 *下午10:42:11
 */
@Controller
@RequestMapping(value="menu")
public class MenuController {
	@Resource
	private MenuServiceImpl menuService;

	@Resource
	private UIstyleService uiService;
	
    @Resource
    private UserService userService;

    @Resource
    private RoleService roleService;

    @Resource
    private PermissionService permissionService;

	private  static UIstyle ui;
	@RequestMapping(value = "selectMenu")
	@ResponseBody
	public ModelAndView getMenu(HttpServletRequest request) {
		ui=null;
		//得到用户全部权限
		List<Object> perms=new ArrayList<Object>();
		if (request.getSession().getAttribute("menuData") == null) {
			//根据用户编号得到权限
			Subject subject = SecurityUtils.getSubject();
			String username=(String) subject.getPrincipal();
			 final User user = userService.selectByUsername(username);
		     final List<Role> roleInfos = roleService.selectRolesByUserId(user.getId());
		        for (Role role : roleInfos) {
		            // 得到权限
		            final List<Permission> permissions = permissionService.selectPermissionsByRoleId(role.getId());
		            for (Permission permission : permissions) {
		                // 添加权限
		            	perms.add(permission.getPermissionMenu());
		            }
		        }
		    //指定权限和类型作为条件
	    	MenuExample example=new MenuExample();
	     	Criteria c=example.createCriteria();
		    //类型为菜单的数据
		    c.andEqualTo("type", "menu");
			c.andIn("id", perms);		
			//根据条件得到全部树形菜单
	        List<Menu> firstLevelPrivilege = menuService.selectByExampleAndList(example);
	        //指定权限和父编号作为条件
	        MenuExample exampleTopMenu =new MenuExample();
	        Criteria cr=exampleTopMenu.createCriteria();
	        cr.andEqualTo("parent_id", "ROOTC662ADC549B5B2CC6D9D8386B8B8");
	        cr.andIn("id", perms);
	        cr.andEqualTo("type", "menu");
	        //查询根部菜单
			List<Menu> topMenu = menuService.getAllPrivilegeList(exampleTopMenu);
			//得到所有菜单并放入map
			Map<String, List<Menu>> map = new HashMap<String, List<Menu>>();
			map.put("data", menuService.getAllChildren(firstLevelPrivilege,topMenu));
			request.getSession().setAttribute("menuData", map);
		}
		return new ModelAndView("index");
	}

	/**
	 * 获取UI设置
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "getUIstyle")
	@ResponseBody
	public UIstyle getUIstyle(HttpServletRequest request) {
		if(ui==null){
			Subject subject = SecurityUtils.getSubject();
			String username=(String) subject.getPrincipal();
			User user = userService.selectByUsername(username);
			ui=uiService.selectByUserId(user.getId());
		}
		return ui;
	}

	/**
	 * 设置UI界面
	 * @param uIstyle
	 */
	@RequestMapping(value = "setUIstyle")
	@ResponseBody
	public void setUIstyle(@Validated UIstyle uIstyle) {
		Subject subject = SecurityUtils.getSubject();
		String username=(String) subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UIstyle uu=uiService.selectByUserId(user.getId());
		if(uu!=null){
			UIstyleExample uIstyleExample =new UIstyleExample();
			Criteria cr=uIstyleExample.createCriteria();
			cr.andEqualTo("userid",user.getId());
			uiService.selectByExample(uIstyle,uIstyleExample);
		}else{
			//设置初始值
			uIstyle.setUserId(user.getId());
			if(uIstyle.getMiniNav()==null)
				uIstyle.setMiniNav("true");
			if(uIstyle.getNavStyle()==null)
				uIstyle.setNavStyle("true");
			if(uIstyle.getSubmenu()==null)
				uIstyle.setSubmenu("true");
			if(uIstyle.getUiStyle()==null)
				uIstyle.setUiStyle("true");
			if(uIstyle.getSkin()==null)
				uIstyle.setSkin("0");
			uiService.insert(uIstyle);
		}
		ui=null;
	}
}
