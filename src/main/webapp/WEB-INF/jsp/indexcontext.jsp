<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>
<jsp:include page="menu.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="panel panel-primary panel-custom">
				<div class="panel-heading">
					<h3 class="panel-title">首页</h3>
				</div>
				<div class="panel-body">
				    <div id="myCarousel" class="carousel slide">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active">
			<img src="../resources/bootstrap/images/1.jpg" alt="First slide" style="width: 100%;height:600px">
		</div>
		<div class="item">
			<img src="../resources/bootstrap/images/2.jpg" alt="Second slide" style="width: 100%;height:600px">
		</div>
		<div class="item">
			<img src="../resources/bootstrap/images/3.jpg" alt="Third slide" style="width: 100%;height:600px">
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="carousel-control left" href="#myCarousel" 
	   data-slide="prev">&lsaquo;</a>
	<a class="carousel-control right" href="#myCarousel" 
	   data-slide="next">&rsaquo;</a>
</div> 
				    
				    
				    
				    
				</div>	
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
		$('#myCarousel').carousel({interval:5000});//每隔5秒自动轮播 
			
	})
	</script>
</body>
</html>