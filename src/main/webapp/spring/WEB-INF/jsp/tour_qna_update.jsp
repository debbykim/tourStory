<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$(document).ready(function() {
		$('#update').bind('click', updateRun);
		$('#cancel').bind('click', cancelRun);
		$('#list').bind('click', listRun);
		date();
		$('#category').focus(function() {
			$('#cate').val($('#category option:selected').val());
		});
		$('#category').change(function() {
			$('#cate').val($('#category option:selected').val());
		});
	});//end ready

	function updateRun() {
		Editor.save();		
		$('#subject').val($('#qna_subject').val());
		$('#content').val($('#qna_content').val());
		$('#uptfrm').submit();
	}

	function listRun() {
		$('#frm').attr('action', 'noticePage.go').submit();
	}

	function cancelRun() {
		$('#subject').val('${dto.qna_subject}');
		$('#content').val('${dto.qna_content}');
	}
	function date() {
		var milliseconds = parseInt($('#time').val());
		var d = new Date(milliseconds);
		var year = d.getFullYear();
		var month = (d.getMonth()) + 1;
		var date = d.getDate();

		if (month < 10) {
			month = "0" + month;
		}
		$('#date').text(year + "-" + month + "-" + date);
		
		var dtocate="${dto.qna_category}";
		if(dtocate == 'notice'){
			 $('#notice_mainTitle').text('공 지 사 항');
			  $('#noticeBtn').attr('class','side-menu-focused');
			  $('#cautiousBtn').attr('class','side-menu-01');
			  $('#tourCtsBtn').attr('class','side-menu-01');
			  $('#tipsBtn').attr('class','side-menu-01');
		}else if(dtocate == 'cautious'){
			$('#notice_mainTitle').text('유 의 사 항');
			  $('#cautiousBtn').attr('class','side-menu-focused');
			  $('#noticeBtn').attr('class','side-menu-01');
			  $('#tourCtsBtn').attr('class','side-menu-01');
			  $('#tipsBtn').attr('class','side-menu-01');
		}else if(dtocate == 'tour_cautious'){
			 $('#notice_mainTitle').text('여행시 주의사항');
			  $('#tourCtsBtn').attr('class','side-menu-focused');
			  $('#cautiousBtn').attr('class','side-menu-01');
			  $('#noticeBtn').attr('class','side-menu-01');
			  $('#tipsBtn').attr('class','side-menu-01');
		}else if(dtocate == 'tips'){
			 $('#notice_mainTitle').text('초보 여행 팁');
			  $('#tipsBtn').attr('class','side-menu-focused');
			  $('#noticeBtn').attr('class','side-menu-01');
			  $('#tourCtsBtn').attr('class','side-menu-01');
			  $('#cautiousBtn').attr('class','side-menu-01');
		}
	}
</script>
<style type="text/css">
table {
	width: 80%;
}
</style>
</head>
<body>
	<%@include file="navi.jsp"%>
	<div class="page-content">
		<ol class="breadcrumb">
			<li><a href="/tourstory/">Home</a></li>
			<li><a href="noticePage.go?currentPage=1&qna_category=notice">Q
					& A</a></li>
			<li>공지사항</li>
		</ol>

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
									<h2 id="notice_mainTitle"
										class="text-center-mobile notice_mainTitle"
										style="margin-bottom: 5px;"></h2>
									<div class="inner" id="qna_list_all">
										<input type="hidden" id="time" value="${time}" />
										<table>
											<tr>
												<th class="notice_name">게시자</th>
												<td class="notice_list_left">${dto.member_qna_nick}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<select id="category" autofocus="autofocus">
														<option value="notice">공지사항</option>
														<option value="cautious">유의사항</option>
														<option value="tour_cautious">여행시 주의사항</option>
														<option value="tips">초보 여행 팁</option>
												</select>
												&nbsp;&nbsp;<span id="date"></span>
												</td>
											</tr>
											<tr>
												<th class="notice_title">제목</th>
												<td class="notice_list_center">
												<c:if test="${dto.qna_re_step != 0}">답변</c:if>
												<input type="text" id="qna_subject" size="70" value="${dto.qna_subject}"/></td>
											</tr>
											<tr>
												<th class="notice_title">내용</th>
												<td class="notice_list_center"><jsp:include
														page="../../../resources/daumeditor/editor_notice_frame.jsp"></jsp:include>
													<script>
														Editor.modify({'content' : '${dto.qna_content}'});
													</script></td>
											</tr>
										</table>
										<form name="uptfrm" id="uptfrm" method="post" action="updateContent.go">
										<input type="hidden" name="qna_subject" id="subject" value="" />
										<input type="hidden" name="qna_content" id="content" value="" />
											<!-- 답변글일때.... -->
											<c:if test="${dto.qna_ref_num!=0}">
												<input type="hidden" name="qna_num" id="ref_qna_num"
													value="${dto.qna_num}" />
												<input type="hidden" name="qna_ref_num" id="qna_ref_num"
													value="${dto.qna_ref_num}" />
												<input type="hidden" name="qna_re_step" id="qna_re_step"
													value="${dto.qna_re_step}" />
												<input type="hidden" name="qna_re_level" id="qna_re_level"
													value="${dto.qna_re_level}" />
											</c:if>
											<input type="hidden" name="qna_num" value="${dto.qna_num}" id="qna_num"/>
											<input type="hidden" name="currentPage" value="${currentPage}" id="curr" />
											<input type="hidden" name="qna_category" value="${dto.qna_category}" id="cate"/>
											<input type="button" id="update" value="수정" />
											<input type="button" id="cancel" value="취소" />
											<input type="button" id="list" value="목록" />
										</form>
									</div>
								</div>
							</section>
						</div>
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
