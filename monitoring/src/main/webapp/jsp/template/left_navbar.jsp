<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
	try{ace.settings.check('main-container' , 'fixed')}catch(e){}
</script>
<!-- #section:basics/sidebar 侧边导航-->
<div id="sidebar" class="sidebar                  responsive">
	<script type="text/javascript">
		try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
	</script>
	<!--侧边导航上方四个按钮-->
	 <div class="sidebar-shortcuts" id="sidebar-shortcuts">
    <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
        <button class="btn btn-success">
            <i class="ace-icon fa fa-signal"></i>
        </button>

        <button class="btn btn-info">
            <i class="ace-icon fa fa-pencil"></i>
        </button>

        <button class="btn btn-warning">
            <i class="ace-icon fa fa-users"></i>
        </button>

        <button class="btn btn-danger">
            <i class="ace-icon fa fa-cogs"></i>
        </button>

    </div>

    <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
        <span class="btn btn-success"></span>

        <span class="btn btn-info"></span>

        <span class="btn btn-warning"></span>

        <span class="btn btn-danger"></span>
    </div>
</div> <!-- /.sidebar-shortcuts -->
	<!--下拉导航开始-->
	<ul class="nav nav-list">
		<c:set var="salary" scope="session" value=""/>
		<c:out value="${salary}"/>
		<c:forEach var="menu" items="${menuData.data}" varStatus="status">
			<li
					<c:if test="${menuState[1]==menu.id}">
						<c:choose>
							<c:when test="${menu.children!=null}"> class="active open" </c:when>
							<c:otherwise>  class="active" </c:otherwise>
						</c:choose>
					</c:if>
					>
				<a
						<c:choose>
							<c:when test="${menu.children!=null}">  href="#" class="dropdown-toggle" </c:when>
							<c:otherwise>  href="${menu.href}" </c:otherwise>
						</c:choose>
						>

					<i class="${menu.style}"></i>
					<span class="menu-text">  ${menu.name}</span>

					<c:if test="${menu.children!=null}">
						<b class="arrow fa fa-angle-down"></b>
					</c:if>
				</a>
				<b class="arrow"></b>
				<c:if test="${menu.children!=null}">
					<ul class="submenu">
						<c:forEach var="menu1" items="${menu.children}" varStatus="status">
							<li
									<c:if test="${menuState[2]==menu1.id}">
										<c:choose>
											<c:when test="${menu1.children!=null}"> class="active open" </c:when>
											<c:otherwise>  class="active" </c:otherwise>
										</c:choose>
									</c:if>
									>
								<a
										<c:choose>
											<c:when test="${menu1.children!=null}">  href="#" class="dropdown-toggle" </c:when>
											<c:otherwise>  href="${menu1.href}" </c:otherwise>
										</c:choose>
										>
									<i class="menu-icon fa fa-caret-right"></i>
										${menu1.name}
									<c:if test="${menu1.children!=null}">
										<b class="arrow fa fa-angle-down"></b>
									</c:if>
								</a>

								<b class="arrow"></b>
								<c:if test="${menu1.children!=null}">
									<ul class="submenu">

										<c:forEach var="menu2" items="${menu1.children}" varStatus="status">
											<li
													<c:if test="${menuState[3]==menu2.id}">
														<c:choose>
															<c:when test="${menu2.children!=null}"> class="active open" </c:when>
															<c:otherwise>  class="active" </c:otherwise>
														</c:choose>
													</c:if>
													>
												<a
														<c:choose>
															<c:when test="${menu2.children!=null}">  href="#" class="dropdown-toggle" </c:when>
															<c:otherwise>  href="${menu2.href}"</c:otherwise>
														</c:choose>
														>
													<i class="menu-icon fa fa-caret-right"></i>
														${menu2.name}
													<c:if test="${menu2.children!=null}">
														<b class="arrow fa fa-angle-down"></b>
													</c:if>
												</a>

												<b class="arrow"></b>
											</li>

										</c:forEach>

									</ul>
								</c:if>
							</li>
						</c:forEach>

					</ul>
				</c:if>
			</li>
		</c:forEach>






		<%-- 	<li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-comment-o"></i>

                    <span class="menu-text">
                        其他信息

                        <!-- #section:basics/sidebar.layout.badge -->
                        <span class="badge badge-primary">5</span>

                        <!-- /section:basics/sidebar.layout.badge -->
                    </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="faq.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            FAQ
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="error-404.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Error 404
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="error-500.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Error 500
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="grid.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Grid
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="blank.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Blank Page
                        </a>

                        <b class="arrow"></b>
                    </li>


                     <!-- 测试权限控制 -->
                        <shiro:hasAnyRoles name="super_admin">
                            <li>
                                <a href="javascript:;">super_admin 拥有此角色</a>
                            </li>
                        </shiro:hasAnyRoles>

                        <shiro:hasPermission name="user:create">
                            <li>
                                <a href="javascript:;">user:create 拥有此权限</a>
                            </li>
                        </shiro:hasPermission>

                        <shiro:hasPermission name="user:update">
                            <li>
                                <a href="javascript:;">user:update 拥有此权限</a>
                            </li>
                        </shiro:hasPermission>

                </ul>
            </li> --%>
	</ul><!-- /.nav-list -->

	<!-- #section:basics/sidebar.layout.minimize 设置导航最小化-->
	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>

	<!-- /section:basics/sidebar.layout.minimize -->
	<script type="text/javascript">
		try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}




	</script>

</div>
			

