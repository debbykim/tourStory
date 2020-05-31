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
    var set;
    var choice = 1;
    $(document).ready(function(){
    	$('#re_password').focus(function(){
    		if($('#re_password').val() != ""){
    			set = setInterval(function(){
    				var pass=$('#b_password').val();
        			var repass=$('#re_password').val();
        		alert(pass+"////"+repass);
        		
        		if(pass != repass){
        			$('#pwmsg').remove();
        			$('#repassLabel').append('<span id="pwmsg" style="color:red;">비밀번호가 일치하지 않습니다.</span>');
        		}else{
        			$('#pwmsg').remove();
        		}
    		}, 500);
        	}
    	});//end focus

	$('#re_password').focusout(function(){
		clearInterval(set);
	});//end focusout
    	
    $('#upPassBtn').bind('click',function(){
    	$.ajax({
    		type:'post',
    		url:'pwUpdate.do',
    		data:'member_pass='+$('#b_password').val()+'&member_nickname='+$('#nickname').val(),
    		success:function(result){
    			alert("비밀번호 수정 완료");
    			window.location = "/tourstory/";
    		}
    	});
    });//end bind
    
});//end ready
function contentChange(choice) {
	if(choice==1){
		$('#container_notice').empty();
		$('#container_notice').load('userInfo.go');
	}
	else if(choice==2){
		$('#container_notice').empty();
		$('#container_notice').load('listTest.go');
	}else if(choice==3){
		$('#container_notice').empty();
		$('#container_notice').load('listTest.go');
	}
	else if(choice==4){
		$('#container_notice').empty();
		$('#container_notice').load('tourMap.go');
	}	
	
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
        <li>사용자 정보</li>
        <li>내 정보</li>
      </ol><!--Breadcrumbs Close-->
      
      <!--Catalog Grid-->
      <section class="catalog-grid">
      	<div class="container">
          <h2 class="with-sorting">사용자 정보</h2>
          
          <div class="row">
          
            <!--Filters-->
          	<div class="filters-mobile col-lg-3 col-md-3 col-sm-4">
            	<div class="shop-filters">
              		<hr class="green-line">
              		<!-- 버튼 타입 -->
              		<button class="side-menu-01" onclick="contentChange(1)">내 정보</button>
              		<button class="side-menu-01" onclick="contentChange(2)">나의 여행</button>
              		<button class="side-menu-01" onclick="contentChange(3)">여행 앨범</button>
              		<button class="side-menu-01" onclick="contentChange(4)">일정 만들기</button>
              </div>
            </div>
            
            <!--Tiles-->
          	<div class="col-lg-9 col-md-9 col-sm-8">
            	<div class="row">
      <!--Orders History-->
      <section class="contain-notice extra-space-bottom">
      	<div class="container-notice" style="margin-top: -18px;" id="container_notice">
      	<%@ include file="user_info.jsp" %>
        </div>
      </section><!--Orders History Close-->
              </div>
              <!--Pagination-->
              <!-- <ul class="pagination">
                <li class="prev-page"><a class="icon-arrow-left" href="#"></a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li class="next-page"><a class="icon-arrow-right" href="#"></a></li>
              </ul> -->
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
