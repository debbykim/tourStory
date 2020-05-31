<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
				//alert("들어오니??");
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
	
	/*
	function deleteRun() {
		$('#frm').attr('action', "delete.go").submit();
	}*/
	
	</script>
</head>
<body>
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
	<form name="frm" id="frm" method="post" action="updateMap.go" style= "float: right">	 
	    <input type="hidden" name="num" id="num" value="${numc}" />	
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" />
		<input type="hidden" name="category" value="${cate}" /> 
		<input type="hidden" name="member_schedule_nick" value="${sessionScope.nick}" />
		<input type="hidden" name="schedule_name" value="${dto.board_subject}"/>
		<input type="hidden" name="board_subject" value="${dto.board_subject}"/>
		

		<c:if test="${sessionScope.nick==nic}">
		<input type="submit" id="update" value="수정" />
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
		
</body>
</html>
				


