<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
//현재 댓글페이지 
$('.current').click(function(){
	current = $(this).text();
	num = ${numc};
	$.ajax({
		type:'get',
		url:'replylistview.go?Reply='+current+"&num="+num,
		success:function(res){
			$('.reply_view').empty();
			$('.reply_view').html(res)
		}});
});

//이전 댓글 페이지 
$('.before').click(function(){
	current = $('#start').val();
	num = ${numc};
	
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
	num = ${numc};
	$.ajax({
		type:'get',
		url:'replylistview.go?Reply='+current+"&num="+num,
		success:function(res){
			$('.reply_view').empty();
			$('.reply_view').html(res)
		}
	});
});//
</script>
<body>
		<input type="hidden" name="start" id="start" value="${rv.startReplyPage-rv.blockReplyPage}">
		<input type="hidden" name="end" id="end" value="${rv.startReplyPage+rv.blockReplyPage}">
<table style="margin: auto; margin-top: 30px;">
	<c:forEach var="i" items="${aList}">
	<tr>
		<td>
			${i.member_reply_nick}
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
</body>
</html>
