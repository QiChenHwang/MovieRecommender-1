<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       <div class="col-sm-3 col-md-2 sidebar">
			<div class="drop-navigation drop-navigation">
			  <ul class="nav nav-sidebar">
				<li class="active"><a href="Movieaction"><span aria-hidden="true"></span>主页</a></li>
				<c:if test="${!empty user}">
					<li><a href="Recommendaction?recommendType=userBased"><span aria-hidden="true"></span>个性推荐</a></li>
					<li><a href="userUpdate.jsp"><span aria-hidden="true"></span>个人资料</a></li>
				</c:if>
				<li><a href="Categoryaction"><span aria-hidden="true"></span>热门电影</a></li>
<!-- 					<li><a href="#" class="sub-icon"><span class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span>最新电影</a></li>
					<li><a href="#" class="menu1"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>电影分类</a></li> -->
			  </ul>
				<div class="side-bottom">
					<div class="copyright">
						<p>Copyright &copy; 2020.Qiana All rights reserved. </p>
					</div>
				</div>
			</div>
       </div>