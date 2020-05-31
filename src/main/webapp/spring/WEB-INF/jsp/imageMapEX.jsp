<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${day}</title>
</head>
<body>
<!-- 이미지 지도를 표시할 div 입니다 -->
<span id="length" style="display: none;">${length}</span>
<c:forEach items="${markerList}" var="dto">
<span id="schedule_title_${dto.schedule_num}" style="display: none;">${dto.schedule_title}</span>
<span id="schedule_latitude_${dto.schedule_num}" style="display: none;">${dto.schedule_latitude}</span>
<span id="schedule_longitude_${dto.schedule_num}" style="display: none;">${dto.schedule_longitude}</span>
</c:forEach>
<div id="staticMap" style="width:100%;height:350px;"></div>    
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=654c061eb76d4fe6767f6942383acfd7&libraries=services"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
var staticMapContainer=document.getElementById('staticMap'),
    staticMapOption={ 
        center: new daum.maps.LatLng($('#schedule_latitude_1').text(), $('#schedule_longitude_1').text()), // 이미지 지도의 중심좌표
        level: 3,  // 이미지 지도의 확대 레벨
    };
    
var map = new daum.maps.Map(staticMapContainer, staticMapOption); 
var polyline;
var position=[];
var point;
var length = $('#length').text();
var arrText=[];
var text;
var bounds = new daum.maps.LatLngBounds(); 

for(var i=1; i<=length; i++){
	point=new daum.maps.LatLng($('#schedule_latitude_'+i).text(),$('#schedule_longitude_'+i).text());
	position.push(point);

	text= $('#schedule_title_'+i).text();
	arrText.push(text);
}//end for
var marker;
var iwContent;
var iwRemoveable = true;

for(var i=0; i<position.length; i++){
	marker=new daum.maps.Marker({map:map,position: position[i]});
	
	iwContent='<div style="padding:5px;">'+arrText[i]+'</div>';
	
	//인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({
		position : position, 
		content : iwContent,
		removable : iwRemoveable
	});
	infowindow.open(map, marker);
	
	 bounds.extend(position[i]);
	 map.setBounds(bounds);
}//end for

polyline= new daum.maps.Polyline({
	map: map, // 선을 표시할 지도 객체 
	path: position,
	endArrow: true,
	strokeWeight: 3, // 선의 두께
	strokeColor: '#00F', // 선 색
	strokeOpacity: 0.7, // 선 투명도
	strokeStyle: 'solid' // 선 스타일
	});
</script>

</body>
</html>
