<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${fullschedule[0].schedule_name}</title>
<style type="text/css">
.full {
	display: inline-block;
	float: left;
	width: 180px;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	var daylength;
	var schlength;
	var data;
	var schDay;
	var daylist = [];
	
	$(document).ready(function() {
		createTable();
	});

	function createTable() {
		daylength = parseInt($('#daylen').val());
		schlength = parseInt($('#schlen').val());

		for (var i = 0; i < daylength; i++) {
			daylist.push($('#daylist_' + i).val());
			var content = '<div class="full"><h4 id="d_day_'+i+'"></h4>';
			content += '<div id="content_'+i+'"></div></div>';
			$('.schedule').append(content);
			
			$('#d_day_' + i).text(daylist[i]);
		}//end i<daylength

		$.each(daylist, function(index, value){
			for (var i = 0; i < schlength; i++) {
				schDay = $('#schDay_' + i).val();
				
				if(schDay == $('#d_day_'+index).text()){
					data = $('#schedule_data_' + i).val();
					$('#content_'+index).append('<p>' + data + '</p>');
				}
			}//end i<schlength
		});
	} //end createTable()
</script>
</head>
<body style="width: 100%;">
	<p style="width: 100%; text-align: center;">${fullschedule[0].schedule_name}</p>
	<div class="schedule"></div>
	<c:forEach items="${day}" var="dd" varStatus="st">
		<input type="hidden" id="daylist_${st.index}"
			value="${dd.schedule_day}" />
		<input type="hidden" id="daylen" value="${fn:length(day)}" />
	</c:forEach>

	<c:forEach items="${day}" var="dayt">
		<c:if test="${dayt.schedule_day == 'Day 1'}">
			<c:forEach items="${day}" var="d" varStatus="s">
				<c:forEach items="${fullschedule}" var="dto" varStatus="status">
					<input type="hidden" id="schedule_data_${status.index}"
						value="${dto.schedule_num}/${dto.schedule_title}" />
					<input type="hidden" id="schlen" value="${fn:length(fullschedule)}" />
					<input type="hidden" id="schDay_${status.index}"
						value="${dto.schedule_day}" />
				</c:forEach>
			</c:forEach>
		</c:if>
	</c:forEach>
</body>
</html>
