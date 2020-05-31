<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
      var choice = 1;
      function boardChange(choice) {
      	if(choice==1){
      		document.getElementById("contents-board").innerHTML = "";
      		$('#contents-board').load('listTest.go');
      	}
      	else if(choice==2){
      		document.getElementById("contents-board").innerHTML = "";
      		$('#contents-board').load('tourMap.go');
      	}
      	else if(choice==3)
      		document.getElementById("contents-board").innerHTML = "후기";
      	else if(choice==4)
      		document.getElementById("contents-board").innerHTML = "수정";
      }
      <c:forEach items="${aList}" var="num">
     	$('#modal_img_'+"<c:out value="${num.board_num}" />").click(function(){
    	  $('#modal_head').text("<c:out value="${num.board_subject}" />");
    	  $('#modal_sub').text("<c:out value="${num.board_subject}" />");
    	  $('#modal_nick').text("<c:out value="${num.member_board_nick}" />");
     	 });
      </c:forEach>
</script>

<!--Catalog Grid-->
      <section class="catalog-grid">
      	<div class="container col-lg-12 col-md-9 col-sm-12">
        	<h2>나의 여행</h2>
          <div class="row">
          <c:forEach items="${aList}" var="dto">
            <!--Tile-->
          	<div class="col-lg-4 col-md-6 col-sm-12">
            	<div class="tile">
              	<div class="price-label">여행지</div>
              	<a href="#" data-toggle="modal" data-target="#part_01" id="modal_img_${dto.board_num}">
              	<c:if test="${dto.board_upload!=null }">
              	<img height="285px" src="temp/${dto.board_upload }">
              	</c:if>
              	<c:if test="${dto.board_upload==null }">
              	<img src="resources/imgs/catalog/1.png" alt="1"/>
              	</c:if>
              	</a>
              	<!--Modal--> 
			    <div class="modal fade" id="part_01" tabindex="-1" role="dialog" aria-hidden="true">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="font-size: 50px;"><i class="fa fa-times"></i></button>
			      <div class="modal-dialog" style="width: 1140px;">
			        <div class="modal-content">
			        <div class="modal-header">
		<h2 id="modal_head"></h2>
	</div>
	<div class="modal-body">
		<!-- modal-body -->
		<!--Catalog Grid-->
		<section class="catalog-grid">
			<div class="contain-notice">
				<div class="row">
					<!--Filters-->
					<div class="filters-mobile col-lg-3 col-md-3 col-sm-4"
						style="width: 15%;">
						<div class="shop-filters">
							<a style="width: 145px; height: 160px;"><img
								src="resources/imgs/catalog/1.png"></a>
							<div class="footer">
								<a href="#" id="modal_sub"></a>
								<span id="modal_nick"></span>
								<div class="tools">
									<div class="rate">
										<span class="active"></span> <span class="active"></span> <span
											class="active"></span> <span class="active"></span> <span></span>
									</div>

								</div>
								<div class="tools">
									<!--Add To Cart Button-->
									<a class="add-cart-btn" href="#"><span>여행 추가</span><i
										class="icon-shopping-cart"></i></a>
									<!--Add To Wishlist Button-->
									<a class="wishlist-btn" href="#">
										<div class="hover-state">추천하기</div> <i class="fa fa-plus"></i>
									</a>
								</div>
							</div>
							<!-- 버튼 타입 -->
							<button class="side-menu-01" onclick="boardChange(1)">여행앨범</button>
							<button class="side-menu-01" onclick="boardChange(2)">여행계획</button>

							<!-- a 타입 -->
							<a class="side-menu-01" href="#" onclick="boardChange(3)">후기</a>
							<a class="side-menu-01" href="#" onclick="boardChange(4)">수정</a>
						</div>
					</div>
					<!--Tiles-->
					<div class="col-lg-9 col-md-9 col-sm-8" style="width: 80%">
						<div class="row" style="margin-left: 15px;">
							<!--Categories-->
							<section class="cat-tiles">
								<div class="contain-notice" id="contents-board"></div>
							</section>
							<!--Categories Close-->
						</div>
						<!-- modal-body div class="row"  -->
						<!--  <!--Pagination
<ul class="pagination">
  <li class="prev-page"><a class="icon-arrow-left" href="#"></a></li>
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li class="next-page"><a class="icon-arrow-right" href="#"></a></li>
</ul> -->
					</div>
					<!-- modal-body div class="col-lg-9 col-md-9 col-sm-8" -->
				</div>
				<!-- modal-body row -->
			</div>
			<!-- modal-body contain-notice -->
		</section>
		<!-- modal-body Catalog Grid Close-->
	</div>
	<!-- modal-body -->
			        </div><!-- /.modal-content -->
			      </div><!-- /.modal-dialog -->
			    </div><!-- /.modal -->
			    
                <div class="footer">
                  <c:choose>
                     <c:when test="${not empty dto.board_subject}">
                      <a class ="story_${dto.board_num}" href="#">
					          <c:choose>
						           <c:when test="${fn:length(dto.board_subject) > 10}">
						            <c:out value="${fn:substring(dto.board_subject,0,11)}"/>....
						           </c:when>
						           <c:otherwise>
						            <c:out value="${dto.board_subject}"/>
						           </c:otherwise> 
					          </c:choose>
                      </a>
                     
                      </c:when>
                      <c:otherwise>
                      <span style="height: 20px;"></span>
                      </c:otherwise>
                      </c:choose>
                  <div class="tools">
                  	<div class="rate">
                     <c:choose>
                        
                        	<c:when test="${i.board_like>=10&&i.board_like<30}">
	                          	<span class="active"></span>
	                          	<span></span>
	                          	<span></span>
	                          	<span></span>
	                          	<span></span>
	                       	</c:when>
	                        
	                        <c:when test="${i.board_like>=30&&i.board_like<50}">
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span></span>
	                          	<span></span>
	                          	<span></span>
	                       	</c:when>

	                       	<c:when test="${i.board_like>=50&&i.board_like<70}">
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span></span>
	                          	<span></span>
	                       	</c:when>

	                       	<c:when test="${i.board_like>=70&&i.board_like<90}">
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span></span>
	                       	</c:when>
	                       	
	                       	<c:when test="${i.board_like>=90}">
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
          
           <!-- 제일 밖 페이징 Pagination-->
              <ul class="pagination">
            
            <c:if test="${length!=null }">
             	<!-- 이전 출력 시작 -->
              	<c:if test="${pv.startPage>1}">
                <li class="prev-page"><a class="icon-arrow-left" href="listTest.go?currentPage=${pv.startPage-pv.blockPage}"></a></li>
                </c:if>
                <!-- 이전 출력 끝 -->

				<!-- 페이지 출력 시작 -->
                <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">		
                 	  <c:url var="currPage" value="listTest.go">
					  <c:param name="currentPage" value="${i}" />
					  </c:url>
					  
              		  <li>
              		  <a href="${currPage}"> <c:out value="${i}" />
              		  </a></li>
				</c:forEach>
				<!-- 페이지 출력 끝 -->

				<!-- 다음 출력 시작 -->
                <c:if test="${pv.totalPage>pv.endPage}">
                <li class="next-page"><a class="icon-arrow-right" href="listTest.go?currentPage=${pv.startPage+pv.blockPage}"></a></li>
                </c:if>
                <!--  다음 출력 끝 -->
                </c:if>
              </ul>
          </div>
        </div>
      </section><!--Catalog Grid Close-->
