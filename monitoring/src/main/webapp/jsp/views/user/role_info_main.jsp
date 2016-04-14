<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="page-content-area">
	<div class="page-header">
		<h1>
			角色管理 <small> <i class="ace-icon fa fa-angle-double-right"></i>
			选择角色后对该角色的用户和权限进行操作
		</small>
		</h1>
	</div>
	<!-- /.page-header -->

	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<div class="col-xs-12 widget-container-col">
				<div class="widget-box widget-color-blue">
					<!-- #section:custom/widget-box.options -->
					<div class="widget-header">
						<h5 class="widget-title bigger lighter">
							<i class="ace-icon fa fa-user"></i> 角色管理
						</h5>

					</div>
					<!-- #section:plugins/fuelux.treeview -->
					<div class="row">
						<!-- #角色管理 -->
						<div class="col-sm-4">
							<ul class="nav nav-list">
								<li class="">
									<span id="id-btn-addrole" class="btn btn-info btn-sm"  >增加</span>
									<span id="id-btn-updaterole" class="btn btn-warning btn-sm tooltip-warning">修改</span>
									<span id="id-btn-deleterole" class="btn btn-danger btn-sm tooltip-error">删除</span>
								</li>
							</ul>
							<div class="widget-body">
								<div class="widget-main padding-8">
									<div id="treeRole" class="tree"></div>
								</div>
							</div>
						</div>

						<!-- 角色的用户和权限管理 -->

						<div class="col-sm-8">
							<!-- #section:elements.tab -->
							<div class="tabbable">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a data-toggle="tab" href="#role">
										<i class="red ace-icon fa fa-users bigger-120"></i> 用户角色
									</a></li>

									<li><a data-toggle="tab" href="#permission"> <i
											class="black ace-icon fa fa-cogs bigger-120"></i> 角色权限
									</a></li>
								</ul>

								<div class="tab-content">
									<div id="role" class="tab-pane fade in active">
										<div class="widget-body">
											<div class="widget-main padding-8">
												<div id="treeUserRole" class="tree"></div>
											</div>
										</div>
									</div>

									<div id="permission" class="tab-pane fade">
										<div class="widget-body">
											<div class="widget-main padding-8">
												<div id="treeRolePermission" class="tree"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /section:plugins/fuelux.treeview -->
			<script type="text/javascript">var $assets = "assets";//this will be used in fuelux.tree-sampledata.js
			</script>
			<!-- PAGE CONTENT ENDS -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->



	<div id="dialog-message" class="hide">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<form id="role_creat" class="form-horizontal" action="rest/role/creat" method="post" >
					<!-- #section:elements.form -->

					<input type="hidden" id="roleid" name="id" />

					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right"
							   for="form-field-1">角色编码 </label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="roleSign" name="roleSign" placeholder="唯一编号" />
						</div>
					</div>

					<div class="space-4"></div>

					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right"
							   for="form-field-1-2">角色名称 </label>

						<div class="col-sm-8">
							<input type="text" id="roleName" name="roleName" placeholder="名称"
								   class="form-control col-sm-5" />
						</div>
					</div>


					<div class="space-4"></div>

					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right"
							   for="form-field-10">备注</label>
						<div class="col-sm-8">
							<textarea class="form-control" rows="3"  id="description" name="description"
									  placeholder="其他信息..."></textarea>
						</div>
					</div>
				</form>

			</div>
			<!-- /.col -->
		</div>

		<div class="hr hr-12 hr-double"></div>

		<p>
			每个角色有个<b>唯一编码</b>,可以用角色拼音或英文代替 .
		</p>
	</div>
	<!-- #dialog-message -->

	<div id="dialog-confirm" class="hide">
		<div class="alert alert-info bigger-110">这个角色将永久被删除,<br/>不能恢复.</div>

		<div class="space-6"></div>

		<p class="bigger-110 bolder center grey">
			<i class="ace-icon fa fa-hand-o-right blue bigger-120"></i>
			你确定吗？
		</p>
	</div>
	<!-- #dialog-confirm -->














</div>
<!-- /.page-content-area -->





<%--调用公共JS上--%>
<jsp:include page="../../js/base/common_top.jsp" />

<!-- page specific plugin scripts -->
<script src="assets/js/fuelux/data/fuelux.tree-sample-demo-data.js"></script>
<!-- <script src="assets/js/fuelux/fuelux.tree.min.js"></script>  -->
<script src="assets/js/uncompressed/fuelux/fuelux.tree.js"></script>
<!-- page specific plugin scripts -->
<script src="assets/js/jquery-ui.min.js"></script>

<%--本页面JS--%>
<script src="jsp/js/user/role_info_main.js"></script>

<%--调用公共JS下--%>
<jsp:include page="../../js/base/common_down.jsp" />