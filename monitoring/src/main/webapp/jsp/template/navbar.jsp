<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- #section:basics/navbar.layout 导航布局-->
<div id="navbar" class="navbar navbar-default">
	<script type="text/javascript">
		try {
			ace.settings.check('navbar', 'fixed')
		} catch (e) {
		}
	</script>

	<div class="navbar-container" id="navbar-container">
		<!-- #section:basics/sidebar.mobile.toggle 导航栏开关-->
		<button type="button" class="navbar-toggle menu-toggler pull-left"
			id="menu-toggler">
			<span class="sr-only"></span>
			 <span class="icon-bar"></span>

			<span class="icon-bar"></span>
			
			 <span class="icon-bar"></span>
		</button>

		<!-- /section:basics/sidebar.mobile.toggle 设置公司图标和项目名称-->
		<div class="navbar-header pull-left">
			<!-- #section:basics/navbar.layout.brand -->
			<a href="#" class="navbar-brand"> <small> <!-- i标签为公司图标-->
					<i class="fa fa-leaf"></i> 数据监控预警平台
			</small>
			</a>

			<!-- /section:basics/navbar.layout.brand -->

			<!-- #section:basics/navbar.toggle -->

			<!-- /section:basics/navbar.toggle -->

		</div>

		<!-- #section:basics/navbar.dropdown 导航条提示信息及下来菜单和用户信息-->

		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">

				<li class="grey">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<i class="ace-icon fa fa-tachometer" style="font-size: 18px;"></i>
					</a>

					<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
						<li class="dropdown-header">
							<i class="ace-icon fa fa-bullhorn"></i>
							3 监控级别
						</li>

						<li>
							<a href="#">
								<div class="clearfix">
									<span class="pull-left">告警</span>
									<span class="pull-right">50%</span>
								</div>

								<div class="progress progress-mini">
									<div style="width:50%" class="progress-bar"></div>
								</div>
							</a>
						</li>

						<li>
							<a href="#">
								<div class="clearfix">
									<span class="pull-left">一般严重</span>
									<span class="pull-right">15%</span>
								</div>

								<div class="progress progress-mini">
									<div style="width:15%" class="progress-bar progress-bar-warning"></div>
								</div>
							</a>
						</li>

						<li>
							<a href="#">
								<div class="clearfix">
									<span class="pull-left">严重</span>
									<span class="pull-right">35%</span>
								</div>

								<div class="progress progress-mini">
									<div style="width:35%" class="progress-bar progress-bar-danger"></div>
								</div>
							</a>
						</li>


						<li class="dropdown-footer">
							<a href="#">
								看到任务的细节
								<i class="ace-icon fa fa-arrow-right"></i>
							</a>
						</li>
					</ul>
				</li>

				<li class="purple">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<i class="ace-icon fa fa-bell icon-animated-bell"></i>
						<span class="badge badge-important">16</span>
					</a>

					<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
						<li class="dropdown-header">
							<i class="ace-icon fa fa-exclamation-triangle"></i>
							16 条通知
						</li>

						<li>
							<a href="#">
								<div class="clearfix">
											<span class="pull-left">
												  <img  style="width: 25px;height: 25px;" src="assets/avatars/7.png"/>
												和上一小时数据比较
											</span>
									<span class="pull-right badge badge-info">+12</span>
								</div>
							</a>
						</li>

						<li>
							<a href="#">
								<div class="clearfix">
											<span class="pull-left">
												  <img  style="width: 25px;height: 25px;" src="assets/avatars/3.png"/>
												大于/小于/等于
											</span>
									<span class="pull-right badge badge-info">+12</span>
								</div>
							</a>
						</li>

						<li>
							<a href="#">
								<div class="clearfix">
											<span class="pull-left">
												  <img  style="width: 25px;height: 25px;" src="assets/avatars/4.png"/>
												数据范围
											</span>
									<span class="pull-right badge badge-info">+13</span>
								</div>
							</a>
						</li>

						<li>
							<a href="#">
								<div class="clearfix">
											<span class="pull-left">
												  <img  style="width: 25px;height: 25px;" src="assets/avatars/5.png"/>
												零点与二十四点数据比较
											</span>
									<span class="pull-right badge badge-info">+5</span>
								</div>
							</a>
						</li>

						<li>
							<a href="#">
								<div class="clearfix">
											<span class="pull-left">
												  <img  style="width: 25px;height: 25px;" src="assets/avatars/6.png"/>
												和上一小时数据比较
											</span>
									<span class="pull-right badge badge-info">+9</span>
								</div>
							</a>
						</li>

						<li class="dropdown-footer">
							<a href="#">
								查看全部信息
								<i class="ace-icon fa fa-arrow-right"></i>
							</a>
						</li>

					</ul>
				</li>

				<li class="green">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
						<span class="badge badge-success">5</span>
					</a>

					<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
						<li class="dropdown-header">
							<i class="ace-icon fa fa-envelope-o"></i>
							5 条短信
						</li>

						<li class="dropdown-content">
							<ul class="dropdown-menu dropdown-navbar">
								<li>
									<a href="#">
										<img src="assets/avatars/avatar2.png" class="msg-photo" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">川江:</span>
														和上一小时比较：水情数据（28条警告，两条严重）电量数据（5条警告）
														和上一小时比较：水情数据（28条警告，两条严重）电量数据（5条警告）
														和上一小时比较：水情数据（28条警告，两条严重）电量数据（5条警告）
														和上一小时比较：水情数据（28条警告，两条严重）电量数据（5条警告）
														和上一小时比较：水情数据（28条警告，两条严重）电量数据（5条警告）
														和上一小时比较：水情数据（28条警告，两条严重）电量数据（5条警告）
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>20 分钟前</span>
													</span>
												</span>
									</a>
								</li>

								<li>
									<a href="#">
										<img src="assets/avatars/avatar2.png" class="msg-photo" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">川江:</span>
														水情数据:锦屏流量与上一小时比较超出最大变幅
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>20 分钟前</span>
													</span>
												</span>
									</a>
								</li>
								<li>
									<a href="#">
										<img src="assets/avatars/avatar2.png" class="msg-photo" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">川江:</span>
														水情数据:锦屏流量与上一小时比较超出最大变幅
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>20 分钟前</span>
													</span>
												</span>
									</a>
								</li>
								<li>
									<a href="#">
										<img src="assets/avatars/avatar2.png" class="msg-photo" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">川江:</span>
														水情数据:锦屏流量与上一小时比较超出最大变幅
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>20 分钟前</span>
													</span>
												</span>
									</a>
								</li>
								<li>
									<a href="#">
										<img src="assets/avatars/avatar2.png" class="msg-photo" />
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">川江:</span>
														水情数据:锦屏流量与上一小时比较超出最大变幅
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>20 分钟前</span>
													</span>
												</span>
									</a>
								</li>

							</ul>
						</li>

						<li class="dropdown-footer">
							<a href="inbox.html">
								查看全部短信
								<i class="ace-icon fa fa-arrow-right"></i>
							</a>
						</li>
					</ul>
				</li>




				<!-- #section:basics/navbar.user_menu 用户信息-->
				<li class="light-blue"><a data-toggle="dropdown" href="#"
					class="dropdown-toggle"> <img class="nav-user-photo"
						src="<%= basePath%>assets/avatars/user.jpg" alt="Jason's Photo" /> <span
						class="user-info"> <small>Welcome,</small> 川江
					</span> <i class="ace-icon fa fa-caret-down"></i>
				</a>

					<ul
						class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<li><a href="#"> <i class="ace-icon fa fa-cog"></i> 设置
						</a></li>

						<li><a href="profile.html"> <i
								class="ace-icon fa fa-user"></i> 资料
						</a></li>

						<li class="divider"></li>

						<li><a href="rest/user/logout"> <i class="ace-icon fa fa-power-off"></i>
								注销
						</a></li>
					</ul></li>

				<!-- /section:basics/navbar.user_menu -->
			</ul>
		</div>

		<!-- /section:basics/navbar.dropdown -->
	</div>
	<!-- /.navbar-container -->
</div>