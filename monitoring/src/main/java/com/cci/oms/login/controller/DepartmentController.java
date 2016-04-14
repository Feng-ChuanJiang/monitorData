
package com.cci.oms.login.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cci.core.generic.tree.Item;
import com.cci.oms.login.service.DepartmentService;

/**
 * Created by chuanJiang.Feng on 2015年8月1日
 *下午11:04:18
 */
@Controller
@RequestMapping(value="department")
public class DepartmentController {
	@Resource
	DepartmentService departmen;
	@RequestMapping(value="selectDepartmen", method = RequestMethod.POST)
	@ResponseBody
	public List<Item>  getDepartmen(@Validated String roleId){
		List<Item> list =departmen.selectDepartmen(roleId);
	    return list;
	}

}
