<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>로그인</title>
<script src="resources/js/jquery-2.2.3.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$('#story').bind('click', tou);
		$('#tour').bind('click', log);
	});
	
	function tou() {
		$('#frm').attr('action', "tourForm.do").submit();
	}

	function log() {
		var frmdata = $('#frm').serialize();

		$.ajax({
			type : 'POST',
			url : 'tourloginProcess.do',
			data : frmdata,
			dataType : 'json',
			success : function(result) {
				alert("success");
				if (result.che == 1) {
					alert("로그인  성공");
					/* $('#login').css('visibility','hidden');
					$('#logout').css('visibility','visible'); */
				} else {
					alert("로그인 실패");
				}
			}			
		});		
	}//end log
	
	function pwc() {
		$('#frm').attr('action', "tourloginProcess.do").submit();
	}
</script>

</head>
<body>

	<br>
	<!-- action="/session.do" -->
	<form name="frm" id="frm" method="post">

		<P align="center">

			<FONT size="6"><B>로그인 페이지</B></FONT>

		</P>

		<table border="0" align="center" cellspacing="1" bgcolor="PapayaWhip"
			width="300" height="150" id="login">
			<tr>
				<td colspan="2" bgcolor="PeachPuff" align="center" height="30">
					<b>로그인 확인</b>
				</td>
			</tr>
			<tr align="center">
				<td bgcolor="PeachPuff" width="100">아이디</td>
				<td><input type="text" id="id" name="id" size="12"
					maxlength="12"></td>
			</tr>

			<tr align="center">
				<td bgcolor="PeachPuff">비밀번호</td>
				<td><input type="password" id="pw" name="pw" size="12"
					maxlength="12"></td>
			</tr>
			
			<tr>
				<td colspan="2" bgcolor="PeachPuff" align="center" height="30">
					<input type="button" value="로그인" id="tour"> 
					<input type="button" value="회원 가입" id="story"> 
					<input type="button" value="아이디/비번찾기" id="passAndId" onclick="javascript:location.href='/tourstory/pwHelp.do';"> 
				</td>
			</tr>
		</table>
		
		<table border="0" align="center" cellspacing="1" bgcolor="PapayaWhip"
			width="300" height="150" id="logout" style="visibility: hidden;">
			<tr>
				<td colspan="2" bgcolor="PeachPuff" align="center" height="30">
					<b>${sessionScope.nick}</b>님 로그인
				</td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="PeachPuff" align="center" height="30">
					<input type="button" value="로그아웃" id="logoutBtn"/>
				</td>
			</tr>
		</table>

	</form>
</body>
</html>
