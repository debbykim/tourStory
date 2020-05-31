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
    
    <script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="resources/js/jquery-ui.js"></script>	
    <link rel="stylesheet" href="resources/css/jquery-ui.css" />
    
    <script type="text/javascript">
	$(document).ready(function() {

	 	$('#update').click(function() {
			$('#frm').attr('action', 'updateMap.go').submit();
		}); 
		/*$('#delete').bind('click', deleteRun);*/
	
		var currentP = ${currentPage};
		var num = ${numc};
		var current = 0;

			$('#like').click(function(){
				$.ajax({
					type:'get',
					url:'like.go?currentPage='+currentP+'&num='+num,
					success:function(res){
						$('.likevalue').empty();
						$('.likevalue').html(res)
					}
				})
			});
			//현재 댓글페이지  
			$('.current').click(function(){
				current = $(this).text();
				$.ajax({
					type:'get',
					url:'replylistview.go?Reply='+current+"&num="+num,
					success:function(res){
						$('.reply_view').empty();
						$('.reply_view').html(res)
					}
				});
			});	
			
			//다음 댓글 페이지
			$('.after').click(function(){
				current = $('#end').val();
				$.ajax({
					type:'get',
					url:'replylistview.go?Reply='+current+"&num="+num,
					success:function(res){
						$('.reply_view').empty();
						$('.reply_view').html(res)
					}
				});
			});//
			
			$('#reply').click(function(){	
				
				currentP = ${currentPage};
				var num = ${numc};
				var cont = $('#reply_content').val();
				if($('#reply_content').val()==null||$('#reply_content').val()==""){
					alert("댓글을 입력해주세요.")
					
				}else{
				$.ajax({
					type:'POST',
					url:'replyview.go',
					data:'currentPage='+currentP+'&num='+num+'&content='+cont,
					success:function(res){
						$('textarea#reply_content').val("");
						$('.reply_view').empty();
						$('.reply_view').html(res)
					}
				});
				}//end else
				
				
			});//click
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
            	 <h2 id="notice_mainTitle" class="text-center-mobile notice_mainTitle" style="margin-bottom: 5px;">
            	 	<c:if test="${cate=='korea'}">국 내 여 행 </c:if>
		             <c:if test="${cate=='abroad'}">해 외 여 행</c:if>
		             <c:if test="${cate=='season'}">시 즌 여 행</c:if>
		             <c:if test="${cate=='reply'}">	후 기 여 행</c:if> 
		             <c:if test="${cate=='koreaH'}">한 국 사 여 행</c:if>
		             <c:if test="${cate=='abroadH'}">해 외 사 여 행</c:if>
		             <c:if test="${cate=='trip'}">관 광 명 소</c:if>
		             <c:if test="${cate=='food'}">맛 집 여 행</c:if>
		             <c:if test="${cate=='train'}">기 차 여 행</c:if>
		             <c:if test="${cate=='cycle'}">자 전 거 여 행</c:if>
		             <c:if test="${cate=='pack'}">배 낭 여 행</c:if>	
		             <c:if test="${cate=='subway'}">지 하 철 여 행 </c:if>
		             <c:if test="${cate==null }">검 색 결 과</c:if>
		         </h2>
<table border="1">
		<tr>
			<th width="80px" style="text-align: center;">글쓴이</th>
			<td>${dto.member_board_nick}</td>
			<th width="80px" style="text-align: center;">조회수</th>
			<td width="60px" style="text-align: center;">${dto.board_readcount}</td>
			<th width="80px" style="text-align: center;">등록일</th>
			<td width="100px" style="text-align: center;">${dto.board_date}</td>
		</tr>

		<tr>        
			<th style="text-align: center;">제목</th>
			<td colspan="3">
			 <c:choose>
						  <c:when test="${fn:length(dto.board_subject) > 20}">
						   <c:out value="${fn:substring(dto.board_subject,20,25)}"/></br>
						   <c:out value="${fn:substring(dto.board_subject,26,fn:length(dto.board_subject))}"/>
						  </c:when>
						<c:otherwise>
						   <c:out value="${dto.board_subject}"/>
						</c:otherwise> 
					          </c:choose>
			</td>
			<th style="text-align: center;">추천수</th>
			<td class="likevalue">${dto.board_like}</td>
		</tr>

		<tr>
			<th style="text-align: center;">내용</th>
			<td colspan="5">${dto.board_content}</td>
		</tr>
	</table>
	<form name="frm" id="frm" method="post" action="" style= "float: right">	 
	    <input type="hidden" name="num" id="num" value="${numc}" />	
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" />
		<input type="hidden" name="category" value="${cate}" /> 
		<input type="hidden" name="member_schedule_nick" value="${sessionScope.nick}" />
		<input type="hidden" name="schedule_name" value="${dto.board_subject}"/>
		<input type="hidden" name="board_subject" value="${dto.board_subject}"/>
		

		<c:if test="${sessionScope.nick==nic}">
		<input type="button" id="update" value="수정" />
		</c:if>
		<c:if test="${sessionScope.nick!=nic}">
		<input type="button" id="like" value="좋아요">
		</c:if>
	</form>
	
	<form name="frm1" id="frm1" method="get" action="delete.go"style= "float: right">
	  <input type="hidden" name="num" id="num" value="${numc}" />	
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" />
		<input type="hidden" name="category" value="${cate}" />
		<input type="hidden" id="sch_nick" name="member_schedule_nick" value="${sessionScope.nick}" />
		<c:if test="${sessionScope.nick=='HOHOHO' }">
		<input type="submit" id="delete" value="삭제" />
		</c:if> 
		<c:if test="${sessionScope.nick==nic&&sessionScope.nick!='HOHOHO'}">
		<input type="submit" id="delete" value="삭제" />	
		</c:if>
		<c:if test="${sessionScope.nick!=nic}">
		</c:if>
	</form>
	
		<form name="frm1" id="frm1" method="post" action="closed.go"style= "float: right">
	  	<input type="hidden" name="num" id="num" value="${numc}" />	
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" />
		<input type="hidden" name="category" value="${cate}" />
		<input type="hidden" id="sch_nick" name="member_schedule_nick" value="${sessionScope.nick}" /> 
		<c:if test="${sessionScope.nick==nic&&close==1}">
		<input type="hidden" name="board_close" value="0" />
		<input type="submit" id="open" value="공개" />	
		</c:if>
		<c:if test="${sessionScope.nick==nic&&close==0}">
		<input type="hidden" name="board_close" value="1" />
		<input type="submit" id="close" value="비공개" />	
		</c:if>
	</form>
	
	<form name="replyMain" id="replyMain" method="post" > 
	<table style="margin: auto; margin-top: 30px;">
	<c:if test="${not empty sessionScope.nick}"> 
	<tr>
		<td style="width: 520px; ">
			<textarea  class="reply_content" name="reply_content" id="reply_content" rows="5" cols="60" style="top: 50px; font-size: 17px;resize:none; margin: auto;"></textarea>
		</td>
		<td>
			<input type="button" id="reply" style="height: 100px; display:inline-block; left: 500px"  value="댓글등록">
		
			<input type="hidden" name="num" value="${dto.board_num}" />
			<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" /> 
		</td>
	</tr>
 </c:if> 
	</table>
	</form>
	<div class="reply_view">
		<input type="hidden" name="start" id="start" value="${rv.startReplyPage-rv.blockReplyPage}">
		<input type="hidden" name="end" id="end" value="${rv.startReplyPage+rv.blockReplyPage}">
		<table style="margin: auto; margin-top: 30px;">
	<c:forEach var="i" items="${aList}">
	<tr>
		<td>
			닉네임:${i.member_reply_nick}
		</td>
		<td>
			${i.reply_content}
		</td>
		<td>
			${i.reply_date}
		</td>
	</tr>
	</c:forEach>
	</table>
	<c:if test="${rv.totalReply>=1 }">
	<ul class="pagination">
		<c:if test="${rv.startReplyPage>1}">
			 <li class="prev-page"><a href="#" class="icon-arrow-left before">이전</a></li>
		</c:if>
		<!-- 이전 출력 끝 -->
		<!-- 페이지 출력 시작 -->
		<c:forEach var="i" begin="${rv.startReplyPage}" end="${rv.endReplyPage}">
			<c:choose>
			<c:when test="${rv.currentReply != i}">
			<li><a href="#" class="current"><c:out value="${i}" /></a></li>
			</c:when>
			<c:otherwise>
			<li class="active"><a href="#" class="current"><c:out value="${i}" /></a></li>
			</c:otherwise>
			</c:choose>
		</c:forEach>
		<!-- 페이지 출력 끝 -->

		<!-- 다음 출력 시작 -->
		<c:if test="${rv.totalReplyPage>rv.endReplyPage}">
			<li class="next-page"><a href="#" class="icon-arrow-right after">다음</a></li>
		</c:if>	
</ul>
</c:if>
	</div>
		         	            	
            	<div>      	
            	<c:forEach var="i" items="${pList}" varStatus="status">

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
            
            <c:if test="${length!=null }">
             	<!-- 이전 출력 시작 -->
              	<c:if test="${pv.startPage>1}">
                <li class="prev-page"><a class="icon-arrow-left" href="list.go?currentPage=${pv.startPage-pv.blockPage}"></a></li>
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
                <li class="next-page"><a class="icon-arrow-right" href="list.go?currentPage=${pv.startPage+pv.blockPage}"></a></li>
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
    
