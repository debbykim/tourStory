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
	        <c:if test="${cate==null }">
	        	검색
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
      </ol><!--Breadcrumbs Close-->
      
      <!--Catalog Grid-->
      <section class="catalog-grid">
      	<div class="container">
      		
      		<c:if test="${cate=='korea'||cate=='abroad'}">
          		<h2 class="side-menu-title">여행 스토리</h2>			
	     	</c:if>
	        <c:if test="${cate=='season'||cate=='reply'}">
	           	<h2 class="side-menu-title">추천 여행</h2>
	        </c:if>
	        <c:if test="${cate=='koreaH'||cate=='abroadH'}">
	           	<h2 class="side-menu-title">역사 여행</h2>
	        </c:if>
	        <c:if test="${cate=='trip'||cate=='food'||cate=='train'||
	        	  cate=='cycle'||cate=='pack'||cate=='subway'}">
	       		<h2 class="side-menu-title">테마 여행</h2>
	        </c:if>
	        <c:if test="${cate==null}">
	        	<h2 class="side-menu-title">검색</h2>
	        </c:if>
	        
          
          <div class="row">
          
            <!--Filters-->
          	<div class="filters-mobile col-lg-3 col-md-3 col-sm-4">
            	<div class="shop-filters">
              		<hr class="green-line">
              		
              		<!-- 버튼 타입 -->
              		<!-- <button class="side-menu-01">국내여행</button>
              		<button class="side-menu-01">해외여행</button> -->
              		
              		 <!-- a 타입 -->
              		<c:choose>
              		 <c:when test="${cate=='korea'||cate=='abroad'}">
	              		 <c:if test="${cate=='korea'}">
	              			<a class="side-menu-focused" href="list.go?board_category=korea">국내여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=abroad">해외여행</a>
	              		 </c:if>
	              		 <c:if test="${cate=='abroad'}">
	              			<a class="side-menu-01" href="list.go?board_category=korea">국내여행</a>
	              			<a class="side-menu-focused" href="list.go?board_category=abroad">해외여행</a>
	              		 </c:if>
              		 </c:when>
              		 
              		 <c:when test="${cate=='season'||cate=='reply'}">
              		 	<c:if test="${cate=='season'}">
	              			<a class="side-menu-focused" href="list.go?board_category=season">시즌여행</a>
              				<a class="side-menu-01" href="list.go?board_category=reply">후기여행</a>
	              		</c:if>
	              		<c:if test="${cate=='reply'}">
	              			<a class="side-menu-01" href="list.go?board_category=season">시즌여행</a>
              				<a class="side-menu-focused" href="list.go?board_category=reply">후기여행</a>
	              		</c:if>
              		 </c:when>
              		 
              		 <c:when test="${cate=='koreaH'||cate=='abroadH'}">
              		 	<c:if test="${cate=='koreaH'}">
	              			<a class="side-menu-focused" href="list.go?board_category=koreaH">한국사여행</a>
              				<a class="side-menu-01" href="list.go?board_category=abroadH">해외사여행</a>
	              		</c:if>
	              		<c:if test="${cate=='abroadH'}">
	              			<a class="side-menu-01" href="list.go?board_category=koreaH">한국사여행</a>
              				<a class="side-menu-focused" href="list.go?board_category=abroadH">해외사여행</a>
	              		</c:if>
              		 </c:when>
              		 
              		 <c:when test="${cate=='trip'||cate=='food'||
              		 cate=='train'||cate=='cycle'||cate=='pack'||cate=='subway'}">
              			<c:if test="${cate=='trip'}">
	              			<a class="side-menu-focused" href="list.go?board_category=trip">관광명소</a>
	              			<a class="side-menu-01" href="list.go?board_category=food">맛집여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=train">기차여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=cycle">자전거여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=pack">배낭여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=subway">지하철여행</a>
	              		</c:if>
	              		<c:if test="${cate=='food'}">
	              			<a class="side-menu-01" href="list.go?board_category=trip">관광명소</a>
	              			<a class="side-menu-focused" href="list.go?board_category=food">맛집여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=train">기차여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=cycle">자전거여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=pack">배낭여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=subway">지하철여행</a>
	              		</c:if>
	              		<c:if test="${cate=='train'}">
	              			<a class="side-menu-01" href="list.go?board_category=trip">관광명소</a>
	              			<a class="side-menu-01" href="list.go?board_category=food">맛집여행</a>
	              			<a class="side-menu-focused" href="list.go?board_category=train">기차여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=cycle">자전거여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=pack">배낭여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=subway">지하철여행</a>
	              		</c:if>
	              		<c:if test="${cate=='cycle'}">
	              			<a class="side-menu-01" href="list.go?board_category=trip">관광명소</a>
	              			<a class="side-menu-01" href="list.go?board_category=food">맛집여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=train">기차여행</a>
	              			<a class="side-menu-focused" href="list.go?board_category=cycle">자전거여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=pack">배낭여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=subway">지하철여행</a>
	              		</c:if>
	              		<c:if test="${cate=='pack'}">
	              			<a class="side-menu-01" href="list.go?board_category=trip">관광명소</a>
	              			<a class="side-menu-01" href="list.go?board_category=food">맛집여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=train">기차여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=cycle">자전거여행</a>
	              			<a class="side-menu-focused" href="list.go?board_category=pack">배낭여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=subway">지하철여행</a>
	              		</c:if>
	              		<c:if test="${cate=='subway'}">
	              			<a class="side-menu-01" href="list.go?board_category=trip">관광명소</a>
	              			<a class="side-menu-01" href="list.go?board_category=food">맛집여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=train">기차여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=cycle">자전거여행</a>
	              			<a class="side-menu-01" href="list.go?board_category=pack">배낭여행</a>
	              			<a class="side-menu-focused" href="list.go?board_category=subway">지하철여행</a>
	              		</c:if>
              		 </c:when>
              		
              		</c:choose>
              </div>
            </div>
              
            <!--Tiles-->
          	<div class="col-lg-9 col-md-9 col-sm-8">
            	<div class="row">
            	 <!--Orders History-->
            	 <section class="contain-notice extra-space-bottom">
            	 <div class="container-notice" style="margin-top: -21px;">
            	 
            	<div>           	
            	<c:forEach var="i" items="${aList}" varStatus="status">
                <!--Tile-->
                <div class="col-lg-4 col-md-6 col-sm-12">
                  <div class="tile">
                    <div class="price-label">여행지</div>
                    		<c:url var="content" value="view.go">
							 <c:param name="currentPage" value="${pv.currentPage}"/>
							 <c:param name="num" value="${i.board_num}"/>
							 <c:param name="board_category" value="${i.board_category}" />					 
							</c:url>
                    <a href="${content}"><img height="250px" src="http://syronia.iptime.org/tourimgs/temp/${i.board_subject}/${i.board_upload}"></a>
                    <div class="footer">
                     <c:choose>
                     <c:when test="${not empty i.board_subject}">
                      <a class ="story_${i.board_num}" href="#">
					          <c:choose>
						           <c:when test="${fn:length(i.board_subject) > 10}">
						            <c:out value="${fn:substring(i.board_subject,0,11)}"/>....
						           </c:when>
						           <c:otherwise>
						            <c:out value="${i.board_subject}"/>
						           </c:otherwise> 
					          </c:choose>
                      </a>
                      <div style="color: black;">${i.member_board_nick }</div>
                      </c:when>
                      <c:otherwise>
                      <div style="color: black; height: 20px;"></div>
                      </c:otherwise>
                      </c:choose>
                      <div class="tools">
                      <!-- 별?? -->
                        <div class="rate">
                        <c:choose>
                        
                        	<c:when test="${i.board_like>=5&&i.board_like<15}">
	                          	<span class="active"></span>
	                          	<span></span>
	                          	<span></span>
	                          	<span></span>
	                          	<span></span>
	                       	</c:when>
	                        
	                        <c:when test="${i.board_like>=15&&i.board_like<25}">
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span></span>
	                          	<span></span>
	                          	<span></span>
	                       	</c:when>

	                       	<c:when test="${i.board_like>=25&&i.board_like<35}">
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span></span>
	                          	<span></span>
	                       	</c:when>

	                       	<c:when test="${i.board_like>=35&&i.board_like<45}">
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span></span>
	                       	</c:when>
	                       	
	                       	<c:when test="${i.board_like>=45}">
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                       	</c:when>
	                       	<c:otherwise>
	                       		<span></span>
	                       		<span></span>
	                       		<span></span>
	                       		<span></span>
	                       		<span></span>
	                       	</c:otherwise>
                         </c:choose>
                        </div>
                        <!--Add To Cart Button-->
                        <a class="add-cart-btn" href="#"><span>계획추가</span><i class="icon-shopping-cart"></i></a>
                        
                        
                      </div>
                    </div>
                  </div>
                </div>
                </c:forEach>
                </div>
                </div>
                </section>
              </div>
              <!--Pagination-->
              <ul class="pagination">
            
            <c:if test="${length!=null &&cate!=null}">
             	<!-- 이전 출력 시작 -->
              	<c:if test="${pv.startPage>1}">
              			<c:url var="currPage" value="list.go">
					  <c:param name="currentPage" value="${pv.startPage-pv.blockPage}" />
					  <c:param name="board_category" value="${pv.category }" />
					  </c:url>
                <li class="prev-page"><a class="icon-arrow-left" href="${currPage}"></a></li>
                </c:if>
                <!-- 이전 출력 끝 -->

				<!-- 페이지 출력 시작 -->
                <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">		
                 	  <c:url var="currPage" value="list.go">
					  <c:param name="currentPage" value="${i}" />
					  <c:param name="board_category" value="${pv.category }" />
					  </c:url>
					  
              		  <li>
              		  <a href="${currPage}"> <c:out value="${i}" />
              		  </a></li>
				</c:forEach>
				<!-- 페이지 출력 끝 -->

				<!-- 다음 출력 시작 -->
                <c:if test="${pv.totalPage>pv.endPage}">
                <c:url var="currPage" value="list.go">
					  <c:param name="currentPage" value="${pv.startPage+pv.blockPage}" />
					  <c:param name="board_category" value="${pv.category }" />
					  </c:url>
                <li class="next-page"><a class="icon-arrow-right" href="${currPage }"></a></li>
                </c:if>
                <!--  다음 출력 끝 -->
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
    