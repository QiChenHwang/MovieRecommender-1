<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="My Play Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />

<title>电影管理</title>

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
			<a class="navbar-brand" href="movieManage.jsp">电影后台管理系统</a>
		</div>
		<div class="nav navbar-top-links navbar-right">	
					<a href="Loginoutaction" class="play-icon popup-with-zoom-anim">注销</a>
		</div>

<!-- 			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="Loginoutaction"><i class="fa fa-sign-out fa-fw">退出登录</i></a></li>
					</ul> /.dropdown-user</li>
				/.dropdown
			</ul> -->

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
					<h1 class="page-header">电影管理</h1>
				</div>
				<!-- /.col-lg-12 -->
				
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">

					<form class="form-inline" action="MovieManageaction?method=showMovie" method="post">
						<div class="form-group">
							<label for="movieName">电影名称</label>
							<input type="text" class="form-control" id="movieName" name="movieName">
						</div>
						<div class="form-group">
							<label for="catagoryId">电影类型</label>
							<select	class="form-control" id="categoryId" placeholder="电影类型" name="categoryId">
								<option value=0>--请选择--</option>
								<c:forEach items="${categorylist}" var="ca">
									<option value="${ca.categoryid}"<c:if test="${ca.categoryid == categoryId}"> selected</c:if>>${ca.category }</option>		
								</c:forEach>
							</select>
						</div>
						
						<button id="chaxun" type="submit" class="btn btn-primary">查询</button>
						<a  href="javascript:void(0)" class="btn btn-primary" data-toggle="modal" data-target="#movieAddDialog" >添加电影</a>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">电影管理信息</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>电影ID</th>
									<th>电影名称</th>
									<th>上映年份</th>
									<th>电影类型</th>
									<th>导演</th>
									<th>评分</th>
									<th>评价人数</th>
									<th>海报</th>
								</tr>
							</thead>
							<tbody align="center">
							<c:forEach items="${sessionScope.movielist}" var="row">
								<tr>
									<td>${row.movieid}</td>
									<td>${row.moviename}</td>
									<!-- <td><fmt:formatDate type="date" value="${row.showyear}" dateStyle="default"/></td> -->
									<td>${row.showyear}</td>
									<td>${row.typelist}</td>
									<td>${row.director}</td>
									<td>${row.averating}</td>
									<td>${row.numrating}</td>
									<td>${row.picture}</td>
									<td>
										<a href="javascript:void(0)"  class="btn btn-primary btn-xs" data-toggle="modal" data-target="#movieEditDialog" onclick="editMovie(${row.movieid})">修改</a>
										<a href="javascript:void(0)"  class="btn btn-danger btn-xs" onclick="deleteMovie(${row.movieid})">删除</a>
									</td>	
								</tr>
							</c:forEach>
							</tbody>
						</table>

						<div class="col-md-12 text-right">
							<%-- <dream:page url="${pageContext.request.contextPath }/movie/list.action" /> --%>
						</div>
						<!-- /.panel-body -->	
					</div>	
					<!-- /.panel -->
					<!-- 自己添加的分页 -->
					<div id="page" align="center">
						<ul class="list-pager">
							<li><a class="page_2"
								href="MovieManageaction?method=showMovie&movieName=${sessionScope.movieName}&categoryId=${sessionScope.sortType}&page=${sessionScope.prepage}">上一页</a>
							</li>
							<c:if test="${sessionScope.page !=100}">
								<li class="active"><a class="page_1" href="javascript:void(0);"
									style="cursor: default">${sessionScope.page}</a></li>
							</c:if>
							<c:forEach var="u" items="${sessionScope.pagelist }">
								<li><a class="page_2"
									href="MovieManageaction?method=showMovie&movieName=${sessionScope.movieName}&categoryId=${sessionScope.sortType}&page=${u}">${u}</a></li>
							</c:forEach>
							<li class="sep">...</li>
							<c:if test="${sessionScope.page ==100}">
								<li class="active"><a class="page_1" href="javascript:void(0);"
									style="cursor: default">100</a></li>
							</c:if>
							<c:if test="${sessionScope.page !=100}">
								<li><a class="page_27731"
									href="MovieManageaction?method=showMovie&movieName=${sessionScope.movieName}&categoryId=${sessionScope.sortType}&page=100">100</a>
								</li>
							</c:if>
							<li><a class="page_2"
								href="MovieManageaction?method=showMovie&movieName=${sessionScope.movieName}&categoryId=${sessionScope.sortType}&page=${sessionScope.lastpage}">下一页</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- /.col-lg-12 -->
			</div>

		</div>
	</div>
			

	<!-- 电影编辑对话框 -->
	<div class="modal fade" id="movieEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改电影信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_movie_form">
						<input type="hidden" value="updateMovie" name="method" />
						<input type="hidden" id="edit_movieid" name="movieid" value="${sessionScope.movieid}"/>
						<div class="form-group">
							<label for="edit_movieName" class="col-sm-2 control-label">电影名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_movieName" placeholder="" name="moviename" value="${sessionScope.moviename}">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_showyear" class="col-sm-2 control-label">上映年份</label>
							<div class="col-sm-10">
								<input class="form_datetime" type="text" id="edit_showyear" name="showyear" value="${sessionScope.showyear}">
							</div>
						</div>
						<%--<div class="form-group">--%>
							<%--<label for="edit_nation" class="col-sm-2 control-label">国家/地区</label>--%>
							<%--<div class="col-sm-10">--%>
								<%--<input type="text" class="form-control" id="edit_nation" placeholder="" name="nation">--%>
							<%--</div>--%>
						<%--</div>--%>
						<div class="form-group">
							<label for="edit_picture" class="col-sm-2 control-label">海报URL</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_picture" placeholder="" name="picture" value="${sessionScope.picture}">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_picture" class="col-sm-2 control-label">评价人数</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_numrating" placeholder="" name="numrating" value="${sessionScope.numrating}">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_director" class="col-sm-2 control-label">导演</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_director" placeholder="" name="director" value="${sessionScope.director}">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_leadactors" class="col-sm-2 control-label">主演</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_leadactors" placeholder="" name="leadactors" value="${sessionScope.leadactors}">
							</div>
						</div>
						<%--<div class="form-group">--%>
							<%--<label for="edit_screenwriter" class="col-sm-2 control-label">编剧</label>--%>
							<%--<div class="col-sm-10">--%>
								<%--<input type="text" class="form-control" id="edit_screenwriter" placeholder="" name="screenwriter">--%>
							<%--</div>--%>
						<%--</div>--%>

						<div class="form-group">
							<label for="edit_picture" class="col-sm-2 control-label">评分</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_averating" placeholder="" name="averating" value="${sessionScope.averating}">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_picture" class="col-sm-2 control-label">电影详情</label>
							<div class="col-sm-10">
								<input type="text" style="height:100%" class="form-control" id="edit_description" placeholder="" name="description"  value="${sessionScope.description}">
							</div>
						</div>
						<div class="form-group">
							<label for="catagoryId" class="col-sm-2 control-label">电影类型</label>
							<div class="col-sm-10">
								<select class="form-control" id="catagoryId" placeholder="" name="categoryId" value="${sessionScope.typelist}" multiple="multiple">
									<c:forEach items="${categorylist}" var="ca">
										<option value="${ca.categoryid}"<c:if test="${ca.categoryid == categoryId }"> selected</c:if>>${ca.category }</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<input type="hidden" id="edit_start" name="start"/>
						<input type="hidden" id="edit_rows" name="rows"/>
					</form>

					<form class="form-horizontal" id="edit_picture_form" enctype="multipart/form-data">
						<div class="form-group">
							<label for="edit_picture" class="col-sm-2 control-label">上传海报</label>
							<div class="col-sm-10">
								<input type="file" name="file" id="image1">
								<a href="javascript:uploadImg1()" class="btn btn-success">上传配图</a>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="UPDATE.updateMovie()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->

	<!-- 电影添加对话框 -->
	<div class="modal fade" id="movieAddDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="add_myModalLabel">添加电影</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="add_movie_form">
						<input type="hidden" value="addMovie" name="method" />
						<input type="hidden" id="add_movieid" name="movieid"/>
						<div class="form-group">
							<label for="add_movieName" class="col-sm-2 control-label">电影名称</label>
							<div class="col-sm-10">
								<input type="text" required="required" class="form-control" id="add_movieName" placeholder="" name="moviename">
							</div>
						</div>

						<div class="form-group">
							<label for="add_showyear" class="col-sm-2 control-label">上映年份</label>
							<div class="col-sm-10">
								<input required="required" class="form_datetime" value="" type="text" id="add_showyear" name="showyear">
							</div>
						</div>

						<%--<div class="form-group">--%>
							<%--<label for="add_nation" class="col-sm-2 control-label">国家/地区</label>--%>
							<%--<div class="col-sm-10">--%>
								<%--<input type="text" required="required" class="form-control" id="add_nation" placeholder="" name="nation">--%>
							<%--</div>--%>
						<%--</div>--%>
						<div class="form-group">
							<label for="add_picture" class="col-sm-2 control-label">海报URL</label>
							<div class="col-sm-10">
								<input type="text" required="required" class="form-control" id="add_picture" placeholder="" name="picture" value="">
							</div>
						</div>


						<div class="form-group">
							<label for="add_picture" class="col-sm-2 control-label">评价人数</label>
							<div class="col-sm-10">
								<input type="text" required="required" class="form-control" id="add_numrating" placeholder="" name="numrating">
							</div>
						</div>
						<div class="form-group">
							<label for="add_director" class="col-sm-2 control-label">导演</label>
							<div class="col-sm-10">
								<input type="text" required="required" class="form-control" id="add_director" placeholder="" name="director">
							</div>
						</div>
						<div class="form-group">
							<label for="add_leadactors" class="col-sm-2 control-label">主演</label>
							<div class="col-sm-10">
								<input type="text" required="required" class="form-control" id="add_leadactors" placeholder="" name="leadactors">
							</div>
						</div>
						<%--<div class="form-group">--%>
							<%--<label for="add_screenwriter" class="col-sm-2 control-label">编剧</label>--%>
							<%--<div class="col-sm-10">--%>
								<%--<input type="text" required="required" class="form-control" id="add_screenwriter" placeholder="" name="screenwriter">--%>
							<%--</div>--%>
						<%--</div>--%>

						<div class="form-group">
							<label for="add_picture" class="col-sm-2 control-label">评分</label>
							<div class="col-sm-10">
								<input type="text" required="required" class="form-control" id="add_averating" placeholder="" name="averating">
							</div>
						</div>

						<div class="form-group">
							<label for="add_picture" class="col-sm-2 control-label">电影详情</label>
							<div class="col-sm-10">
								<input type="text" required="required" class="form-control" id="add_description" placeholder="" name="description">
							</div>
						</div>

						<div class="form-group">
							<label for="add_catagoryId" class="col-sm-2 control-label">电影类型</label>
							<div class="col-sm-10">
								<select	multiple required="required" class="form-control" id="add_catagoryId" placeholder="电影类型" name="categoryId">
									<c:forEach items="${categorylist}" var="ca">
										<option value="${ca.categoryid}"<c:if test="${ca.categoryid == categoryId }"> selected</c:if>>${ca.category }</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<input type="hidden" id="add_start" name="start"/>
						<input type="hidden" id="add_rows" name="rows"/>

					</form>

				    <form class="form-horizontal" id="add_picture_form" enctype="multipart/form-data">
					    <div class="form-group">
								<label for="add_picture" class="col-sm-2 control-label">上传海报</label>
							<div class="col-sm-10">
								<input type="file" name="file" id="image">
								<a href="javascript:uploadImg()" class="btn btn-success">上传配图</a>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="ADDMOVIE.addMovie()">确认添加</button>
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

        var ADDMOVIE = {
            checkInput:function() {

                if(!$("#add_movieName").val()) {
                    alert("请输入电影名称！");
                    return false;
                }
                if(!$("#add_showyear").val()) {
                    alert("请输入上映年份！");
                    return false;
                }
//                if(!$("#add_nation").val()) {
//                    alert("请输入国家/地区！");
//                    return false;
//                }
                if(!$("#add_picture").val()) {
                    alert("请输入海报URL！");
                    return false;
                }
                if(!$("#add_numrating").val()) {
                    alert("请输入评论人数！");
                    return false;
                }
                if(!$("#add_director").val()) {
                    alert("请输入导演！");
                    return false;
                }
                if(!$("#add_leadactors").val()) {
                    alert("请输入主演！");
                    return false;
                }
//                if(!$("#add_screenwriter").val()) {
//                    alert("请输入编剧！");
//                    return false;
//                }
                if(!$("#add_averating").val()) {
                    alert("请输入评分！");
                    return false;
                }
                if(!$("#add_description").val()) {
                    alert("请输入详情！");
                    return false;
                }
                if(!$("#add_catagoryId").val()) {
                    alert("请选择电影类型！");
                    return false;
                }
                return true;
            },
            addMo:function() {
                    $.post("MovieManageaction",$("#add_movie_form").serialize(),function(data){
                        alert("电影信息添加成功！");
                        $("#chaxun").click();
                        //window.location.reload();
                    });
                },
            addMovie:function() {
                if (this.checkInput()) {
                    this.addMo();
                }
            }
        };
		
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

		 //点击修改获取id，通过id查询电影信息
		function editMovie(id) {
			console.log(id);
			$.ajax({
				type:"get",
				url:"MovieManageaction",
				dataType: "json",
				data:{
					"id":id,
					"method": "getMovieById"
				},
				success:function(datas) {   // Movie的JSON字符串传过来就行
					console.log(datas[0]);
				    var data = datas[0];
					$("#edit_movieid").val(data.movieid);
					$("#edit_movieName").val(data.moviename);
					$("#edit_showyear").val(data.showyear);
//					$("#edit_nation").val(data.nation);
					$("#edit_director").val(data.director);
					$("#edit_leadactors").val(data.leadactors);
//					$("#edit_screenwriter").val(data.screenwriter);
					$("#edit_picture").val(data.picture);
					$("#edit_averating").val(data.averating);
					$("#edit_numrating").val(data.numrating);
                    $("#catagoryId").val(data.categoryid);
                    $("#edit_description").val(data.description);
				}
			});
		}

        //上传海报配图
        function uploadImg(){
            var formData = new FormData($( "#add_picture_form" )[0]);
            formData.append("file",$("#image")[0]);
            formData.append("name",name);
            $.ajax({
                url:"servlet/UploadImg",
                type:"POST",
                dataType:"json",
                data:formData,
                contentType: false,
                processData: false,
                success:function(data) {
                        alert("上传成功!");
                         // $("#picture").attr("disabled","disabled");
                        $("#add_picture").val(data.url);
                }
            });
        }

        function uploadImg1(){
            var formData = new FormData($( "#edit_picture_form" )[0]);
            formData.append("file",$("#image1")[0]);
            formData.append("name",name);
            $.ajax({
                url:"servlet/UploadImg",
                type:"POST",
                dataType:"json",
                data:formData,
                contentType: false,
                processData: false,
                success:function(data) {
                    alert("上传成功!");
                    // $("#picture").attr("disabled","disabled");
                    $("#edit_picture").val(data.url);
                }
            });
        }

        var UPDATE = {
            checkInput:function() {

                if(!$("#edit_movieName").val()) {
                    alert("请输入电影名称！");
                    return false;
                }
                if(!$("#edit_showyear").val()) {
                    alert("请输入上映年份！");
                    return false;
                }
//                if(!$("#edit_nation").val()) {
//                    alert("请输入国家/地区！");
//                    return false;
//                }
                if(!$("#edit_picture").val()) {
                    alert("请输入海报URL！");
                    return false;
                }
                if(!$("#edit_numrating").val()) {
                    alert("请输入评论人数！");
                    return false;
                }
                if(!$("#edit_director").val()) {
                    alert("请输入导演！");
                    return false;
                }
                if(!$("#edit_leadactors").val()) {
                    alert("请输入主演！");
                    return false;
                }
//                if(!$("#edit_screenwriter").val()) {
//                    alert("请输入编剧！");
//                    return false;
//                }
                if(!$("#edit_averating").val()) {
                    alert("请输入评分！");
                    return false;
                }
                if(!$("#edit_description").val()) {
                    alert("请输入详情！");
                    return false;
                }
                if(!$("#catagoryId").val()) {
                    alert("请选择电影类型！");
                    return false;
                }
                return true;
            },
            updateMo:function() {
                $.post("MovieManageaction",$("#edit_movie_form").serialize(),function(data,status){
                	$("#chaxun").click();
                	//window.location.reload();
                });
            },
            updateMovie:function() {
                if (this.checkInput()) {
                    this.updateMo();
                }
            }
        };

		function deleteMovie(id) {
			if(confirm('确实要删除该电影吗?')) {
				$.post("MovieManageaction?method=deleteMovie",{"id":id},function(data){
					alert("电影信息删除成功！");
					$("#chaxun").click();
					//window.location.reload();
				});
			}
		}
	</script>

</body>

</html>
