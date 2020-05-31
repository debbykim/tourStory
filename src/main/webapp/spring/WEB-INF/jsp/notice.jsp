<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<style>
	.notice-container{
		width: 100%;
		height: 100%;
		
	} 
	.notice-container th, 
	.notice-container td{
		line-height: 30px;
		border: solid 1px;
		
	}
	.notice-container table{
		border-collapse: collapse;
	}
	
	.notice-container th{
		
	}
	
	.notice-container td{
		
	}
	.notice-num{
		width: 50px;
		text-align: center;
	}
	.notice-title{
		width: 300px;
	}
	.notice-hit{
		width: 50px;
		text-align: center;
	}
	.notice-writer{
		width: 150px;
		text-align: center;
		
	}
</style>

<div class="notice-container">
	
	 <table>
		<tr>
			<th class="notice-num">번호</th>
			<th class="notice-title">제목</th>
			<th class="notice-hit">조회수</th>
			<th class="notice-writer">작성자</th>
		</tr>
		<tr>
			<td>1</td>
			<td>공지 사항 입니다.</td>
			<td>12</td>
			<td>관리자</td>
		</tr>
	</table> 
</div>
