<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="page-content-area">
	<div class="page-header">
		<h1>
			用户维护<small> <i class="ace-icon fa fa-angle-double-right"></i>
				新增用户
			</small>
		</h1>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<c:if test="${addFlag == 'Y' }">
				<div class="alert alert-block alert-success">
					<button type="button" class="close" data-dismiss="alert"> <i class="ace-icon fa fa-times"></i> </button>
					 <i class="ace-icon fa fa-check green"></i>
					<strong class="green">添加成功。</strong> 
				</div>
			</c:if>
			<!-- PAGE CONTENT BEGINS -->
			<form class="form-horizontal" action="rest/user/creat" method="post" onsubmit="return false;">
				<!-- #section:elements.form -->
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1">职工编号<label style="color: red;">&nbsp;*</label> </label>
					<div class="col-sm-9">
						<div class="col-sm-5 no-padding-left">
							<input type="text" class="form-control" name="username" />
							${isSameUser }
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-2">职工姓名 <label style="color: red;">&nbsp;*</label> </label>

					<div class="col-sm-9">
						<div class="col-sm-5 no-padding-left">
							<input type="text" name="chinaName" class="form-control col-sm-5" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-select-3">职位 </label>
					<div class="col-sm-9">
						<div class="col-sm-5 no-padding-left">
							<input type="text" name="userPosition" class="form-control col-sm-5" />
							<!-- <select class="chosen-select " name="userPosition" data-placeholder="请选择职位">
								<option value=""></option>
								<option value="员工">员工</option>
								<option value="副总经理">副总经理</option>
								<option value="主管">主管</option>
								<option value="总工程师">总工程师</option>
								<option value="总经理">总经理</option>
								<option value="主任">主任</option>
								<option value="值长">值长</option>
								<option value="副主任">副主任</option>
								<option value="党委副书记">党委副书记</option>
								<option value="主任工程师">主任工程师</option>
								<option value="厂长">厂长</option>
								<option value="副厂长">副厂长</option>
								<option value="局长">局长</option>
								<option value="副局长">副局长</option>
								<option value="主管">主管</option>
								<option value="副总工程师">副总工程师</option>
								<option value="总会计师">总会计师</option>
								<option value="副总会计师">副总会计师</option>
								<option value="总经济师">总经济师</option>
								<option value="班长">班长</option>
								<option value="工程师">工程师</option>
								<option value="值班员">值班员</option>
								<option value="副值长">副值长</option>
							</select> -->
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-2">部门/单位<label style="color: red;">&nbsp;*</label></label>
					<div class="col-sm-9">
						<div class="col-sm-5 no-padding-left">
							<select class="chosen-select " name="userGroupId" data-placeholder="请选择部门/单位">
								<c:forEach items="${departmentList}" var="list">
									<option value=""></option>
									<option value="${list.id }">${list.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-4"> 性&nbsp;别</label>

					<div class="col-sm-9">
						<!-- #section:elements.form.input-icon -->
						<div class="col-sm-1" style="padding-top: 5px;">
							<label> <input type="radio" name="userSex"value="男" checked /> 男 </label>
						</div>
						<div class="col-sm-1" style="padding-top: 5px;">
							<label> <input type="radio" name="userSex" value="女" /> 女 </label>
						</div>

					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-1-5"> 年&nbsp;龄 </label>

					<div class="col-sm-9">
						<div class="col-sm-5 no-padding-left">
							<input type="text" name="userAge" class="form-control" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-1-6"> 电&nbsp;话 </label>

					<div class="col-sm-9">
						<div class="col-sm-5 no-padding-left">
							<input type="text" name="userPhone" class="form-control" />
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-1-6"> 邮箱地址 </label>

					<div class="col-sm-9">
						<div class="col-sm-5 no-padding-left">
							<input type="text" name="userEmail" class="form-control" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-1-7"> 家庭住址 </label>

					<div class="col-sm-9">
						<div class="col-sm-5 no-padding-left">
							<input type="text" name="userAddress"class="form-control" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-10">备注</label>
					<div class="col-sm-9">
						<div class="col-sm-5 no-padding-left">
							<textarea class="form-control" rows="3" name="remarks" placeholder="其他信息..."></textarea>
						</div>
					</div>
				</div>

				<div class="row" style="height:30px"></div>
				<div align="center">
					<div>
						<button class="btn btn-sm btn-success" onclick="onSubmit()">
							<i class="ace-icon fa fa-check bigger-110">提交</i> 
						</button>
						
						&nbsp; &nbsp; &nbsp;
						<button class="btn btn-sm btn-success" onclick="doUndoAll()">
							<i class="ace-icon fa fa-undo bigger-110">重置</i> 
						</button>
					</div>
				</div>

			</form>

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</div>
<%--调用公共JS上--%>
<jsp:include page="../../js/base/common_top.jsp" />
<%--本页面JS--%>
<script src="jsp/js/user/user_info_creat.js"></script>

<%--调用公共JS下--%>
<jsp:include page="../../js/base/common_down.jsp" />