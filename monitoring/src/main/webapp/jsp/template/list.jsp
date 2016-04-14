<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<tiles:insertAttribute name="head" />
<body class="no-skin">

	<tiles:insertAttribute name="navbar" />
	<div class="main-container" id="main-container">
		<tiles:insertAttribute name="left_navbar" />
		<!-- /section:basics/sidebar 界面主体-->
		<div class="main-content">
			<%--导航--%>
			<div class="breadcrumbs" id="breadcrumbs">
				<ul class="breadcrumb" id="breadcrumbli">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">主页</a></li>
					<input type="hidden" id="breadvalue112" value="<tiles:insertAttribute name="title" />" />
				</ul>
			</div>
			<!-- /section:basics/content.breadcrumbs-->
			<div class="page-content">
				<tiles:insertAttribute name="layout_setting" />
				<!-- /.ace-settings-container -->
				<tiles:insertAttribute name="main" />
				<tiles:insertAttribute name="footer" />
			</div>
			<!-- basic scripts -->
		</div>
		<!-- /.page-content -->
	</div>

</body>
</html>