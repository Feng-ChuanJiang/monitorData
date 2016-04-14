package com.cci.oms.login.repository;

import java.util.List;

import com.cci.core.generic.GenericDao;
import com.cci.oms.login.container.Menu;
import com.cci.oms.login.container.MenuExample;

public interface MenuMapper extends GenericDao<Menu, Menu> {
	
  int countByExample(MenuExample example);

  int insert(Menu record);

  int updateByPrimaryKey(Menu record);
  
  int deleteByPrimaryKey(Menu record);
  Menu selectByExample(MenuExample example);
  Menu selectByPrimaryKey(MenuExample example);
  List<Menu> selectByExampleAndList(MenuExample example);
  String getParentId(String id);
  String getChildren(String id);
}
