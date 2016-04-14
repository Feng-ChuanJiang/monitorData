/**
 * Created by Administrator on 2016/1/7.
 */
function onSubmit()
{
    if(vaidateFrom())
    {
        document.forms[0].action = 'rest/user/creat';
        document.forms[0].submit();
    }
}

function vaidateFrom()
{
    $("span[name='error_message']").remove();
    $("br").remove();
    var submitFlag = true;
    var username = $("input[name='username']").val();
    var chinaName = $("input[name='chinaName']").val();
    var userPosition = $("input[name='userPosition']").val();
    var userGroupId = $("select[name='userGroupId']").val();
    if(username == "")
    {
        $("input[name='username").parent().append("<span name='error_message' style='color: red;'>职工编号不能为空.</span>");
        submitFlag = false;
    }
    if(chinaName == "")
    {
        $("input[name='chinaName").parent().append("<span name='error_message' style='color: red;'>职工姓名不能为空.</span>");
        submitFlag = false;
    }
    /* 	if(userPosition == "")
     {
     $("input[name='userPosition").parent().append("<span name='error_message' style='color: red;'>职位不能为空.</span>");
     submitFlag = false;
     } */
    if(userGroupId == "")
    {
        $("select[name='userGroupId").parent().append("<span name='error_message' style='color: red;'>部门/单位不能为空.</span>");
        submitFlag = false;
    }
    return submitFlag;
}
function doUndoAll()
{
    $(".chosen-single>span").text("");
    $("span[name='error_message']").remove();
    $("input[type='text']").val("");
}
