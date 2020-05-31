<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

				
			<section class="catalog-grid">
      	<div class="container">
        	<h2 style="margin-top: 50px;">추천여행</h2>
          <div class="row">		
          <c:forEach var="i" items="${aList}">	
					<!--Tiles-->
          	<div class="col-lg-4 col-md-4 col-sm-6">
            	<div class="tile">
              	<div class="price-label">
              		<c:if test="${i.board_category=='korea'}">국내여행 </c:if>
            	 	<c:if test="${i.board_category=='abroad'}">해외여행</c:if>
		             <c:if test="${i.board_category=='season'}">시즌여행</c:if>
		             <c:if test="${i.board_category=='reply'}">후기여행</c:if> 
		             <c:if test="${i.board_category=='koreaH'}">한국사여행</c:if>
		             <c:if test="${i.board_category=='abroadH'}">해외사여행</c:if>
		             <c:if test="${i.board_category=='trip'}">관광명소</c:if>
		             <c:if test="${i.board_category=='food'}">맛집여행</c:if>
		             <c:if test="${i.board_category=='train'}">기차여행</c:if>
		             <c:if test="${i.board_category=='cycle'}">자전거여행</c:if>
		             <c:if test="${i.board_category=='pack'}">배낭여행</c:if>	
		             <c:if test="${i.board_category=='subway'}">지하철여행</c:if>
              	</div>
              	<c:url var="content" value="view.go">
							 <c:param name="currentPage" value="1"/>
							 <c:param name="num" value="${i.board_num}"/>
							 <c:param name="board_category" value="${i.board_category}" />					 
							</c:url>
                    <a href="${content}">
              	<img width="350px" height="300px" src="http://syronia.iptime.org/tourimgs/temp/${i.board_subject}/${i.board_upload}"></a>	     	
            	<div>
            	
                      <div class="footer" >
                	<span style="color: black; font-size: 25px;">
                		<c:choose>
						  <c:when test="${fn:length(i.board_subject) > 10}">
						   <c:out value="${fn:substring(i.board_subject,0,10)}"/>...</br>
						  </c:when>
						<c:otherwise>
						   <c:out value="${i.board_subject}"/>
						</c:otherwise> 
					          </c:choose>
                	</span>
                  <span style="font-size: 17px;">${i.member_board_nick }</span>
                  <div class="tools">
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
                   
                  </div>
                </div>
                
                </div>
                
              </div>
              </div>
                </c:forEach>
                </div>
				
		</div>
	
</section>
