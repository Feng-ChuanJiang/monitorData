
package com.cci.oms.common;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cci.oms.login.repository.DepartmentMapper;
import org.apache.commons.io.FileUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cci.oms.login.container.Department;

@Controller
@RequestMapping(value = "/baseController")
public class BaseController
{
	@Resource
	private DepartmentMapper department;
	/**
	 *   解决页面JQGRID传date类型
	 * @param binder
	 */
	@InitBinder  
	public void initBinder(WebDataBinder binder)
	{  
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    dateFormat.setLenient(false);  
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
	}
	
	@RequestMapping(value="/doFancyBox")  
    @ResponseBody  
    public ModelAndView doFancyBox(String name) throws Exception
    { 
		Map model = new HashMap<>();
		String name1 = java.net.URLDecoder.decode(name,"UTF-8");
		model.put("name", name1);
    	return new ModelAndView("fancyBox",model);  
    }  
	
	//  得到所有部门
	@RequestMapping(value =  "/getAllDepartment")
	@ResponseBody
	public List<Department> getAllDepartment()
	{
		List<Department> departmentList = department.selectDepartmen();
		return departmentList;
	}

	//秘书处存储文件
	@RequestMapping(value =  "/storeSecurityFile")
	public String storeSecurityFile(@RequestParam MultipartFile[] securityFile, HttpServletRequest request, HttpServletResponse response) throws IOException
	{
	        //可以在上传文件的同时接收其它参数
	        //如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
	        //这里实现文件上传操作用的是commons.io.FileUtils类,它会自动判断/upload是否存在,不存在会自动创建
	        String realPath = request.getSession().getServletContext().getRealPath("/upload/security");
	        //设置响应给前台内容的数据格式
	        response.setContentType("text/plain; charset=UTF-8");
	        //设置响应给前台内容的PrintWriter对象
	        PrintWriter out = response.getWriter();
	        //上传文件的原名(即上传前的文件名字)
	        String originalFilename = null;
	        //如果只是上传一个文件,则只需要MultipartFile类型接收文件即可,而且无需显式指定@RequestParam注解
	        //如果想上传多个文件,那么这里就要用MultipartFile[]类型来接收文件,并且要指定@RequestParam注解
	        //上传多个文件时,前台表单中的所有<input type="file"/>的name都应该是importFile,否则参数里的importFile无法获取到所有上传的文件
	        for(MultipartFile myfile : securityFile){
	            if(myfile.isEmpty()){
	                out.print("1`请选择文件后上传!");
	                out.flush();
	                return null;
	            }else{
	                originalFilename = myfile.getOriginalFilename();
	                //判断文件在该目录是否已存在
	                File file = new File(realPath+"\\"+originalFilename);
	                SimpleDateFormat simple = new SimpleDateFormat("yyyy:MM:dd:HH:mm:ss");
	                String datetime = simple.format(new Date()).replaceAll(":", "");
	                if(file.exists())
	                {
	                	originalFilename = originalFilename.split("\\.")[0] +"("+ datetime +")." + originalFilename.split("\\.")[1];
	                }
	                System.out.println("文件原名: " + originalFilename);
	                System.out.println("文件名称: " + myfile.getName());
	                System.out.println("文件长度: " + myfile.getSize());
	                System.out.println("文件类型: " + myfile.getContentType());
	                System.out.println("========================================");
	                try {
	                    //这里不必处理IO流关闭的问题,因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
	                    FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, originalFilename));
	                } catch (IOException e) {
	                    System.out.println("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
	                    e.printStackTrace();
	                    out.print("1`文件上传失败，请重试!!");
	                    out.flush();
	                    return null;
	                }
	            }
	        }
	        //System.out.println(realPath + "\\" + originalFilename);
	        System.out.println(request.getContextPath() + "/upload/security" + originalFilename);
//	        out.print("0`" + request.getContextPath() + "/upload/" + originalFilename);
	        out.print("0`文件上传成功!"+originalFilename);
	        out.flush();
	        return null;
    }
	
	//  点击超链接打开秘书处文件
	@RequestMapping(value =  "/openSecurityFile")
	@ResponseBody
	public void openSecurityFile(HttpServletRequest request,String fileName) throws Exception
	{
		String execStr = "cmd /c start explorer ";
		String path = request.getSession().getServletContext().getRealPath("/upload/security");
		
		execStr = execStr+path+"\\"+ fileName;
		 //判断文件在该目录是否已存在
        File file = new File(path+"\\"+ fileName);	
        if(file.exists())
        {
        	Process proc =  Runtime.getRuntime().exec(execStr);  
        }else{
        	throw new Exception();
        }
  
	}
	
	//文印处存储文件
	@RequestMapping(value =  "/storePrFile")
	public String storePrFile(@RequestParam MultipartFile[] prFile, HttpServletRequest request, HttpServletResponse response) throws IOException
	{
	        String realPath = request.getSession().getServletContext().getRealPath("/upload/printingRoom");
	        response.setContentType("text/plain; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        String originalFilename = null;
	        for(MultipartFile myfile : prFile){
	            if(myfile.isEmpty()){
	                out.print("1`请选择文件后上传!");
	                out.flush();
	                return null;
	            }else{
	                originalFilename = myfile.getOriginalFilename();
	                //判断文件在该目录是否已存在
	                File file = new File(realPath+"\\"+originalFilename);
	                SimpleDateFormat simple = new SimpleDateFormat("yyyy:MM:dd:HH:mm:ss");
	                String datetime = simple.format(new Date()).replaceAll(":", "");
	                if(file.exists())
	                {
	                	originalFilename = originalFilename.split("\\.")[0] +"("+ datetime +")." + originalFilename.split("\\.")[1];
	                }
	                System.out.println("文件原名: " + originalFilename);
	                System.out.println("文件名称: " + myfile.getName());
	                System.out.println("文件长度: " + myfile.getSize());
	                System.out.println("文件类型: " + myfile.getContentType());
	                System.out.println("========================================");
	                try {
	                    //这里不必处理IO流关闭的问题,因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
	                    FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, originalFilename));
	                } catch (IOException e) {
	                    System.out.println("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
	                    e.printStackTrace();
	                    out.print("1`文件上传失败，请重试!!");
	                    out.flush();
	                    return null;
	                }
	            }
	        }
	        System.out.println(request.getContextPath() + "/upload/printingRoom" + originalFilename);
	        out.print("0`文件上传成功!"+originalFilename);
	        out.flush();
	        return null;
    }
	
	//  点击超链接打开文印处文件
	@RequestMapping(value =  "/openPrFile")
	@ResponseBody
	public void openRdFile(HttpServletRequest request,String fileName) throws Exception
	{
		String execStr = "cmd /c start explorer ";
		String path = request.getSession().getServletContext().getRealPath("/upload/printingRoom");
		
		execStr = execStr+path+"\\"+ fileName;
		 //判断文件在该目录是否已存在
       File file = new File(path+"\\"+ fileName);	
       if(file.exists())
       {
    	   Process proc =  Runtime.getRuntime().exec(execStr);  
       }else{
    	   throw new Exception();
       }
 
  
	}

	//拥有模块的修改和删除的权限
	public boolean isUpdatePermitted(String model)
	{
		Subject subject = SecurityUtils.getSubject();
		return subject.isPermitted(model+":update");
	}
	//拥有模块的修改和删除的权限
	public boolean isDeletePermitted(String model)
	{
		Subject subject = SecurityUtils.getSubject();
		return subject.isPermitted(model+":delete");
	}
	
}
