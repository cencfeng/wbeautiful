<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="menu.jsp"></jsp:include>
<style type="text/css">
    table td{word-break: keep-all;white-space:nowrap;}
    table th{word-break: keep-all;white-space:nowrap;}
</style>
<script type="text/javascript">
    $(function(){    
    	//绑定宿舍号
    	$.post('/wbeautiful/dormitory/getDormitory',{},function(data){
    		     var optionstring='';
    		     $.each(data,function(i,n){
    		    	 optionstring += "<option value=\"" + n.dormitory_number + "\" >" + n.dormitory_number + "</option>"; 
    		     });  
    			 $("#dormitory").html("<option value='0'>-请选择-</option> "+optionstring); 
    	});
    	//绑定房间号
    	$("#dormitory").change(function(){
    		var value = $("#dormitory").val();
    		getallRoom(value);
    	});
    	//查询
    	$("#btnSearchRoom").click(function(){
    		var strDormitorynumber = $("#dormitory").val();
    		var strRoomnumber = $("#roomNumber").val();
    		 
    		if(strDormitorynumber == 0){
    			alert('请选择信息');
    		    return false;
    		}   		
    		/* $('#tabletest').bootstrapTable({  
    		        columns: [{  
    		            field: 'username',  
    		            title: '用户名',  
    		        }, {  
    		            field: 'name',  
    		            title: '姓名',  
    		        }, {  
    		            field: 'phone',  
    		            title: '联系方式',  
    		        },{  
    		            field: 'email',  
    		            title: '邮件',  
    		        },{  
    		            field: 'dept.dept',  
    		            title: '部门',  
    		        },{  
    		            field: 'dormitory.dormitory_number',  
    		            title: '宿舍楼',  
    		        },{  
    		            field: 'dormitory.room_number',  
    		            title: '房间号',  
    		        },{  
    		            field: 'dormitory.tnumber',  
    		            title: '总数',  
    		        },{  
    		            field: 'dormitory.left_number',  
    		            title: '剩余数量',  
    		        }],
    		        showToggle:true, 
    		        showRefresh: true,
    		        //页面需要展示的列，后端交互对象的属性  
    		        // pagination: true,  //开启分页  
    		        // sidePagination: 'server',//服务器端分页  
    		        //pageNumber: 1,//默认加载页  
    		        //pageSize: 20,//每页数据  
    		       // pageList: [20, 50, 100, 500],//可选的每页数据  
    		        queryParams: function (params) {  
    		            return {  
    		            strDormitorynumber: strDormitorynumber,  
    		            strRoomnumber:strRoomnumber   		                 		                
    		            }  
    		        },//请求服务器数据时的参数  
    		        url: '/wbeautiful/dormitory/getDormitoryliveinfo' //服务器数据的加载地址  
    		    });  
    		*/
    		$.post('/wbeautiful/dormitory/getDormitoryliveinfo',{strDormitorynumber:strDormitorynumber,strRoomnumber:strRoomnumber},function(data){ 						  		
    			//var sss = JSON.stringify(data); 
    		    
    			$("#dormitoryInfo").empty();
        		var strtable='';
        		if(data.length !=0){
        			strtable = '<thead><tr><th>工号</th><th>姓名</th><th>联系方式</th><th>邮件</th><th>部门</th><th>宿舍楼</th><th>房间号</th><th>总数</th><th>剩余</th></tr></thead><tbody>';
        		}else{
        			alert('房间无信息,请确认是否有入住');
        			return false;
        		}
    			
    			$.each(data,function(i,n){
    				strtable += '<tr><td>'+n.username+'</td><td>'+n.name+'</td><td>'+n.phone+'</td><td>'+n.email+'</td><td>'+n.dept.dept+'</td><td>'+n.dormitory.dormitory_number+'</td><td>'+n.dormitory.room_number+'</td><td>'+n.dormitory.tnumber+'</td><td>'+n.dormitory.left_number+'</td></tr>';
    				
    			});
    			strtable +='</tbody>';
    			//alert(strtable);
    			$("#dormitoryInfo").append(strtable);
    			
    		});
    	})
    })
    function getallRoom(strDormitory){    
    	if(strDormitory == 0){
    		return false;
    	}
    	$.post('/wbeautiful/dormitory/getAllRoom',{strDormitory:strDormitory},function(data){	
    		
    		var roomoption='';
    		$.each(data,function(i,n){
    			roomoption += "<option value=\"" + n.room_number + "\" >" + n.room_number + "</option>";
    		});
    		$("#roomNumber").html(roomoption); 
    		
    	});
    }
    
   
</script>
</head>
<body>

	<div class="container">		
			<div class="panel panel-primary panel-custom">
				<div class="panel-heading">
					<h3 class="panel-title" style="text-align: center">宿舍查询</h3>
				</div>
				<div class="panel-body">
				 <form action="#" role="form" id="infos">
				     <div class="row">
				         <div class="col-sm-2">
				             <font color="red">*</font>宿舍楼:
				         </div>
				         <div class="col-sm-4">
				             <select id="dormitory"></select>
				         </div>
				         <div class="col-sm-1">
				             <font color="red">*</font>房间号:
				         </div>
				         <div class="col-sm-4">
				             <select id="roomNumber"></select>
				         </div>
				         <div class="col-sm-1">
				             <input type="button" id="btnSearchRoom" class="btn btn-default" value="查询">
				         </div>
				     </div>				     
				 </form> 
    		       
				  <table id="dormitoryInfo" class="table table-striped table-condensed"></table>			 
				 </div>
				
				</div>
			</div>
		
</body>

</html>