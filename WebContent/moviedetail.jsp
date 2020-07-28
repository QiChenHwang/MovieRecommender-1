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
<title>Movie</title>
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
<link rel="icon" type="image/x-icon" href="imgges/title.ico" />
<link rel="stylesheet" type="text/css" href="./css/style2.css">
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/movieList.css">
<link rel="stylesheet" type="text/css" href="./css/buyTickets.css">
<link rel="stylesheet" type="text/css" href="./css/movieDetail.css">
<link rel="stylesheet" href="css/star-main.css" media="all" type="text/css"/>
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

.wz{
position:absolute;
top:1%;
left:90%;
}
         .black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 100%; 
            background-color: black; 
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=88); 
        } 
        .white_content { 
            display: none; 
            position: absolute; 
            top:25%; 
            left: 23%; 
            width: 450px; 
            height: 380px; 
            padding: 5px; 
            border: 5px solid white; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
#popupcontent{
position: absolute;
visibility: hidden;
overflow: hidden;
border:1px solid white;
background-color:#F9F9F9;
border:0px solid #333;
padding:5px;
width:30px;
height:50px;
<!--background:rgba(0,0,0,0.1);--> 
}
 
* {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
}

a:active, a:hover {
	outline-width: 0;
}

img {
	border-style: none;
}

body {
	font-family: Microsoft YaHei, Helvetica, Arial, sans-serif;
	background-color: #fff;
	-webkit-font-smoothing: subpixel-antialiased;
}

input {
	outline: none;
}

input[type=search]::-webkit-search-cancel-button {
	-webkit-appearance: none;
} 

textarea {
	overflow: auto;
	font: inherit;
}

.msgContainer {
	position: relative;
	width: 488px;
	height: 158px;
	margin: 10px 15px 20px;
	border: 1px solid #d8d8d8;
	border-radius: 4px;
	padding: 10px 10px 30px;
}

.msgContainer textarea {
	width: 100%;
	height: 100%;
	border: none;
	resize: none;
}

.writeBtn {
	color: #fff;
	background-color: #df2d2d;
	cursor: pointer;
	float: right;
	margin-right: 15px;
	width: 90px;
	height: 40px;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	line-height: 16px;
}

.deleteCom {
	cursor: pointer;
	position: absolute;
	top: -10px;
	right: 0;
	display: block;
	height: 30px;
	padding: 0 10px;
	border-radius: 15px;
	border: 1px solid #2d98f3;
	text-align: center;
	font-size: 14px;
	line-height: 30px;
	color: #2d98f3;
}

.approve {
	width: 60px;
}
</style>
<style>
	/*按钮颜色*/
	.btn-block{
		width: 20% !important;
		margin: 0 auto !important;
		color:white;
		background-color:red;
		height: 40px;
		margin:10px 5px 0px 20px;
	}
	/*满意主体*/
	.evalBody {
	    width: 34rem;/*修改form的大小*/
	    height: 27rem;
	    border: 1px solid white;/*距离表单的距离*/
	    margin: auto;
	    margin-top: 3rem;/*表单距离屏幕的高度*/
	    box-shadow: 1px 0px 21px -8px grey;/*右边阴影、下方阴影、阴影度、厚度*/
	 /*  background:rgba(0,0,0,0.1);*/ 
	}
	/*满意度*/
	.manyidu {
	    text-align: center;
	    font-size: 19px;
	    margin-top: 1.4rem;
	}
	/*备注文本*/
	.beizu-text{
		font-size: 1.1rem;
	    height: 12rem !important;
	    width: 90%;
	    border: 1px solid #f0eaea;
	    box-shadow: 4px 1px 22px -5px #909090;
	    margin-top: 1rem;
	    margin-left: 2rem;
	    margin-bottom: 2rem;
	    opacity: 0.9;
	    border-radius: 1rem;
	    outline: none;
	    padding: 0.9rem;
	}
</style>
<style>
	.page-header{
		padding-bottom: 1px !important;
    	margin: 18px 0 20px !important;
	}
	.submit_btn{
		width: 100%;
	}
	.textarea.form-control{
		height: 28rem !important;
	}
	h3{
		font-size: 22px;
	}
	
	h2{
		font-size: 19px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main-grids">
				<div class="top-grids">
					<div class="banner2">
						<div class="wrapper clearfix">
							<div class="celeInfo-left">
								<div class="avatar-shadow">
									<img class="avatar" src="${sessionScope.moviedetail.picture}"
										alt="">
			
								</div>
							</div>
			
							<div class="celeInfo-right clearfix">
								<div class="movie-brief-container">
									<h3 class="name">${sessionScope.moviedetail.moviename}</h3>
									<ul>
										<li class="ellipsis">${sessionScope.moviedetail.typelist}</li>
			
										<li class="ellipsis">${sessionScope.moviedetail.showyear}
											/${sessionScope.moviedetail.nation}</li>
									</ul>
								</div>
								<div class="action-buyBtn">
									<div class="action clearfix" data-val="{movieid:42964}">
									    <c:if test="${empty user}">
<!-- 									    <a class="wish " data-wish="false" data-score=""
											data-bid="b_gbxqtw6x" href="">
											<div>
												<i class="icon wish-icon"></i> <span class="wish-msg"
													data-act="wish-click"> 想看 </span>
											</div>
										</a> --> 
										<a href="">
											<div>
												<i class="icon score-btn-icon"></i> <span class="score-btn-msg"
													data-act="comment-open-click">评分</span>
											</div>
										</a>
									    </c:if>
										<c:if test="${!empty user}">
<!-- 										<a class="wish " data-wish="false" data-score=""
											data-bid="b_gbxqtw6x" href="Browsiedaction">
											<div>
												<i class="icon wish-icon"></i> <span class="wish-msg"
													data-act="wish-click"> 想看 </span>
											</div>
										</a>  -->
										<a onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
											<div>
												<i class="icon score-btn-icon"></i> <span class="score-btn-msg"
													data-act="comment-open-click">评分</span>
											</div>
										</a>
										</c:if>
									</div>
									<a class="btn buy" href="https://vip.iqiyi.com/" target="_blank"
										data-act="more-detail-click" data-bid="b_ozuzh4j4">在线播放</a>
								</div>
			
								<div class="movie-stats-container">
			
									<div class="movie-index">
										<p class="movie-index-title">用户评分</p>
										<div class="movie-index-content score normal-score">
											<span class="index-left info-num "> <span
												class="stonefont"> ${sessionScope.moviedetail.averating}</span>
											</span>
											<div class="index-right">
												<div class="star-wrapper">
													<div class="star-on" style="width: 93%;"></div>
												</div>
												<span class="score-num">
												<span class="stonefont">${sessionScope.moviedetail.numrating}
<%-- 													<c:if test="${sessionScope.moviedetail.numrating == '10000'}">
							                 			万
							                 		</c:if> 
							                 		<c:if
															test="${sessionScope.moviedetail.numrating == '1'}">
													</c:if> --%>
												</span>人评分</span>
											</div>
										</div>
									</div>
			
<%-- 									<div class="movie-index">
										<p class="movie-index-title">累计票房</p>
										<div class="movie-index-content box">
											<span class="stonefont">${sessionScope.moviedetail.numrating}</span>
											<span class="unit"> <c:if
													test="${sessionScope.moviedetail.numrating== 10000}">
									            		万
									            	</c:if> <c:if
													test="${sessionScope.moviedetail.numrating == 100000000}">
									            		亿
									            	</c:if>
											</span>
										</div>
									</div> --%>
								</div>
			
							</div>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="main">
					<div class="main-inner">
						<div class="main-content">
							<div class="tab-container">
								<div class="tab-title-container clearfix">
			
									<div class="tab-title active" data-act="tab-desc-click">介绍</div>
									<div class="tab-title " data-act="tab-celebrity-click">演职人员</div>
<!-- 									<div class="tab-title tab-disabled" data-act="tab-award-click">奖项</div>
									<div class="tab-title " data-act="tab-img-click">图集</div> -->
								</div>
			
								<div class="tab-content-container">
									<div class="tab-desc tab-content active"
										data-val="{tabtype:'desc'}">
										<div class="module">
											<div class="mod-title">
												<h3>剧情简介</h3>
											</div>
											<div class="mod-content">
												<span class="dra">${sessionScope.moviedetail.description}
												</span>
			
											</div>
										</div>
			
										<div class="module  staringPeople">
											<div class="mod-title">
												<h3>演职人员</h3>
												<!-- <a class="more" href="#celebrity" data-act="all-actor-click">全部</a> -->
											</div>
											<div class="mod-content">
												<div class="celebrity-container clearfix">
			
													<div class="celebrity-group">
														<div class="celebrity-type">导演:${sessionScope.moviedetail.director}</div>
														<div class="celebrity-type">主演:${sessionScope.moviedetail.leadactors}</div>
<%-- 														<ul class="celebrity-list clearfix">
															<li class="celebrity " data-act="celebrity-click" data-val="{celebrityid:29844}">
<!-- 																<a href="/films/celebrity/29844" target="_blank" class="portrait"> 
																	<img class="default-img" alt="" src="http://p1.meituan.net/moviemachine/231e87d37ebd5e191899e2210619b2dd41945.jpg@128w_170h_1e_1c">
																</a> -->
																<div class="info">
																	<a href="/films/celebrity/29844" target="_blank"
																		class="name"> ${sessionScope.moviedetail.director} </a>
																</div>
															</li>
			
														</ul> --%>
												</div>
											</div>
										</div>		
									<c:if test="${!empty user}">
											<c:if test="${empty sessionScope.recommendMovieInfo}">
												<h3 align="center">尊敬的用户，你的记录太少，点评更多你喜欢的电影，才能为你推荐~</h3>
											</c:if>
											<c:if test="${!empty  sessionScope.recommendMovieInfo}">
												<h3 align="left">看过这个电影的用户还看过这些电影</h3>
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
										</c:if>
										<script type="text/javascript" src="./js/jquery.min.js"></script>
										<script type="text/javascript" src="./js/carousel.js"></script>
										<script type="text/javascript" src="./js/layer.js"></script>
									</div>
								</div>
							</div>
						</div>
						<div id="light" class="white_content">
							<div>
								<div>
								  <form action="Commentsscoreaction">
								    	<div class="evalBody">    	
								    		<div class="manyidu">
								    			 <font color="red">请点击星星评分</font></br>
								    			 <div class="panel-body" style="text-align: center;margin-left: 23%;">
										  	  		  <input name="starNum" id="starNum" type="hidden"/>
								                      <div class="starability-container">
									                       <fieldset class="starability-slot">
									                       		<!-- <input type="radio" id="rate_1_0_1_10" name="starLevel" value="10" /> 
										                        <label for="rate_1_0_1_10" title="10星"></label>
										                        <input type="radio" id="rate_1_0_1_9" name="starLevel" value="9" /> 
										                        <label for="rate_1_0_1_9" title="9星"></label>
										                        <input type="radio" id="rate_1_0_1_8" name="starLevel" value="8" /> 
										                        <label for="rate_1_0_1_8" title="8星"></label>
										                        <input type="radio" id="rate_1_0_1_7" name="starLevel" value="7" /> 
										                        <label for="rate_1_0_1_7" title="7星"></label>
										                        <input type="radio" id="rate_1_0_1_6" name="starLevel" value="6" /> 
										                        <label for="rate_1_0_1_6" title="6星"></label> -->
										                        <input type="radio" id="rate_1_0_1_5" name="starLevel" value="5" /> 
										                        <label for="rate_1_0_1_5" title="5星"></label>
										                        <input type="radio" id="rate_1_0_1_4" name="starLevel" value="4" /> 
										                        <label for="rate_1_0_1_4" title="4星"></label>
										                        <input type="radio" id="rate_1_0_1_3" name="starLevel" value="3" /> 
										                        <label for="rate_1_0_1_3" title="3星"></label>
										                        <input type="radio" id="rate_1_0_1_2" name="starLevel" value="2" /> 
										                        <label for="rate_1_0_1_2" title="2星"></label>
										                        <input type="radio" id="rate_1_0_1_1" name="starLevel" value="1" /> 
										                        <label for="rate_1_0_1_1" title="1星"></label>
									                       </fieldset>
								                      </div>
										  		 </div>
									    	</div>
								    		<!--备注输入框-->
<!-- 								    		<div class="beizu">
											   	<textarea class="beizu-text" id="customerEvaluationComment" 
											   		name="customerEvaluationComment"
											   		placeholder="快来说说你的看法吧" 
									        	class="form-control" rows="16" ></textarea>
								    		</div> -->
								    		<!--按钮-->
								    		<div style="text-align:center;">  
								    			<button type="submit" 
								    					style="margin-bottom: 0.8rem !important;"class="btn btn-primary btn-lg btn-block"
								    					>提交
							    				</button>			
									    	</div>    	
							    		</div>	
								    </form>
								</div>
							</div>
							<div class="wz">
								<a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><button type="button" class="btn btn-default btn-lg btn-block">X</button></a>
							</div>
						</div> 
			        <div id="fade" class="black_overlay"></div>
			      </div>
			    </div>
			</div>

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
	</div>
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
<script>
	//关闭
	function closed() {
		window.close();
	}
</script>
</html>