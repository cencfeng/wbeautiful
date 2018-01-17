<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="menu.jsp"></jsp:include>
<script type="text/javascript"
	src="../resources/bootstrap/js/echarts.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="panel panel-primary panel-custom">
				<div class="panel-heading">
					<h3 class="panel-title" style="text-align: center">5分钟k线</h3>
				</div>
				<div class="panel-body">
				    <div id="kline" style="width: 100%; height: 800px"></div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
/*function splitData(rawData) {
    var categoryData = [];
    var values = []
    for (var i = 0; i < rawData.length; i++) {
        categoryData.push(rawData[i].splice(0, 1)[0]);
        values.push(rawData[i])
    }
    return {
        categoryData: categoryData,
        values: values
    };
}*/
var upColor = '#ec0000';
var upBorderColor = '#8A0000';
var downColor = '#00da3c';
var downBorderColor = '#008F28';
function splitData(data) {
       result = data.result;
		var categoryData= [];
		var values= [];
		$.each(result,function(n) {
			var resultsplit = result[n].split(',');
			 categoryData.push(resultsplit.splice(0, 1)[0]);			
			 values.push(resultsplit.splice(0,4));
       });
       return {
           categoryData: categoryData,
           values: values             
       };
   }

/*function calculateMA(dayCount) {
	   var result = [];
	   for (var i = 0, len = data0.values.length; i < len; i++) {
	       if (i < dayCount) {
	           result.push('-');
	           //alert(result);
	           continue;   //结束单次循环，即不输出本次结果
	       }
	       var sum = 0;
	       for (var j = 0; j < dayCount; j++) {
	           //收盘价总和
	           sum += data0.values[i - j][1];
	           //alert(sum);
	       }
	       result.push(sum / dayCount);
	      // alert(result);
	   }*/
    $(function(){
    	$.get('http://stock.liangyee.com/bus-api/stock/freeStockMarketData/get5MinK?userKey=C0257A2915AB4F64A0487F9009637D29&symbol=600100&type=0',function(data){
    		var data0 = splitData(data);  		
    		/*result = data.result;
    		var categoryData= [];
    		var values= [];
    		//for (var i = 0; i < result.length; i++){
    		$.each(result,function(n){
    			alert(result[n]);
    		    var resultsplit = result[n].split(',');
    			//categoryData.push(resultsplit[0]);
                 categoryData.push(resultsplit.splice(0, 1)[0]);
                alert(categoryData);

                //数据数组，即数组中除日期外的数据
               // alert(rawData[i]);
                values.push(resultsplit.splice(0,4));
                
    			return false;
    		});
    		
    			   return result;
    			}*/
    	
    			var option = {
    				    title: {
    				        text: 'k线',
    				        left: 0
    				    },
    				    tooltip: {
    				        trigger: 'axis',
    				        axisPointer: {
    				            type: 'cross'
    				        }
    				    },
    				    legend: {
    				        data: ['日K']
    				    },
    				    grid: {
    				        left: '10%',
    				        right: '10%',
    				        bottom: '15%'
    				    },
    				    xAxis: {
    				        type: 'category',
    				        data: data0.categoryData,
    				        scale: true,
    				        boundaryGap : false,
    				        axisLine: {onZero: false},
    				        splitLine: {show: false},
    				        splitNumber: 20,
    				        min: 'dataMin',
    				        max: 'dataMax'
    				    },
    				    yAxis: {
    				        scale: true,
    				        splitArea: {
    				            show: true
    				        }
    				    },
    				    dataZoom: [
    				        {
    				            type: 'inside',
    				            start: 50,
    				            end: 100
    				        },
    				        {
    				            show: true,
    				            type: 'slider',
    				            y: '90%',
    				            start: 50,
    				            end: 100
    				        }
    				    ],
    				    series: [
    				        {
    				            name: '日K',
    				            type: 'candlestick',
    				            data: data0.values,
    				            itemStyle: {
    				                normal: {
    				                    color: upColor,
    				                    color0: downColor,
    				                    borderColor: upBorderColor,
    				                    borderColor0: downBorderColor
    				                }
    				            },
    				            markPoint: {
    				                label: {
    				                    normal: {
    				                        formatter: function (param) {
    				                            return param != null ? Math.round(param.value) : '';
    				                        }
    				                    }
    				                },
    				                
    				                tooltip: {
    				                    formatter: function (param) {
    				                        return param.name + '<br>' + (param.data.coord || '');
    				                    }
    				                }
    				            }
    				            
    				        }
    				       
    				    ]
    				};
    			
    			
    		 var myChart = echarts.init(document.getElementById('kline'));
    	    	
    	    	myChart.setOption(option);
    	});

    	
    })  
    
</script>
</body>
</html>