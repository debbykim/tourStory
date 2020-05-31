<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	$('#back').bind('click',log);
	$('#join').bind('click',joi);
	$('.nidC').bind('click',nidCheck);
	$('.idC').bind('click',idCheck);
	$('.emailee').change(function(){
		$('.emailer').val($('.emailee').val());
	});
});
	
function log(){	
	$('#ba').attr('action',"tourloginForm.do").submit();
}

function joi(){
	$('#joinF').attr('action',"ymneu.do").submit();
}

	//닉네임 중복체크
	function nidCheck() {
		var param = "member_nid" + "=" + $("#member_nid").val();
		var text = $("#member_nid").val();
		var regexp = /[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]{2,}/g; // 숫자,영문,한글
			if (regexp.test(text) == false) {
				alert("두글자 이상이어야 합니다.");
				return false;
			}		
			$.ajax({
				type : 'GET',
				dataType : 'text',
				url : 'nidCheck.do?member_nid='+text,
				success:function(res){								
					$("#nidchk").html(res);
						
					if ($("#nidchkw").html() == "0") {
						alert("닉네임이 중복이 되지 않습니다. 쓰셔도 됩니다.")
					} else {
						alert("닉네임이 중복이 됩니다. 다시 입력 해주세요");
						return false;
					}
				}
			});
	}
	//아이디 중복체크
	function idCheck() {
		var param = "member_id" + "=" + $("#member_id").val();
		var text = $("#member_id").val();
		var regexp = /[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]{2,}/g; // 숫자,영문,한글
			if (regexp.test(text) == false) {
				alert("두글자 이상이어야 합니다.");
				return false;
			}		
			$.ajax({
				type : 'GET',
				dataType : 'text',
				url : 'idCheck.do?member_id='+text,
				success:function(res){								
					$("#idchk").html(res);
					
					if ($("#idchkw").html() == "0") {
						alert("아이디가 중복이 되지 않습니다. 쓰셔도 됩니다.")
					} else {
						alert("아이디가 중복이 됩니다. 다시 입력 해주세요");
						return false;
					}
				}
			});
	}
			
	function formCheck() {
		var member_id = document.getElementById('member_id');
		var password = document.getElementById('password');
		var password_hint = document.getElementById('password_hint');
		var password_check = document.getElementById('password_check');
		var hp1 = document.getElementById('hp1');
		var hp2 = document.getElementById('hp2');
		var hp3 = document.getElementById('hp3');
		var hp = hp1.value + "-" + hp2.value + "-" + hp3.value;
		/*핸드폰 번호 길이 체크*/
		if (member_id.value == '' || member_id.value == null) {
			alert('ID를 입력하세요');
			focus.member_id;
			return false;
		}
		if (password.value == '' || password.value == null) {
			alert('비밀번호를 입력하세요');
			focus.password;
			return false;
		}
		if (password_check.value == '' || password_check.value == null) {
			alert('비밀번호확인란을 입력하세요');
			focus.password_hint;
			return false;
		}
		/*비밀번호와 비밀번호확인란 같은지 확인*/
		if (password.value != password_check.value) {
			alert("비밀번호와 비밀번호 확인란이 다릅니다.");
			focus.passowrd;
			return false;
		}
		if (password_hint.value == '' || password_hint.value == null) {
			alert('비밀번호힌트를 입력하세요');
			focus.password_hint;
			return false;
		}
		/*핸드폰 번호 길이 체크*/
		if (hp2.value.length <= 2 || hp3.value.length != 4) {
			alert("휴대폰번호를 제대로 입력해주세요");
			focus.hp2;
			return false;
		}
		/*핸드폰이 숫자만 들어가는지 체크*/
		if (isNaN(hp2.value) || isNaN(hp3.value)) {
			alert("휴대폰번호는 숫자만 들어갈 수 있습니다.");
			return false;
		}
		/**/
		if (hp2.value.length > 2 || hp3.value.length == 4) {
			document.getElementById("member_HP").value = hp;
		}
		if (count == 0) {
			alert("중복확인을 눌러주세요");
			return false;
		} else {
			save();
		}
	}
	function init() {
		
	}
	function save() {
		// 		alert($("#password_hint").val());
		// 		alert($("#member_HP").val());
		var str3 = document.getElementById('join');
		str3.submit();
		alert("가입이 완료되었습니다.")
	}
	function countCheck() {
		if (count == 1) {
			count = 0;
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body bgcolor="#ffffff" text="#000000">
	<P align="center">
		<FONT size="6"><B>회원 가입서</B></FONT>
	</P>
	<form id="ba"></form>
	<form method="post" id="joinF">
		<table width="550" align="center" border="1" bordercolor="ADD8E6"
			cellpadding="5">
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">닉네임</td>
				<td bgcolor="#E0FFFF"><input type="text" size="10"
				id="member_nid" name="member_nid" maxlength="10">&nbsp;
				<input type="button" value="중복확인" class="nidC"></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">아이디</td>
				<td bgcolor="#E0FFFF"><input type="text" size="10"
				id="member_id" name="member_id" maxlength="10">&nbsp;<input
				type="button" value="중복확인" class="idC"></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">비밀번호</td>
				<td bgcolor="#E0FFFF"><input type="password" id="password"
				name="member_password" size=12 maxlength="12"></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">비밀번호확인</td>
				<td bgcolor="#E0FFFF"><input type="password"
					id="password_check" name="password_check" size=12 maxlength="12"></td>
			</tr>
			<tr>
				<td height="30" align="center" bgcolor="#FFDEAD">이메일</td>
				<td bgcolor="#E0FFFF">
				<input type="text" id="member_email" name="member_email" size=12 maxlength="30">
				<span>@</span>
				<input type="text" class="emailer" name="email2" size=12>
				<select style="width : 100px;" class = "emailee" >
				<option value="" selected="selected" >이메일 선택</option>
				<option value="naver.com" >naver.com</option>
				<option value="daum.net" >daum.net</option>
				<option value="nate.com" >nate.com</option>
				<option value="hotmail.com" >hotmail.com</option>
				<option value="yahoo.com" >yahoo.com</option>
				<option value="empas.com" >empas.com</option>
				<option value="korea.com" >korea.com</option>
				<option value="dreamwiz.com" >dreamwiz.com</option>
				<option value="gmail.com" >gmail.com</option>
				<option value="">직접입력</option>
			</select>
				</td>
			</tr>
			
			<!-- 사용여부 보류 -->
			<!-- <tr>
				<td height="30" align="center" bgcolor="#FFDEAD">관심사 선택</td>
				<td bgcolor="#E0FFFF">
				<input type=checkbox name=check value="배낭여행">배낭여행
				<input type=checkbox name=check value="졸업여행">졸업여행
				<input type=checkbox name=check value="수학여행">수학여행
				<input type=checkbox name=check value="가족여행">가족여행	
				<input type=checkbox name=check value="솔로여행">솔로여행
				<input type=checkbox name=check value="맛집탐방">맛집탐방
				<input type=checkbox name=check value="역사여행">역사여행
				</td>
			</tr> -->
			<tr>
				<td colspan="2" height="30" align="center" bgcolor="#FFDEAD">
				<div id="nidchk" style="display: none"></div>
				<div id="idchk" style="display: none"></div>
				<input type="button" id="join" name="join" value="가입하기">&nbsp;&nbsp; 
				<input type="reset" value="리셋하기">&nbsp;&nbsp; 
				<input type="button" id="back" value="뒤로가기"></td>
			</tr>
		</table>
	</form>
</body>
</html>
