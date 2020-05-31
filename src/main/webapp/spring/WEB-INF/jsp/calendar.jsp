<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
var dep;
var arr;
var month;
var depArray=[];
var arrArray=[];
var depObj; 
var arrObj;
var betweenDay;
var scheduleName;

$(document).ready(function(){
	$('#check').bind('click',function(){
		$('#tripdate').val(betweenDay);
		$('#schedulename').val($('#schname').val());
		
		$.ajax({
		type:'post',
		url:'tour_map.go',
		data:$('#tourgo').serialize(),
		success:function(result){
			alert("success");
			/*document.getElementById("container_notice").innerHTML = "<iframe id='tour_schedule_map' src='tour_callMap.go'></iframe>";
			*/
		}
		});
	});
	
	$('#dep').datepicker({
		showOn: "both"
		
    });
	$('#arr').datepicker({
		showOn: "both"
    });
	
	$('#dep').bind('change',function(){
		dep = new Date($('#dep').val());
		dep = dep.getFullYear() + "-" + ("00"+(dep.getMonth() + 1)).slice(-2) + "-" +("00"+ dep.getDate()).slice(-2);
		depArray = dep.split("-"); 
		
		depObj= new Date(depArray[0], depArray[1], depArray[2]); 
		date();
	});
	
	$('#arr').bind('change',function(){
		arr = new Date($('#arr').val());
		arr = arr.getFullYear() + "-" + ("00"+(arr.getMonth() + 1)).slice(-2) + "-" + ("00"+arr.getDate()).slice(-2);
		
		arrArray = arr.split("-"); 

		arrObj= new Date(arrArray[0], arrArray[1], arrArray[2]);
		date();
	});
	
});

function date(){
	if(arrObj == null || depObj==null){
		$('.tripdate').text(" ");
	}else{
		var be = arrObj - depObj;
		betweenDay = be / (24 * 3600 * 1000);
		$('.tripdate').text(betweenDay-1+"박 "+betweenDay+"일");
	}
} //end date()	
</script>
<h1>test</h1>
<form action="tour_map.go" method="post" id="tourgo">
<p style="text-align: center;">출발 <input type="text" id="dep"/></p>
<p style="text-align: center;">도착 <input type="text" id="arr"/></p>
<p style="text-align: center;">여행 제목<input type="text" id="schname"/></p>
<p class="tripdate" style="text-align: center;"></p>
<p style="text-align: center;"><button type="button" id="check">확인</button>&nbsp;<button type="reset">취소</button></p>
<input type="hidden" id="tripdate" name="tripdate" value="">
<input type="hidden"id="schedulename" name="schedulename" value=""/>
</form>
