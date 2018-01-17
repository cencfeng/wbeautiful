<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="../resources/bootstrap/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="../resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="../resources/bootstrap/js/bootstrap-table.min.js"></script>
<script type="text/javascript"
	src="../resources/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../resources/bootstrap/css/bootstrap.min.css">
	<style type="text/css">
  .siteheader {
    position: relative;
    text-align: center;
    background-color: #337ab7;
    color: #fff;
    margin-bottom: 0;
}


</style>


</head>
<div class="siteheader">
<div class="pull-left">
    <a href="indexcontext"><img alt="图片" src="../resources/bootstrap/images/Enterprise.png"></a></div>
	<div class="container" style="margin-top: 0px;">
		<div class="row">
			<div class="col-sm-12 col-md-12">
				<!--  头部 -->
				<div class="site-header-banner" style="min-height:100px;">
				<br>
				<br>			
					<form method="post" id="searchFrm" class="searchFrm" role="search"
						action="/mfeng">
						<div class="input-group">
							<input type="text" class="form-control input-group-lg"
								id="keyword" name="keyword" placeholder="Search"> <span
								class="input-group-btn">
								<button type="button" class="btn btn-default">搜索</button>
							</span>
							
						</div>
					</form>
				</div>
			
			</div>
			
		
	</div>
	</div>
	
	</div>
	<!--导航菜单 -->
	<!--<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">--> 
	 <nav class="navbar navbar-default navbar-custom" role="navigation">
	<div class="container">
		<div class="navbar-header navbar-header-custom">
			<ul class="nav navbar-nav nav-custom" id="navcontext">
			  
			</ul>
		</div>
	</div>
	</nav>
	<script type="text/javascript">
function getsubMenu(mid) {
	$.post('/wbeautiful/menu/getSubMenu', {mid : mid}, function(data) {
		var subhtml = '';
		$.each(data, function(i, n) {
			subhtml += '<li><a href="/wbeautiful/topage/'+n.m_url+'">' + n.m_name+ '</a></li>';
		});
		$('ul[id=' + mid + ']').append(subhtml);
	})
}
	$(function() {		      
				$.post('/wbeautiful/menu/getMenu',{},function(data) {
					var ahtml = '';
					$.each(data,function(i, n) {
					    ahtml += '<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" >'
					    + n.m_name
					    + '<span class="caret"></span></a><ul class="dropdown-menu" id="'+n.id+'"></ul></li>';
					    getsubMenu(n.id);
				    });

				    $("#navcontext").append(ahtml);
			    });
	     
	})
	
</script>
</html>