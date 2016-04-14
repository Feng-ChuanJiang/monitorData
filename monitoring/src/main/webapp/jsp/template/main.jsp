<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


		<!-- /section:settings.box 页面主要信息开始啦-->
		<div class="page-content-area">
			<div class="page-header">
				<h1>
					控制面板 <small> <i class="ace-icon fa fa-angle-double-right"></i>
						概述 &amp; 统计
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS 页面内容开始-->

					<div class="row">
						<div class="space-6"></div>
						<div class="col-sm-5">
							<div class="widget-box">
								<div
										class="widget-header widget-header-flat widget-header-small">
									<h5 class="widget-title">
										<i class="ace-icon fa fa-signal"></i> 数据错误率
									</h5>

									<div class="widget-toolbar no-border">
										<div class="inline dropdown-hover">
											<button class="btn btn-minier btn-primary">
												今年 <i
													class="ace-icon fa fa-angle-down icon-on-right bigger-110"></i>
											</button>

											<ul
													class="dropdown-menu dropdown-menu-right dropdown-125 dropdown-lighter dropdown-close dropdown-caret">
												<li class="active"><a href="#" class="blue"> <i
														class="ace-icon fa fa-caret-right bigger-110">&nbsp;</i>
													今年
												</a></li>

												<li><a href="#"> <i
														class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
													去年
												</a></li>
											</ul>
										</div>
									</div>
								</div>

								<div class="widget-body">
									<div class="widget-main">
										<!-- #section:plugins/charts.flotchart -->
										<div id="piechart-placeholder"></div>

										<!-- /section:plugins/charts.flotchart -->
										<div class="hr hr8 hr-double"></div>

										<div class="clearfix">
											<!-- #section:custom/extra.grid -->
											<div class="grid3">
												<span class="grey"> <i
														class="ace-icon fa fa-facebook-square fa-2x blue"></i>
													&nbsp; 告警
												</span>
												<h4 class="bigger pull-right">1,255</h4>
											</div>

											<div class="grid3">
												<span class="grey"> <i
														class="ace-icon fa fa-twitter-square fa-2x purple"></i>
													&nbsp; 一般严重
												</span>
												<h4 class="bigger pull-right">941</h4>
											</div>

											<div class="grid3">
												<span class="grey"> <i
														class="ace-icon fa fa-pinterest-square fa-2x red"></i>
													&nbsp; 严重
												</span>
												<h4 class="bigger pull-right">1,050</h4>
											</div>

											<!-- /section:custom/extra.grid -->
										</div>
									</div>
									<!-- /.widget-main -->
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.widget-box -->
						</div>


                      <%--柱状图--%>
						<div class="col-sm-7">
							<div class="widget-box transparent">
								<div class="widget-header widget-header-flat">
									<h4 class="widget-title lighter">
										<i class="ace-icon fa fa-signal"></i> 水情数据
									</h4>

									<div class="widget-toolbar">
										<a href="#" data-action="collapse"> <i
												class="ace-icon fa fa-chevron-up"></i>
										</a>
									</div>
									<div class="widget-toolbar no-border">
										<button class="btn btn-xs btn-light bigger">
											<i class="ace-icon fa fa-arrow-left"></i>
											切换
										</button>

										<button class="btn btn-xs bigger btn-yellow dropdown-toggle" data-toggle="dropdown">
											选择
											<i class="ace-icon fa fa-chevron-down icon-on-right"></i>
										</button>

										<ul class="dropdown-menu dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
											<li>
												<a href="#">水位</a>
											</li>

											<li>
												<a href="#">入库流量</a>
											</li>

											<li>
												<a href="#">出库流量</a>
											</li>

											<li>
												<a href="#">发电流量</a>
											</li>
										</ul>
									</div>
								</div>

								<div class="widget-body">
									<div class="widget-main padding-4">
										<div id="sq-axis" style="height: 225px;width: 100%"></div>
									</div>
									<!-- /.widget-main -->
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.widget-box -->
						</div>

						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- #section:custom/extra.hr -->
					<div class="hr hr32 hr-dotted"></div>

					<!-- /section:custom/extra.hr -->
					<div class="row">
						<div class="col-sm-7">
							<div class="widget-box transparent">
								<div class="widget-header widget-header-flat">
									<h4 class="widget-title lighter">
										<i class="ace-icon fa fa-signal"></i> 电量数据
									</h4>

									<div class="widget-toolbar">
										<a href="#" data-action="collapse"> <i
												class="ace-icon fa fa-chevron-up"></i>
										</a>
									</div>

									<div class="widget-toolbar no-border">
										<button class="btn btn-xs btn-light bigger">
											<i class="ace-icon fa fa-arrow-left"></i>
											切换
										</button>

										<button class="btn btn-xs bigger btn-yellow dropdown-toggle" data-toggle="dropdown">
											选择
											<i class="ace-icon fa fa-chevron-down icon-on-right"></i>
										</button>

										<ul class="dropdown-menu dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
											<li>
												<a href="#">日电量</a>
											</li>

											<li>
												<a href="#">昨日电量</a>
											</li>

											<li>
												<a href="#">月电量</a>
											</li>

											<li>
												<a href="#">年电量</a>
											</li>
										</ul>
									</div>
								</div>

								<div class="widget-body">
									<div class="widget-main padding-4">
										<div id="dl-axis" style="height: 255px;width: 100%"></div>
									</div>
									<!-- /.widget-main -->
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.widget-box -->
						</div>
						<div class="col-sm-5">
							<div class="widget-box transparent">
								<div class="widget-header widget-header-flat">
									<h4 class="widget-title lighter">
										<i class="ace-icon fa fa-star orange"></i> 监控状态
									</h4>

									<div class="widget-toolbar">
										<a href="#" data-action="collapse"> <i
												class="ace-icon fa fa-chevron-up"></i>
										</a>
									</div>
								</div>

								<div class="widget-body">
									<div class="widget-main no-padding">
										<table class="table table-bordered table-striped">
											<thead class="thin-border-bottom">
											<tr>
												<th ><i class="ace-icon fa fa-caret-right blue"></i>名称
												</th>

												<th><i class="ace-icon fa fa-caret-right blue"></i>数量
												</th>

												<th class="hidden-480"><i
														class="ace-icon fa fa-caret-right blue"></i>类型</th>
											</tr>
											</thead>

											<tbody>
											<tr>
												<td>电量数据</td>

												<td><b class="green">219</b></td>

												<td class="hidden-480"><span
														class="label label-info arrowed-right arrowed-in">正常</span></td>
											</tr>

											<tr>
												<td>电量警告数据</td>

												<td><b class="green">0</b></td>

												<td class="hidden-480"><span
														class="label label-success arrowed-in arrowed-in-right">告警</span>
												</td>
											</tr>

											<tr>
												<td>电量错误数据</td>

												<td><b class="green">0</b></td>

												<td class="hidden-480"><span
														class="label label-danger arrowed">严重</span></td>
											</tr>
											<tr>
												<td>水情数据</td>

												<td><b class="green">359</b></td>

												<td class="hidden-480"><span
														class="label label-info arrowed-right arrowed-in">正常</span></td>
											</tr>

											<tr>
												<td>水情警告数据</td>

												<td><b class="green">0</b></td>

												<td class="hidden-480"><span
														class="label label-success arrowed-in arrowed-in-right">告警</span>
												</td>
											</tr>

											<tr>
												<td>水情错误数据</td>

												<td><b class="green">0</b></td>

												<td class="hidden-480"><span
														class="label label-danger arrowed">严重</span></td>
											</tr>

											</tbody>
										</table>
									</div>
									<!-- /.widget-main -->
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.widget-box -->
						</div>
						<!-- /.col -->


						<!-- /.col -->
					</div>
					<!-- /.row -->

					<div class="hr hr32 hr-dotted"></div>

					<div class="row">
						<div class="col-sm-6">
							<div class="widget-box transparent" id="recent-box">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">
										<i class="ace-icon fa fa-rss orange"></i>监控类型错误率
									</h4>

								</div>

								<div class="widget-body">
									<div class="widget-main padding-4">
										<div class="tab-content padding-8">
											<div id="task-tab" class="tab-pane active">
												<h5 class="smaller lighter green">
													<i class="ace-icon fa fa-list"></i>全部级别
												</h5>

												<!-- #section:pages/dashboard.tasks -->
												<ul id="tasks" class="item-list">

													<li class="item-orange clearfix ">
														<label class="ace-icon fa fa-angle-right bigger-110"><span class="lbl">&nbsp; 和上小时数据比较</span></label>
														<div class="pull-right easy-pie-chart percentage"
															 data-size="30" data-color="#ECCB51" data-percent="42">
															<span class="percent">42</span>%
														</div>
													</li>
													<li class="item-red clearfix">
														<label class="ace-icon fa fa-angle-right bigger-110"><span class="lbl">&nbsp; 和上一天数据比较</span></label>
														<div class="pull-right easy-pie-chart percentage"
															 data-size="30" data-color="#ECCB71" data-percent="42">
															<span class="percent">42</span>%
														</div>
													</li>
													<li class="item-default clearfix">
														<label class="ace-icon fa fa-angle-right bigger-110"><span class="lbl">&nbsp; 大于/小于/等于</span></label>
														<div class="pull-right easy-pie-chart percentage"
															 data-size="30" data-color="#ECCB71" data-percent="42">
															<span class="percent">42</span>%
														</div>
													</li>
													<li class="item-blue clearfix">
														<label class="ace-icon fa fa-angle-right bigger-110"><span class="lbl">&nbsp; 超出某个范围</span></label>
														<div class="pull-right easy-pie-chart percentage"
															 data-size="30" data-color="#ECCB71" data-percent="42">
															<span class="percent">42</span>%
														</div>
													</li>
													<li class="item-pink clearfix">
														<label class="ace-icon fa fa-angle-right bigger-110"><span class="lbl">&nbsp; 数据范围变幅大小</span></label>
														<div class="pull-right easy-pie-chart percentage"
															 data-size="30" data-color="#ECCB71" data-percent="42">
															<span class="percent">42</span>%
														</div>
													</li>
													<li class="item-purple clearfix">
														<label class="ace-icon fa fa-angle-right bigger-110"><span class="lbl">&nbsp; 根据其他数据比较</span></label>
														<div class="pull-right easy-pie-chart percentage"
															 data-size="30" data-color="#ECCB71" data-percent="42">
															<span class="percent">42</span>%
														</div>
													</li>
													<li class="item-black  clearfix">
														<label class="ace-icon fa fa-angle-right bigger-110"><span class="lbl">&nbsp; 零点与二十四点数据比较</span></label>
														<div class="pull-right easy-pie-chart percentage"
															 data-size="30" data-color="#ECCB71" data-percent="42">
															<span class="percent">42</span>%
														</div>
													</li>
													<li class="item-brownamber  clearfix">
														<label class="ace-icon fa fa-angle-right bigger-110"><span class="lbl">&nbsp; 数据缺失</span></label>
														<div class="pull-right easy-pie-chart percentage"
															 data-size="30" data-color="#ECCB71" data-percent="42">
															<span class="percent">42</span>%
														</div>
													</li>
												</ul>

												<!-- /section:pages/dashboard.tasks -->
											</div>


											<!-- /.#member-tab -->


										</div>
									</div>
									<!-- /.widget-main -->
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.widget-box -->
						</div>
						<!-- /.col -->

						<div class="col-sm-6">
							<div class="widget-box">
								<div class="widget-header">
									<h4 class="widget-title lighter smaller">
										<i class="ace-icon fa fa-comment blue"></i> 实时信息
									</h4>
								</div>

								<div class="widget-body">
									<div class="widget-main no-padding">
										<!-- #section:pages/dashboard.conversations -->
										<div class="dialogs">
											<div class="itemdiv dialogdiv">
												<div class="user">
													<img alt="小时数据比较" src="assets/avatars/1.png"/></div>
												<div class="body">
													<div class="time">
														<i class="ace-icon fa fa-clock-o"></i> <span class="green">2分钟</span>
													</div>

													<div class="name">
														<a href="#">小时数据比较</a>
													</div>
													<div class="text">水情数据:锦屏流量与上一小时比较超出最大变幅.</div>
													<div class="tools">
														<a href="#" class="btn btn-minier btn-info"> <i
																class="icon-only ace-icon fa fa-share"></i>
														</a>
													</div>
												</div>
											</div>
											<div class="itemdiv dialogdiv">
												<div class="user">
													<img alt="小时数据比较" src="assets/avatars/2.png"/></div>
												<div class="body">
													<div class="time">
														<i class="ace-icon fa fa-clock-o"></i> <span class="green">2分钟</span>
													</div>

													<div class="name">
														<a href="#">小时数据比较</a>
													</div>
													<div class="text">水情数据:锦屏流量与上一小时比较超出最大变幅.</div>
													<div class="tools">
														<a href="#" class="btn btn-minier btn-info"> <i
																class="icon-only ace-icon fa fa-share"></i>
														</a>
													</div>
												</div>
											</div> <div class="itemdiv dialogdiv">
											<div class="user">
												<img alt="小时数据比较" src="assets/avatars/3.png"/></div>
											<div class="body">
												<div class="time">
													<i class="ace-icon fa fa-clock-o"></i> <span class="green">2分钟</span>
												</div>

												<div class="name">
													<a href="#">小时数据比较</a>
												</div>
												<div class="text">水情数据:锦屏流量与上一小时比较超出最大变幅.</div>
												<div class="tools">
													<a href="#" class="btn btn-minier btn-info"> <i
															class="icon-only ace-icon fa fa-share"></i>
													</a>
												</div>
											</div>
										</div> <div class="itemdiv dialogdiv">
											<div class="user">
												<img alt="小时数据比较" src="assets/avatars/4.png"/></div>
											<div class="body">
												<div class="time">
													<i class="ace-icon fa fa-clock-o"></i> <span class="green">2分钟</span>
												</div>

												<div class="name">
													<a href="#">小时数据比较</a>
												</div>
												<div class="text">水情数据:锦屏流量与上一小时比较超出最大变幅.</div>
												<div class="tools">
													<a href="#" class="btn btn-minier btn-info"> <i
															class="icon-only ace-icon fa fa-share"></i>
													</a>
												</div>
											</div>
										</div> <div class="itemdiv dialogdiv">
											<div class="user">
												<img alt="小时数据比较" src="assets/avatars/5.png"/></div>
											<div class="body">
												<div class="time">
													<i class="ace-icon fa fa-clock-o"></i> <span class="green">2分钟</span>
												</div>

												<div class="name">
													<a href="#">小时数据比较</a>
												</div>
												<div class="text">水情数据:锦屏流量与上一小时比较超出最大变幅.</div>
												<div class="tools">
													<a href="#" class="btn btn-minier btn-info"> <i
															class="icon-only ace-icon fa fa-share"></i>
													</a>
												</div>
											</div>
										</div> <div class="itemdiv dialogdiv">
											<div class="user">
												<img alt="小时数据比较" src="assets/avatars/6.png"/></div>
											<div class="body">
												<div class="time">
													<i class="ace-icon fa fa-clock-o"></i> <span class="green">2分钟</span>
												</div>

												<div class="name">
													<a href="#">小时数据比较</a>
												</div>
												<div class="text">水情数据:锦屏流量与上一小时比较超出最大变幅.</div>
												<div class="tools">
													<a href="#" class="btn btn-minier btn-info"> <i
															class="icon-only ace-icon fa fa-share"></i>
													</a>
												</div>
											</div>
										</div> <div class="itemdiv dialogdiv">
											<div class="user">
												<img alt="小时数据比较" src="assets/avatars/7.png"/></div>
											<div class="body">
												<div class="time">
													<i class="ace-icon fa fa-clock-o"></i> <span class="green">2分钟</span>
												</div>

												<div class="name">
													<a href="#">小时数据比较</a>
												</div>
												<div class="text">水情数据:锦屏流量与上一小时比较超出最大变幅.</div>
												<div class="tools">
													<a href="#" class="btn btn-minier btn-info"> <i
															class="icon-only ace-icon fa fa-share"></i>
													</a>
												</div>
											</div>
										</div> <div class="itemdiv dialogdiv">
											<div class="user">
												<img alt="小时数据比较" src="assets/avatars/8.png"/></div>
											<div class="body">
												<div class="time">
													<i class="ace-icon fa fa-clock-o"></i> <span class="green">2分钟</span>
												</div>

												<div class="name">
													<a href="#">小时数据比较</a>
												</div>
												<div class="text">水情数据:锦屏流量与上一小时比较超出最大变幅.</div>
												<div class="tools">
													<a href="#" class="btn btn-minier btn-info"> <i
															class="icon-only ace-icon fa fa-share"></i>
													</a>
												</div>
											</div>
										</div>


										</div>

										<!-- /section:pages/dashboard.conversations -->


									</div>
									<!-- /.widget-main -->
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.widget-box -->
						</div>
						<!-- /.col -->
					</div>

                            <!-- /.row -->

					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content-area -->
<%--调用公共JS上--%>
<jsp:include page="../js/base/common_top.jsp" />

<script src="assets/js/jquery.easypiechart.min.js"></script>
<script src="assets/js/jquery.sparkline.min.js"></script>
<script src="assets/js/flot/jquery.flot.min.js"></script>
<script src="assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="assets/js/flot/jquery.flot.resize.min.js"></script>
<script src="assets/js/echarts.js"></script>
<script type="text/javascript">
	jQuery(function($) {

		//柱状图
		var ccc =echarts.init(document.getElementById('dl-axis'));
		ccc.setOption( {
			toolbox: {
				show : true,
				feature : {
					mark : {show: true},
					dataView : {show: true, readOnly: false},
					magicType: {show: true, type: ['line', 'bar']}


				}
				//padding:-5
			},
			tooltip : {
				trigger: 'axis'
			},
			legend: {
				data:['2011年', '实际电量', '计划电量'],
				left:'right',
				top:60,
				orient: 'vertical'
			},
			grid: {
				left: '1%',
				right: '0%',
				bottom: '2%',
				top:'1%',
				containLabel: true
			},
			xAxis : [
				{
					type : 'value',
					boundaryGap : [0, 0.01]
				}
			],
			yAxis : [
				{
					type : 'category',
					data : ['锦东','锦西','官地','二滩','若水']
				}
			],
			color :  [
				'#ff7f50', '#87cefa', '#da70d6', '#32cd32', '#6495ed',
				'#ff69b4', '#ba55d3', '#cd5c5c', '#ffa500', '#40e0d0',
				'#68BC31','#2091CF','#AF4E96','#F3A43B','#60C0DD',
				'#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
			],
			series : [
				{
					name:'实际电量',
					type:'bar',
					data:[19325, 23438, 31000, 121594, 134141]
				}
				,
				{
					name:'计划电量',
					type:'bar',
					data:[19325, 23438, 31000, 122222, 134141]

				}
			]
		});




		//线路图
		var aaa =echarts.init(document.getElementById('sq-axis'));

		aaa.setOption({
			tooltip : {
				trigger: 'axis'
			},
			legend: {
				data:['锦东','锦西','官地','二滩','若水'],
				left:'right',
				top:60,
				orient: 'vertical'
			},
			toolbox: {
				show : true,
				feature : {
					dataView: {readOnly: false},
					magicType: {type: ['line', 'bar']}
				}

			},grid: {
				left: '0%',
				right: '1%',
				bottom: '2%',
				top:'3%',
				containLabel: true
			},
			xAxis : [
				{
					type : 'category',
					boundaryGap : true,
					data : ['16-21-11','16-21-12','16-21-13','16-21-14','16-21-15','16-21-16','16-21-17','16-21-18','16-21-19','16-21-20','16-21-21','16-21-22','16-21-23','16-21-24']
				}
			],
			yAxis : [
				{
					type : 'value'
					/*            axisLabel : {
					 formatter: '{value} °C'
					 }*/
				}
			],
			series : [
				{
					name:'锦东',
					type:'line',
					symbolSize: 8,
					smooth:true,
					data:[11, 11, 15, 13, 12, 13, 10,11,22,11,12,16,32,29]
				},
				{
					name:'锦西',
					type:'line',
					symbolSize: 8,
					smooth:true,
					data:[2,10,16,14,13,2,13,23,8,9,12,18,12,9]
				}
				,
				{
					name:'官地',
					type:'line',
					symbolSize: 8,
					smooth:true,
					data:[9,13,16,22,13,15,13,23,8,9,12,18,12,9]
				}
				,
				{
					name:'二滩',
					type:'line',
					symbolSize: 8,
					smooth:true,
					data:[4,13,16,14,13,15,13,23,8,9,12,6,12,9]
				}
				,
				{
					name:'若水',
					type:'line',
					symbolSize: 8,
					smooth:true,
					data:[14,22,16,11,13,5,7,23,8,34,12,12,12,8]
				}
			]
		}) ;



	//图形自适应网页
		window.onresize= function () {
			 aaa.resize();
			 ccc.resize();
		};















		$('.easy-pie-chart.percentage').each(function(){
			var $box = $(this).closest('.infobox');
			var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
			var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
			var size = parseInt($(this).data('size')) || 50;
			$(this).easyPieChart({
				barColor: barColor,
				trackColor: trackColor,
				scaleColor: false,
				lineCap: 'butt',
				lineWidth: parseInt(size/10),
				animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
				size: size
			});
		})

		$('.sparkline').each(function(){
			var $box = $(this).closest('.infobox');
			var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
			$(this).sparkline('html',
					{
						tagValuesAttribute:'data-values',
						type: 'bar',
						barColor: barColor ,
						chartRangeMin:$(this).data('min') || 0
					});
		});


		//flot chart resize plugin, somehow manipulates default browser resize event to optimize it!
		//but sometimes it brings up errors with normal resize event handlers
		$.resize.throttleWindow = false;

		var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
		var data = [
			{ label: "水情告警",  data: 38.7, color: "#68BC31"},
			{ label: "电量告警",  data: 24.5, color: "#2091CF"},
			{ label: "水情一般严重",  data: 8.2, color: "#AF4E96"},
			{ label: "电量一般严重",  data: 18.6, color: "#DA5430"},
			{ label: "水情严重",  data: 10, color: "#FEE074"},
			{ label: "电量严重",  data: 10, color: "#FEF089"}
		]
		function drawPieChart(placeholder, data, position) {
			$.plot(placeholder, data, {
				series: {
					pie: {
						show: true,
						tilt:0.8,
						highlight: {
							opacity: 0.25
						},
						stroke: {
							color: '#fff',
							width: 2
						},
						startAngle: 2
					}
				},
				legend: {
					show: true,
					position: position || "ne",
					labelBoxBorderColor: null,
					margin:[-30,15]
				}
				,
				grid: {
					hoverable: true,
					clickable: true
				}
			})
		}
		drawPieChart(placeholder, data);

		/**
		 we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
		 so that's not needed actually.
		 */
		placeholder.data('chart', data);
		placeholder.data('draw', drawPieChart);


		//pie chart tooltip example
		var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
		var previousPoint = null;

		placeholder.on('plothover', function (event, pos, item) {
			if(item) {
				if (previousPoint != item.seriesIndex) {
					previousPoint = item.seriesIndex;
					var tip = item.series['label'] + " : " + item.series['percent']+'%';
					$tooltip.show().children(0).text(tip);
				}
				$tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
			} else {
				$tooltip.hide();
				previousPoint = null;
			}

		});

		var d1 = [];
		for (var i = 0; i < Math.PI * 2; i += 0.5) {
			d1.push([i, Math.sin(i)]);
		}

		var d2 = [];
		for (var i = 0; i < Math.PI * 2; i += 0.6) {
			d2.push([i, Math.cos(i)]);
		}


		$('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
		function tooltip_placement(context, source) {
			var $source = $(source);
			var $parent = $source.closest('.tab-content')
			var off1 = $parent.offset();
			var w1 = $parent.width();

			var off2 = $source.offset();
			//var w2 = $source.width();

			if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
			return 'left';
		}


		$('.dialogs,.comments').ace_scroll({
			size: 420
		});


		//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
		//so disable dragging when clicking on label
		var agent = navigator.userAgent.toLowerCase();
		if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
			$('#tasks').on('touchstart', function(e){
				var li = $(e.target).closest('#tasks li');
				if(li.length == 0)return;
				var label = li.find('label.inline').get(0);
				if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
			});

		$('#tasks').sortable({
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'draggable-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					stop: function( event, ui ) {
						//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
						$(ui.item).css('z-index', 'auto');
					}
				}
		);
		$('#tasks').disableSelection();
		$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
			if(this.checked) $(this).closest('li').addClass('selected');
			else $(this).closest('li').removeClass('selected');
		});


		//show the dropdowns on top or bottom depending on window height and menu position
		$('#task-tab .dropdown-hover').on('mouseenter', function(e) {
			var offset = $(this).offset();

			var $w = $(window)
			if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
				$(this).addClass('dropup');
			else $(this).removeClass('dropup');
		});


	})



</script>