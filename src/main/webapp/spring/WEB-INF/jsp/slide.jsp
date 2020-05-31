<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!DOCTYPE html><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="hero-slider">
	<div class="master-slider" id="hero-slider">

		<!--Slide 1-->
		<div class="ms-slide" data-delay="7">
			<div class="overlay"></div>
			<img data-src="resources/imgs/hero/slideshow/Change1.jpg"/>
			<h2 style="width: 410px; left: 110px; top: 110px;"
				class="light-color ms-layer" data-effect="top(50,true)"
				data-duration="700" data-delay="250" data-ease="easeOutQuad">한국의 멋을 찾아 떠나는 여행</h2>
			
			<div style="left: 110px; top: 300px;" class="ms-layer button"
				data-effect="bottom(50,true)" data-duration="600" data-delay="950"
				data-ease="easeOutQuad">
				
			</div>
		</div>

		<!--Slide 2-->
		<div class="ms-slide" data-delay="7">
			<span class="overlay"></span> 
			<img data-src="resources/imgs/hero/slideshow/Change2.jpg"/>
			<h2 style="width: 410px; left: 110px; top: 110px;"
				class="light-color ms-layer" data-effect="bottom(50,true)"
				data-duration="700" data-delay="250" data-ease="easeOutQuad">자연과</br>하나되는</br>힐링여행</h2>
			
			<div style="left: 110px; top: 300px;" class="ms-layer button"
				data-effect="rotatebottom(30|90,long,br,true)" data-duration="600"
				data-delay="950" data-ease="easeOutQuad">
				
			</div>
		</div>

		<!--Slide 3-->
		<div class="ms-slide" data-delay="7">
			<div class="overlay"></div>
			<img data-src="resources/imgs/hero/slideshow/Change3.jpg"/>
			<h2 style="width: 410px; left: 110px; top: 110px;"
				class="light-color ms-layer" data-effect="left(50,true)"
				data-duration="700" data-delay="250" data-ease="easeOutQuad">제주도의</br>푸른 밤</h2>
			
			<div style="left: 110px; top: 300px;" class="ms-layer button"
				data-effect="left(50,true)" data-duration="600" data-delay="950"
				data-ease="easeOutQuad">
				
			</div>
		</div>
		
		<!--Slide 4-->
		<div class="ms-slide" data-delay="7">
			<div class="overlay"></div>
			<img data-src="resources/imgs/hero/slideshow/Change4.jpg"/>
			<h2 style="width: 410px; left: 110px; top: 110px;"
				class="light-color ms-layer" data-effect="left(50,true)"
				data-duration="700" data-delay="250" data-ease="easeOutQuad">사랑하는</br>사람과 함께</h2>
			
			<div style="left: 110px; top: 300px;" class="ms-layer button"
				data-effect="left(50,true)" data-duration="600" data-delay="950"
				data-ease="easeOutQuad">
				
			</div>
		</div>
		
		<!--Slide 5-->
		<div class="ms-slide" data-delay="7">
			<div class="overlay"></div>
			<img data-src="resources/imgs/hero/slideshow/Change5.jpg"/>
			<h2 style="width: 410px; left: 110px; top: 110px;"
				class="light-color ms-layer" data-effect="left(50,true)"
				data-duration="700" data-delay="250" data-ease="easeOutQuad">나만을 위한 여행</h2>
			
			<div style="left: 110px; top: 300px;" class="ms-layer button"
				data-effect="left(50,true)" data-duration="600" data-delay="950"
				data-ease="easeOutQuad">
				
			</div>
		</div>

	</div>
</section>
<!--Hero Slider Close-->
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
    
</head>
<body>


<%-- 	<%@include file="navi.jsp"%> --%>
	<div class="page-content">
		<%@include file="calendar.jsp"%>
	</div>
<%-- 	<%@include file="index_list.jsp"%>
	<%@include file="footer.jsp"%> --%>
	
	
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
