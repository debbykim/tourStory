<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<html>
<script type="text/javascript">
$(document).ready(function() {
	var Page = ${pv.currentPage}
	var length = parseInt($('#len').val());
	var numlist=[];
	
	
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
				$('.storyview').html(res)
			}
		});
	});
	})
	
});
</script>
</html>

<h2>Browse categories</h2>
        	<div class="row">
        	<div class="storyview">
            		
            </div>
        	<input type="hidden" id="len" value="${length}" />
        	
        	<c:forEach var="i" items="${aList}" varStatus="status">
        	<input type="hidden" id="numlist_${status.index}" value="${i.board_num}" >
          	<!--Category-->
          	<div class="category col-sm-3 col-xs-6">
            	<%-- <c:url var="content" value="view.go">
							 <c:param name="currentPage" value="${pv.currentPage}"/>
							 <c:param name="num" value="${i.board_num}"/>					 
							</c:url> --%>
                <a href="#" class="story_${i.board_num}">
                <img height="220px" src="temp/${i.board_upload }">
                <p>${i.board_subject}</p>
                </a>
                
                </div>
             </c:forEach>
            
          	<!--Category-->
          	<div class="category col-sm-3 col-xs-6">
            	<a href="#">
                <img src="resources/imgs/categories/1.png" alt="1"/>
                <p>Category name</p>
              </a>
            </div>
          	<!--Category-->
          	<div class="category col-sm-3 col-xs-6">
            	<a href="#">
                <img src="resources/imgs/categories/1.png" alt="1"/>
                <p>Category name</p>
              </a>
            </div>
          	<!--Category-->
          	<div class="category col-sm-3 col-xs-6">
            	<a href="#">
                <img src="resources/imgs/categories/1.png" alt="1"/>
                <p>Category name</p>
              </a>
            </div>
          	<!--Category-->
          	<div class="category col-sm-3 col-xs-6">
            	<a href="#">
                <img src="resources/imgs/categories/1.png" alt="1"/>
                <p>Category name</p>
              </a>
            </div>
          	<!--Category-->
          	<div class="category col-sm-3 col-xs-6">
            	<a href="#">
                <img src="resources/imgs/categories/1.png" alt="1"/>
                <p>Category name</p>
              </a>
            </div>
          </div>