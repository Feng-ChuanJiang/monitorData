<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/10/28
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- /section:basics/sidebar -->
<div class="page-content-area">
    <form class="form-horizontal" action="rest/addMonitor/add" method="post" onsubmit="return false;">
        <div class="page-header">
            <h1>
                监控
                <small>
                    <i class="ace-icon fa fa-angle-double-right"></i>
                    数据录入
                </small>
            </h1>
        </div>
        <!-- /.page-header -->

        <div class="row">
            <div class="col-xs-12">
                <div class="widget-box">
                    <div class="widget-header widget-header-blue widget-header-flat">
                        <h4 class="widget-title lighter">数据录入</h4>

                        <div class="widget-toolbar">
                            <label>
                                <small class="green">
                                    <b>Validation</b>
                                </small>

                                <input id="skip-validation" type="checkbox" class="ace ace-switch ace-switch-4"/>
                                <span class="lbl middle"></span>
                            </label>
                        </div>
                    </div>

                    <div class="widget-body">
                        <div class="widget-main">
                            <!-- #section:plugins/fuelux.wizard -->
                            <div id="fuelux-wizard" data-target="#step-container">
                                <!-- #section:plugins/fuelux.wizard.steps -->
                                <ul class="wizard-steps">
                                    <li data-target="#step1" class="active">
                                        <span class="step">1</span>
                                        <span class="title">数据类型</span>
                                    </li>

                                    <li data-target="#step2">
                                        <span class="step">2</span>
                                        <span class="title">监控类型</span>
                                    </li>

                                    <li data-target="#step3">
                                        <span class="step">3</span>
                                        <span class="title">调度任务</span>
                                    </li>

                                    <li data-target="#step4">
                                        <span class="step">4</span>
                                        <span class="title">告警设置</span>
                                    </li>
                                </ul>

                                <!-- /section:plugins/fuelux.wizard.steps -->
                            </div>

                            <hr/>
                            <form class="form-horizontal" id="validation-form" method="get">
                                <!-- #section:plugins/fuelux.wizard.container -->
                                <div class="step-content pos-rel" id="step-container">
                                    <div class="step-pane active" id="step1">
                                        <h3 class="lighter block green">请输入以下的信息</h3>
                                        <!-- input样式 -->
                                        <div class="form-group">
                                            <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                   for="datatype">数据类型:</label>
                                            <!--数据选择-->
                                            <div class="col-xs-12 col-sm-9">
                                                <select class="col-xs-4" id="datatype" name="dataType">
                                                    <option value="1">电量数据</option>
                                                    <option value="2">水情数据</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="hr hr-dotted"></div>

                                        <!--水情点号-->
                                        <div id="wdsDiv" class="hide">
                                            <div class="form-group">
                                                <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                       for="wdsTable">数据表名:</label>

                                                <div class="col-xs-12 col-sm-5">
                                                    <select multiple="multiple" class="form-control tag-input-style" id="wdsTable" name="wdsData.tableName" data-placeholder="请选择表名">
                                                        <option value="AL">实时表</option>
                                                        <option value="AK">日表</option>
                                                        <option value="AZ">月表</option>
                                                        <option value="A">年表</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                       for="name">点号:</label>

                                                <div class="col-xs-12 col-sm-5">
                                                    <div class="clearfix">
                                                        <input type="text" id="name" name="wdsData.name" class="col-xs-12"/>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <!--电能量点号-->
                                        <div id="tmrDiv">

                                            <div class="form-group">
                                                <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                       for="tmrTable">数据表名:</label>

                                                <div class="col-xs-12 col-sm-5">
                                                    <select multiple="multiple" class="chosen-select tag-input-style"
                                                            id="tmrTable"
                                                            data-placeholder="请选择表名">
                                                        <option value="AL">Power_data60_final</option>
                                                        <option value="AK">Adm_power_stat</option>
                                                        <option value="AZ">Adm_power_stat_indi</option>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                       for="tmrId">电站:</label>

                                                <div class="col-xs-12 col-sm-5">
                                                    <select multiple="multiple" class="chosen-select tag-input-style"
                                                            id="tmrId"
                                                            data-placeholder="请选择电站">
                                                        <option value="AL">若水</option>
                                                        <option value="AK">Alaska</option>
                                                        <option value="AZ">Arizona</option>
                                                        <option value="AR">Arkansas</option>
                                                        <option value="CA">California</option>
                                                        <option value="CO">Colorado</option>
                                                        <option value="CT">Connecticut</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                       for="meterId">电表:</label>

                                                <div class="col-xs-12 col-sm-5">
                                                    <select multiple="multiple" class="chosen-select tag-input-style"
                                                            id="meterId"
                                                            data-placeholder="请选择电站">
                                                        <option value="AL">Alabama</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                       for="dataTypes">类型:</label>

                                                <div class="col-xs-12 col-sm-5">
                                                    <select multiple="multiple" class="chosen-select tag-input-style"
                                                            id="dataTypes"
                                                            data-placeholder="请选择类型">
                                                        <option value="AL">正向有功</option>
                                                        <option value="AL">正向无功</option>
                                                        <option value="AL">反向有功</option>
                                                        <option value="AL">反向无功</option>
                                                    </select>
                                                </div>
                                            </div>

                                        </div>


                                        <!-- input样式 验证结束-->
                                        <div class="hr hr-dotted"></div>

                                        <div class="container col-xs-12">
                                            <table id="scble-1"
                                                   class="table table-striped table-bordered table-hover">
                                                <thead>
                                                <tr>
                                                    <th>编号</th>
                                                    <th>点号</th>
                                                    <th>电站名称</th>
                                                    <th>点号名称</th>
                                                    <th>状态</th>
                                                </thead>

                                                <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>
                                                        <a href="#">01000005</a>
                                                    </td>
                                                    <td>若水</td>
                                                    <td>#1机组出口</td>
                                                    <td>
                                                        <span class="label label-sm label-warning">已添加</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>
                                                        <a href="#">01000005</a>
                                                    </td>
                                                    <td>若水</td>
                                                    <td>#2机组出口</td>
                                                    <td>
                                                        <span class="label label-sm label-warning">已添加</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>
                                                        <a href="#">01000005</a>
                                                    </td>
                                                    <td>若水</td>
                                                    <td>3机组出口</td>
                                                    <td>
                                                        <span class="label label-sm label-warning">已添加</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td>
                                                        <a href="#">01000005</a>
                                                    </td>
                                                    <td>若水</td>
                                                    <td>#4机组出口</td>
                                                    <td>
                                                        <span class="label label-sm label-success">未添加</span>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- /.span -->


                                    <div class="step-pane" id="step2">
                                        <div class="row" style="border: 1px  salmon;margin:10px 40px 0px 40px">


                                            <div class="container col-xs-12 col-sm-4">
                                                <div class="widget-box widget-color-dark">
                                                    <div class="widget-header widget-header-large">
                                                        <h3 class="widget-title smaller">与上一小时比较</h3>

                                                        <div class="widget-toolbar no-border">
                                                            <label>
                                                                <input id="yqtrqbj" type="checkbox"
                                                                       class="ace ace-switch ace-switch-3"/>
                                                                <span class="lbl middle"></span>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div id="yqtrqbj-body" class="widget-body hide">
                                                        <div class="widget-main">
                                                            <div class="alert alert-info">

                                                                <div class="row">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                               for="maxv">列名:</label>

                                                                        <div class="col-xs-12 col-sm-6">
                                                                            <div class="clearfix">
                                                                                <input type="text" id="maxv" name="maxv"
                                                                                       placeholder="多个列用逗号分开"
                                                                                       class="col-xs-12"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                               for="maxv">判断代码:</label>

                                                                        <div class="col-xs-12 col-sm-6">
                                                                            <div class="clearfix">
                                                                                <input type="text" id="maxv" name="maxv"
                                                                                       placeholder="大于“>”,小于“<”,等于“=”,不等“!=”"
                                                                                       class="col-xs-12"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                               for="maxv">最大变幅:</label>

                                                                        <div class="col-xs-12 col-sm-6">
                                                                            <div class="clearfix">
                                                                                <input type="text" id="maxv" name="maxv"
                                                                                       class="col-xs-12"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                               for="maxv">最小变幅:</label>

                                                                        <div class="col-xs-12 col-sm-6">
                                                                            <div class="clearfix">
                                                                                <input type="text" id="maxv" name="maxv"
                                                                                       class="col-xs-12"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container col-xs-12 col-sm-4">
                                                <div class="widget-box widget-color-dark">
                                                    <div class="widget-header widget-header-large">
                                                        <h3 class="widget-title smaller">与上一天比较</h3>

                                                        <div class="widget-toolbar no-border">
                                                            <label>
                                                                <input id="ysytbj" type="checkbox"
                                                                       class="ace ace-switch ace-switch-3"/>
                                                                <span class="lbl middle"></span>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div id="ysytbj-body" class="widget-body hide">
                                                        <div class="widget-main">
                                                            <div class="alert alert-info">

                                                                <div class="row">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                               for="maxv">列名:</label>

                                                                        <div class="col-xs-12 col-sm-6">
                                                                            <div class="clearfix">
                                                                                <input type="text" id="maxv" name="maxv"
                                                                                       placeholder="多个列用逗号分开"
                                                                                       class="col-xs-12"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                               for="maxv">判断代码:</label>

                                                                        <div class="col-xs-12 col-sm-6">
                                                                            <div class="clearfix">
                                                                                <input type="text" id="maxv" name="maxv"
                                                                                       placeholder="大于“>”,小于“<”,等于“=”,不等“!=”"
                                                                                       class="col-xs-12"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                               for="maxv">最大变幅:</label>

                                                                        <div class="col-xs-12 col-sm-6">
                                                                            <div class="clearfix">
                                                                                <input type="text" id="maxv" name="maxv"
                                                                                       class="col-xs-12"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                               for="maxv">最小变幅:</label>

                                                                        <div class="col-xs-12 col-sm-6">
                                                                            <div class="clearfix">
                                                                                <input type="text" id="maxv" name="maxv"
                                                                                       class="col-xs-12"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="container col-xs-12 col-sm-4">
                                                <div class="widget-box widget-color-green2">
                                                    <div class="widget-header widget-header-large">
                                                        <h3 class="widget-title smaller">大于/小于/等于</h3>

                                                        <div class="widget-toolbar no-border">
                                                            <label>
                                                                <input id="dyxydy" type="checkbox"
                                                                       class="ace ace-switch ace-switch-3"/>
                                                                <span class="lbl middle"></span>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div id="dyxydy-body" class="widget-body hide">
                                                        <div class="widget-main">
                                                            <div class="alert alert-info">
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">列名:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   placeholder="多个列用逗号分开"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">等于:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">大于:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">小于:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="container col-xs-12 col-sm-4">
                                                <div class="widget-box widget-color-blue">
                                                    <div class="widget-header widget-header-large">
                                                        <h3 class="widget-title smaller">超出某个范围</h3>

                                                        <div class="widget-toolbar no-border">
                                                            <label>
                                                                <input id="ccmgfw" type="checkbox"
                                                                       class="ace ace-switch ace-switch-3"/>
                                                                <span class="lbl middle"></span>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div id="ccmgfw-body" class="widget-body hide">
                                                        <div class="widget-main">
                                                            <div class="alert alert-info">
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">列名:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   placeholder="多个列用逗号分开"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="minv">最小值:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="minv" name="minv"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">最大值:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="container col-xs-12 col-sm-4">
                                                <div class="widget-box widget-color-blue2">
                                                    <div class="widget-header widget-header-large">
                                                        <h3 class="widget-title smaller">数据范围变幅大小</h3>

                                                        <div class="widget-toolbar no-border">
                                                            <label>
                                                                <input id="sjfwbfdx" type="checkbox"
                                                                       class="ace ace-switch ace-switch-3"/>
                                                                <span class="lbl middle"></span>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div id="sjfwbfdx-body" class="widget-body hide">
                                                        <div class="widget-main">
                                                            <div class="alert alert-info">
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">列名:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   placeholder="多个列用逗号分开"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="minv">范围最小值:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="minv" name="minv"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">范围最大值:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">最大变幅值:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="container col-xs-12 col-sm-4">
                                                <div class="widget-box widget-color-red3">
                                                    <div class="widget-header widget-header-large">
                                                        <h3 class="widget-title smaller">根据其他数据比较</h3>

                                                        <div class="widget-toolbar no-border">
                                                            <label>
                                                                <input id="gjqtsjbj" type="checkbox"
                                                                       class="ace ace-switch ace-switch-3"/>
                                                                <span class="lbl middle"></span>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div id="gjqtsjbj-body" class="widget-body hide">
                                                        <div class="widget-main">
                                                            <div class="alert alert-info">
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">列名:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   placeholder="多个列用逗号分开"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="nameComp">对比点号:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="nameComp" name="name"
                                                                                   placeholder="要对比的点号ID"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">点号值:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   placeholder="要对比点号的数据"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">数据最小值:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">数据最大值:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container col-xs-12 col-sm-4">
                                                <div class="widget-box widget-color-purple">
                                                    <div class="widget-header widget-header-large">
                                                        <h3 class="widget-title smaller">缺失一定时间</h3>

                                                        <div class="widget-toolbar no-border">
                                                            <label>
                                                                <input id="ccmgfw1" type="checkbox"
                                                                       class="ace ace-switch ace-switch-3"/>
                                                                <span class="lbl middle"></span>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div id="ccmgfw1-body" class="widget-body hide">
                                                        <div class="widget-main">
                                                            <div class="alert alert-info ">
                                                                <div class="form-group">
                                                                    <label class="control-label  col-xs-12 col-sm-3"
                                                                           for="timepicker1">超时时间:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <div class="input-group bootstrap-timepicker col-xs-12 col-sm-6">
                                                                                <input id="timepicker1" type="text"
                                                                                       class="form-control" value="2"/>
                                                                                <span class="input-group-addon"> <i
                                                                                        class="fa fa-clock-o bigger-110"></i></span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="container col-xs-12 col-sm-4">
                                                <div class="widget-box widget-color-green2">
                                                    <div class="widget-header widget-header-large">
                                                        <h3 class="widget-title smaller">零点与二十四点数据比较</h3>

                                                        <div class="widget-toolbar no-border">
                                                            <label>
                                                                <input id="ldyessdbj" type="checkbox"
                                                                       class="ace ace-switch ace-switch-3"/>
                                                                <span class="lbl middle"></span>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div id="ldyessdbj-body" class="widget-body hide">
                                                        <div class="widget-main">
                                                            <div class="alert alert-info">
                                                                <div class="form-group">
                                                                    <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                                           for="maxv">判断代码:</label>

                                                                    <div class="col-xs-12 col-sm-6">
                                                                        <div class="clearfix">
                                                                            <input type="text" id="maxv" name="maxv"
                                                                                   placeholder="大于“>”,小于“<”,等于“=”,不等“!=”"
                                                                                   class="col-xs-12"/>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                    <div class="step-pane" id="step3">
                                        <div class="col-xs-12 col-sm-1"></div>
                                        <h4 class="header blue bolder smaller col-xs-12 col-sm-9 right">监控设置</h4>
                                        <!-- input样式 -->
                                        <div class="hr hr-dotted"></div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                       for="datatypess">监控频率:</label>
                                                <!--数据选择-->
                                                <div class="col-xs-12 col-sm-9">
                                                    <select class="col-xs-4" id="datatypess" name="datatype">
                                                        <option value="1">实时监控</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                       for="maxv">开始时间:</label>

                                                <div class="col-xs-12 col-sm-3">
                                                    <div class="clearfix">
                                                        <input type="text" id="maxv" name="maxv"
                                                               placeholder="YYYY-MM-DD HH24" class="col-xs-12"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                       for="maxv">结束时间:</label>

                                                <div class="col-xs-12 col-sm-3">
                                                    <div class="clearfix">
                                                        <input type="text" id="maxv" name="maxv"
                                                               placeholder="YYYY-MM-DD HH24" class="col-xs-12"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-1"></div>
                                            <h4 class="header blue bolder smaller col-xs-12 col-sm-9 right">数据改变</h4>

                                        </div>


                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-3"></div>
                                            <label class="inline">
                                                <input type="radio" name="form-field-checkbox" class="ace"/>
                                                <span class="lbl">延续上一个数据值</span>
                                            </label>
                                            &nbsp; &nbsp; &nbsp; &nbsp;
                                            <label class="inline">
                                                <input type="radio" name="form-field-checkbox" class="ace"/>
                                                <span class="lbl">改变数据为零</span>
                                            </label>
                                        </div>


                                    </div>

                                    <div class="step-pane" id="step4">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-1"></div>
                                            <h4 class="header blue bolder smaller col-xs-12 col-sm-9 right">监控级别</h4>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-3"></div>
                                            <label class="inline">
                                                <input type="radio" name="form-field-checkbox" class="ace"/>
                                                <span class="lbl">警告</span>
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-3"></div>
                                            <label class="inline">
                                                <input type="radio" name="form-field-checkbox" class="ace"/>
                                                <span class="lbl">一般严重</span>
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-3"></div>
                                            <label class="inline">
                                                <input type="radio" name="form-field-checkbox" class="ace"/>
                                                <span class="lbl">严重</span>
                                            </label>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-1"></div>
                                            <h4 class="header blue bolder smaller col-xs-12 col-sm-9 right">告警方式</h4>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-3"></div>
                                            <label class="inline">
                                                <input type="checkbox" name="form-field-checkbox" class="ace"/>
                                                <span class="lbl">短信告警</span>
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-3"></div>
                                            <label class="inline">
                                                <input type="checkbox" name="form-field-checkbox" class="ace"/>
                                                <span class="lbl">网页告警</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- /section:plugins/fuelux.wizard.container -->
                            <hr/>
                            <div class="wizard-actions">
                                <!-- #section:plugins/fuelux.wizard.buttons -->
                                <button class="btn btn-prev">
                                    <i class="ace-icon fa fa-arrow-left"></i>
                                    返回
                                </button>

                                <button class="btn btn-success btn-next" data-last="完成">
                                    下一步
                                    <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                </button>

                                <!-- /section:plugins/fuelux.wizard.buttons -->
                            </div>

                            <!-- /section:plugins/fuelux.wizard -->
                        </div>
                        <!-- /.widget-main -->
                    </div>
                    <!-- /.widget-body -->
                </div>

                <div id="modal-wizard" class="modal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header" data-target="#modal-step-contents">
                                <ul class="wizard-steps">
                                    <li data-target="#modal-step1" class="active">
                                        <span class="step">1</span>
                                        <span class="title">Validation states</span>
                                    </li>

                                    <li data-target="#modal-step2">
                                        <span class="step">2</span>
                                        <span class="title">Alerts</span>
                                    </li>

                                    <li data-target="#modal-step3">
                                        <span class="step">3</span>
                                        <span class="title">Payment Info</span>
                                    </li>

                                    <li data-target="#modal-step4">
                                        <span class="step">4</span>
                                        <span class="title">Other Info</span>
                                    </li>
                                </ul>
                            </div>

                            <div class="modal-body step-content" id="modal-step-contents">
                                <div class="step-pane active" id="modal-step1">
                                    <div class="center">
                                        <h4 class="blue">Step 1</h4>
                                    </div>
                                </div>

                                <div class="step-pane" id="modal-step2">
                                    <div class="center">
                                        <h4 class="blue">Step 2</h4>
                                    </div>
                                </div>

                                <div class="step-pane" id="modal-step3">
                                    <div class="center">
                                        <h4 class="blue">Step 3</h4>
                                    </div>
                                </div>

                                <div class="step-pane" id="modal-step4">
                                    <div class="center">
                                        <h4 class="blue">Step 4</h4>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer wizard-actions">
                                <button class="btn btn-sm btn-prev">
                                    <i class="ace-icon fa fa-arrow-left"></i>
                                    Prev
                                </button>

                                <button class="btn btn-success btn-sm btn-next" data-last="Finish">
                                    Next
                                    <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                </button>

                                <button class="btn btn-danger btn-sm pull-left" data-dismiss="modal">
                                    <i class="ace-icon fa fa-times"></i>
                                    Cancel
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- PAGE CONTENT ENDS -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </form>
</div>
<!-- /.page-content-area -->

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
</a>

<%--调用公共JS上--%>
<jsp:include page="../../js/base/common_top.jsp"/>

<%--本页面JS--%>
<script src="jsp/js/monitoring/mt_add.js"></script>

<%--调用公共JS下--%>
<jsp:include page="../../js/base/common_down.jsp"/>