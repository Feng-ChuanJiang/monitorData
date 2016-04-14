package com.cci.oms.common;


import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.cci.core.util.ApplicationUtils;
import com.cci.oms.log.container.LogSystem;
import com.cci.oms.log.service.LogSystemService;
import com.cci.oms.login.container.User;
import com.cci.oms.login.service.MenuService;

public class CommonInterceptor implements HandlerInterceptor {
    
	@Resource
	private MenuService menuService;
	@Resource
	private LogSystemService logSystemService;
	
	private Logger log = Logger.getLogger(CommonInterceptor.class);
	
	public CommonInterceptor() {
		// TODO Auto-generated constructor stub
	}

	private String mappingURL;//利用正则映射到需要拦截的路径  
    public void setMappingURL(String mappingURL) {  
           this.mappingURL = mappingURL;  
   } 

	/**
	 * 在业务处理器处理请求之前被调用
	 * 如果返回false
	 *     从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链
	 * 
	 * 如果返回true
	 *    执行下一个拦截器,直到所有的拦截器都执行完毕
	 *    再执行被拦截的Controller
	 *    然后进入拦截器链,
	 *    从最后一个拦截器往回执行所有的postHandle()
	 *    接着再从最后一个拦截器往回执行所有的afterCompletion()
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		
		log.info("==============执行顺序: 1、preHandle================");
		String url=request.getRequestURL().toString();  
		String[] menuState =menuService.setMenuByAdd(url);
		request.getSession().setAttribute("menuState", menuState);
		log.info(url);
        if(mappingURL==null || url.matches(mappingURL)){  
			//request.getRequestDispatcher("/msg.jsp").forward(request, response);
			//return false; 
        }  
        
        User user = new User();
	    //写入数据到T_MT_LOG
		LogSystem logsystem = new LogSystem();
		String splitUrl[] = url.split("/");
		String model;
		String method ;
		//截取访问路径url 得到访问模块和访问方法
		if(splitUrl.length >= 6)
		{
			model = splitUrl[5];
			method = splitUrl[6];
		}else{
			return true;
		}
		if(!method.equals("logout")){
			 user = (User) request.getSession().getAttribute("userInfo");
		}
		logsystem.setId(ApplicationUtils.randomUUID());
		if(null != user) logsystem.setUserName(user.getUsername());
		logsystem.setHostName(request.getRemoteHost() + ":" + request.getServerPort());
        if(model.equals("logSystem"))
        {
        	logsystem.setHandle("日志管理");
		}else if(model.equals("petition")){
			logsystem.setHandle("信访维稳管理");
		}else if(model.equals("user")){
			logsystem.setHandle("用户管理");
		}else if(model.equals("fixedAssets")){
			logsystem.setHandle("固定资产管理");
		}else if(model.equals("tenement")){
			logsystem.setHandle("楼宇物业管理");
		}else if(model.equals("carInformation")){
			logsystem.setHandle("车辆信息管理");
		}else if(model.equals("driverCar")){
			logsystem.setHandle("驾驶员信息管理");
		}else if(model.equals("meeting")){
			logsystem.setHandle("会议管理");
		}else if(model.equals("mess")){
			logsystem.setHandle("食堂管理");
		}else if(model.equals("reception")){
			logsystem.setHandle("接待管理");
		}else if(model.equals("smallCarLog")){
			logsystem.setHandle("行车日志管理");
		}else if(model.equals("smallCarCost")){
			logsystem.setHandle("车辆费用管理");
		}else if(model.equals("secretary")){
			logsystem.setHandle("秘书处管理");
		}else if(model.equals("rdLending")){
			logsystem.setHandle("查借阅文件管理");
		}else if(model.equals("rdReceive")){
			logsystem.setHandle("接收文件管理");
		}else if(model.equals("prSendError")){
			logsystem.setHandle("发文差错率管理");
		}else if(model.equals("prSubmissionError")){
			logsystem.setHandle("报送文件差错率管理");
		}else{
			logsystem.setHandle("其他");
		}
        logsystem.setHandleTime(new Date());
        logsystem.setCreateDate(new Date());
        logSystemService.insert(logsystem);
        return true;
	}

	//在业务处理器处理请求执行完成后,生成视图之前执行的动作 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		log.info("==============执行顺序: 2、postHandle================");
	}

	/**
	 * 在DispatcherServlet完全处理完请求后被调用 
	 * 
	 *   当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion()
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		log.info("==============执行顺序: 3、afterCompletion================");
	}

}
