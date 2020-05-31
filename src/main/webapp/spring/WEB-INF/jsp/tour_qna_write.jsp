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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/daumeditor/css/editor.css"
	type="text/css" charset="utf-8" />
<script
	src="${pageContext.request.contextPath}/resources/daumeditor/js/editor_loader.js"
	type="text/javascript" charset="utf-8"></script>
<style>
.tx-content-container {
	margin: 0;
}
</style>
<script type="text/javascript">
	function validForm(editor) {
		var validator = new Trex.Validator();
		var content = editor.getContent();
		if (!validator.exists(content)) {
			return false;
		}
		return true;
	}

	function setForm(editor) {
		var i, input;
		var form = editor.getForm();
		var content = editor.getContent();

		// 본문 내용을 필드를 생성하여 값을 할당하는 부분
		var textarea = document.createElement('textarea');
		textarea.id = 'qna_content'; //name값 수정
		textarea.value = content;
		form.createField(textarea);
		return true;
	}
	$(document).ready(
			function() {				
				$('#category').focus(
						function() {
							$('#qna_category').val(
									$('#category option:selected').val());
						});
				$('#category').change(
						function() {
							$('#qna_category').val(
									$('#category option:selected').val());
						});
				$('#btnList').bind(
						'click',
						function() {
							$('#frm').attr(
									'action',
									'noticePage.go?currentPage='
											+ $('#currentPage').val()
											+ '&qna_category='
											+ $('#qna_category').val());
							$('#frm').submit();
						});
				$('#btnSave').bind('click', function() {
					Editor.save();
					$('#subject').val($('#qna_subject').val());
					$('#content').val($('#qna_content').val());
					$('#noticefrm').submit();
				});
				
				/* 메뉴버튼 이벤트 */
				$('#noticeBtn').bind('click',function(){
					$('#noticeBtn').focus();
					$('#notice_mainTitle').text('공 지 사 항');
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
					$.ajax({
						type:'get',
						url:'noticeList.go',
						data:'qna_category=tips',
						success:noticeChange
					});
				});
			});


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
							if(result.dto.member_qna_nick != result.sessionNick){
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
								content += '<input type="button" id="replayBtn" value="답변" />';
								content += '<input type="button" id="updateBtn" value="수정" />';
								content += '<input type="button" id="deleteBtn" value="삭제" /></form>';
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
		 if(data.length == 0){
			 var all_add ='<input type="button" id="btnWrite" value="글쓰기" />';
			 all_add +='<input type="hidden" id="len" value="'+data.length+'" />';
			all_add +='<table><tr><th class="notice_num">번호</th><th class="notice_title">제목</th><th class="notice_name">게시자</th><th class="notice_date">게시일</th><th class="notice_hit">조회수</th></tr></table>';
			$('#qna_list_all').append(all_add);
		 }else{
			 var all_add ='<input type="button" id="btnWrite" value="글쓰기" />';
			 all_add += '<input type="hidden" id="len" value="'+data.length+'" />';
			 all_add +='<table><tr><th class="notice_num">번호</th><th class="notice_title">제목</th><th class="notice_name">게시자</th><th class="notice_date">게시일</th><th class="notice_hit">조회수</th></tr>';
			 $.each(data.aList, function(index, value){
				 all_add +='<input type="hidden" id="numlist_'+index+'"value="'+value.qna_num+'" />';
				 all_add +='<input type="hidden" id="qna_content_'+value.qna_num+'"value="'+value.qna_content+'"/>';
				 all_add +='<input type="hidden" id="currentPage_'+value.qna_num+'"value="'+data.pv.currentPage+'"/>';
				 all_add +='<tr><td class="notice_list_center">'+value.qna_num+'</td><td class="salign">';
				 if(value.qna_re_level != 0){
					 all_add +='<img src="resources/images/level.gif" width="'+20*value.qna_re_level+'" height="15" style="display: inline-block;"/><img src="resources/images/reply.png" width="20" height="25" style="display: inline-block;"/>';
				 }
				 all_add +='<a href="#" class="notice_list_left" style="text-decoration: none;color:black;display: inline-block;" id="qna_subject_'+value.qna_num+'">';
				 all_add +=''+value.qna_subject+'</a></td><td class="notice_list_center" id="qna_nick_'+value.qna_num+'">'+value.member_qna_nick+'</td>';
				 all_add +='<td class="notice_list_center" id="qna_date_'+index+'"><input type="hidden" id="time_'+index+'"value="'+value.qna_date+'"/></td>';
				 all_add +='<td class="notice_list_center" id="qna_hit_'+value.qna_num+'">'+value.qna_readcount+'</td></tr>';
				 category=value.qna_category;
			 });//end each data.aList
			 all_add+='</table>';
			 $('#qna_list_all').append(all_add);
			
			var uladd='';
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
			$('ul.pagination').css('display','block');
			dateEvents();
			$('#btnWrite').bind('click', function(){
				$('.qna_contents').empty();
				$('#qna_list_all').empty();
				window.open('qnawrite.go','_self');
			});
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
			<li><a href="noticePage.go?currentPage=1&qna_category=notice">Q
					& A</a></li>
			<li>공지사항</li>
		</ol>
		<!--Breadcrumbs Close-->
		<!--Catalog Grid-->
		<section class="catalog-grid">
			<div class="container">
			
			 <h2 class="with-sorting">Q & A</h2>
          
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
              </div>
            </div>
			
			
				<div class="col-lg-9 col-md-9 col-sm-8">
					<div class="row">
						<section class="contain-notice extra-space-bottom">
							<div class="container-notice" style="margin-top: -18px;">
							<h2 id="notice_mainTitle" class="text-center-mobile notice_mainTitle" style="margin-bottom: 5px;"></h2>
							<div class="qna_contents"></div>
       						 <div class="inner" id="qna_list_all">
								<table>
									<tr>
										<th class="notice_name">게시자</th>
										<td class="notice_list_left">${member_qna_nick}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<select id="category" autofocus="autofocus">
												<option value="notice">공지사항</option>
												<option value="cautious">유의사항</option>
												<option value="tour_cautious">여행시 주의사항</option>
												<option value="tips">초보 여행 팁</option>
										</select>
										</td>
									</tr>
									<tr>
										<th class="notice_title">제목</th>
										<td class="notice_list_center"><c:if
												test="${dto.qna_ref_num!=0}">답변</c:if> <input type="text"
											id="qna_subject" size="70" /></td>
									</tr>
									<tr>
										<th class="notice_title">내용</th>
										<td class="notice_list_center"><jsp:include
												page="../../../resources/daumeditor/editor_notice_frame.jsp"></jsp:include></td>
									</tr>
								</table>
								<form name="noticefrm" id="noticefrm" action="qnawrite.go" method="post">
									<input type="hidden" name="member_qna_nick"
										id="member_qna_nick" value="${member_qna_nick}" /> <input
										type="hidden" name="qna_subject" id="subject" value="" /> <input
										type="hidden" name="qna_content" id="content" value="" />
									<!-- 답변글일때.... -->
									<c:if test="${dto.qna_ref_num!=0}">
										<input type="hidden" name="qna_num" id="qna_num"
											value="${dto.qna_num}" />
										<input type="hidden" name="qna_ref_num"
											value="${dto.qna_ref_num}" />
										<input type="hidden" name="qna_re_step"
											value="${dto.qna_re_step}" />
										<input type="hidden" name="qna_re_level"
											value="${dto.qna_re_level}" />
									</c:if>
									<input type="hidden" name="currentPage" id="currentPage"
										value="${currentPage}" /> <input type="hidden"
										name="qna_category" value="${dto.qna_category}"
										id="qna_category" /> <input type="button" id="btnList"
										value="리스트" /> <input type="button" id="btnSave" value="저장" />
								</form>
							</div>
							</div>
						</section>
					</div>
			 <ul class="pagination" style="display: none;">
              </ul>
				</div>
			</div>
			</div>
		</section>
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
<script type="text/javascript">
	var config = {
		txHost : '',
		txPath : '',
		txService : 'sample',
		txProject : 'sample',
		initializedId : "",
		wrapper : "tx_trex_container",
		form : 'notice_form' + "", /* 등록하기 위한 Form 이름 */
		txIconPath : "${pageContext.request.contextPath}/resources/daumeditor/images/icon/editor/",
		txDecoPath : "${pageContext.request.contextPath}/resources/daumeditor/images/deco/contents/",
		canvas : {
			styles : {
				color : "#123456", /* 기본 글자색 */
				fontFamily : "굴림", /* 기본 글자체 */
				fontSize : "10pt", /* 기본 글자크기 */
				backgroundColor : "#fff", /*기본 배경색 */
				lineHeight : "1.5" /*기본 줄간격 */
			},
			showGuideArea : false
		},
		events : {
			preventUnload : false
		},
		sidebar : {
			attachbox : {
				show : true,
				confirmForDeleteAll : true
			}
		},
		size : {
			contentWidth : 300
		}
	};
	EditorJSLoader.ready(function(Editor) {
		editor = new Editor(config);
	});
</script>
</html>
