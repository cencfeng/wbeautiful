<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="resources/bootstrap/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/bootstrap/css/bootstrap.min.css">
<title>登录</title>
<style type="text/css">
.input-group {
	margin: 10px 0px;
	
}

h3 {
	padding: 5px;
	border-bottom: 1px solid #ddd;
	
}

li {
	list-style-type: square; 
	margin: 10px 0;
	
}

em { 
	color: #c7254e;
	font-style: inherit;
	background-color: #f9f2f4;
}
</style>
<body>
	<div class="container">
		<div class="row">
			<div style="border-right: 1px solid #ddd;">
				<div class="well col-md-12">
					<h3 style="text-align: center;">用户登录</h3>
					<form action="/wbeautiful/user/login" method="post">
					    <div class="input-group input-group-md">
						<span class="input-group-addon" id="sizing-addon1"><i
							class="glyphicon glyphicon-user" aria-hidden="true"></i></span> <input
							type="text" class="form-control" placeholder="用户名" name="username"
							aria-describedby="sizing-addon1">
					</div>
					<div class="input-group input-group-md">
						<span class="input-group-addon" id="sizing-addon1"><i
							class="glyphicon glyphicon-lock"></i></span> 
							<input type="password" class="form-control" placeholder="密码" name="password"
							aria-describedby="sizing-addon1">
					</div>

					<button type="submit" class="btn btn-success btn-block">登录</button>
						
				    <button type="reset" class="btn btn-success btn-block">重置</button>
				    </form>
                   

						
				</div>


				

			</div>
		</div>
	</div>

</body>
</html>