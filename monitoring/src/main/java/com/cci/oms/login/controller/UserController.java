package com.cci.oms.login.controller;

import com.cci.core.feature.orm.page.Page;
import com.cci.core.generic.criteria.Criteria;
import com.cci.core.util.ApplicationUtils;
import com.cci.core.util.PasswordHash;
import com.cci.oms.common.BaseController;
import com.cci.oms.login.container.Department;
import com.cci.oms.login.container.User;
import com.cci.oms.login.container.UserExample;
import com.cci.oms.login.service.UserService;
import com.cci.oms.security.PermissionSign;
import com.cci.oms.security.RoleSign;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 用户控制器
 * 
 * @author fcj
 * 
 **/
@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController{

	@Resource
	private UserService userService;
	/**
	 *   解决页面JQGRID传date类型
	 * @param binder
	 */
	@InitBinder  
	public void initBinder(WebDataBinder binder)
	{  
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
	    dateFormat.setLenient(false);  
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
	}
	

	/**
	 * 用户登录
	 * 
	 * @param user
	 * @param result
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Validated User user, BindingResult result,
			Model model, HttpServletRequest request) {
		//记住我
		String rememberMe =request.getParameter("rememberMe");
		try {
			Subject subject = SecurityUtils.getSubject();
			// 已登陆则 跳到首页
			if (subject.isAuthenticated()) {
				return "redirect:/";
			}
			if (result.hasErrors()) {
				model.addAttribute("errorss", "参数错误！");
				return "login";
			}
			// 身份验证
			UsernamePasswordToken token = null;
			//用户名登录
			token = new UsernamePasswordToken(user.getUsername(), ApplicationUtils.sha256Hex(user.getPassword()));
			if(null!=rememberMe)
			token.setRememberMe(true);  
			subject.login(token);
		} catch (AuthenticationException e) {
			e.printStackTrace();
			// 身份验证失败
			model.addAttribute("errorss", "用户名或密码错误 ！");
			return "login";
		}
		return "redirect:/";
		
		
		
		
		
	}

	/**
	 * 用户登出
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// 登出操作
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "login";
	}

	/**
	 * 创建用户
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/creat", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView creatUser(@Validated User user,HttpSession session, BindingResult result) {

		List<Department> departmentList = getAllDepartment();
		Map model =new HashMap<String,Object>();
		
		if (result.hasErrors()) {
			System.out.println("error" + "参数错误！");
			return new ModelAndView("creatUser", model);
		}
		//验证用户输入的用户名是否已存在
		int isSameUser = userService.selectIsSameUser(user);
		if(isSameUser == 1){
			model.put("isSameUser", "<span name='error_message' style='color: red;'>职工编号已存在,请重新输入.</span>");
			model.put("departmentList", departmentList);
			return new ModelAndView("creatUser", model);
		}
		String addFlag = "";
	    Subject subject = SecurityUtils.getSubject();
		String username=(String) subject.getPrincipal();
		user.setId(ApplicationUtils.randomUUID());
		user.setCreateBy(username);
		user.setCreateDate(new Date());
		int isSucess = userService.insert(user);
		if(isSucess == 1)
		{
			model.put("departmentList", departmentList);
			model.put("addFlag", "Y");
		}
		else  
			addFlag = "N";
			
		return new ModelAndView("creatUser", model);
	}

	/**
	 * 查询用户
	 * 
	 * @paramsession
	 * @return
	 */

	@RequestMapping(value = "/selectuser", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView selectUser(@Validated User user,HttpServletRequest request, HttpServletResponse response) {
        Map map= request.getParameterMap();
		int pages = request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page")); // 取得当前页数
		int rows = request.getParameter("rows")==null?1:Integer.parseInt(request.getParameter("rows")); // 取得每页显示行数

		ModelAndView mav = new ModelAndView();
		// 分页查询
		Page<User> pagess = new Page<User>(pages,rows);
		// 查询条件
		UserExample example = new UserExample();
		Criteria c = example.createCriteria();
		c.andGreaterThan("id", "");
		//得到对象集合
		List<User> users = userService.selectByExampleAndPage(pagess, example);
        //总页数
		int total = pagess.getTotalPages();
		//页码
		int page = pagess.getPageNo();
		//总条数
		int records = pagess.getTotalCount();
        //返回到页面
		MappingJacksonJsonView view = new MappingJacksonJsonView();
		Map attributes = new HashMap();
		attributes.put("total", total);
		attributes.put("page", page);
		attributes.put("records", records);
		attributes.put("rows", users);
		view.setAttributesMap(attributes);
		mav.setView(view);

		return mav;
	}

	/**
	 * 更新用户
	 * 
	 * @param session
	 * @return
	 */

	@RequestMapping(value = "/updateuser", method = RequestMethod.POST)
	@ResponseBody
	public void updateUser(@Validated User user, HttpServletRequest request,HttpSession session) {
		String flag = request.getParameter("oper");
		User user1 = userService.selectById(user);
		user.setUpdateBy(user1.getUsername());
		user.setUpdateDate(new Date());
		if("edit".equals(flag))
		{
			user.setVersion(user.getVersion()+1);
			userService.update(user);
		}
		else if("del".equals(flag))
		{
			userService.delete(user);
		}
		
	}

	/**
	 * 基于角色 标识的权限控制案例
	 */
	@RequestMapping(value = "/admin")
	@ResponseBody
	@RequiresRoles(value = RoleSign.ADMIN)
	public String admin() {
		return "拥有admin角色,能访问";
	}

	/**
	 * 基于权限标识的权限控制案例
	 */
	@RequestMapping(value = "/create")
	@ResponseBody
	@RequiresPermissions(value = PermissionSign.USER_CREATE)
	public String create() {
		return "拥有user:create权限,能访问";
	}
	
	@RequestMapping(value = "/pwdSettingRequest")
	@ResponseBody
	public  ModelAndView pwdSettingRequest(HttpSession session)
	{
	    Map model = new HashMap<String,Object>();
	    Subject subject = SecurityUtils.getSubject();
		String username=(String) subject.getPrincipal();
	    User user = userService.selectByUsername(username);;
	    model.put("username", user.getUsername());
	    model.put("id", user.getId());
		return new ModelAndView("pwdSetting" , model);
	}
	@RequestMapping(value = "/pwdSetting", method = RequestMethod.POST)
	@ResponseBody
	public  ModelAndView pwdSetting(@Validated User user,HttpSession session,String password1)
	{
		Subject subject = SecurityUtils.getSubject();
		String username=(String) subject.getPrincipal();
	    User u = userService.selectByUsername(username);
	    Map model = new HashMap<String,Object>();
	    user.setPassword( ApplicationUtils.sha256Hex(user.getPassword()));
	    int oldPassWord = userService.selectOldPwd(user);
	    if(oldPassWord == 1)
	    {
	    	user.setPassword(ApplicationUtils.sha256Hex(password1));
	    	userService.updatePassWord(user);
	    	model.put("updateFlag", "Y");
	    }
	    else
	    {
	    	model.put("errorMessage", "<label style='color: red;'>旧密码错误，请检查再输入。</label>");
	    }
	    
	    model.put("username", u.getUsername());
	    model.put("id", u.getId());
		return new ModelAndView("pwdSetting" , model);
	}
	@RequestMapping(value = "/webPwdSetting")
	@ResponseBody
	public  String webPwdSetting(HttpSession session,String oldPwd,String newPwd)
	{
	    Subject subject = SecurityUtils.getSubject();
		String username=(String) subject.getPrincipal();
	    User u = userService.selectByUsername(username);
	    User user = new User();
	    user.setId(u.getId());
	    user.setPassword( ApplicationUtils.sha256Hex(oldPwd));
	    int oldPassWord = userService.selectOldPwd(user);
	    if(oldPassWord == 1)
	    {
	    	user.setPassword(ApplicationUtils.sha256Hex(newPwd));
	    	try {
				userService.updatePassWord(user);
				return "success";
			} catch (Exception e) {
				return "exception";
			}
	    }else{
	    	return "error";
	    }
	}
	
}
