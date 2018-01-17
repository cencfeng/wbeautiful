<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>菜单管理</title>
<jsp:include page="menu.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="panel panel-primary panel-custom">
				<div class="panel-heading">
					<h3 class="panel-title">菜单管理</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-12">
							<form action="#" id="menuform">



								<div class="row">
									<div class="col-sm-1">
										<label>菜单:</label>
									</div>
									<div class="col-sm-1">
										<select id="menulist"></select>
									</div>
									<div class="col-sm-1">菜单名称</div>
									<div class="col-sm-2">
										<input type="text" class="form-control" id="m_name"
											placeholder="菜单名称">
									</div>
									<div class="col-sm-1">url:</div>
									<div class="col-sm-1">
										<input type="text" class="form-control" id="m_url"
											placeholder="url">
									</div>
									<div class="col-sm-1">排序:</div>
									<div class="col-sm-1">
										<input type="text" class="form-control" id="m_order"
											placeholder="排序">
									</div>
									<div class="col-sm-1">是否主菜单:</div>
                                     <div class="col-sm-1">                                                                                                
									<select id="ifmain">
										    <option value="0">-请选择-</option>
										    <option value="1">是</option>
										    <option value="2">否</option>
										</select>
									</div>
									<div class="col-sm-1">
										<input type="button" id="btnadd" value="确定"
											class="btn btn-primary">
									</div>
								</div>


							</form>
						</div>

					</div>

					<table class="table table-striped table-condensed"
						id="submenutable"></table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			//初始化下拉
			$.post('/wbeautiful/menu/getMenu', {}, function(data) {
				var optionstring = '';
				//var test = JSON.stringify(data);
				$.each(data, function(i, n) {
					optionstring += '<option value="' + n.id + '" >' + n.m_name
							+ '</option>';
				});

				$("#menulist").html(
						"<option value='0'>-请选择-</option> " + optionstring);
			});
			//下拉事件
			$("#menulist").change(function() {
				var mid = $('#menulist').val();
				getSubMenu(mid);
			});
			//添加菜单
			$("#btnadd").click(function(){
				var m_name = $("#m_name").val();
				var m_url = $("#m_url").val();
				var m_order =$("#m_order").val();
				var parentid = $("#menulist").val();
				var reg = new RegExp("^[0-9]*$");
			    var ifmain = $("#ifmain").val();
			    if(parentid == 0){
			    	alert('请选择添加的菜单');
			    	return false;
			    }
				if(!reg.test(m_order)){
					alert('排序框内容只能为数字');
					return false;
				}
				if(m_name == ''||m_url == '' ||m_order == ''||ifmain == 0){
					alert('请完善信息');
					return false;
				}
				$.post('/wbeautiful/menu/insertmenu',{m_name:m_name,m_url:m_url,m_order:m_order,parentid:parentid,m_level:ifmain},function(){
					alert('添加成功');
					$("#menuform")[0].reset();
					$("#submenutable").empty();
				});
			
		        });
			
			
		})
		//删除菜单
		function delmenu(menuid){
			if (confirm('确定要删除')==false){
				return false;
				}
			if(menuid ==''||menuid ==null){
				return false;
			}
			$.post('/wbeautiful/menu/delmenu',{mid:menuid},function(){
				alert('删除成功');
				var parent_id = $('#menulist').val();
				$("#menuform")[0].reset();
				$("#submenutable").empty();
				getSubMenu(parent_id);		
			});
		}
		function getSubMenu(mid) {
			if (mid == 0) {
				$("#menuform")[0].reset();
				$("#submenutable").empty();
				return false;
			}
			$.post('/wbeautiful/menu/getSubMenu',
							{
								mid : mid
							},
							function(data) {
								$("#submenutable").empty();
								if (data != '') {
									var tablehtml = '<thead><tr><th>序号</th><th>菜单名称</th><th>url</th></tr></thead><tbody>';
									$.each(data, function(i, n) {
										i += 1;
										tablehtml += '<tr><td>' + i
												+ '</td><td>' + n.m_name
												+ '</td><td>' + n.m_url
												+ '</td><td><input type="button" id="btndel" value="删除" class="btn btn-primary" onclick="delmenu('+n.id+')"></td></tr>'
									});
									$("#submenutable").append(
											tablehtml + '</tbody>');
								}

							});
		}
	</script>
</body>
</html>