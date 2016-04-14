package com.cci.oms.login.service;

import java.util.List;

import com.cci.core.generic.GenericService;
import com.cci.oms.login.container.Menu;
import com.cci.oms.login.container.MenuExample;

/**
 * 模块菜单
 * 
 * @author 
 * 
 **/
public interface MenuService extends GenericService<Menu, Menu>
{
	
	  List<Menu> selectByExampleAndList(MenuExample example);
	  int countByExample(MenuExample example);
	  String[] setMenuByAdd(String url);
}
