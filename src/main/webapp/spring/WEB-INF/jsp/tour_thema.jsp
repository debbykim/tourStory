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
		var Page = ${pv.currentPage}
		var length = parseInt($('#len').val())
		var numlist=[]
		var aList = ${length}
		

		for(var i=0;i<length;i++){
			numlist.push($('#numlist_'+i).val());
		}
		$.each(numlist, function(index,value){
    	$(".story_"+value).click(function(){
    		$.ajax({
    			type:'GET',
    			dataType:'text',
    			url:'view.go?currentPage='+Page+'&num='+value,
    			success:function(res){
    				$('.storyview').empty();
    				$('.storyview').append(res);
    			}
    		});
    	});
		})
    
	  });
    </script>
</head>
<body>


	<%@include file="navi.jsp"%>
    <!--Page Content-->
    <div class="page-content">
    
      <!--Breadcrumbs-->
      <ol class="breadcrumb">
        <li><a href="/tourstory/">Home</a></li>
        <li>검색</li>
      </ol><!--Breadcrumbs Close-->
      
      <!--Catalog Grid-->
      <section class="catalog-grid">
      	<div class="container">
          <h2 class="with-sorting">검색</h2>
          
          <div class="row">
               <div class="filters-mobile col-lg-3 col-md-3 col-sm-4">
            	<div class="shop-filters">
              		<hr class="green-line">
              	<c:if test="${not empty sessionScope.nick}"> 
		<form id="frm" name="frm" method="get" action="write.go">
			<input type="submit" id="btnWrite" value="글쓰기" size="30px" style="width: 150px;height: 70px;"/>
			<input type="hidden" name="category" value="${cate}">
		</form></c:if>
              </div>
            </div>
               
               
            <!--Tiles-->
          	<div class="col-lg-9 col-md-9 col-sm-8">
            	<div class="row">
            	<!--Orders History-->
            	 <section class="contain-notice extra-space-bottom">
            	 <div class="container-notice" style="margin-top: -18px;">
            	 <h2 id="notice_mainTitle" class="text-center-mobile notice_mainTitle" style="margin-TOP: 50px;">
            	 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;검색 결과가 없습니다.
		         </h2>
      
            	<div>
            	<input type="hidden" id="len" value="${length}" />
            	<input type="hidden" id="numlist_${status.index}" value="${i.board_num}" >
                                     
                      </div>
                    </div>
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
</html>
    