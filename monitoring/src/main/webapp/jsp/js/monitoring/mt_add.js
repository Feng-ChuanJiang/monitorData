/**
 * Created by Administrator on 2015/11/4.
 */
jQuery(function($) {
    $('[data-rel=tooltip]').tooltip();
   // $('#wdsDiv').hide();
    $('#wdsDivComp').hide();

    var $validation = true;

//数据录入步奏验证和实现
    $('#fuelux-wizard')
        .ace_wizard({
            //step: 2 //optional argument. wizard will jump to step "2" at first
        })
        .on('change', function (e, info) {
            if (info.step == 1 && $validation) {
               // if (!$('#validation-form').valid()) return false;
            }
        })
        .on('finished', function (e) {
           // document.forms[0].action = 'rest/user/creat';
            document.forms[0].submit();
            bootbox.dialog({
                message: "Thank you! Your information was successfully saved!",
                buttons: {
                    "success": {
                        "label": "OK",
                        "className": "btn-sm btn-primary"
                    }
                }
            });
        }).on('stepclick', function (e) {
            //e.preventDefault();//this will prevent clicking and selecting steps
        });


//跳到下一个步奏
    $('#step-jump').on('click', function () {
        var wizard = $('#fuelux-wizard').data('wizard')
        wizard.currentStep = 3;
        wizard.setState();
    })
//确定选择的步骤
//wizard.selectedItem().step
    $('#timepicker1').timepicker({
        minuteStep : 1,
        showSeconds : true,
        showMeridian : false
    }).next().on(ace.click_event, function() {
        $(this).prev().focus();
    });

//隐藏或显示水情点号或者电量点号
    $('#datatype').change(function () {
        if (this.value == 2) {
            $('#tmrDiv').hide();
           // $('#wdsDiv').show();
            $('#wdsDiv').removeClass('hide');
        }
        else {
           // $('#wdsDiv').hide();h
            $('#tmrDiv').show();
            $('#wdsDiv').addClass('hide');

        }
    })

   //与其他数据比较模块里面隐藏或显示水情点号或者电量点号
    $('#datatypeComp').change(function () {
        if (this.value == '2') {
            $('#tmrDivComp').hide();
            $('#wdsDivComp').show();
        }
        else {
            $('#wdsDivComp').hide();
            $('#tmrDivComp').show();
        }
    })
//隐藏或显示水情点号或者电量点号
    $('#tmrId').on("change", function () {
        var friends = $("#meterId");
        friends.empty();
        for (var i = 0; i < 10; i++) {
            $("#meterId").append("<option value=" + i + ">#" + i + "号机组</option>");
            $("#meterId").trigger("chosen:updated");
        }
    })



    //监控类型显示或隐藏
    $("#step2").find("input[type='checkbox']").on("change",function(){
        var content=$("#step2").find("div[id^="+this.id+"-]")
        if(this.checked){

            content.removeClass("hide");
            $("#tmrIdComp").addClass("");
            $("#tmrIdComp").load();
        }else{
            content.addClass("hide")
        }
    });

//documentation : http://docs.jquery.com/Plugins/Validation/validate


    $.mask.definitions['~'] = '[+-]';
    $('#phone').mask('(999) 999-9999');

    jQuery.validator.addMethod("phone", function (value, element) {
        return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
    }, "Enter a valid phone number.");


    $('#validation-form').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            wdsId: {required: true}
        },

        messages: {
            wdsId: {
                required: "点号不能为空"
            }
        },


        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },

        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
            $(e).remove();
        },

        errorPlacement: function (error, element) {
            if (element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                var controls = element.closest('div[class*="col-"]');
                if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
                else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
            }
            else if (element.is('.select2')) {
                error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
            }
            else if (element.is('.chosen-select')) {
                error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
            }
            else error.insertAfter(element.parent());
        },

        submitHandler: function (form) {
        },
        invalidHandler: function (form) {
        }
    });


    $('#modal-wizard .modal-header').ace_wizard();
    $('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');



})