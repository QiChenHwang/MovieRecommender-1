<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.html"><h1><img src="images/logo.png" alt="" /></h1></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
			<div class="top-search">
				<form class="navbar-form navbar-right" action="Searchaction?page=1" method="post">
					<input type="text" id="movieName" name="movieName" class="form-control" placeholder="搜索电影...">
					<input id="search" type="submit" value=" ">
				</form>
			</div>
			<div class="header-top-right">	
				<c:if test="${empty user}">
					<div class="signin">
						<a href="#small-dialog2" class="play-icon popup-with-zoom-anim">注册</a>
						<!-- pop-up-box -->
						<script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
						<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
						<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
						<!--//pop-up-box -->
						<div id="small-dialog2" class="mfp-hide">
							<h3>创建账户</h3>
							<div class="signup">
								<form action="Registeraction" method="post" id="form">
									<input name="login" placeholder='用户名' maxlength="16" type='text' autocomplete="off" value="" class="email" title="用户名" />
									<input name="pwd" class="email" placeholder='密码不小于6位数' maxlength="16" type='password' autocomplete="off" value="" required="required" pattern=".{6,}" title="密码" />
									<input name="code" placeholder='邮箱' type='text' name="ValidateNum" autocomplete="off" class="email" required="required" pattern="([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?" title="邮箱"/>
									<input type="submit"  value="注册"/>
								</form>
								<div class="button-bottom">
									<p>已经有账户了吗? <a href="#small-dialog" class="play-icon popup-with-zoom-anim">登录</a></p>
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
						<script>
											$(document).ready(function() {
											$('.popup-with-zoom-anim').magnificPopup({
												type: 'inline',
												fixedContentPos: false,
												fixedBgPos: true,
												overflowY: 'auto',
												closeBtnInside: true,
												preloader: false,
												midClick: true,
												removalDelay: 300,
												mainClass: 'my-mfp-zoom-in'
											});
																											
											});
						</script>					
					</div>
					<div class="signin">
						<a href="#small-dialog" class="play-icon popup-with-zoom-anim">登录</a>
						<div id="small-dialog" class="mfp-hide">
							<h3>登录</h3>
							<div class="signup">
								<form action="Loginaction" method="post" id="form">
									<input name="login" maxlength="16" type='text' autocomplete="off" value="" class="email" placeholder="用户名" title="用户名" />
									<input name="pwd" placeholder='密码' maxlength="16" type='password' value="" required="required" pattern=".{6,}" title="密码" autocomplete="off" />
									<div class="com-sel">
										<select class="com-opt" name="usersort">
										    <option value="0">普通用户</option>
										    <option value="1">管理员</option>
										</select>
									</div>
									<input type="submit"  value="登录"/>
								</form>
								<div class="button-bottom">
									<p>创建新账户? <a href="#small-dialog2" class="play-icon popup-with-zoom-anim">注册</a></p>
								</div>
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
					<div class="success"> </div>
				</c:if>
				<c:if test="${!empty user}">
				<div class="signin">
					<a href="Loginoutaction" class="play-icon popup-with-zoom-anim">注销</a>
				</div>
				</c:if>
			</div>
			
<!-- 			<script>
				window.alert =alert;
			    function alert(e){
			        $("body").append('<div id="msg"><div id="msg_top">信息<span class="msg_close">×</span></div><div id="msg_cont">'+e+'</div><div class="msg_close" id="msg_clear">确定</div></div>');
			        $(".msg_close").click(function (){
			            $("#msg").remove();
			        });
			    }
			</script> -->
			<%
				String errorInfo = (String)session.getAttribute("msg");         // 获取错误属性
				if("登录失败！".equals(errorInfo)) {
				%>
					<script type="text/javascript" language="javascript">
						alert("index--<%=errorInfo%>");
					//window.location='index.jsp' ;                            // 跳转到登录界面
					</script>
				<%
					session.removeAttribute("msg");
				}
			%>
			
	    </div>
		<div class="clearfix"> </div>
      </div>
    </nav>