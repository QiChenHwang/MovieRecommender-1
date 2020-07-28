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
<title>RARI MOVIE</title>
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
						<h3>查看电影</h3>
					</div>
						<div class="tags-panel">
							<ul class="tags-lines">
								<li class="tags-line" data-val="{tagTypeName:'cat'}">
									<div class="tags-title">类型 :</div>
		
									<ul class="tags">
										<li class="active" data-state-val="{catTagName:'0'}"><a
											data-act="tag-click" data-val="{'0'}"
											href="Querymovieaction?type=0&page=1" style="cursor: default">全部</a>
										</li>
		
										<li><a data-act="tag-click" data-val="{1}"
											href="Querymovieaction?type=1&page=1">动作</a></li>
		
										<li><a data-act="tag-click" data-val="{2}"
											href="Querymovieaction?type=2&page=1">冒险</a></li>
		
										<li><a data-act="tag-click" data-val="{3}"
											href="Querymovieaction?type=3&page=1">动漫</a></li>
		
										<li><a data-act="tag-click" data-val="{'4'}"
											href="Querymovieaction?type=4&page=1">儿童</a></li>
		
										<li><a data-act="tag-click" data-val="{'5'}"
											href="Querymovieaction?type=5&page=1">喜剧</a></li>
		
										<li><a data-act="tag-click" data-val="{'6'}"
											href="Querymovieaction?type=6&page=1">犯罪</a></li>
		
										<li><a data-act="tag-click" data-val="{'7'}"
											href="Querymovieaction?type=7&page=1">记录</a></li>
		
										<li><a data-act="tag-click" data-val="{'8'}"
											href="Querymovieaction?type=8&page=1">戏剧</a></li>
		
										<li><a data-act="tag-click" data-val="{'9'}"
											href="Querymovieaction?type=9&page=1">幻想</a></li>
		
										<li><a data-act="tag-click" data-val="{'10'}"
											href="Querymovieaction?type=10&page=1">黑色</a></li>
		
										<li><a data-act="tag-click" data-val="{'11'}"
											href="Querymovieaction?type=11&page=1">恐怖</a></li>
		
										<li><a data-act="tag-click" data-val="{'12'}"
											href="Querymovieaction?type=12&page=1">音乐</a></li>
		
										<li><a data-act="tag-click" data-val="{'13'}"
											href="Querymovieaction?type=13&page=1">神秘</a></li>
		
										<li><a data-act="tag-click" data-val="{'14'}"
											href="Querymovieaction?type=14&page=1">浪漫</a></li>
		
										<li><a data-act="tag-click" data-val="{'15'}"
											href="Querymovieaction?type=15&page=1">科幻</a></li>
		
										<li><a data-act="tag-click" data-val="{'16'}"
											href="Querymovieaction?type=16&page=1">惊悚</a></li>
		
										<li><a data-act="tag-click" data-val="{'17'}"
											href="Querymovieaction?type=17&page=1">战争</a></li>
		
										<li><a data-act="tag-click" data-val="{'18'}"
											href="Querymovieaction?type=18&page=1">西方</a></li>
		
										<li><a data-act="tag-click" data-val="{'19'}"
											href="Querymovieaction?type=19&page=1">家庭</a></li>
		
										<li><a data-act="tag-click" data-val="{其他}"
											href="Javascript:void(0)">其他</a></li>
									</ul>
								</li>

							</ul>
						</div>
						<div class="movies-panel">
							<div class="movies-sorter">
								<div class="cat-sorter">
									<ul>
										<li><span class="sort-control-group" data-act="sort-click"
											data-val="{tagId: 1 }"
											onclick="location.href='Querymovieaction?type=${sessionScope.sortType}&page=${sessionScope.page}'">
												<c:if test="${sessionScope.sortOrder==null }">
													<span class="sort-control sort-radio sort-radio-checked"></span>
												</c:if> <c:if test="${sessionScope.sortOrder !=null }">
													<span class="sort-control sort-radio"></span>
												</c:if> <span class="sort-control-label">按热门排序</span>
										</span></li>
										<li><span class="sort-control-group" data-act="sort-click"
											data-val="{tagId: 2 }" data-href="?sortId=2"
											onclick="location.href='Querymovieaction?type=${sessionScope.sortType}&order=showyear&page=${sessionScope.page}' ">
			
												<c:if test="${sessionScope.sortOrder =='showyear' }">
													<span class="sort-control sort-radio sort-radio-checked"></span>
												</c:if> <c:if test="${sessionScope.sortOrder !='showyear' }">
													<span class="sort-control sort-radio"></span>
												</c:if> <span class="sort-control-label">按时间排序</span>
										</span></li>
										<li><span class="sort-control-group" data-act="sort-click"
											data-val="{tagId: 3 }" data-href="?sortId=3"
											onclick="location.href='Querymovieaction?type=${sessionScope.sortType}&order=averating&page=${sessionScope.page}'">
			
												<c:if test="${sessionScope.sortOrder =='averating' }">
													<span class="sort-control sort-radio sort-radio-checked"></span>
												</c:if> <c:if test="${sessionScope.sortOrder !='averating' }">
													<span class="sort-control sort-radio"></span>
												</c:if> <span class="sort-control-label">按评价排序</span>
										</span></li>
									</ul>
								</div>
							</div>
			
							<div class="movies-list">
								<ul class="movie-list">
			
			
									<c:forEach var="u" items="${sessionScope.movielist }">
			
										<li>
											<div class="movie-item">
												<a href="Moviedetailaction?movieid=${u.movieid}"
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
												<a href="Moviedetailaction?movieid=${u.movieid}"
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
						</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<div id="page" align="center">
				<ul class="list-pager">
					<li><a class="page_2"
						href="Querymovieaction?type=${sessionScope.sortType}&page=${sessionScope.prepage}">上一页</a>
					</li>
					<c:if test="${sessionScope.page !=100}">
						<li class="active"><a class="page_1" href="javascript:void(0);"
							style="cursor: default">${sessionScope.page}</a></li>
					</c:if>
					<c:forEach var="u" items="${sessionScope.pagelist }">
						<li><a class="page_2"
							href="Querymovieaction?type=${sessionScope.sortType}&page=${u}">${u}</a></li>
					</c:forEach>
					<li class="sep">...</li>
					<c:if test="${sessionScope.page ==100}">
						<li class="active"><a class="page_1" href="javascript:void(0);"
							style="cursor: default">100</a></li>
					</c:if>
					<c:if test="${sessionScope.page !=100}">
						<li><a class="page_27731"
							href="Querymovieaction?type=${sessionScope.sortType}&page=100">100</a>
						</li>
					</c:if>
					<li><a class="page_2"
						href="Querymovieaction?type=${sessionScope.sortType}&page=${sessionScope.lastpage}">下一页</a>
					</li>
				</ul>
			</div>
			<script type="text/javascript" src="./js/jquery.min.js"></script>
			<script type="text/javascript" src="./js/page.js"></script>
			<script type="text/javascript">
				  var active=new Array(23);
				
				 $("[data-act='tag-click']").each(function(key,value){
					if($(this).html()=="${sessionScope.category}"){
						$(this).parent().addClass('active').siblings().removeClass('active');
					}
		            active[key] = $(this).html();      //如果是其他标签 用 html();
		        });	
			</script>
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