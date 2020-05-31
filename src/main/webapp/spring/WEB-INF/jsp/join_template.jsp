<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<div>
<form class="join-form">
	<table>
		<tr>
			<th>이름</th>
			<td><input type="text" placeholder="홈페이지에서 쓰일 이름을 입력 하세요"></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" placeholder="로그인 아이디를 입력 하세요"></td>
		</tr>
		<tr>
			<th>암호</th>
			<td><input type="password" placeholder="암호를 입력 하세요"></td>
		</tr>
		<tr>
			<th>암호 재입력</th>
			<td><input type="password" placeholder="암호를 다시 입력 하세요"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" placeholder="아이디 및 암호를 찾기 위한 이메일을 입력해 주세요"></td>
		</tr>
		<tr>
			<th>관심사</th>
			<td>
			<a><input type="checkbox">배낭 여행</a>
			<a><input type="checkbox">자전거 여행</a>
			<a><input type="checkbox">맛집 여행</a>
			<a><input type="checkbox">기차 여행</a><br/>
			<a><input type="checkbox">관광 여행</a>
			<a><input type="checkbox">지하철 여행</a>
			<a><input type="checkbox">후기 여행</a>
			<a><input type="checkbox">시즌 여행</a><br/>
			<a><input type="checkbox">국내 여행</a>
			<a><input type="checkbox">한국사 여행</a><br/>
			<a><input type="checkbox">해외 여행</a>
			<a><input type="checkbox">해외사 여행</a><br/>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="가입"></td>
		</tr>
	</table>
</form>
</div>
