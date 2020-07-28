<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>管理员管理</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />

<!-- MetisMenu CSS -->
<link href="css/manage/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="css/manage/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/manage/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="css/manage/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="css/manage/boot-crm.css" rel="stylesheet"
	type="text/css">
<link href="css/manage/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./css/style2.css">
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/movieList.css">
<link rel="stylesheet" type="text/css" href="./css/page.css">
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation"
            style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            
            <a class="navbar-brand" href="list.action">电影后台管理系统</a>
        </div>
        <div class="nav navbar-top-links navbar-right">	
					<a href="Loginoutaction" class="play-icon popup-with-zoom-anim">注销</a>
		</div>

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li><a href="MovieManageaction?method=showMovie" class="active"><i
                            class="fa fa-edit fa-fw"></i> 电影管理</a></li>
                    <li><a href="UserManageaction?method=showUser"><i
                            class="fa fa-edit fa-fw"></i> 用户管理</a></li>
                    <li><a href="AdminManageaction?method=showUser&root=1"><i
                            class="fa fa-edit fa-fw"></i>管理员管理</a></li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side --> </nav>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">管理员管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="panel panel-default">
                <div class="panel-body">

                    <form class="form-inline" action="AdminManageaction?method=showUser&root=1" method="post">
                     	<div class="form-group">
                            <label for="userName">管理员名</label>
                            <input type="text" class="form-control" id="username" value="${username}" name="username">
                        </div>

                        <button id="chaxun" type="submit" class="btn btn-primary">查询</button>
                        <a href="javascript:void(0)" class="btn btn-primary" data-toggle="modal" data-target="#userAddDialog" >添加管理员</a>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">管理员管理信息</div>
                        <!-- /.panel-heading -->
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>管理员Id</th>
                                    <th>管理员名</th>
                                    <th>邮箱</th>
                                    <th>权限</th>
                                </tr>
                            </thead>
                            <tbody align="center">
                            <c:forEach items="${sessionScope.userlist}" var="row">
                                <tr>
                                    <td>${row.userid}</td>
                                    <td>${row.username}</td>
                                    <td>${row.email}</td>
                                    <td>${row.usersort}</td>
                                    <td>
                                        <a href="javascript:void(0)" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userEditDialog" onclick="editUser(${row.userid})">修改</a>
                                        <a href="javascript:void(0)" class="btn btn-danger btn-xs" onclick="deleteUser(${row.userid})">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!-- /.panel-body -->
                        
                    </div>
                    <!-- /.panel -->
					<!-- 自己添加的分页 -->
					<div id="page" align="center">
						<ul class="list-pager">
							<li><a class="page_2"
								href="AdminManageaction?method=showUser&root=1&userName=${sessionScope.userName}&page=${sessionScope.prepage}">上一页</a>
							</li>
							<c:if test="${sessionScope.page !=100}">
								<li class="active"><a class="page_1" href="javascript:void(0);"
									style="cursor: default">${sessionScope.page}</a></li>
							</c:if>
							<c:forEach var="u" items="${sessionScope.pagelist }">
								<li><a class="page_2"
									href="AdminManageaction?method=showUser&root=1&userName=${sessionScope.userName}&page=${u}">${u}</a></li>
							</c:forEach>
							<li class="sep">...</li>
							<c:if test="${sessionScope.page ==100}">
								<li class="active"><a class="page_1" href="javascript:void(0);"
									style="cursor: default">100</a></li>
							</c:if>
							<c:if test="${sessionScope.page !=100}">
								<li><a class="page_27731"
									href="AdminManageaction?method=showUser&root=1&userName=${sessionScope.userName}&page=100">100</a>
								</li>
							</c:if>
							<li><a class="page_2"
								href="AdminManageaction?method=showUser&root=1&userName=${sessionScope.userName}&page=${sessionScope.lastpage}">下一页</a>
							</li>
						</ul>
					</div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
    </div>
            

    <!-- 管理员 编辑对话框 -->
    <div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">修改管理员信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="edit_user_form">
                        <input type="hidden" id="edit_userid" name="userid"/>
                        <input type="hidden" value="updateUser" name="method" />
                        <div class="form-group">
                            <label for="edit_username" class="col-sm-2 control-label">管理员名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_username" placeholder="管理员名" name="username">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="edit_password" class="col-sm-2 control-label">管理员密码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_password" placeholder="管理员密码" name="password">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="edit_email" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_email" placeholder="邮箱" name="email" >
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="edit_username" class="col-sm-2 control-label">权限</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_usersort" placeholder="权限" name="usersort">
                            </div>
                        </div>

                        <input type="hidden" id="edit_start" name="start"/>
                        <input type="hidden" id="edit_rows" name="rows"/>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="UPDATE.updateUser()">保存修改</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /#wrapper -->

    <!-- 管理员添加对话框 -->
    <div class="modal fade" id="userAddDialog" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="add_myModalLabel">添加管理员</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="add_user_form">
                        <input type="hidden" id="add_userid" name="userid"/>
                        <input type="hidden" value="addUser" name="method" />
                        <div class="form-group">
                            <label for="add_username" class="col-sm-2 control-label">管理员名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_username" placeholder="" name="username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add_password" class="col-sm-2 control-label">管理员密码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_password" placeholder="" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add_email" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_email" placeholder="" name="email">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="add_usersort" class="col-sm-2 control-label">权限</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_usersort" placeholder="" name="usersort">
                            </div>
                        </div>

                        <input type="hidden" id="add_start" name="start"/>
                        <input type="hidden" id="add_rows" name="rows"/>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="ADDUSER.addUser()">确认添加</button>
                </div>
            </div>
        </div>
    </div>

	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

	<%--Datetimepicker Javascript--%>
	<script src="<%=basePath%>js/moment/moment.min.js"></script>
	<script src="<%=basePath%>js/bootstrap-datetimepicker.js"></script>
	<script>
	$.fn.datetimepicker.dates['zh-CN'] = {
	           days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
	           daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
	           daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],
	           months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
	           monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
	           today: "今天",
	           suffix: [],
	           meridiem: ["上午", "下午"]
	   };
	</script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
	
	<script type="text/javascript">

		//日期插件
		 $(".form_datetime").datetimepicker({
		 	language:'zh-CN',
		 	format: 'yyyy-mm-dd',//显示格式
		      todayHighlight: 1,//今天高亮
		      minView: "month",//设置只显示到月份
		      startView:2,
		      forceParse: 0,
		      showMeridian: 1,
		      autoclose: 1//选择后自动关闭
		      
		 });

        function editUser(id) {
            $.ajax({
                type:"get",
                url:"AdminManageaction",
                dataType: "json",
                data:{
                	"id":id,
                	"method": "getUserById"
                	},
                success:function(datas) {   // User的JSON字符串传过来就行
                	var data = datas[0];
                    $("#edit_userid").val(data.userid);
                    $("#edit_username").val(data.username);
                    $("#edit_password").val(data.password);
                    $("#edit_email").val(data.email);
                    $("#edit_usersort").val(data.usersort);
                }
            });
        }
        var ADDUSER = {

            checkInput:function() {
                reg=/^\w+[@]\w+((.com)|(.net)|(.cn)|(.org)|(.gmail))$$/;

                if(!$("#add_username").val()) {
                    alert("请输入管理员名！");
                    return false;
                }
                if($("#add_username").val().length<4 || $("#add_username").val().length>10) {
                    alert("管理员名长度必须在4-10之间！");
                    return false;
                }
                if(!$("#add_password").val()) {
                    alert("请输入管理员密码！");
                    return false;
                }
                if($("#add_password").val().length<6 || $("#add_password").val().length>16) {
                    alert("管理员密码长度必须在6-16之间！");
                    return false;
                }
                if(!$("#add_email").val()) {
                    alert("请输入管理员邮箱！");
                    return false;
                }
                if(!reg.test($("#add_email").val())){
                    alert("请输入正确的邮箱格式！");
                    return false;
                }
                if(!$("#add_usersort").val()) {
                    alert("请输入权限！");
                    return false;
                }
                return true;
            },
            addUs:function() {
                $.post("AdminManageaction",$("#add_user_form").serialize(),function(data){
                    alert("管理员信息添加成功！");
                    window.location.reload();
                });
            },
            addUser:function() {
                if (this.checkInput()) {
                    this.addUs();
                }
            }
        };

        var UPDATE = {
            checkInput:function() {
                reg=/^\w+[@]\w+((.com)|(.net)|(.cn)|(.org)|(.gmail))$$/;

                if(!$("#edit_username").val()) {
                    alert("请输入管理员名！");
                    return false;
                }
                if($("#edit_username").val().length<4 || $("#edit_username").val().length>10) {
                    alert("管理员名长度必须在4-10之间！");
                    return false;
                }
                if(!$("#edit_password").val()) {
                    alert("请输入管理员密码！");
                    return false;
                }
                if(!$("#edit_email").val()) {
                    alert("请输入管理员邮箱！");
                    return false;
                }
                if(!reg.test($("#edit_email").val())){
                    alert("请输入正确的邮箱格式！");
                    return false;
                }
                if(!$("#edit_usersort").val()) {
                    alert("请输入权限！");
                    return false;
                }
                return true;
            },
            updateUs:function() {
                $.post("AdminManageaction",$("#edit_user_form").serialize(),function(data){
                    alert("管理员信息更新成功！");
                    $("#chaxun").click();
                });
            },
            updateUser:function() {
                if (this.checkInput()) {
                    this.updateUs();
                }
            }
        };
        
        function deleteUser(id) {
            if(confirm('确实要删除该管理员吗?')) {
                $.post("AdminManageaction?method=deleteUser",{"id":id},function(data){
                    alert("管理员删除成功！");
                    $("#chaxun").click();
                });
            }
        }
    </script>

</body>

</html>
