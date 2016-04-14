package com.cci.oms.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cci.oms.login.container.Department;
import com.cci.oms.login.service.UserService;

/**
 * 视图控制器,返回jsp视图给前端
 * 
 * @author fcj
 *
 **/
@Controller
@RequestMapping("/page")
public class PageController extends BaseController {
	@Resource
	private UserService userService;
    /**
     * 登录页
     */
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    /**
     * dashboard页
     */
    @RequestMapping("/dashboard")
    public String dashboard() {
        return "dashboard";
    }
    
    /**
     * 用户增加页
     */
    @RequestMapping("/usercreat")
    public ModelAndView userCreat() {
    	List<Department> departmentList = getAllDepartment();
    	Map model =new HashMap<>();
		model.put("departmentList", departmentList);
        return new ModelAndView("creatUser", model);
    }
    /**
     * 用户信息操作
     */
    @RequestMapping("/usermain")
    public String userMain() {
        return "userMain";
    }
    /**
     * 角色信息操作
     */
    @RequestMapping("/rolemain")
    public String roleMain() {
        return "roleMain";
    }

    /**
     * 404页
     */
    @RequestMapping("/404")
    public String error404() {
        return "404";
    }

    /**
     * 401页
     */
    @RequestMapping("/401")
    public String error401() {
        return "401";
    }

    /**
     * 500页
     */
    @RequestMapping("/500")
    public String error500() {
        return "500";
    }

    /**
     * monitorCreate
     */
    @RequestMapping("/monitorCreate")
    public String monitorCreate() {
        return "monitorCreate";
    }

}