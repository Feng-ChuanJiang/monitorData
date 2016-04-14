package com.cci.oms.login.service;

import com.cci.core.generic.GenericService;
import com.cci.oms.login.container.UIstyle;
import com.cci.oms.login.container.UIstyleExample;

/**
 * 样式模块
 * 
 * @author 
 * 
 **/
public interface UIstyleService extends GenericService<UIstyle, UIstyle>
{
	UIstyle selectByUserId(String userId);
	int selectByExample(UIstyle u,UIstyleExample ue);
}
