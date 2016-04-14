
package com.cci.oms.login.repository;

import java.util.List;

import com.cci.core.generic.GenericDao;
import com.cci.oms.login.container.Department;
import com.cci.oms.login.container.DepartmentExample;

/**
 * Created by chuanJiang.Feng on 2015年7月30日
 *下午8:48:52
 */
public interface DepartmentMapper extends GenericDao<Department, String> {
	 List<Department> selectDepartmen();

}
