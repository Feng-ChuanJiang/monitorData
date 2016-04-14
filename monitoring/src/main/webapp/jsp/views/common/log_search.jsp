<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml">
    <body>

		<div class="page-content-area" >
			<div class="page-header">
				<h1>日志管理 <small> <i class="ace-icon fa fa-angle-double-right"></i> &nbsp;日志查询</small></h1>
			</div>
	
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<form id="searchForm" class="form-horizontal" action="rest/logSystem/doSearch" method="post" onsubmit="return false;" >
						<!-- 页面头部 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">日期</label>
							<div class="col-sm-2">
								<div class="input-group">
									<input type="text" name="handleTime" class="form-control date-timepicker"/>
									<span class="input-group-addon">
										<i class="fa fa-clock-o bigger-110"></i>
									</span>
								</div>
							</div>
							<label class="col-sm-1"></label>
							<label class="col-sm-1 control-label">到</label>
							<div class="col-sm-2">
								<div class="input-group">
									<input type="text" name="searchValue1" class="form-control date-timepicker"/>
									<span class="input-group-addon">
										<i class="fa fa-clock-o bigger-110"></i>
									</span>
								</div>
							</div>
							<label class="col-sm-1"></label>
						</div>
						<div class="space-12"></div>
						<div align="center">
							<div>
								<button type="button" class="btn btn-sm btn-primary" onclick="onSubmit()">
									<i class="ace-icon fa fa-search"></i>
									<span class="bigger-110">查询</span>
								</button>
							</div>
						</div>
					</form>
					<!-- 页面头部  END -->
					<div class="space-12"></div>
					<!--  台账统计  -->
					<div id="printDIV">
						<div class="col-xs-15">
							<table id="sample-table" class="table table-striped table-bordered table-hover">
								<thead>
									<th></th>
									<th>操作人</th>
									<th>操作内容</th>
									<th>操作时间</th>
									<th>IP地址</th>
									<th>操作详情</th>
								</thead>
								<tbody>
									<c:forEach items="${logList}" var="list" varStatus="status">
										<tr><td align="center">${status.index +1 }</td>
										<td>${list.userName }</td>
										<td>${list.handle }</td>
										<td><fmt:formatDate value="${list.handleTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td>${list.hostName }</td>
										<td>${list.contents }</td>
										</tr> 
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div><!-- / col -->
			</div><!-- /row  -->  
			
		</div>
 		<script type="text/javascript" language="JavaScript">
 		
			jQuery(function($) {
			/*  第一个查询台账详细table*/	
				$('#sample-table').dataTable( {
					"iDisplayLength" : 10,
					bAutoWidth      : false,
					"aoColumns": [ { "bSortable": false }, { "bSortable": false },{ "bSortable": false },{ "bSortable": false },{ "bSortable": false },{ "bSortable": false } ],
					"aaSorting": [],
					//"sPaginationType" : "full_numbers",
			        "oLanguage" : {
			            "sProcessing" : "正在加载中......",
			            "sLengthMenu" : "每页显示 _MENU_ 条记录",
			            "sZeroRecords" : "没有搜索到任何相关数据!",
			            "sEmptyTable" : "没有查询到任何相关数据！",
			            "sInfo" : "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
			            "sInfoEmpty" : "显示0到0条记录",
			            "sInfoFiltered" : "数据表中共为 _MAX_ 条记录",
			            "sSearch" : "搜索 ：",
			            "oPaginate" : {"sFirst" : "首页","sPrevious" : "上一页","sNext" : "下一页","sLast" : "末页"
			            }
			        }
			    } );
				/*  第一个查询台账详细*/
			});
			//提交查询数据
			function onSubmit()
			{
				document.forms[0].action = "rest/logSystem/doSearch";
				document.forms[0].submit();
			}
		 </script> 
		
	</body>
 </html>