package com.cci.oms.login.service.impl;

import com.cci.core.generic.GenericDao;
import com.cci.core.generic.GenericServiceImpl;
import com.cci.oms.login.container.UIstyle;
import com.cci.oms.login.container.UIstyleExample;
import com.cci.oms.login.repository.UIstyleMapper;
import com.cci.oms.login.service.UIstyleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 模块菜单
 * 
 * @author fcj
 * 
 */
@Service
public class UIstyleServiceImpl extends GenericServiceImpl<UIstyle, UIstyle> implements
		UIstyleService {
	@Resource
	protected UIstyleMapper uiStyleMappers;


	@Override
	public GenericDao<UIstyle, UIstyle> getDao() {
		return null;
	}

	@Override
	public UIstyle selectByUserId(String userId) {
		return uiStyleMappers.selectByUserId(userId);
	}

	@Override
	public int selectByExample(UIstyle u, UIstyleExample ue) {
		return uiStyleMappers.updateByExampleSelective(u,ue);
	}

	@Override
	public int insert(UIstyle model) {
		return uiStyleMappers.insert(model);
	}

	@Override
	public int update(UIstyle model) {
		return uiStyleMappers.updateByPrimaryKey(model);
	}
}
