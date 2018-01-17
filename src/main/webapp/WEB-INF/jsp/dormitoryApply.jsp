<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="menu.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
    	//绑定宿舍楼
    	$.post('/wbeautiful/dormitory/getDormitory',{},function(data){
		     var optionstring='';
		     $.each(data,function(i,n){
		    	 //$("#dormitory").append('<option value="'+n.dormitory_number+'">'+n.dormitory_number+'</option>');
		    	 optionstring += '<option value="' + n.dormitory_number + '" >' + n.dormitory_number + '</option>'; 
		     });  
			 $("#dormitory").html("<option value='0'>-请选择-</option> "+optionstring); 
	});
    	//绑定房间号,只取剩余床位房间
    	$("#dormitory").change(function(){
    		var value = $("#dormitory").val();
    		getLeftRoom(value);
    	});
    	
    	$("#btnApply").click(function() {
			var username = $("#txtAccount").val();
			var strname = $("#txtName").val();
			var dormitory = $("#dormitory").val();
			var roomNumber = $("#roomNumber").val();
			if(username==''||strname==''||dormitory==''||roomNumber==''){
				alert('信息不完整');
				return false;
			}
			$.post('/wbeautiful/user/isexit',{username:username,name:strname},function(data,status){
			
				if(status=='success'&&data!=''){
					if(data.dormitory_id!=0){
						alert('员工已分配宿舍,请确认');
						return false;
					}
					$.post('/wbeautiful/dormitory/applyDormitory',{username:username,name:strname,dormitory:dormitory,roomNumber:roomNumber},function(data,status){
						if(status=='success'){
							alert('申请成功');
							$("#dormitoryapplyform")[0].reset();
						}else{
							alert("申请失败,请联系管理员");
							return false;
						}
					});
				}else{
					alert('请确认账号是否存在,账号姓名是否匹配');
					return false;
				}
			});
			
		});
    })
    function getLeftRoom(strDormitory){    
    	if(strDormitory == 0){
    		return false;
    	}
    	$.post('/wbeautiful/dormitory/getLeftRoom',{strDormitory:strDormitory},function(data){	
    		
    		var roomoption='';
    		$.each(data,function(i,n){
    			 roomoption += "<option value=\"" + n.room_number + "\" >" + n.room_number + "</option>";
    			//$("#roomNumber").append('<option value="'+n.room_number+'">'+n.room_number+'</option>');
    		});
    		$("#roomNumber").html(roomoption); 
    		
    	});
    }
</script>
</head>
<body>
  
	<div class="container">
		<div class="row">
			<div class="panel panel-primary  panel-custom">
				<div class="panel-heading">
					<h3 class="panel-title" style="text-align: center">宿舍申请</h3>
				</div>
				<div class="panel-body">
				
					<form action="#" method="post" id="dormitoryapplyform" role="form">
					 <div class="row">
					        <div class="col-sm-1">工号:</div>
					        <div class="col-sm-2">
					            <input type="text" class="form-control" id="txtAccount" placeholder="工号:">
					        </div>       
                             <div class="col-sm-1">姓名:</div>
                             <div class="col-sm-2">
                               <input type="text" class="form-control" id="txtName" placeholder="姓名">
                            </div> 
                             <div class="col-sm-1">宿舍楼:</div>
					        <div class="col-sm-2">
					           <select id="dormitory"></select>
					        </div>       
                             <div class="col-sm-1">房间号:</div>
                             <div class="col-sm-1">
                               <select id="roomNumber"></select>
                            </div>    
                            <div class="col-sm-1">
                                <input type="button" id="btnApply" value="申请入住">
                            </div>                  
                     </div>					    
					    
						<!-- <table class="table table-striped">
						<thead>
						</thead>
						<tbody>
						    <tr>
								<td>工号:</td>
								<td><input type="text" id="txtAccount"></td>
								<td>姓名:</td>
								<td><input type="text" id="txtName"></td>
								<td>宿舍楼:</td>
								<td><select id="dormitory"></select></td>
								<td>房间号:</td>
								<td><select id="roomNumber"></select></td>
								<td><input type="button" id="btnApply" value="申请入住"></td>
							</tr>
						</tbody>						
						</table>-->
					</form>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>