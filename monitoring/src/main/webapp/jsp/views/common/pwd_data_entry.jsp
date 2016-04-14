<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="page-content">
			<div class="page-header">
				<h1>密码设置 <small> <i class="ace-icon fa fa-angle-double-right"></i> &nbsp;修改密码</small></h1>
			</div>
			<div class="row" style="height:30px"></div>
		
			<div class="row">
				<div class="col-xs-12">
					<c:if test="${updateFlag == 'Y' }">
						<div class="alert alert-block alert-success">
							<button type="button" class="close" data-dismiss="alert"> <i class="ace-icon fa fa-times"></i> </button>
							 <i class="ace-icon fa fa-check green"></i>
							<strong class="green">修改成功。</strong> 
						</div>
					</c:if>
					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" action="rest/secretary/doAdd" method="post" onsubmit="return false;">
						<!-- 页面头部 -->
						<div class="form-group">
							<label class="col-sm-3 control-label">用户名 <label style="color: red;">&nbsp;*</label></label>
							<label class="col-sm-1 control-label">${username }</label>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">旧密码 <label style="color: red;">&nbsp;*</label></label>
							<div class="col-sm-5">
								<input name="password" type="password" class="form-control" value="${password }"/>${errorMessage }
								
							</div>
							 
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">新密码 <label style="color: red;">&nbsp;*</label></label>
							<div class="col-sm-5">
								<input name="password1" type="password" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">再次输入新密码 <label style="color: red;">&nbsp;*</label></label>
							<div class="col-sm-5">
								<input name="password2" type="password" class="form-control"/>
							</div>
						</div>
						<!-- 页面头部  END -->
						<div class="row" style="height:30px"></div>
						<div align="center">
							<div>
								<button class="btn btn-sm btn-success" onclick="onSubmit()">
									<i class="ace-icon fa fa-check bigger-110">提交</i> 
								</button>
								
								&nbsp; &nbsp; &nbsp;
								<button class="btn btn-sm btn-success" type="reset" onclick="doUndoAll()">
									<i class="ace-icon fa fa-undo bigger-110">重置</i> 
								</button>
							</div>
						</div>
						<input type="hidden" name="id" value="${id }"/>
					</form>
				</div>
			</div>
						
		</div>

<%--调用公共JS上--%>
<jsp:include page="../../js/base/common_top.jsp" />
<script type="text/javascript" language="JavaScript">
	function doUndoAll()
	{
		$(".chosen-single>span").text("");
		$("span[name='error_message']").remove();
	}

	function onSubmit()
	{
		if(vaidateFrom())
		{
			document.forms[0].action = 'rest/user/pwdSetting';
			document.forms[0].submit();
		}
	}

	function vaidateFrom()
	{
		$("span[name='error_message']").remove();
		$("br").remove();
		var submitFlag = true;
		var password = $("input[name='password']").val();
		var password1 = $("input[name='password1']").val();
		var password2 = $("input[name='password2']").val();
		if(trim(password) == "")
		{
			$("input[name='password").parent().append("<span name='error_message' style='color: red;'>旧密码不能为空.</span>");
			submitFlag = false;
		}
		if(trim(password1) == "")
		{
			$("input[name='password1").parent().append("<span name='error_message' style='color: red;'>新密码不能为空.</span>");
			submitFlag = false;
		}
		if(trim(password2) == "")
		{
			$("input[name='password2").parent().append("<span name='error_message' style='color: red;'>确认新密码不能为空.</span>");
			submitFlag = false;
		}
		if(trim(password1) != trim(password2))
		{
			$("input[name='password2").parent().append("<span name='error_message' style='color: red;'>两次输入的密码不一样.</span>");
			submitFlag = false;
		}
		return submitFlag;
	}

	function trim(str)
	{
		str = str.replace(/(^\s*)|(\s*$)/g, "");
		return str;
	}
</script>

<%--调用公共JS下--%>
<jsp:include page="../../js/base/common_down.jsp" />