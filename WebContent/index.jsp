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
<title>主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="My Play Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
<!-- //bootstrap -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
<script src="js/jquery-1.11.1.min.js"></script>
<!--start-smoth-scrolling-->
<!-- fonts -->
<link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<link rel="icon" type="image/x-icon" href="img/title.ico" />
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
						<h3>经典电影</h3>
					</div>
					<c:forEach var="u" items="${sessionScope.toplist }">
						<div class="col-md-4 resent-grid recommended-grid slider-top-grids" style="width: 200px;">
							<div class="resent-grid-img recommended-grid-img">
								<a href="Moviedetailaction?movieid=${u.movieid}&recommendType=slopeOne"
										target="_blank" data-act="movie-click"
										data-val="{movieid:1208282}">
										<img src="${u.picture}">
								</a>
								<div class="clck">
									<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
								</div>
							</div>
							<div class="resent-grid-info recommended-grid-info" title="${u.moviename }">
								<h3><a href="Moviedetailaction?movieid=${u.movieid}&recommendType=slopeOne"
										target="_blank" data-act="movies-click"
										data-val="{movieId:1208282}">${u.moviename }</a>
								</h3>
								<ul>
									<li class="right-list"><p class="views views-info"><i class="integer">评分：${u.averating}</i></p></li>
								</ul>
							</div>
						</div>
					</c:forEach>
					<div class="clearfix"> </div>
				</div>
				<!-- 自己添加的分页 -->
				<c:if test="${!empty movieName}">
				<div id="page" align="center">
					<ul class="list-pager">
						<li><a class="page_2"
							href="Searchaction?movieName=${sessionScope.movieName}&page=${sessionScope.prepage}">上一页</a>
						</li>
						<c:if test="${sessionScope.page !=100}">
							<li class="active"><a class="page_1" href="javascript:void(0);"
								style="cursor: default">${sessionScope.page}</a></li>
						</c:if>
						<c:forEach var="u" items="${sessionScope.pagelist }">
							<li><a class="page_2"
								href="Searchaction?movieName=${sessionScope.movieName}&page=${u}">${u}</a></li>
						</c:forEach>
						<li class="sep">...</li>
						<c:if test="${sessionScope.page ==100}">
							<li class="active"><a class="page_1" href="javascript:void(0);"
								style="cursor: default">100</a></li>
						</c:if>
						<c:if test="${sessionScope.page !=100}">
							<li><a class="page_27731"
								href="Searchaction?movieName=${sessionScope.movieName}&page=100">100</a>
							</li>
						</c:if>
						<li><a class="page_2"
							href="Searchaction?movieName=${sessionScope.movieName}&page=${sessionScope.lastpage}">下一页</a>
						</li>
					</ul>
				</div>
				</c:if>
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
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>