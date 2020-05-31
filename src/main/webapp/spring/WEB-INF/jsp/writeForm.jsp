<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
<style>
.tx-content-container{
margin: 0;
}
</style>
<script src="${pageContext.request.contextPath}/resources/daumeditor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
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
    textarea.id = 'board_content'; //name값 수정
    textarea.value = content;
    form.createField(textarea);
    return true;
}
  $(document).ready(function(){
	  var cate = $('#categorylist').val();
	  $('#'+cate).attr('selected','selected');
	   
	  $('#category').focus(function(){
		  $('#board_category').val($('#category option:selected').val());
	  });
	  $('#category').change(function(){
		  $('#board_category').val($('#category option:selected').val());
	  });
	  
	  $('#btnList').bind('click',function(){
		  $('#frm').attr('action','list.go');		
		  $('#frm').submit();
	  });
	  
	  $('#btnSave').click(function(){ 
		  Editor.save();
		   $("#subject").val($("#board_subject").val());
		   $("#contec").val($("#board_content").val());
		   $("#category").val();
		   $("#frm").submit();
	  });
	  
	  $('.remaining').each(function() {
	        // count 정보 및 count 정보와 관련된 textarea/input 요소를 찾아내서 변수에 저장한다.
	        var $count = $('.count', this);
	        var $input = $(this).prev();
	        // .text()가 문자열을 반환하기에 이 문자를 숫자로 만들기 위해 1을 곱한다.
	        var maximumCount = $count.text() * 1;
	        // update 함수는 keyup, paste, input 이벤트에서 호출한다.
	        var update = function() {
	            var before = $count.text() * 1;
	            var now = maximumCount - $input.val().length;
	            // 사용자가 입력한 값이 제한 값을 초과하는지를 검사한다.
	            if (now < 0) {
	                var str = $input.val();
	                alert('글자 입력수가 초과하였습니다.');
	                $input.val(str.substr(0, maximumCount));
	                now = 0;
	            }
	            // 필요한 경우 DOM을 수정한다.
	            if (before != now) {
	                $count.text(now);
	            }
	        };
	        // input, keyup, paste 이벤트와 update 함수를 바인드한다
	        $input.bind('input keyup paste', function() {
	            setTimeout(update, 0)
	        });
	        update();
	    });
	});
</script>

</head>
<body>

            
		<div class="col-lg-9 col-md-9 col-sm-8">
			
				<section class="contain-notice extra-space-bottom">
					<div>
						<h2 id="notice_mainTitle" class="text-center-mobile notice_mainTitle" style="margin-bottom: 5px;"></h2>
		<form id="cate">				
		<input type="hidden" name="board_category" id = "categorylist" value="${cate}">
		<input type="hidden" name="currentPage" value="${currentPage}" />
		</form>
		<table>
			<tr>
			<th class="notice_name" >게시자</th>
				<td class="notice_list_left">${sessionScope.nick}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select id="category" autofocus="autofocus">
				<optgroup label="여행스토리">
				<option value="korea" id="korea">국내여행</option>
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
				<th class="notice_title">제목</th>
				<td class="notice_list_center">				
				<input type="text" name="board_subject" id="board_subject" size="90" />
				<DIV class=remaining style="color:blue; text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;<SPAN class="count" style="color:white">30</SPAN></DIV>
				</td>
			</tr>

			<tr>
				<th class="notice_title">내용</th>
				<td class="notice_list_center">
				<jsp:include page="../../../resources/daumeditor/editor_frame.jsp"></jsp:include>
				<script>
		        Editor.modify({'content': '${content}'});
				</script>
				</td>
			</tr>

			<tr>
				<th class="notice_title" style="font-size: 15px;" >대표이미지 설정</th>
				<td class="notice_list_center">
				<form id="frm" action="write.go" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="board_subject" id="subject"  value="">
				<input type="hidden" name="board_content" id="contec" value="">
				<input type="hidden" name="board_category" value="${cate}" id="board_category"/>
				<input type="file" name="filename" id="filename"/>
				</form>
				
			</tr>
		</table>	
		<input type="button" id="btnList" value="리스트" /> 
		<input type="button" id="btnSave" value="저장" />
		</div>
		</section>
		</div>
	
		
	
	
	
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
				    maximum: 5*1024*1024 //최대 첨부 용량 (5MB)
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