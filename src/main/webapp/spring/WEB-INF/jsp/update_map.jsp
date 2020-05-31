<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>Tour Story</title>
<!--SEO Meta Tags-->
<meta name="keywords" content="Tour, Story" />

<!--Mobile Specific Meta Tag-->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<!--Favicon-->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">
<!--Master Slider Styles-->
<link href="resources/masterslider/style/masterslider.css"
	rel="stylesheet" media="screen">
<!--Styles-->
<link href="resources/css/styles.css" rel="stylesheet" media="screen">

<!--Modernizr-->
<script src="resources/js/libs/modernizr.custom.js"></script>
<!--Adding Media Queries Support for IE8-->
<!--[if lt IE 9]>
      <script src="js/plugins/respond.js"></script>
    <![endif]-->

<script src="resources/js/jquery-2.2.3.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" />
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	top: 0;
	position: absolute;
	width: 250px;
	height: 470px;
	margin: 10px 0 0 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}
/* 검색결과 */
#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}
/* 검색결과창에 나오는 마커 지도 X*/
#placesList .item span.markerbg {
	float: left;
	position: absolute;
	width: 45px;
	height: 45px;
	background-position: center;
	background-size: 36px 40px;
	background-repeat: no-repeat;
}

#placesList .item .marker_1 {
	background-image: url("resources/images/pointer2_n_1.png");
}

#placesList .item .marker_2 {
	background-image: url("resources/images/pointer2_n_2.png");
}

#placesList .item .marker_3 {
	background-image: url("resources/images/pointer2_n_3.png");
}

#placesList .item .marker_4 {
	background-image: url("resources/images/pointer2_n_4.png");
}

#placesList .item .marker_5 {
	background-image: url("resources/images/pointer2_n_5.png");
}

#placesList .item .marker_6 {
	background-image: url("resources/images/pointer2_n_6.png");
}

#placesList .item .marker_7 {
	background-image: url("resources/images/pointer2_n_7.png");
}

#placesList .item .marker_8 {
	background-image: url("resources/images/pointer2_n_8.png");
}

#placesList .item .marker_9 {
	background-image: url("resources/images/pointer2_n_9.png");
}

#placesList .item .marker_10 {
	background-image: url("resources/images/pointer2_n_10.png");
}

#placesList .item .marker_11 {
	background-image: url("resources/images/pointer2_n_11.png");
}

#placesList .item .marker_12 {
	background-image: url("resources/images/pointer2_n_12.png");
}

#placesList .item .marker_13 {
	background-image: url("resources/images/pointer2_n_13.png");
}

#placesList .item .marker_14 {
	background-image: url("resources/images/pointer2_n_14.png");
}

#placesList .item .marker_15 {
	background-image: url("resources/images/pointer2_n_15.png");
}
/* 추가 버튼 */
#placesList .item span.add {
	display: inline-block;
	width: 30px;
	height: 30px;
	border: 1px solid orange;
	position: relative;
	left: 120px;
	background-color: #FFF5E6
}

#placesList .item span.add:HOVER {
	background-color: #B2A58F
}
/* 페이지번호 */
#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
/* 일정 리스트 */
div.menubar {
	width: 100%;
	height: 40px;
	background-color: #363;
	position: relative;
	display: inline-block;
}

div.menubar button {
	font-size: .9em;
	font-weight: bold;
	color: #fff;
	border: 0;
	margin: 0 0 0 5px;
	height: 40px;
	width: 120px;
	background-color: #938;
}

div.menubar button:HOVER {
	background-color: #d84;
	color: #fff;
}

div.menubar #days {
	width: 70px;
	height: 36px;
	margin: 2px;
	border: 0;
	vertical-align: top;
}

.menubar #my_allschedule, .menubar #selectdel, .menubar #save_schedule {
	float: right;
}

div.my_schedule {
	clear: both;
	width: 100%;
	height: 200px;
	border: 2px solid black;
	position: relative;
	overflow: auto;
}

#my_schInfo #tlist {
	padding-left: 20px
}

#my_schInfo #tlist span, #my_schInfo #tlist {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	display: inline-block;
}

#my_schInfo #tlist {
	width: 300px;
}

#dayInfo {
	text-align: center;
	width: 269px;
	color: #fff;
	font-weight: bold;
	display: inline-block;
	line-height: 40px;
	padding-left: 10px;
}

.map_list_01, .map_list_02 {
	height: 50px;
}

.map_list_01 {
	background-color: #f7f7f7;
}

.map_list_01 a, .map_list_02 a {
	float: right;
	border: 0;
	width: 40px;
	height: 40px;
	cursor: pointer;
	margin: 5px;
}

.map_list_01 .box, .map_list_02 .box {
	vertical-align: top;
	width: 20px;
	height: 20px;
	cursor: pointer;
	margin: 15px;
}

.map_list_01 span, .map_list_02 span {
	font-size: 1em;
	font-weight: bold;
	line-height: 50px;
}

.map_list_01 .find_way, .map_list_02 .find_way {
	background-image: url("resources/imgs/way-find_gb_01.png");
	background-size: contain;
}

.map_list_01 .delete_sch, .map_list_02 .delete_sch {
	background-image: url("resources/imgs/round-delete_r.png");
	background-size: contain;
}

.map_list_01 .find_way:HOVER, .map_list_02 .find_way:HOVER {
	background-image: url("resources/imgs/way-find_gb_03.png");
	background-size: contain;
}

.map_list_01 .delete_sch:HOVER, .map_list_02 .delete_sch:HOVER {
	background-image: url("resources/imgs/round-delete_r_02.png");
	background-size: contain;
}
</style>
</head>
<body onload="onLoad()">
	<%@include file="navi.jsp"%>
	<div class="page-content">

		<div class="menubar" style="margin-top: 2px;">
			<select id="days" onChange="selectEvent(this)"></select> <span
				id="dayInfo"></span>
			<button id="selectdel">선택삭제</button>
			<button id="my_allschedule">전체일정</button>
			<button id="save_schedule">저장</button>
		</div>
		<form action="updateSchedule.go" method="post" id="uptfrm">
			<input type="hidden" id="upt_name" name="schedule_name" value="" />
			<input type="hidden" name="board_num" value="${boardDTO.board_num}" />
			<input type="hidden" name="board_content" value="${boardDTO.board_content}"/>
			<input type="hidden" name="tripdate" value="${tripdate}" /> 
			<input type="hidden" name="board_subject"
				value="${boardDTO.board_subject}" /> <input type="hidden"
				name="board_category" value="${boardDTO.board_category}" /> <input
				type="hidden" name="currentPage" value="${curr}" />
		</form>
		<div class="my_schedule">
			<div id="my_schInfo"></div>
			<span style="display: none;" id="tripdate">${tripdate}</span> <span
				style="display: none;" id="schedulename">${schedulename}</span>
		</div>


		<div class="map_wrap" style="display: block; width: 100%">
			<div id="map"
				style="clear: both; width: 100%; height: 500px; position: relative; overflow: hidden;"></div>
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<p>
					<form onsubmit="searchPlaces(); return false;">
						키워드:<input type="text" value="${uptdayList[0].schedule_title}" id="keyword" size="15">
						<button type="submit" id="subBtn">검색하기</button>
					</form>

				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
		</div>


		<script type="text/javascript"
			src="//apis.daum.net/maps/maps3.js?apikey=2daa949ca5620e28f36d616ead4ad272&libraries=services"></script>
		<script type="text/javascript">
			// 마커를 담을 배열입니다
			var markers = [];
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption);
			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places();
			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
				zIndex : 1
			});
			var imageSrc;
			var imageSize;
			var polyline;
			//일정표시마커 변수
			var mkers = [];
			var mker;
			var arrpoly = [];

			var tripdate;
			var schedulename;
			var days = "Day 1";
			var schList = [];

			//DB 저장된것들 새로 마커표시하기 
			var iSrc = "resources/images/circle_blue_w.png";
			var iSize = new daum.maps.Size(25, 25);
			var mImage = new daum.maps.MarkerImage(iSrc, iSize);
			var roadnum = [];

			// 키워드로 장소를 검색합니다
			searchPlaces();
			
			$('#my_allschedule').bind('click', function() {
				var sendData = 'fullschedule.go?schedule_name=' + schedulename;
				window.open(sendData, '_blank');
			});

			$('#selectdel')
					.click(
							function() {
								var chLen = $('.box:checked').length;
								if (chLen > 1) {
									var value = [];
									for (var i = 0; i < chLen; i++) {
										value = [];
										for (var j = 1; j < $('#sclistlen')
												.val() + 1; j++) {
											if ($('#chkbox_' + j).prop(
													'checked')) {
												value.push($('#chkbox_' + j)
														.val());
											}
										}//end j
										var cnt = 0;
										for (var i = 0; i < chLen; i++) {
											$
													.ajax({
														type : 'post',
														url : 'deletList.go',
														data : 'schedule_name='
																+ schedulename
																+ '&schedule_day='
																+ days
																+ '&schedule_num='
																+ value[i],
														dataType : 'json',
														success : function(
																result) {
															cnt++;
															$('.list').empty();
															var chi = i - 1;
															if (chi == cnt) {
																alert('다중 선택'
																		+ cnt
																		+ '개 삭제 완료');
																$('#days')
																		.trigger(
																				'change',
																				days);
															}
														}//end success
													});
										}
									}
								} else {
									var cnt = 0;
									$.ajax({
										type : 'post',
										url : 'deletList.go',
										data : 'schedule_name=' + schedulename
												+ '&schedule_day=' + days
												+ '&schedule_num='
												+ $('.box:checked').val(),
										dataType : 'json',
										success : function(result) {
											cnt++;
											alert(cnt + '개 삭제 완료');
											$('.list').empty();
											$('#days').trigger('change', days);
										}
									});
								}

							});//end click
			$('#save_schedule').click(function() {
				$('#upt_name').val(schedulename);
				$('#uptfrm').submit();
				/* 	location.href =  */
			});// 저장 버튼

			function onLoad() {
				schedulename = '${uptName}';
				var daysize = 0;
				var i = 0;
				roadnum = [];
				<c:forEach items="${days}" var="ds">
				daysize++;
				</c:forEach>
				<c:forEach items="${uptdayList}" var="day">
				var tindex = i + 1;
				var tlist;
				i++;
				roadnum.push("${day.schedule_num}");
				if ("${days}" != tindex) {
					if (("${day.schedule_num}" % 2) == 1) {
						tlist = '<div class="map_list_01" id="tlist_${day.schedule_num}"><input type="checkbox" id="chkbox_${day.schedule_num}" name="chkbox" class="box" value="${day.schedule_num}" /><span>${day.schedule_num}번 ${day.schedule_title}</span><a class="delete_sch" id="updated_${day.schedule_num}"></a><a class="find_way" id="roadmap_${day.schedule_num}" ></a><br/>'
								+ '<input id="scnum_${day.schedule_num}" type="hidden" name="schedule_num" value="${day.schedule_num}"/><input id="sctitle_${day.schedule_num}" type="hidden" name="schedule_title" value="${day.schedule_title}"/><input id="scname_${day.schedule_num}" type="hidden" name="schedule_name" value="${day.schedule_name}"/></div>'
								+ '<input id="scday_${day.schedule_num}" type="hidden" name="schedule_day" value="${day.schedule_num}"/>'
								+ '<input id="sclistlen" type="hidden" value="${uptdayList.size()}"/>'
								+ '<input id="sclat_${day.schedule_num}" type="hidden" name="schedule_latitude" value="${day.schedule_latitude}"/>'
								+ '<input id="sclnt_${day.schedule_num}" type="hidden" name="schedule_longitude" value="${day.schedule_longitude}"/>';
					} else {
						tlist = '<div class="map_list_02" id="tlist_${day.schedule_num}"><input type="checkbox" id="chkbox_${day.schedule_num}" name="chkbox" class="box" value="${day.schedule_num}" /><span>${day.schedule_num}번 ${day.schedule_title}</span><a class="delete_sch" id="updated_${day.schedule_num}"></a><a class="find_way" id="roadmap_${day.schedule_num}"></a><br/>'
								+ '<input id="scnum_${day.schedule_num}" type="hidden" name="schedule_num" value="${day.schedule_num}"/><input id="sctitle_${day.schedule_num}" type="hidden" name="schedule_title" value="${day.schedule_title}"/><input id="scname_${day.schedule_num}" type="hidden" name="schedule_name" value="${day.schedule_name}"/></div>'
								+ '<input id="scday_${day.schedule_num}" type="hidden" name="schedule_day" value="${day.schedule_num}"/>'
								+ '<input id="sclistlen" type="hidden" value="${uptdayList.size()}"/>'
								+ '<input id="sclat_${day.schedule_num}" type="hidden" name="schedule_latitude" value="${day.schedule_latitude}"/>'
								+ '<input id="sclnt_${day.schedule_num}" type="hidden" name="schedule_longitude" value="${day.schedule_longitude}"/>';
					}
				} else {
					if (("${day.schedule_num}" % 2) == 1) {
						tlist = '<div class="map_list_01" id="tlist_${day.schedule_num}"><input type="checkbox" id="chkbox_${day.schedule_num}" name="chkbox" class="box" value="${day.schedule_num}" /><span>${day.schedule_num}번 ${day.schedule_title}</span><a class="delete_sch" id="updated_${day.schedule_num}"></a><a class="find_way" id="roadmap_${day.schedule_num}" ></a><br/>'
								+ '<input id="scnum_${day.schedule_num}" type="hidden" name="schedule_num" value="${day.schedule_num}"/><input id="sctitle_${day.schedule_num}" type="hidden" name="schedule_title" value="${day.schedule_title}"/><input id="scname_${day.schedule_num}" type="hidden" name="schedule_name" value="${day.schedule_name}"/></div>'
								+ '<input id="scday_${day.schedule_num}" type="hidden" name="schedule_day" value="${day.schedule_num}"/>'
								+ '<input id="sclistlen" type="hidden" value="${uptdayList.size()}"/>'
								+ '<input id="sclat_${day.schedule_num}" type="hidden" name="schedule_latitude" value="${day.schedule_latitude}"/>'
								+ '<input id="sclnt_${day.schedule_num}" type="hidden" name="schedule_longitude" value="${day.schedule_longitude}"/>';
					} else {
						tlist = '<div class="map_list_02" id="tlist_${day.schedule_num}"><input type="checkbox" id="chkbox_${day.schedule_num}" name="chkbox" class="box" value="${day.schedule_num}" /><span>${day.schedule_num}번 ${day.schedule_title}</span><a class="delete_sch" id="updated_${day.schedule_num}"></a><a class="find_way" id="roadmap_${day.schedule_num}"></a><br/>'
								+ '<input id="scnum_${day.schedule_num}" type="hidden" name="schedule_num" value="${day.schedule_num}"/><input id="sctitle_${day.schedule_num}" type="hidden" name="schedule_title" value="${day.schedule_title}"/><input id="scname_${day.schedule_num}" type="hidden" name="schedule_name" value="${day.schedule_name}"/></div>'
								+ '<input id="scday_${day.schedule_num}" type="hidden" name="schedule_day" value="${day.schedule_num}"/>'
								+ '<input id="sclistlen" type="hidden" value="${uptdayList.size()}"/>'
								+ '<input id="sclat_${day.schedule_num}" type="hidden" name="schedule_latitude" value="${day.schedule_latitude}"/>'
								+ '<input id="sclnt_${day.schedule_num}" type="hidden" name="schedule_longitude" value="${day.schedule_longitude}"/>';
					}
				}
				schList.push(tlist);
				</c:forEach>
				$('#my_schInfo').append('<div class="list"></div>');
				for (var i = 0; i < schList.length; i++) {
					$('.list').append(schList[i]);
				}
				schList = [];

				tripdate = daysize + 1;

				$('#days').empty();
				for (var i = 1; i < tripdate; i++) {
					if (i == 1) {
						$('#days').append(
								'<option value="'+ i +'">' + 'Day ' + i
										+ '</option>');
						$('#dayInfo').text($('#days option:selected').text());
					} else
						$('#days').append(
								'<option value="'+ i +'">' + 'Day ' + i
										+ '</option>');
				}//end for
				$('#days').trigger('change',days);
			}//end onLoad

			// 검색처리 함수들
			// 키워드 검색을 요청하는 함수
			function searchPlaces() {
				var keyword = document.getElementById('keyword').value;
				if (!keyword.replace(/^\s+|\s+$/g, '')) {
					alert('키워드를 입력해주세요!');
					return false;
				}

				// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
				ps.keywordSearch(keyword, placesSearchCB);
			}//검색 요청

			//selectEvent
			function selectEvent() { // select box 이벤트 처리
				var word = $('#keyword').val();
				$('#keyword').val(word);

				$('#dayInfo').text($('#days option:selected').text());
				days = $('#days option:selected').text();

				$('#subBtn').trigger('click');

				$('.list').empty();

				$
						.ajax({
							type : 'post',
							url : 'dayList.go',
							data : 'schedule_day=' + days + '&schedule_name='
									+ schedulename,
							dataType : 'json',
							success : function(result) {
								if (mkers.length > 0) {
									for (var i = 0; i < mkers.length; i++) {
										mkers[i].setMap(null);
									}//end for
									mkers = [];
								}//end if

								if (arrpoly.length > 0) {
									for (var i = 0; i < arrpoly.length; i++) {
										arrpoly[i].setMap(null);
									}//end for
									arrpoly = [];
								}//end if

								roadnum = [];

								$.each(
												result.dayList,
												function(index, value) {
													roadnum
															.push(value.schedule_num);
													var tindex = parseInt(index) + 1;
													var tlist;

													if (result.dayList.length != tindex) {
														if ((value.schedule_num % 2) == 1) {
															tlist = '<div class="map_list_01" id="tlist_'+value.schedule_num+'"><input type="checkbox" id="chkbox_'+value.schedule_num+'" name="chkbox" class="box" value="'+value.schedule_num+'" /><span>'
																	+ value.schedule_num
																	+ '번 '
																	+ value.schedule_title
																	+ '</span><a class="delete_sch" id="updated_'+value.schedule_num+'"></a><a class="find_way" id="roadmap_'+value.schedule_num+'" ></a><br/>'
																	+ '<input id="scnum_'+value.schedule_num+'" type="hidden" name="schedule_num" value="'+value.schedule_num+'"/><input id="sctitle_'+value.schedule_num+'" type="hidden" name="schedule_title" value="'+value.schedule_title+'"/><input id="scname_'+value.schedule_num+'" type="hidden" name="schedule_name" value="'+value.schedule_name+'"/></div>'
																	+ '<input id="scday_'+value.schedule_num+'" type="hidden" name="schedule_day" value="'+value.schedule_day+'"/>'
																	+ '<input id="sclistlen" type="hidden" value="'+result.dayList.length+'"/>'
																	+ '<input id="sclat_'+value.schedule_num+'" type="hidden" name="schedule_latitude" value="'+value.schedule_latitude+'"/>'
																	+ '<input id="sclnt_'+value.schedule_num+'" type="hidden" name="schedule_longitude" value="'+value.schedule_longitude+'"/>';
														} else {
															tlist = '<div class="map_list_02" id="tlist_'+value.schedule_num+'"><input type="checkbox" id="chkbox_'+value.schedule_num+'" name="chkbox" class="box" value="'+value.schedule_num+'" /><span>'
																	+ value.schedule_num
																	+ '번 '
																	+ value.schedule_title
																	+ '</span><a class="delete_sch" id="updated_'+value.schedule_num+'"></a><a class="find_way" id="roadmap_'+value.schedule_num+'"></a><br/>'
																	+ '<input id="scnum_'+value.schedule_num+'" type="hidden" name="schedule_num" value="'+value.schedule_num+'"/><input id="sctitle_'+value.schedule_num+'" type="hidden" name="schedule_title" value="'+value.schedule_title+'"/><input id="scname_'+value.schedule_num+'" type="hidden" name="schedule_name" value="'+value.schedule_name+'"/></div>'
																	+ '<input id="scday_'+value.schedule_num+'" type="hidden" name="schedule_day" value="'+value.schedule_day+'"/>'
																	+ '<input id="sclistlen" type="hidden" value="'+result.dayList.length+'"/>'
																	+ '<input id="sclat_'+value.schedule_num+'" type="hidden" name="schedule_latitude" value="'+value.schedule_latitude+'"/>'
																	+ '<input id="sclnt_'+value.schedule_num+'" type="hidden" name="schedule_longitude" value="'+value.schedule_longitude+'"/>';
														}
													} else {
														if ((value.schedule_num % 2) == 1) {
															tlist = '<div class="map_list_01" id="tlist_'+value.schedule_num+'"><input type="checkbox" id="chkbox_'+value.schedule_num+'" name="chkbox" class="box" value="'+value.schedule_num+'" /><span>'
																	+ value.schedule_num
																	+ '번 '
																	+ value.schedule_title
																	+ '</span><a class="delete_sch" id="updated_'+value.schedule_num+'"></a>'
																	+ '<input id="scnum_'+value.schedule_num+'" type="hidden" name="schedule_num" value="'+value.schedule_num+'"/><input id="sctitle_'+value.schedule_num+'" type="hidden" name="schedule_title" value="'+value.schedule_title+'"/><input id="scname_'+value.schedule_num+'" type="hidden" name="schedule_name" value="'+value.schedule_name+'"/></div>'
																	+ '<input id="scday_'+value.schedule_num+'" type="hidden" name="schedule_day" value="'+value.schedule_day+'"/>'
																	+ '<input id="sclistlen" type="hidden" value="'+result.dayList.length+'"/>'
																	+ '<input id="sclat_'+value.schedule_num+'" type="hidden" name="schedule_latitude" value="'+value.schedule_latitude+'"/>'
																	+ '<input id="sclnt_'+value.schedule_num+'" type="hidden" name="schedule_longitude" value="'+value.schedule_longitude+'"/>';
														} else {
															tlist = '<div class="map_list_02" id="tlist_'+value.schedule_num+'"><input type="checkbox" id="chkbox_'+value.schedule_num+'" name="chkbox" class="box" value="'+value.schedule_num+'" /><span>'
																	+ value.schedule_num
																	+ '번 '
																	+ value.schedule_title
																	+ '</span><a class="delete_sch" id="updated_'+value.schedule_num+'"></a>'
																	+ '<input id="scnum_'+value.schedule_num+'" type="hidden" name="schedule_num" value="'+value.schedule_num+'"/><input id="sctitle_'+value.schedule_num+'" type="hidden" name="schedule_title" value="'+value.schedule_title+'"/><input id="scname_'+value.schedule_num+'" type="hidden" name="schedule_name" value="'+value.schedule_name+'"/></div>'
																	+ '<input id="scday_'+value.schedule_num+'" type="hidden" name="schedule_day" value="'+value.schedule_day+'"/>'
																	+ '<input id="sclistlen" type="hidden" value="'+result.dayList.length+'"/>'
																	+ '<input id="sclat_'+value.schedule_num+'" type="hidden" name="schedule_latitude" value="'+value.schedule_latitude+'"/>'
																	+ '<input id="sclnt_'+value.schedule_num+'" type="hidden" name="schedule_longitude" value="'+value.schedule_longitude+'"/>';
														}
													}
													schList.push(tlist);
												});

								for (var i = 0; i < schList.length; i++) {
									$('.list').append(schList[i]);
								}
								schList = [];

								var markerpath = [];

								$
										.each(
												result.markerList,
												function(index, value) {
													markerpath
															.push(new daum.maps.LatLng(
																	value.schedule_latitude,
																	value.schedule_longitude));
												});

								polyline = new daum.maps.Polyline({
									map : map, // 선을 표시할 지도 객체 
									path : markerpath,
									endArrow : true,
									strokeWeight : 3, // 선의 두께
									strokeColor : '#00F', // 선 색
									strokeOpacity : 0.7, // 선 투명도
									strokeStyle : 'solid' // 선 스타일
								});

								arrpoly.push(polyline);
								for (var i = 0; i < markerpath.length; i++) {

									mker = new daum.maps.Marker({
										map : map,
										position : markerpath[i], // 마커를 표시할 위치
										image : mImage
									// 마커 이미지 
									});
									mkers.push(mker);
								}

								$
										.each(
												roadnum,
												function(index, value) {
													$('#roadmap_' + value)
															.bind(
																	'click',
																	function() {
																		var stitle = $(
																				'#sctitle_'
																						+ value)
																				.val();
																		var snum = $(
																				'#scnum_'
																						+ value)
																				.val();
																		snum = parseInt(snum);

																		var endnum = snum + 1;
																		var etitle = $(
																				'#sctitle_'
																						+ endnum)
																				.val();
																		var url = "http://map.daum.net/?sName="
																				+ stitle
																				+ "&eName="
																				+ etitle;
																		window
																				.open(
																						url,
																						'_blank');
																	});//길찾기 이벤트 처리

													// 삭제버튼 처리
													$('#updated_' + value)
															.bind(
																	'click',
																	function() {
																		var stitle = $(
																				'#sctitle_'
																						+ value)
																				.val();
																		var snum = $(
																				'#scnum_'
																						+ value)
																				.val();
																		snum = parseInt(snum);

																		var scname = $(
																				'#scname_'
																						+ value)
																				.val();
																		var scday = $(
																				'#scday_'
																						+ value)
																				.val();
																		var sclat = $(
																				'#sclat_'
																						+ value)
																				.val();
																		var sclnt = $(
																				'#sclnt_'
																						+ value)
																				.val();

																		$(
																				'.list')
																				.empty();

																		$
																				.ajax({
																					type : 'GET',
																					dataType : 'json',
																					url : 'updatesch.go?schedule_num='
																							+ snum
																							+ '&schedule_name='
																							+ scname
																							+ '&schedule_day='
																							+ scday
																							+ '&schedule_latitude='
																							+ sclat
																							+ '&schedule_longitude='
																							+ sclnt,
																					success : function(
																							res) {
																						$(
																								'#days')
																								.trigger(
																										'change',
																										days);
																					}//end success
																				});//end ajax updatesch.go?
																	});//end bind click
												});//end each result.dayList
							}//end success
						}); //end ajax
			}//end selectEvent

			// 장소검색이 완료됐을 때 호출되는 콜백함수
			function placesSearchCB(status, data, pagination) { //상태값, result=array, 페이징처리
				if (status === daum.maps.services.Status.OK) {
					// 정상적으로 검색이 완료됐으면
					// 검색 목록과 마커를 표출합니다
					displayPlaces(data.places);

					// 페이지 번호를 표출합니다
					displayPagination(pagination);

				} else if (status === daum.maps.services.Status.ZERO_RESULT) {
					alert('검색 결과가 존재하지 않습니다.');
					return;

				} else if (status === daum.maps.services.Status.ERROR) {
					alert('검색 결과 중 오류가 발생했습니다.');
					return;

				}
			}// 콜백함수

			// 검색 결과 목록과 마커를 표출하는 함수입니다
			function displayPlaces(places) {
				var listEl = document.getElementById('placesList'), menuEl = document
						.getElementById('menu_wrap'), fragment = document
						.createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';

				// 검색 결과 목록에 추가된 항목들을 제거합니다
				removeAllChildNods(listEl);

				// 지도에 표시되고 있는 마커를 제거합니다
				removeMarker();

				for (var i = 0; i < places.length; i++) {
					// 마커를 생성하고 지도에 표시합니다
					var placePosition = new daum.maps.LatLng(
							places[i].latitude, places[i].longitude), marker = addMarker(
							placePosition, i), itemEl = getListItem(i,
							places[i], days); // 검색 결과 항목 Element를 생성합니다
					// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해

					// LatLngBounds 객체에 좌표를 추가합니다
					bounds.extend(placePosition);

					// 마커와 검색결과 항목에 mouseover 했을때
					// 해당 장소에 인포윈도우에 장소명을 표시합니다
					// mouseout 했을 때는 인포윈도우를 닫습니다
					(function(marker, title) {
						daum.maps.event.addListener(marker, 'mouseover',
								function() {
									displayInfowindow(marker, title);
								});

						daum.maps.event.addListener(marker, 'mouseout',
								function() {
									infowindow.close();
								});

						itemEl.onmouseover = function() {
							displayInfowindow(marker, title);
						};

						itemEl.onmouseout = function() {
							infowindow.close();
						};
					})(marker, places[i].title);

					fragment.appendChild(itemEl);
				}
				// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
				listEl.appendChild(fragment);
				menuEl.scrollTop = 0;

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}// 검색결과 처리

			// 검색결과 항목을 Element로 반환하는 함수입니다
			function getListItem(index, places, days) {
				var el = document.createElement('li');
				itemStr = '<form method="post" class="addgo" id="ag_'
						+ (index + 1) + '"><span class="markerbg marker_'
						+ (index + 1) + '"></span>' + '<div class="info">'
						+ '   <h5>' + places.title + '</h5>'
						+ '   <span class="add add_' + (index + 1)
						+ '" onclick="formsub(' + (index + 1) + ')"></span>';

				if (places.newAddress) {
					itemStr += '    <span>' + places.newAddress + '</span>'
							+ '   <span class="jibun gray">' + places.address
							+ '</span>';
				} else {
					itemStr += '    <span>' + places.address + '</span>';
				}
				itemStr += '  <span class="tel">' + places.phone + '</span>'
						+ '</div>';
				itemStr += '<input type="hidden" name="schedule_title" value="'
						+ (places.title)
						+ '"/><input type="hidden" name="schedule_address" value="'
						+ (places.address) + '"/>';
				itemStr += '<input type="hidden" name="schedule_tel" value="'
						+ (places.phone)
						+ '"/><input type="hidden" name="schedule_latitude" value="'
						+ (places.latitude) + '"/>';
				itemStr += '<input type="hidden" name="schedule_longitude" value="'
						+ (places.longitude) + '"/>';
				itemStr += '<input type="hidden" name="schedule_day" value="'+days+'"/><input type="hidden" name="schedule_name" value="'+schedulename+'"/></form>';

				el.innerHTML = itemStr;
				el.className = 'item';
				return el
			}// 검색 결과 항목 Element로 반환

			// 검색시의 마커 
			function addMarker(position, idx) {
				imageSrc = 'resources/images/pointer2_n_' + (idx + 1) + '.png';

				imageSize = new daum.maps.Size(35, 40);

				var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize), marker = new daum.maps.Marker(
						{
							position : position, // 마커의 위치
							image : markerImage
						});

				marker.setMap(map);
				markers.push(marker); // 배열에 생성된 마커를 추가합니다

				return marker;
			}//검색시 마커 생성및 지도에 추가

			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
				markers = [];
			}// 지도위 마커 초기화

			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
				var paginationEl = document.getElementById('pagination'), fragment = document
						.createDocumentFragment(), i;

				// 기존에 추가된 페이지번호를 삭제합니다
				while (paginationEl.hasChildNodes()) {
					paginationEl.removeChild(paginationEl.lastChild);
				}

				for (i = 1; i <= pagination.last; i++) {
					var el = document.createElement('a');
					el.href = "#";
					el.innerHTML = i;

					if (i === pagination.current) {
						el.className = 'on';
					} else {
						el.onclick = (function(i) {
							return function() {
								pagination.gotoPage(i);
							}
						})(i);
					}

					fragment.appendChild(el);
				}
				paginationEl.appendChild(fragment);
			}//검색 목록 페이징처리

			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
			// 인포윈도우에 장소명을 표시합니다
			function displayInfowindow(marker, title) {
				var content = '<div style="padding:5px;z-index:1;">' + title
						+ '</div>';

				infowindow.setContent(content);
				infowindow.open(map, marker);
			}

			// 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) {
				while (el.hasChildNodes()) {
					el.removeChild(el.lastChild);
				}
			}

			// 추가버튼 누른후 작업
			// 추가한 정보
			function formsub(index) {
				var formData = $("#ag_" + index).serialize();
				formData = decodeURIComponent((formData + '').replace(/\+/g,
						'%20'));
				$
						.ajax({
							type : 'POST',
							dataType : 'json',
							url : 'tourMapList.go',
							data : formData,
							contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
							success : CreatePoly
						});
			}//end formsub()

			//선그리기 마커그리기
			function CreatePoly(data) {
				$('.list').remove();

				// 마커 + 선 초기화
				if (mkers.length > 0) {
					for (var i = 0; i < mkers.length; i++) {
						mkers[i].setMap(null);
					}//end for
					mkers = [];
				}//end if

				if (arrpoly.length > 0) {
					for (var i = 0; i < arrpoly.length; i++) {
						arrpoly[i].setMap(null);
					}//end for
					arrpoly = [];
				}//end if

				var linepath = []; // 좌표배열 초기화
				var pointplace = new daum.maps.LatLng(
						data.dto.schedule_latitude, data.dto.schedule_longitude);
				roadnum = [];

				$
						.each(
								data.alist,
								function(index, value) {
									linepath.push(new daum.maps.LatLng(
											value.schedule_latitude,
											value.schedule_longitude));
									roadnum.push(value.schedule_num);

									var tlist;

									var tindex = parseInt(index) + 1;

									if (data.alist.length != tindex) {
										if ((value.schedule_num % 2) == 1) {
											tlist = '<div class="map_list_01" id="tlist_'+value.schedule_num+'"><input type="checkbox" id="chkbox_'+value.schedule_num+'" name="chkbox" class="box" value="'+value.schedule_num+'" /><span>'
													+ value.schedule_num
													+ '번 '
													+ value.schedule_title
													+ '</span><a class="delete_sch" id="updated_'+value.schedule_num+'"></a><a class="find_way" id="roadmap_'+value.schedule_num+'" ></a><br/>'
													+ '<input id="scnum_'+value.schedule_num+'" type="hidden" name="schedule_num" value="'+value.schedule_num+'"/><input id="sctitle_'+value.schedule_num+'" type="hidden" name="schedule_title" value="'+value.schedule_title+'"/><input id="scname_'+value.schedule_num+'" type="hidden" name="schedule_name" value="'+value.schedule_name+'"/></div>'
													+ '<input id="scday_'+value.schedule_num+'" type="hidden" name="schedule_day" value="'+value.schedule_day+'"/>'
													+ '<input id="sclistlen" type="hidden" value="'+data.alist.length+'"/>'
													+ '<input id="sclat_'+value.schedule_num+'" type="hidden" name="schedule_latitude" value="'+value.schedule_latitude+'"/>'
													+ '<input id="sclnt_'+value.schedule_num+'" type="hidden" name="schedule_longitude" value="'+value.schedule_longitude+'"/>';
										} else {
											tlist = '<div class="map_list_02" id="tlist_'+value.schedule_num+'"><input type="checkbox" id="chkbox_'+value.schedule_num+'" name="chkbox" class="box" value="'+value.schedule_num+'" /><span>'
													+ value.schedule_num
													+ '번 '
													+ value.schedule_title
													+ '</span><a class="delete_sch" id="updated_'+value.schedule_num+'"></a><a class="find_way" id="roadmap_'+value.schedule_num+'"></a><br/>'
													+ '<input id="scnum_'+value.schedule_num+'" type="hidden" name="schedule_num" value="'+value.schedule_num+'"/><input id="sctitle_'+value.schedule_num+'" type="hidden" name="schedule_title" value="'+value.schedule_title+'"/><input id="scname_'+value.schedule_num+'" type="hidden" name="schedule_name" value="'+value.schedule_name+'"/></div>'
													+ '<input id="scday_'+value.schedule_num+'" type="hidden" name="schedule_day" value="'+value.schedule_day+'"/>'
													+ '<input id="sclistlen" type="hidden" value="'+data.alist.length+'"/>'
													+ '<input id="sclat_'+value.schedule_num+'" type="hidden" name="schedule_latitude" value="'+value.schedule_latitude+'"/>'
													+ '<input id="sclnt_'+value.schedule_num+'" type="hidden" name="schedule_longitude" value="'+value.schedule_longitude+'"/>';
										}
									} else {
										if ((value.schedule_num % 2) == 1) {
											tlist = '<div class="map_list_01" id="tlist_'+value.schedule_num+'"><input type="checkbox" id="chkbox_'+value.schedule_num+'" name="chkbox" class="box" value="'+value.schedule_num+'" /><span>'
													+ value.schedule_num
													+ '번 '
													+ value.schedule_title
													+ '</span><a class="delete_sch" id="updated_'+value.schedule_num+'"></a>'
													+ '<input id="scnum_'+value.schedule_num+'" type="hidden" name="schedule_num" value="'+value.schedule_num+'"/><input id="sctitle_'+value.schedule_num+'" type="hidden" name="schedule_title" value="'+value.schedule_title+'"/><input id="scname_'+value.schedule_num+'" type="hidden" name="schedule_name" value="'+value.schedule_name+'"/></div>'
													+ '<input id="scday_'+value.schedule_num+'" type="hidden" name="schedule_day" value="'+value.schedule_day+'"/>'
													+ '<input id="sclistlen" type="hidden" value="'+data.alist.length+'"/>'
													+ '<input id="sclat_'+value.schedule_num+'" type="hidden" name="schedule_latitude" value="'+value.schedule_latitude+'"/>'
													+ '<input id="sclnt_'+value.schedule_num+'" type="hidden" name="schedule_longitude" value="'+value.schedule_longitude+'"/>';
										} else {
											tlist = '<div class="map_list_02" id="tlist_'+value.schedule_num+'"><input type="checkbox" id="chkbox_'+value.schedule_num+'" name="chkbox" class="box" value="'+value.schedule_num+'" /><span>'
													+ value.schedule_num
													+ '번 '
													+ value.schedule_title
													+ '</span><a class="delete_sch" id="updated_'+value.schedule_num+'"></a>'
													+ '<input id="scnum_'+value.schedule_num+'" type="hidden" name="schedule_num" value="'+value.schedule_num+'"/><input id="sctitle_'+value.schedule_num+'" type="hidden" name="schedule_title" value="'+value.schedule_title+'"/><input id="scname_'+value.schedule_num+'" type="hidden" name="schedule_name" value="'+value.schedule_name+'"/></div>'
													+ '<input id="scday_'+value.schedule_num+'" type="hidden" name="schedule_day" value="'+value.schedule_day+'"/>'
													+ '<input id="sclistlen" type="hidden" value="'+data.alist.length+'"/>'
													+ '<input id="sclat_'+value.schedule_num+'" type="hidden" name="schedule_latitude" value="'+value.schedule_latitude+'"/>'
													+ '<input id="sclnt_'+value.schedule_num+'" type="hidden" name="schedule_longitude" value="'+value.schedule_longitude+'"/>';
										}
									}
									schList.push(tlist);
								});

				// 선그리기
				polyline = new daum.maps.Polyline({
					map : map, // 선을 표시할 지도 객체 
					path : linepath,
					endArrow : true,
					strokeWeight : 3, // 선의 두께
					strokeColor : '#00F', // 선 색
					strokeOpacity : 0.7, // 선 투명도
					strokeStyle : 'solid' // 선 스타일
				});

				arrpoly.push(polyline);

				for (var i = 0; i < linepath.length; i++) {
					mker = new daum.maps.Marker({
						map : map,
						position : linepath[i], // 마커를 표시할 위치
						image : mImage
					// 마커 이미지 
					});
					mkers.push(mker);
				}

				$('#my_schInfo').append('<div class="list"></div>');

				for (var i = 0; i < schList.length; i++) {
					$('.list').append(schList[i]);
				}
				schList = [];

				$.each(roadnum, function(index, value) {
					$('#roadmap_' + value).bind(
							'click',
							function() {
								var stitle = $('#sctitle_' + value).val();
								var snum = $('#scnum_' + value).val();
								snum = parseInt(snum);

								var endnum = snum + 1;
								var etitle = $('#sctitle_' + endnum).val();
								var url = "http://map.daum.net/?sName="
										+ stitle + "&eName=" + etitle;
								window.open(url, '_blank');
							});//길찾기 이벤트 처리

					// 삭제버튼 처리
					$('#updated_' + value).bind(
							'click',
							function() {
								var stitle = $('#sctitle_' + value).val();
								var snum = $('#scnum_' + value).val();
								snum = parseInt(snum);

								var scname = $('#scname_' + value).val();
								var scday = $('#scday_' + value).val();
								var sclat = $('#sclat_' + value).val();
								var sclnt = $('#sclnt_' + value).val();

								$('.list').empty();

								$.ajax({
									type : 'GET',
									dataType : 'json',
									url : 'updatesch.go?schedule_num=' + snum
											+ '&schedule_name=' + scname
											+ '&schedule_day=' + scday
											+ '&schedule_latitude=' + sclat
											+ '&schedule_longitude=' + sclnt,
									success : function(res) {
										$('#days').trigger('change', days);
									}//end success
								});//end ajax updatesch.go?
							});//end bind click
				});//end each
			}//CreatePoly
		</script>

	</div>
	<%@include file="index_list.jsp"%>
	<%@include file="footer.jsp"%>
	<!--Javascript (jQuery) Libraries and Plugins-->

	<script src="resources/js/libs/jquery.easing.min.js"></script>
	<script src="resources/js/plugins/bootstrap.min.js"></script>
	<script src="resources/js/plugins/smoothscroll.js"></script>
	<script src="resources/js/plugins/jquery.validate.min.js"></script>
	<script src="resources/js/plugins/icheck.min.js"></script>
	<script src="resources/js/plugins/jquery.placeholder.js"></script>
	<script src="resources/js/plugins/jquery.stellar.min.js"></script>
	<script src="resources/js/plugins/jquery.touchSwipe.min.js"></script>
	<script src="resources/js/plugins/jquery.shuffle.min.js"></script>
	<script src="resources/js/plugins/lightGallery.min.js"></script>
	<script src="resources/js/plugins/owl.carousel.min.js"></script>
	<script src="resources/js/plugins/masterslider.min.js"></script>
	<script src="resources/js/plugins/jquery.nouislider.min.js"></script>
	<script src="resources/js/scripts.js"></script>
</body>
</html>