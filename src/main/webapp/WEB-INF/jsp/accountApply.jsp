<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="menu.jsp"></jsp:include>
<script type="text/javascript">
    $(function(){
    	$.post('/wbeautiful/dept/getdept',{},function(data){
    		 var optionstring='';
		     $.each(data,function(i,n){
		    	 optionstring += "<option value=\"" + n.dept_id + "\" >" + n.dept + "</option>"; 
		     });  
			 $("#dept_id").html("<option value='0'>-请选择-</option> "+optionstring); 
    	});
    	$.post('/wbeautiful/position/getposition',{},function(data){
   		 var optionstring='';
		     $.each(data,function(i,n){
		    	 optionstring += "<option value=\"" + n.position_id + "\" >" + n.position + "</option>"; 
		     });  
			 $("#position").html("<option value='0'>-请选择-</option> "+optionstring); 
   	});
    	$("#btnAccountApply").click(function(){
    		var username = $("#txtAccount").val();
    		var strname = $("#txtName").val();
    		if(username==''||strname==''){
    			alert('工号和姓名不能为空');
    			return false;
    		}
    	});
    })
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="panel panel-primary panel-custom">
				<div class="panel-heading">
					<h3 class="panel-title" style="text-align: center">账号申请</h3>
				</div>
				<div class="panel-body">
				    <form action="/wbeautiful/user/accountApply" method="post" role="form">
				       <div class="row">
				        <div class="col-sm-1">
				           <font color="red">*</font>工号:
				       </div>
				       <div class="col-sm-2">
				           <input type="text" id="txtAccount" name="username" class="form-control" placeholder="工号">
				       </div>
				       <div class="col-sm-1"><font color="red">*</font>姓名:</div>
				       <div class="col-sm-2">
				           <input type="text" id="txtName" name="name" class="form-control" placeholder="姓名">
				       </div>
				       
				       <div class="col-sm-1">
				                       性别:
				       </div>
				       <div class="col-sm-2">
				           <select id="sex" name="sex">
				                   <option value="1">男</option>
				                   <option value="0">女</option>
				               </select>
				       </div>
				       <div class="col-sm-1">部门:</div>
				       <div class="col-sm-2"><select id="dept_id" name="dept_id"></select></div>
				      </div>
				      <br/>
				      <div class="row">
				          <div class="col-sm-1">手机:</div>
				       <div class="col-sm-2"><input type="text" id="txtPhone" name="phone" class="form-control" placeholder="手机"></div>
				       <div class="col-sm-1">座机:</div>
				       <div class="col-sm-2"><input type="text" id="txtTel" name="tel" class="form-control" placeholder="座机"></div>
				        <div class="col-sm-1">邮件:</div>
				       <div class="col-sm-2"><input type="text" id="txtEmail" name="email" class="form-control" placeholder="email"></div>
				       <div class="col-sm-1">职位:</div>
				       <div class="col-sm-2"><input type="text" id="position_id" name="position_id" class="form-control" placeholder="职位"></div>
				      </div>
				      <br/>
				      <div class="row">
				          <div class="col-sm-offset-5">
				          <button class="btn btn-default" id="btnAccountApply" type="submit">确定</button>		
				           <button class="btn btn-default">取消</button>
				          </div>
				          
				      </div>
				       
				       
				       <!-- <table class="table" id="applyaccounttable">
				           <tr>
				               <td><font color="red">*</font>工号:</td>
				               <td><input type="text" id="txtAccount" name="username"></td>
				               <td><font color="red">*</font>姓名:</td>
				               <td><input type="text" id="txtTel" name="tel"></td>
				               
				           </tr>
				           <tr>
				               <td>性别:</td>
				               <td><select id="sex" name="sex">
				                   <option value="1">男</option>
				                   <option value="0">女</option>
				               </select></td>
				               <td>部门:</td>
				               <td><select id="dept_id" name="dept_id"></select></td>
				               
				           </tr>
				           <tr>
				               <td>手机:</td>
				               <td><input type="text" id="txtPhone" name="phone"></td>
				               <td>座机:</td>
				               <td><input type="text" id="txtTel" name="tel"></td>
				           </tr>
				           <tr>
				               <td>邮件:</td>
				               <td><input type="text" id="txtEmail" name="email"></td>
				               <td>职位:</td>
				               <td><select id="position" name="position_id"></select></td>
				           </tr>
				       </table>
				       <div>
				           
				       </div>-->
				       
				    </form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>