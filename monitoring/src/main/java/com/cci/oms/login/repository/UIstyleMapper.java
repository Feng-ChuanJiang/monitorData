
package com.cci.oms.login.repository;

import com.cci.core.generic.GenericDao;
import com.cci.oms.login.container.Permission;
import com.cci.oms.login.container.PermissionExample;
import com.cci.oms.login.container.UIstyle;
import com.cci.oms.login.container.UIstyleExample;
import org.apache.ibatis.annotations.Param;

/**
 * Created by chuanJiang.Feng on 2015年7月30日
 *下午8:48:52
 */
public interface UIstyleMapper extends GenericDao<UIstyle, UIstyle> {
	 UIstyle selectByUserId(String userId);
	int insert(UIstyle record);
	int updateByPrimaryKey(UIstyle record);
	int updateByExampleSelective(@Param("record") UIstyle record, @Param("example") UIstyleExample example);


}

