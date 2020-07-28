<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>个人资料</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="My Play Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
<!-- //bootstrap -->
<link href="css/dashboard.css" rel="stylesheet">

<script src="js/jquery-1.11.1.min.js"></script>
<!--start-smoth-scrolling-->
<!-- DataTables CSS -->
<link href="css/manage/dataTables.bootstrap.css" rel="stylesheet">

<!--
<link href="css/manage/sb-admin-2.css" rel="stylesheet"> -->

<!-- Custom Fonts -->
<link href="css/manage/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="css/manage/boot-crm.css" rel="stylesheet"
	type="text/css">
<!-- fonts -->
<link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<link rel="icon" type="image/x-icon" href="img/title.ico" />
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
<link rel="stylesheet" type="text/css" href="./css/style2.css">
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/movieList.css">
<link rel="stylesheet" type="text/css" href="./css/page.css">
<style>
/*登录下拉列表*/
.com-sel {
    line-height: 5rem;
    cursor: pointer;        /*鼠标上移变成小手*/
}

.com-opt {
    padding-right: 1.8rem;
    color: gray;
    font-size: 1.6rem;
    border: 1px solid gray;
    outline: none;

/*     appearance:none;  
    -moz-appearance:none;  
    -webkit-appearance:none;
   
    background: url("images/tr.png") no-repeat right center transparent; */
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main-grids">
				<div class="top-grids">
					<div class="recommended-info">
						<h3>修改个人资料</h3>
					</div>
					<div style="display:none;">
					 <form class="form-inline" action="UserModification" method="post">
						 <input type="hidden" class="input-text" value="${user.username}" name="username" id="username">
						 <button id="chaxun" type="submit"></button>
					 </form>
					</div>
					<div class="row">
		                <div class="col-lg-12">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">个人资料信息</div>
		                        <!-- /.panel-heading -->
		                        <table class="table table-bordered table-striped">
		                            <thead>
		                                <tr>
		                                    <th>用户名</th>
		                                    <th>密码</th>
		                                    <th>邮箱</th>
		                                </tr>
		                            </thead>
		                            <tbody align="center">
		                            <%-- <c:forEach items="${sessionScope.user}" var="row"> --%>
		                                <tr>
		                                    <td>${user.username}</td>
		                                    <td>${user.password}</td>
		                                    <td>${user.email}</td>
		                                    <td>
		                                        <a href="javascript:void(0)" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userEditDialog" onclick="editUser(${user.userid})">修改</a>
		                                    </td>
		                                </tr>
		                            <%-- </c:forEach> --%>
		                            </tbody>
		                        </table>
		                        <!-- /.panel-body -->
		                        
		                    </div>
		                    <!-- /.panel -->
		                </div>
		                <!-- /.col-lg-12 -->
		            </div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<div class="clearfix"> </div>
	<div class="drop-menu">
		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu4">
		  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Regular link</a></li>
		  <li role="presentation" class="disabled"><a role="menuitem" tabindex="-1" href="#">Disabled link</a></li>
		  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another link</a></li>
		</ul>
	</div>
	<!-- 用户 编辑对话框 -->
    <div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="edit_user_form">
                        <input type="hidden" id="edit_userid" name="userid"/>
                        <input type="hidden" id="edit_usersort" name="usersort"/>
                        <input type="hidden" value="updateUser" name="method" />
                        <div class="form-group">
                            <label for="edit_username" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_username" placeholder="用户名" name="username">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="edit_password" class="col-sm-2 control-label">用户密码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_password" placeholder="用户密码" name="password">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="edit_email" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_email" placeholder="邮箱" name="email" >
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
    <!-- Bootstrap core JavaScript
    ================================================== -->
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
	
		<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
	
	<script type="text/javascript">
    function editUser(id) {
        $.ajax({
            type:"get",
            url:"UserManageaction",
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
    var UPDATE = {
            checkInput:function() {
                reg=/^\w+[@]\w+((.com)|(.net)|(.cn)|(.org)|(.gmail))$$/;

                if(!$("#edit_username").val()) {
                    alert("请输入用户名！");
                    return false;
                }
                if($("#edit_username").val().length<4 || $("#edit_username").val().length>10) {
                    alert("用户名长度必须在4-10之间！");
                    return false;
                }
                if(!$("#edit_password").val()) {
                    alert("请输入用户密码！");
                    return false;
                }
                if(!$("#edit_email").val()) {
                    alert("请输入用户邮箱！");
                    return false;
                }
                if(!reg.test($("#edit_email").val())){
                    alert("请输入正确的邮箱格式！");
                    return false;
                }
                return true;
            },
            updateUs:function() {
                $.post("UserManageaction",$("#edit_user_form").serialize(),function(data){
                    alert("用户信息更新成功！");
                    $("#chaxun").click();
                });
            },
            updateUser:function() {
                if (this.checkInput()) {
                    this.updateUs();
                }
            }
        };
	</script>
</body>
</html>