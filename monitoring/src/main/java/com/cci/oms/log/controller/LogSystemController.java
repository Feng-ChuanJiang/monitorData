
package com.cci.oms.log.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cci.oms.common.BaseController;
import com.cci.oms.log.container.LogSystem;
import com.cci.oms.log.service.LogSystemService;

@Controller
@RequestMapping(value = "/logSystem")
public class LogSystemController extends BaseController
{
	private static final Logger logger = Logger.getLogger(LogSystemController.class);
	public static final String PAGE_SEARCH   = "log_doSearch";
	@Resource
	private LogSystemService logSystemService;
	
	/**
	 *  初始化查询页面
	 * @return  
	 */
	@RequestMapping(value =  "/doSearchRequest")
	public ModelAndView doSearchRequest(@Validated LogSystem logSystem) throws Exception
	{
		return doSearch(logSystem);
	} 
	
	
	/**
	 *  点击查询按钮根据条件进行查询，如果查询条件都为空查询所有记录
	 * @return  返回查询页面和查询出的数据
	 */
	@RequestMapping(value =  "/doSearch")
	public ModelAndView doSearch(@Validated LogSystem logSystem) throws Exception
	{
		if(logger.isDebugEnabled()){
			logger.debug("[LogSystemController]  doSearch Start ->>>>>");
		}
		List<LogSystem> logList  = logSystemService.doGetAllLog(logSystem);

		Map model =new HashMap<>();
		model.put("logList",logList);
		if(logger.isDebugEnabled()){
			logger.debug("[LogSystemController]  carList.size =" + logList.size());
			logger.debug("[LogSystemController]  doSearch End");
		}
		return new ModelAndView(LogSystemController.PAGE_SEARCH , model);
	}  
	
}
