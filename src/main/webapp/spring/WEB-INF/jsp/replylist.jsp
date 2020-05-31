<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>

	<!-- 이전 출력 시작 -->
		<c:if test="${rv.startReplyPage>1}">
		
			<a href="#" class="before">이전</a>
		</c:if>
		<!-- 이전 출력 끝 -->

		<!-- 페이지 출력 시작 -->
		<c:forEach var="i" begin="${rv.startReplyPage}" end="${rv.endReplyPage}">
			<a href="#" class="current"><c:out value="${i}" />qqq</a>
		</c:forEach>
		<!-- 페이지 출력 끝 -->

		<!-- 다음 출력 시작 -->
		<c:if test="${rv.totalReplyPage>rv.endReplyPage}">
		
			<a href="#" class="after">다음</a>
		</c:if>
		<!--  다음 출력 끝 -->

</body>
</html>
