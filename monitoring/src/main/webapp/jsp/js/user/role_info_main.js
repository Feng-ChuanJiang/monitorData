jQuery(function($) {

    //查询角色
    function selectRole() {
        //查询角色
        $.ajax({
            url : 'rest/role/selectRole',
            type : 'Post',
            dataType : 'json',
            timeout : 1000,
            cache : false,
            //  beforeSend: LoadFunction, //加载执行方法
            //  error: erryFunction,  //错误执行方法
            success : succRole
            //成功执行方法
        })
        //动态加载Role树形菜单
        function succRole(tt) {
            //封装树形菜单的json
            var treeRoleData = new DataSourceTree({
                data : tt
            });

            //加载角色树形菜单
            $('#treeRole').ace_tree({
                dataSource : treeRoleData,
                //loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
                'open-icon' : 'ace-icon fa fa-folder-open',
                'close-icon' : 'ace-icon fa fa-folder',
                'selectable' : true,
                'selected-icon' : null,
                'unselected-icon' : null,
                'cacheItems' : false,
                folderSelect : false

            });

        }
    }
    //根据角色编号返回用户
    function selectUserRole(id) {
        $.ajax({
            url : 'rest/department/selectDepartmen',//动态树数据请求接口
            data : {
                'roleId' : id
            },
            type : 'Post',
            dataType : 'json',
            timeout : 1000,
            cache : false,
            success : succFunction
            //成功执行方法
        })
        //构造json数据
        function succFunction(tt) {
            var treeDataSource1 = new DataSourceTree({
                data : tt
            });

            //执行tree
            $('#treeUserRole').ace_tree({
                dataSource : treeDataSource1,
                multiSelect : true,
                //loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
                'open-icon' : 'ace-icon tree-minus',
                'close-icon' : 'ace-icon tree-plus',
                'selectable' : true,
                'selected-icon' : 'ace-icon fa fa-check',
                'unselected-icon' : 'ace-icon fa fa-check',
                'cacheItems' : false,
                folderSelect : false
            });

        }

    }
    //根据角色编号返回权限
    function selectRolePermission(id) {
        $.ajax({
            url : 'rest/permission/select',//动态树数据请求接口
            data : {
                'roleId' : id
            },
            type : 'Post',
            dataType : 'json',
            timeout : 1000,
            cache : false,
            success : succFunction
            //成功执行方法
        })
        //构造json数据
        function succFunction(tt) {
            var treeDataSource1 = new DataSourceTree({
                data : tt
            });

            //执行tree
            $('#treeRolePermission').ace_tree({
                dataSource : treeDataSource1,
                multiSelect : true,
                //loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
                'open-icon' : 'ace-icon tree-minus',
                'close-icon' : 'ace-icon tree-plus',
                'selectable' : true,
                'selected-icon' : 'ace-icon fa fa-check',
                'unselected-icon' : 'ace-icon fa fa-check',
                'cacheItems' : false,
                folderSelect : false
            });

        }

    }
    //角色事件管理
    $('#treeRole').on('updated', function(e, result) {
    }).on('selected', function(e, data) {
        //得到角色编号
        var roleId = data.info[0].id;
        //清空用户角色数据
        $("#treeUserRole").removeData("tree");
        //清空用户角色事件
        $("#treeUserRole").unbind('click');
        //调用用户角色查询方法
        selectUserRole(roleId);
        //清空角色权限数据
        $("#treeRolePermission").removeData("tree");
        //清空角色权限事件
        $("#treeRolePermission").unbind('click');
        //调用角色权限树形菜单
        selectRolePermission(roleId);
    }).on('unselected', function(e) {
    }).on('opened', function(e) {
    }).on('closed', function(e) {

    });

    //角色用户事件管理

    $('#treeUserRole').on('updated', function(e, result) {

        var role = roleid();
        if (role != null) {
            if(result.eventType=='selected'){
                $.ajax({
                    url : 'rest/role/insterRoleByRoleIdAndUserId',
                    data : {'roleId' : role.id,'userId':result.info[result.info.length-1].id},
                    type : 'Post',
                    dataType : 'json',
                    async: false,
                    cache : false,
                    error : function(){
                        alert('出错啦！');
                    }
                })
            }else{
                $.ajax({
                    url : 'rest/role/deleteRoleByRoleIdAndUserId',
                    data : {'roleId' : role.id,'userId':result.info[result.info.length-1].id},
                    type : 'Post',
                    dataType : 'json',
                    async: false,
                    cache : false,
                    error : function(){
                        alert('出错啦！');
                    }
                })
            }


        }

    }).on('selected', function(e, data) {
        //得到要操作的编号

    }).on('unselected', function(e) {
    }).on('opened', function(e) {
    }).on('closed', function(e) {
    });
    //角色权限事件管理

    $('#treeRolePermission').on('updated', function(e, result) {

        var role = roleid();
        if (role != null) {
            if(result.eventType=='selected'){
                $.ajax({
                    url : 'rest/role/insertPermissionRole',
                    data : {'roleId' : role.id,'perId':result.info[result.info.length-1].id},
                    type : 'Post',
                    dataType : 'json',
                    async: false,
                    cache : false,
                    error : function(){
                        alert('出错啦！');
                    }
                })
            }else{
                $.ajax({
                    url : 'rest/role/deletePermissionRole',
                    data : {'roleId' : role.id,'perId':result.info[result.info.length-1].id},
                    type : 'Post',
                    dataType : 'json',
                    async: false,
                    cache : false,
                    error : function(){
                        alert('出错啦！');
                    }
                })
            }


        }

    }).on('selected', function(e, data) {
        //得到要操作的编号

    }).on('unselected', function(e) {
    }).on('opened', function(e) {
    }).on('closed', function(e) {
    });

    //得到roleId
    var roleid = function() {
        var role = $('#treeRole').find('.tree-selected').data();
        if (role != null) {
            return role;

        } else {

            bootbox.alert({
                buttons : {
                    ok : {
                        label : '确定',
                        className : 'btn-myStyle'

                    }
                },
                message : '请先选择需要操作的角色',
                title : '请先选择角色'
            });

        }
    }

    //根据编号查询角色
    var roleById =function(id){
        var dataSouce="";
        //查询角色
        $.ajax({
            url : 'rest/role/selectRoleById',
            data : {'roleId' : id},
            type : 'Post',
            dataType : 'json',
            async: false,
            cache : false,
            success : function(data){
                dataSouce=data;
            }
        })
        return dataSouce;
    }


    //覆盖对话框的标题功能允许HTML标题
    $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
        _title : function(title) {
            var $title = this.options.title || '&nbsp;'
            if (("title_html" in this.options)
                && this.options.title_html == true)
                title.html($title);
            else
                title.text($title);
        }
    }));

    //增加角色
    $( "#id-btn-addrole" ).on('click', function(e) {
        e.preventDefault();
        $("#roleid").val(null);
        $("#roleSign").val(null);
        $("#roleName").val(null);
        $("#description").val(null);
        var dialog = $( "#dialog-message" ).removeClass('hide').dialog({
            modal: true,
            title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon glyphicon glyphicon-plus'></i>增加角色</h4></div>",
            title_html: true,
            width:400,
            buttons: [
                {
                    text: "取消",
                    "class" : "btn btn-sm",
                    click: function() {
                        $( this ).dialog( "close" );
                    }
                },
                {
                    text: "确定",
                    "class" : "btn btn-primary btn-sm",
                    click: function() {
                        var addRoleOK=$( this );
                        var resultData= $("#role_creat").ajaxSubmit(function (resultData) {
                            if(resultData==1){
                                addRoleOK.dialog( "close" );
                                //添加成功，刷新
                                location.reload();
                            }else{
                                bootbox.alert({
                                    buttons : {
                                        ok : {
                                            label : '确定',
                                            className : 'btn-myStyle'
                                        }
                                    },
                                    message : resultData.error.message,
                                    title : '提示'
                                });
                            }
                        });
                    }
                }
            ]
        });

        /**
         dialog.data( "uiDialog" )._title = function(title) {
						title.html( this.options.title );
					};
         **/
    });
    //修改角色
    $( "#id-btn-updaterole" ).on('click', function(e) {
        e.preventDefault();
        var role=roleid();
        if(role==null)return;
        //根据编号得到角色
        var roleData=roleById(role.id);
        //把角色赋值到界面上
        $("#roleid").val(roleData[0].id);
        $("#roleSign").val(roleData[0].roleSign);
        $("#roleName").val(roleData[0].roleName);
        $("#description").val(roleData[0].description);
        var dialog = $( "#dialog-message" ).removeClass('hide').dialog({
            modal: true,
            title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon glyphicon glyphicon-plus'></i>修改角色</h4></div>",
            title_html: true,
            width:400,
            buttons: [
                {
                    text: "取消",
                    "class" : "btn btn-sm",
                    click: function() {
                        $( this ).dialog( "close" );
                    }
                },
                {
                    text: "确定",
                    "class" : "btn btn-primary btn-sm",
                    click: function() {
                        var addRoleOK=$( this );
                        var resultData= $("#role_creat").ajaxSubmit(function (resultData) {
                            if(resultData==1){
                                addRoleOK.dialog( "close" );
                                //修改成功，刷新
                                location.reload();
                            }else{
                                bootbox.alert({
                                    buttons : {
                                        ok : {
                                            label : '确定',
                                            className : 'btn-myStyle'
                                        }
                                    },
                                    message : resultData.error.message,
                                    title : '提示',
                                });
                            }
                        });
                    }
                }
            ]
        });

        /**
         dialog.data( "uiDialog" )._title = function(title) {
						title.html( this.options.title );
					};
         **/
    });
    //删除角色
    $( "#id-btn-deleterole" ).on('click', function(e) {
        e.preventDefault();
        var role=roleid();
        if(role==null)return;
        $( "#dialog-confirm" ).removeClass('hide').dialog({
            resizable: false,
            modal: true,
            title: "<div class='widget-header'><h4 class='smaller'><i class='ace-icon fa fa-exclamation-triangle red'></i> 删除角色?</h4></div>",
            title_html: true,
            buttons: [
                {
                    html: "<i class='ace-icon fa fa-trash-o bigger-110'></i>&nbsp; 删除",
                    "class" : "btn btn-danger btn-sm",
                    click: function() {
                        var delRoleOK=$( this );
                        $.ajax({
                            url : 'rest/role/deleteRoleById',
                            data : {'roleId' : role.id},
                            type : 'Post',
                            dataType : 'json',
                            cache : false,
                            success : function(dataSouce){
                                if(dataSouce==1){
                                    delRoleOK.dialog( "close" );
                                    //修改成功，刷新tree
                                    location.reload();
                                }else{
                                    bootbox.alert({
                                        buttons : {
                                            ok : {
                                                label : '确定',
                                                className : 'btn-myStyle'
                                            }
                                        },
                                        message : dataSouce.error.message,
                                        title : '提示',
                                    });
                                }
                            }
                        });
                    }
                }
                ,
                {
                    html: "<i class='ace-icon fa fa-times bigger-110'></i>&nbsp; 取消",
                    "class" : "btn btn-sm",
                    click: function() {
                        $( this ).dialog( "close" );
                    }
                }
            ]
        });
    });
    //加载角色查询方法
    selectRole();
    //加载用户角色查询
    selectUserRole(null);
    //加载角色查询权限
    selectRolePermission(null);
});