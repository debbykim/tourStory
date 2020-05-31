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


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
<script src="${pageContext.request.contextPath}/resources/daumeditor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var cate = $('#categorylist').val();
		  $('#'+cate).attr('selected','selected');
		
		  $('#category').focus(function(){
			  $('#board_category').val($('#category option:selected').val());
		  });
		  $('#category').change(function(){
			  $('#board_category').val($('#category option:selected').val());
		  });
		  
		  
		$('#cancel').bind('click', cancelRun);
		$('#update').click(function(){ 
			  Editor.save();				    
			   $("#subject").val($("#board_subject").val());
			   $("#contec").val($("#board_content").val());
			   $("#category").val();
			   alert("수정되었습니다.");
			  $("#frm").submit();
			  
		}); 
	});

	function cancelRun() {
		$('#cate').attr('action','list.go');		
		$('#cate').submit();
	}
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
	    textarea.id = 'board_content'; //name값 수정
	    textarea.value = content;
	    form.createField(textarea);
	    return true;
	}
	
</script>

</head>
<body>
	
	<%@include file="navi.jsp"%>
	<!--Page Content-->
	<div class="page-content">
		<!--Breadcrumbs-->
		<ol class="breadcrumb">
			<li><a href="/tourstory/">Home</a></li>
			<li>
				<c:if test="${cate=='korea'||cate=='abroad'}">
          			<a href="list.go?board_category=korea">여행스토리</a>			
	      		 </c:if>
	             <c:if test="${cate=='season'||cate=='reply'}">
	             	<a href="list.go?board_category=season">추천여행</a>
	             </c:if>
	             <c:if test="${cate=='koreaH'||cate=='abroadH'}">
	              	<a href="list.go?board_category=koreaH">역사여행</a>
	             </c:if>
	             <c:if test="${cate=='trip'||cate=='food'||cate=='train'||
	             cate=='cycle'||cate=='pack'||cate=='subway'}">
	              	<a href="list.go?board_category=trip">테마여행</a>
	             </c:if>		
			</li>
			
			<li>
			<c:if test="${cate=='korea'}">국내여행 </c:if>
             <c:if test="${cate=='abroad'}">해외여행</c:if>
             <c:if test="${cate=='season'}">시즌여행</c:if>
             <c:if test="${cate=='reply'}">후기여행</c:if> 
             <c:if test="${cate=='koreaH'}">한국사여행</c:if>
             <c:if test="${cate=='abroadH'}">해외사여행</c:if>
             <c:if test="${cate=='trip'}">관광명소</c:if>
             <c:if test="${cate=='food'}">맛집여행</c:if>
             <c:if test="${cate=='train'}">기차여행</c:if>
             <c:if test="${cate=='cycle'}">자전거여행</c:if>
             <c:if test="${cate=='pack'}">배낭여행</c:if>	
             <c:if test="${cate=='subway'}">지하철여행</c:if>
			</li>
		</ol>
		<!--Breadcrumbs Close-->
		<!--Catalog Grid-->
		<section class="catalog-grid">
			<div class="container">
			
			 <h2 class="with-sorting">
			 	<c:if test="${cate=='korea'||cate=='abroad'}">
          			여행스토리		
	      		 </c:if>
	             <c:if test="${cate=='season'||cate=='reply'}">
	             	추천여행
	             </c:if>
	             <c:if test="${cate=='koreaH'||cate=='abroadH'}">
	              	역사여행
	             </c:if>
	             <c:if test="${cate=='trip'||cate=='food'||cate=='train'||
	             cate=='cycle'||cate=='pack'||cate=='subway'}">
	              	테마여행
	             </c:if>
			 </h2>
          
          <div class="row">
          
            <!--Filters-->
          	<div class="filters-mobile col-lg-3 col-md-3 col-sm-4">
            	<div class="shop-filters">
              		<hr class="green-line">
              		<!-- a 타입 -->              		
              		<c:choose>
              		 <c:when test="${cate=='korea'||cate=='abroad'}">
              			<a class="side-menu-01" href="#">국내여행</a>
              			<a class="side-menu-01" href="#">해외여행</a>
              		 </c:when>
              		 
              		 <c:when test="${cate=='season'||cate=='reply'}">
              			<a class="side-menu-01" href="#">시즌여행</a>
              			<a class="side-menu-01" href="#">후기여행</a>
              		 </c:when>
              		 
              		 <c:when test="${cate=='koreaH'||cate=='abroadH'}">
              			<a class="side-menu-01" href="#">한국사여행</a>
              			<a class="side-menu-01" href="#">해외사여행</a>
              		 </c:when>
              		 
              		 <c:when test="${cate=='trip'||cate=='food'||
              		 cate=='train'||cate=='cycle'||cate=='pack'||cate=='subway'}">
              			<a class="side-menu-01" href="#">관광명소</a>
              			<a class="side-menu-01" href="#">맛집여행</a>
              			<a class="side-menu-01" href="#">기차여행</a>
              			<a class="side-menu-01" href="#">자전거여행</a>
              			<a class="side-menu-01" href="#">배낭여행</a>
              			<a class="side-menu-01" href="#">지하철여행</a>
              		 </c:when>
              		
              		</c:choose>
              </div>
            </div>		
	<div class="col-lg-9 col-md-9 col-sm-8">
		<div class="row">
			<section class="contain-notice extra-space-bottom">
				<div class="container-notice" style="margin-top: -18px;">
				<h2 id="notice_mainTitle" class="text-center-mobile notice_mainTitle" style="margin-bottom: 5px;"></h2>
				<form id="cate" >
					<input type="hidden" name="board_category" id = "categorylist" value="${cate}">
					<input type="hidden" name="currentPage" value="${currentPage}" />
				</form>	
				<div class="inner" id="qna_list_all">
					<table>
					<tr>
					<th class="notice_name">게시자</th>
					<td class="notice_list_left">${sessionScope.nick}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="category" autofocus="autofocus">
						<optgroup label="여행스토리">
						<option value="korea" id="korea" >국내여행</option>
						<option value="abroad" id="abroad">해외여행</option>
						</optgroup>
						
						<optgroup label="추천여행">
						<option value="season" id="season">시즌여행</option>
						<option value="reply" id="reply">후기여행</option>
						</optgroup>
						
						<optgroup label="역사여행">
						<option value="koreaH" id="koreaH">한국사여행</option>
						<option value="abroadH" id="abroadH">해외사여행</option>
						</optgroup>
						
						<optgroup label="테마별여행">
						<option value="trip" id="trip">관광명소</option>
						<option value="food" id="food">맛집여행</option>
						<option value="train" id="train">기차여행</option>
						<option value="cycle" id="cycle">자전거여행</option>
						<option value="pack" id="pack">배낭여행</option>
						<option value="subway" id="subway">지하철여행</option>
						</optgroup>
					</select></td>
					</tr>			
					<tr>
					<th class="notice_name">제목</th>
					<td class="notice_list_left"><input type="text" name="board_subject" id="board_subject"
							value="${dto.board_subject}" size="92px"/></td>
					</tr>
					<tr>
					<th class="notice_title">내용</th>
					<td class="notice_list_center">
						<jsp:include page="../../../resources/daumeditor/editor_frame.jsp"></jsp:include>
						<script>
						//'수정하기' 모드일 때, 다음과 같이 데이터를 다음오픈에디터에 대입할 수 있다.
						//${board}는 컨트롤러에서 넘어오는 게시판 객체, ${board.board_content}는 게시판 내용	
						Editor.modify({'content': '${dto.board_content}'});
						</script>					
					</td>
					</tr>
			<tr>
				<th class="notice_title">대표이미지 설정</th>
				<td class="notice_list_center">
				<form id="frm" action="update.go" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="board_subject" id="subject"  value="">
				<input type="hidden" name="board_content" id="contec" value="">
				<input type="hidden" name="board_category" value="${cate}" id="board_category"/>
				<input type="hidden" name="board_num" value="${dto.board_num}" />
		 		<input type="hidden" name="currentPage" value="${currentPage}" />
				<input type="file" name="filename" id="filename"/>
				</form>
				
			</tr>
		</table>
		  
		  <input type="button" id="update" value="수정" /> 
		  <input type="button"	id="cancel" value="취소" />
		  
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
		  
</body>

<script>
	var config = {
			txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
			txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
			txService: 'sample', /* 수정필요없음. */
			txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
			initializedId: "", /* 대부분의 경우에 빈문자열 */
			wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
			form: 'tos_form'+"", /* 등록하기 위한 Form 이름 */
			txIconPath: "${pageContext.request.contextPath}/resources/daumeditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
			txDecoPath: "${pageContext.request.contextPath}/resources/daumeditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
			canvas: {
				styles: {
					color: "#123456", /* 기본 글자색 */
					fontFamily: "굴림", /* 기본 글자체 */
					fontSize: "10pt", /* 기본 글자크기 */
					backgroundColor: "#fff", /*기본 배경색 */
					lineHeight: "1.5", /*기본 줄간격 */
					padding: "8px" /* 위지윅 영역의 여백 */
				},
				showGuideArea: false
			},
			events: {
				preventUnload: false
			},
			sidebar: {
				attachbox: {
					show: true,
					confirmForDeleteAll: true
				},
				/* 이미지첨부 관련 추가 config */
				attacher:{
				    image:{
				        features:{left:250,top:65,width:400,height:300,scrollbars:0}, //팝업창 사이즈
				        popPageUrl:'imagePopup.go' //팝업창 주소
				    }
				},
				capacity: {
				    maximum: 30*1024*1024 //최대 첨부 용량 (30MB)
				}
				/* 이미지첨부 관련 추가 config */
			},
			size: {
				contentWidth: 700 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
			}
		};
		EditorJSLoader.ready(function(Editor) {
			editor = new Editor(config);
		});
		</script>
</html>









