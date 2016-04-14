
package com.cci.oms.login.service;

import java.util.List;

import com.cci.core.generic.GenericService;
import com.cci.core.generic.tree.Item;
import com.cci.oms.login.container.Department;

/**
 * Created by chuanJiang.Feng on 2015年7月30日
 *下午8:59:09
 */
public interface DepartmentService extends GenericService<Department, String> {

    List<Item> selectDepartmen(String roleId);
}
