<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>404 Error Page - Ace Admin</title>

<meta name="description" content="404 Error Page" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=basePath%>assets/css/font-awesome.min.css" />

<!-- page specific plugin styles -->

<!-- text fonts -->
<link rel="stylesheet" href="<%=basePath%>assets/css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet" href="<%=basePath%>assets/css/ace.min.css"
	id="main-ace-style" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="<%=basePath%>assets/css/ace-part2.min.css" />
		<![endif]-->
<link rel="stylesheet" href="<%=basePath%>assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/ace-rtl.min.css" />

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="<%=basePath%>assets/css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="<%=basePath%>assets/js/ace-extra.min.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="<%=basePath%>assets/js/html5shiv.min.js"></script>
		<script src="<%=basePath%>assets/js/respond.min.js"></script>
		<![endif]-->
</head>

<body >


							<div style="text-align: center; ">
								<div>
									<h1 class=" lighter smaller">
										<span class="blue bigger-125"> <i
											class="ace-icon fa fa-random"></i> 500
										</span> Something Went Wrong
									</h1>

									<hr />
									<h3 class="lighter smaller">
										But we are working <i
											class="ace-icon fa fa-wrench icon-animated-wrench bigger-125"></i>
										on it!
									</h3>

									<div class="space"></div>

									<div > 
										<h4 class="lighter smaller" >Meanwhile, try one of the
											following:</h4>

										<ul class="list-unstyled spaced inline bigger-110 margin-15" style="text-align: left; ">
											<li><i class="ace-icon fa fa-hand-o-right blue"></i>
												Read the faq</li>

											<li><i class="ace-icon fa fa-hand-o-right blue"></i>
												Give us more info on how this specific error occurred!</li>
										</ul>
									</div>

									<hr />
									<div class="space"></div>

									<div class="center">
										<a href="javascript:history.back()" class="btn btn-grey">
											<i class="ace-icon fa fa-arrow-left"></i> Go Back
										</a> <a href="#" class="btn btn-primary"> <i
											class="ace-icon fa fa-tachometer"></i> Dashboard
										</a>
									</div>
								</div>
							</div>




		

	<script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>assets/js/ace-elements.min.js"></script>
	<script src="<%=basePath%>assets/js/ace.min.js"></script>
	<link rel="stylesheet"
		href="<%=basePath%>assets/css/ace.onpage-help.css" />
	<link rel="stylesheet"
		href="<%=basePath%>docs/assets/js/themes/sunburst.css" />
	<script type="text/javascript">
		ace.vars['base'] = '..';
	</script>
	<script src="<%=basePath%>assets/js/ace/elements.onpage-help.js"></script>
	<script src="<%=basePath%>assets/js/ace/ace.onpage-help.js"></script>
	<script src="<%=basePath%>docs/assets/js/rainbow.js"></script>
	<script src="<%=basePath%>docs/assets/js/language/generic.js"></script>
	<script src="<%=basePath%>docs/assets/js/language/html.js"></script>
	<script src="<%=basePath%>docs/assets/js/language/css.js"></script>
	<script src="<%=basePath%>docs/assets/js/language/javascript.js"></script>
</body>
</html>

