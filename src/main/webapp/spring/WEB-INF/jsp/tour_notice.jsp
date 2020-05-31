<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>Tour Story</title>
    <!--SEO Meta Tags-->
	<meta name="keywords" content="Tour, Story" />

    <!--Mobile Specific Meta Tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!--Favicon-->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <!--Master Slider Styles-->
    <link href="resources/masterslider/style/masterslider.css" rel="stylesheet" media="screen">
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
<script type="text/javascript">
$(document).ready(function() {
	dateEvents();
	/* 글쓰기 버튼 이벤트 */
	$('#btnWrite').bind('click', function(){
		$('.qna_contents').empty();
		$('#qna_list_all').empty();
		window.open('qnawrite.go','_self');
	});
	/* 메뉴버튼 이벤트 */
	$('#noticeBtn').bind('click',function(){
		$('#noticeBtn').focus();
		$('#notice_mainTitle').text('공 지 사 항');
		firstin();
		$.ajax({
			type:'get',
			url:'noticeList.go',
			data:'qna_category=notice',
			success:noticeChange
		});//end ajax
	});
	$('#cautiousBtn').bind('click',function(){
		$('#cautiousBtn').focus();
		$('#notice_mainTitle').text('유 의 사 항');
		firstin();
		$.ajax({
			type:'get',
			url:'noticeList.go',
			data:'qna_category=cautious',
			success:noticeChange
		});
	});
	$('#tourCtsBtn').bind('click',function(){
		$('#tourCtsBtn').focus();
		$('#notice_mainTitle').text('여행시 주의 사항');
		firstin();
		$.ajax({
			type:'get',
			url:'noticeList.go',
			data:'qna_category=tour_cautious',
			success:noticeChange
		});
	});
	$('#tipsBtn').bind('click',function(){
		$('#tipsBtn').focus();
		$('#notice_mainTitle').text('초보 여행 팁');
		firstin();
		$.ajax({
			type:'get',
			url:'noticeList.go',
			data:'qna_category=tips',
			success:noticeChange
		});
	});
});//end ready
function firstin(){
	 var all_add ='<table><tr><th class="notice_num">번호</th><th class="notice_title">제목</th><th class="notice_name">게시자</th><th class="notice_date">게시일</th><th class="notice_hit">조회수</th></tr></table>';
	$('#qna_list_all').append(all_add);
}

function dateEvents() {
	  var length = parseInt($('#len').val());
	  var numlist=[];	  
	  for(var i=0; i<length; i++){
	  var milliseconds = parseInt($('#time_'+i).val());
	  var d = new Date(milliseconds);
	  var year = d.getFullYear();
	  var mon = (d.getMonth())+1;
	  var date = d.getDate();
	  if(mon < 10){
			mon = "0"+mon;
		}
	$('#qna_date_'+i).text(year+"-"+mon+"-"+date);
		
	numlist.push($('#numlist_'+i).val());
}//end for
		$.each(numlist, function(index, value){
			$('#qna_subject_'+value).bind('click',function(){
				$.ajax({
					type:'post',
					url:'qnaview.go',
					data:'currentPage='+$('#currentPage_'+value).val()+'&qna_num='+value,
					success:function(result){
						var milliseconds = parseInt(result.dto.qna_date);
						var d = new Date(milliseconds);
						var year = d.getFullYear();
						var mon = (d.getMonth())+1;
						var date = d.getDate();
						if(mon < 10){
							mon = "0"+mon;
						}
						var qna_date = year+"-"+mon+"-"+date;
						$('.qna_contents').empty();
						$('#con_table').remove();
						var content;
						if(result.sessionNick == 'HOHOHO'){
							content ='<table border="1" width="80%" id="con_table"><tr><th>게시자</th><td>'+result.dto.member_qna_nick+'</td>';
							content += '<th>조회수</th><td>'+result.dto.qna_readcount+'</td><td>'+qna_date+'</td></tr>';
							content += '<tr><th>제목</th><td colspan="4">'+result.dto.qna_subject+'</td></tr>';	
							content += '<tr><th>내용</th><td colspan="4">'+result.dto.qna_content+'</td></tr></table>';
							content += '<form name="answerfrm" id="answerfrm" method="get">';	
							content += '<input type="hidden" name="qna_num" value="'+result.dto.qna_num+'" />';
							content += '<input type="hidden" name="currentPage" id="currentPage"value="'+result.currentPage+'" />';
							content += '<input type="hidden" name="qna_ref_num"	value="'+result.dto.qna_ref_num+'" />';
							content += '<input type="hidden" name="qna_re_step"	value="'+result.dto.qna_re_step+'" />';
							content += '<input type="hidden" name="qna_re_level" value="'+result.dto.qna_re_level+'" />'; 
							content += '<input type="button" id="replayBtn" value="답변" /></form>';
						}
						else if(result.dto.member_qna_nick == result.sessionNick){
						content ='<table border="1" width="80%" id="con_table"><tr><th>게시자</th><td>'+result.dto.member_qna_nick+'</td>';
						content += '<th>조회수</th><td>'+result.dto.qna_readcount+'</td><td>'+qna_date+'</td></tr>';
						content += '<tr><th>제목</th><td colspan="4">'+result.dto.qna_subject+'</td></tr>';	
						content += '<tr><th>내용</th><td colspan="4">'+result.dto.qna_content+'</td></tr></table>';
						content += '<form name="answerfrm" id="answerfrm" method="get">';	
						content += '<input type="hidden" name="qna_num" value="'+result.dto.qna_num+'" />';
						content += '<input type="hidden" name="currentPage" id="currentPage"value="'+result.currentPage+'" />';
						content += '<input type="hidden" name="qna_ref_num"	value="'+result.dto.qna_ref_num+'" />';
						content += '<input type="hidden" name="qna_re_step"	value="'+result.dto.qna_re_step+'" />';
						content += '<input type="hidden" name="qna_re_level" value="'+result.dto.qna_re_level+'" />';
						content += '<input type="button" id="updateBtn" value="수정" />';
						content += '<input type="button" id="deleteBtn" value="삭제" /></form>';
						}else{
							content ='<table border="1" width="80%" id="con_table"><tr><th>게시자</th><td>'+result.dto.member_qna_nick+'</td>';
							content += '<th>조회수</th><td>'+result.dto.qna_readcount+'</td><td>'+qna_date+'</td></tr>';
							content += '<tr><th>제목</th><td colspan="4">'+result.dto.qna_subject+'</td></tr>';	
							content += '<tr><th>내용</th><td colspan="4">'+result.dto.qna_content+'</td></tr></table>';
							content += '<form name="answerfrm" id="answerfrm" method="get">';	
							content += '<input type="hidden" name="qna_num" value="'+result.dto.qna_num+'" />';
							content += '<input type="hidden" name="currentPage" id="currentPage"value="'+result.currentPage+'" />';
							content += '<input type="hidden" name="qna_ref_num"	value="'+result.dto.qna_ref_num+'" />';
							content += '<input type="hidden" name="qna_re_step"	value="'+result.dto.qna_re_step+'" />';
							content += '<input type="hidden" name="qna_re_level" value="'+result.dto.qna_re_level+'" />';
							content += '<input type="hidden" id="qna_category" name="qna_category" value="'+result.dto.qna_category+'" />'; 
							content += '</form>';
						}
						$('.qna_contents').append(content);
						$('#qna_hit_'+result.dto.qna_num).text(result.dto.qna_readcount);
						$('#replayBtn').bind('click', function(){$('#answerfrm').attr('action', 'qnawrite.go?currentPage='+$('#currentPage').val()+'&qna_category='+$('#qna_category').val()).submit();});
						$('#updateBtn').bind('click', function(){$('#answerfrm').attr('action', 'qnaupdate.go').submit();});
						$('#deleteBtn').bind('click', function(){$('#answerfrm').attr('action', 'qnadelete.go').submit();});
					}//end success
				});
			}); 
	});
}//end function date

function noticeChange(data){
	  $('.qna_contents').empty();
	  $('#qna_list_all').empty();
	  $('ul.pagination').empty();
	  
	  var category;
	  if(data.length >= 0){
	  if(data.aList[0].qna_category == 'notice'){
		  $('#notice_mainTitle').text('공 지 사 항');
		  $('#noticeBtn').attr('class','side-menu-focused');
		  $('#cautiousBtn').attr('class','side-menu-01');
		  $('#tourCtsBtn').attr('class','side-menu-01');
		  $('#tipsBtn').attr('class','side-menu-01');
	 }else if(data.aList[0].qna_category == 'cautious'){
		  $('#notice_mainTitle').text('유 의 사 항');
		  $('#cautiousBtn').attr('class','side-menu-focused');
		  $('#noticeBtn').attr('class','side-menu-01');
		  $('#tourCtsBtn').attr('class','side-menu-01');
		  $('#tipsBtn').attr('class','side-menu-01');
	 }else if(data.aList[0].qna_category == 'tour_cautious'){
		  $('#notice_mainTitle').text('여행시 주의 사항');
		  $('#tourCtsBtn').attr('class','side-menu-focused');
		  $('#cautiousBtn').attr('class','side-menu-01');
		  $('#noticeBtn').attr('class','side-menu-01');
		  $('#tipsBtn').attr('class','side-menu-01');
	 }else if(data.aList[0].qna_category == 'tips'){
		  $('#notice_mainTitle').text('초보 여행 팁');
		  $('#tipsBtn').attr('class','side-menu-focused');
		  $('#noticeBtn').attr('class','side-menu-01');
		  $('#tourCtsBtn').attr('class','side-menu-01');
		  $('#cautiousBtn').attr('class','side-menu-01');
	 }
	  }
	 
	 if(data.length == 0){
		 var all_add ='<input type="hidden" id="len" value="'+data.length+'" />';
		all_add +='<table><tr><th class="notice_num">번호</th><th class="notice_title">제목</th><th class="notice_name">게시자</th><th class="notice_date">게시일</th><th class="notice_hit">조회수</th></tr></table>';
		$('#qna_list_all').append(all_add);
	 }else{
		 var all_add ='<input type="hidden" id="len" value="'+data.length+'" />';
		 all_add +='<table><tr><th class="notice_num">번호</th><th class="notice_title">제목</th><th class="notice_name">게시자</th><th class="notice_date">게시일</th><th class="notice_hit">조회수</th></tr>';
		 $.each(data.aList, function(index, value){
			 all_add +='<input type="hidden" id="numlist_'+index+'"value="'+value.qna_num+'" />';
			 all_add +='<input type="hidden" id="qna_content_'+value.qna_num+'"value="'+value.qna_content+'"/>';
			 all_add +='<input type="hidden" id="currentPage_'+value.qna_num+'"value="'+data.pv.currentPage+'"/>';
			 all_add +='<tr href="#" id="qna_subject_'+value.qna_num+'"><td class="notice_list_center">'+value.qna_num+'</td><td class="salign">';
			 if(value.qna_re_level != 0){
				 all_add +='<img src="resources/images/level.gif" width="'+20*value.qna_re_level+'" height="15" style="display: inline-block;"/><img src="resources/images/reply.png" width="20" height="25" style="display: inline-block;"/>';
			 }
			 all_add +='<a class="notice_list_left" style="text-decoration: none;color:black;display: inline-block;">';
			 all_add +=''+value.qna_subject+'</a></td><td class="notice_list_center" id="qna_nick_'+value.qna_num+'">'+value.member_qna_nick+'</td>';
			 all_add +='<td class="notice_list_center" id="qna_date_'+index+'"><input type="hidden" id="time_'+index+'"value="'+value.qna_date+'"/></td>';
			 all_add +='<td class="notice_list_center" id="qna_hit_'+value.qna_num+'">'+value.qna_readcount+'</td></tr>';
			 category=value.qna_category;
		 });//end each data.aList
		 all_add+='</table>';
		 $('#qna_list_all').append(all_add);
		
		var uladd='';
		if(data.pv.startPage > 0){
		var prevpage = data.pv.startPage-data.pv.blockPage;
		var nextpage = parseInt(data.pv.startPage)+parseInt(data.pv.blockPage);
		if(data.pv.startPage > 1){
			uladd +='<li class="prev-page"><a class="icon-arrow-left" href="noticePage.go?currentPage='+prevpage+'&qna_category='+category+'"></a></li>';
		}
		
		for(var i=data.pv.startPage; i<=data.pv.endPage; i++){
			var currPage = 'noticePage.go?currentPage='+i+'&qna_category='+category;
			if(data.pv.currentPage != i){
				uladd +='<li><a href="'+currPage+'">'+i+'</li>';
			}else{
				uladd +='<li class="active"><a href="'+currPage+'">'+i+'</a></li>';
			}
		}
		if(data.pv.totalPage > data.pv.endPage){
			uladd +='<li class="next-page"><a class="icon-arrow-right" href="noticePage.go?currentPage='+nextpage+'&qna_category='+category+'"></a></li>';
		}
		$('ul.pagination').append(uladd);
		}
		dateEvents();
	 }//end data.length == 0
  }//end  noticeChange
 </script>
</head>
<body>


	<%@include file="navi.jsp"%>
	
    <!--Page Content-->
    <div class="page-content">
    
      <!--Breadcrumbs-->
      <ol class="breadcrumb">
        <li><a href="/tourstory/">Home</a></li>
        <li><a href="noticePage.go?currentPage=1&qna_category=notice">Q & A</a></li>
        <li>
        <c:choose>
      	<c:when test="${aList[0].qna_category == 'cautious'}">
      	유 의 사 항
      	</c:when>
      	<c:when test="${aList[0].qna_category == 'tour_cautious'}">
      	여행시 주의 사항
      	</c:when>
      	<c:when test="${aList[0].qna_category == 'tips'}">
      	초보 여행 팁
      	</c:when>
      	<c:otherwise>
      	공 지 사 항
      	</c:otherwise>
      	</c:choose>
        </li>
      </ol><!--Breadcrumbs Close-->
      
      <!--Catalog Grid-->
      <section class="catalog-grid">
      	<div class="container">
          <h2 class="side-menu-title">Q & A</h2>
          
          <div class="row">
          
            <!--Filters-->
          	<div class="filters-mobile col-lg-3 col-md-3 col-sm-4">
            	<div class="shop-filters">
              		<hr class="green-line">
              		<!-- 버튼 타입 -->         		
              		<button class="side-menu-01" id="noticeBtn">공지사항</button>
              		<button class="side-menu-01" id="cautiousBtn">유의사항</button>
              		<button class="side-menu-01" id="tourCtsBtn">여행시 주의사항</button>
              		<button class="side-menu-01" id="tipsBtn">초보 여행 팁</button>
              		
              		<c:if test="${not empty sessionScope.nick}">                		         		
              		<input type="button" id="btnWrite" value="글쓰기" style="width: 150px;height: 70px;"/>
              		</c:if>
              		
              </div>
            </div>
            <!--Tiles-->
          	<div class="col-lg-9 col-md-9 col-sm-8">
            	<div class="row">
      <!--Orders History-->
      <section class="contain-notice extra-space-bottom">
      	<div class="container-notice" style="margin-top: -18px;">
      	<h2 id="notice_mainTitle" class="text-center-mobile notice_mainTitle" style="margin-bottom: 5px;">
      	<c:choose>
      	<c:when test="${aList[0].qna_category == 'cautious'}">
      	유 의 사 항
      	</c:when>
      	<c:when test="${aList[0].qna_category == 'tour_cautious'}">
      	여행시 주의 사항
      	</c:when>
      	<c:when test="${aList[0].qna_category == 'tips'}">
      	초보 여행 팁
      	</c:when>
      	<c:otherwise>
      	공 지 사 항
      	</c:otherwise>
      	</c:choose>
         </h2>
		
		<div class="qna_contents"></div>
        <div class="inner" id="qna_list_all"><table>
			<tr>
				<th class="notice_num">번호</th>
				<th class="notice_title">제목</th>
				<th class="notice_name">게시자</th>
				<th class="notice_date">게시일</th>
				<th class="notice_hit">조회수</th>
			</tr>
			<c:forEach var="i" items="${aList}" varStatus="status">
			<input type="hidden" id="len" value="${length}" />
			<input type="hidden" id="numlist_${status.index}" value="${i.qna_num}" >
			<span  style="display: none;" id="qna_content_${i.qna_num}">${i.qna_content}</span>
			<input type="hidden" id="currentPage_${i.qna_num}" value="${pv.currentPage}"/>
				<tr href="#" id="qna_subject_${i.qna_num}">
					<td class="notice_list_center">${i.qna_num}</td>
					<td class="salign">
					<c:if test="${i.qna_re_level!=0}">
						<img src="resources/images/level.gif" width="${20*i.qna_re_level}" height="15" style="display: inline-block;"/>
						<img src="resources/images/reply.png" width="20" height="25" style="display: inline-block;"/>
					</c:if>
					<a class="notice_list_left" style="text-decoration: none;color:black;display: inline-block;" >
					${i.qna_subject}</a>
					</td>
					<td class="notice_list_center" id="qna_nick_${i.qna_num}">${i.member_qna_nick}</td>
					<td class="notice_list_center" id="qna_date_${status.index}"><input type="hidden" id="time_${status.index}"value="${i.qna_date.getTime()}"/></td>
					<td class="notice_list_center" id="qna_hit_${i.qna_num}">${i.qna_readcount}</td>
				</tr>
			</c:forEach>
		</table>

          </div>
        </div>
      </section><!--Orders History Close-->
     
     </div>
     <!--Pagination-->
     <ul class="pagination">
		<c:if test="${pv.startPage>1}">
			 <li class="prev-page"><a class="icon-arrow-left" href="noticePage.go?currentPage=${pv.startPage-pv.blockPage}"></a></li>
		</c:if>
		
		<!-- 페이지 출력 시작 -->
		<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
			<c:url var="currPage" value="noticePage.go">
				<c:param name="currentPage" value="${i}" />
			</c:url>
			<c:choose>
			<c:when test="${pv.currentPage != i}">
			<li><a href="${currPage}"><c:out value="${i}" /></a></li>
			</c:when>
			<c:otherwise>
			<li class="active"><a href="${currPage}"><c:out value="${i}" /></a></li>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		<!-- 페이지 출력 끝 -->
		<c:if test="${pv.totalPage>pv.endPage}">
			 <li class="next-page"><a class="icon-arrow-right" href="noticePage.go?currentPage=${pv.startPage+pv.blockPage}"></a></li>
		</c:if>
              </ul>
            </div>
          </div>
        </div>
      </section><!--Catalog Grid Close-->
    </div><!--Page Content Close-->
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
