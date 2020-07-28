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
<title>推荐列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
			<!--  <div class="main-grids">-->
			<div class="movie-grid">
				<div class="recommended-info">
					<h3>个性推荐</h3>
				</div>
				<div class="panel-content">
					<c:if test="${empty sessionScope.recommendMovieInfo}">
						<h3 align="center">尊敬的用户，你的记录太少，点评更多你喜欢的电影，才能为你推荐~</h3>
					</c:if>
					<c:if test="${!empty sessionScope.recommendMovieInfo}">
						<div class="movies-list">
							<ul class="movie-list">


								<c:forEach var="u" items="${sessionScope.recommendMovieInfo }">

									<li>
										<div class="movie-item">
											<a href="Moviedetailaction?movieid=${u.movieid}&recommendType=slopeOne"
												target="_blank" data-act="movie-click"
												data-val="{movieid:1208282}">
												<div class="movie-poster">
													<img src="${u.picture}">
												</div>
											</a>
											<div class="movie-ver"></div>
										</div>
										<div class="channel-detail movie-item-title"
											title="${u.moviename }">
											<a href="Moviedetailaction?movieid=${u.movieid}&recommendType=slopeOne"
												target="_blank" data-act="movies-click"
												data-val="{movieId:1208282}">${u.moviename }</a>
										</div>

										<div class="channel-detail channel-detail-orange">
											<i class="integer">${u.averating}</i>
										</div>

									</li>
								</c:forEach>

							</ul>
						</div>
					</c:if>
				</div>
			</div>
			<!-- </div>  -->
			<!-- footer
			<div class="footer">
				<div class="footer-grids">
					<div class="footer-top">
						<div class="footer-top-nav">
							<ul>
								<li><a href="#">About</a></li>
								<li><a href="#small-dialog5" class="play-icon popup-with-zoom-anim f-history f-help">Help</a></li>
								<li><a href="#small-dialog4" class="play-icon popup-with-zoom-anim">Send feedback</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			//footer -->
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