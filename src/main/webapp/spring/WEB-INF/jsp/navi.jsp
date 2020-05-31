<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
	.form-group label{
		font-weight: bold;
	}
	#test-flip{
	
	overflow: hidden;
	}
	
	#test-flip:HOVER {
	overflow: visible;
	}
	.join-check-area input{
		opacity: 1;
	}
</style>
<script type="text/javascript">
var set ;
$(document).ready(function(){
	
	$.ajax({
		type:'get',
		url:'navi.go',
		success:function(res){
			$('#klike_subject').html(res.kList[0].board_subject);
			$('#klike_image').attr('src','http://syronia.iptime.org/tourimgs/temp/'+res.kList[0].board_subject+'/'+res.kList[0].board_upload);
			$('#klike_nick').html(res.kList[0].member_board_nick);
			$('#klike_a').attr('href','view.go?currentPage=1&num='+res.kList[0].board_num+'&board_category='+res.kList[0].board_category);
			
			$('#rlike_subject').html(res.rList[0].board_subject);
			$('#rlike_image').attr('src','http://syronia.iptime.org/tourimgs/temp/'+res.rList[0].board_subject+'/'+res.rList[0].board_upload+'');
			$('#rlike_nick').html(res.rList[0].member_board_nick);
			$('#rlike_a').attr('href','view.go?currentPage=1&num='+res.rList[0].board_num+'&board_category='+res.rList[0].board_category);
			
			$('#hlike_subject').html(res.hList[0].board_subject);
			$('#hlike_image').attr('src','http://syronia.iptime.org/tourimgs/temp/'+res.hList[0].board_subject+'/'+res.hList[0].board_upload+'');
			$('#hlike_nick').html(res.hList[0].member_board_nick);
			$('#hlike_a').attr('href','view.go?currentPage=1&num='+res.hList[0].board_num+'&board_category='+res.hList[0].board_category);
			
			$('#tlike_subject').html(res.tList[0].board_subject);
			$('#tlike_image').attr('src','http://syronia.iptime.org/tourimgs/temp/'+res.tList[0].board_subject+'/'+res.tList[0].board_upload+'');
			$('#tlike_nick').html(res.tList[0].member_board_nick);
			$('#tlike_a').attr('href','view.go?currentPage=1&num='+res.tList[0].board_num+'&board_category='+res.tList[0].board_category);
		}
	});
	
	
	
	$('#join_name').focus(function(){
		set = setInterval(function(){
			if($('#join_name').val() != ""){
			$.ajax({
				type:'post',
				url:'nidCheck.do',
				data:'join_name='+$('#join_name').val(),
				success:function(result){
					if(result.check_name == 1){
						$("label[for='log-nickname']").children().remove();
						$("label[for='log-nickname']").append("<span style='color:red;position: relative;left:120px;'>닉네임이 중복됩니다.</span>");
					}else{
						$("label[for='log-nickname']").children().remove();
						$("label[for='log-nickname']").append("<span style='color:blue;position: relative;left:120px;'>사용가능한 닉네임입니다.</span>");
						
					}
				}
			});
			}}, 500);
	});
	
	$('#join_name').focusout(function(){
		clearInterval(set);
	});
	
	$('#join_id').focus(function(){
		set = setInterval(function(){
			if($('#join_id').val() != ""){
			$.ajax({
				type:'post',
				url:'idCheck.do',
				data:'join_id='+$('#join_id').val(),
				success:function(result){
					if(result.check_id == 1){
						$("label[for='log-id']").children().remove();
						$("label[for='log-id']").append("<span style='color:red;position: relative;left:120px;'>사용중인 아이디 입니다.</span>");
					}else{
						$("label[for='log-id']").children().remove();
						$("label[for='log-id']").append("<span style='color:blue;position: relative;left:120px;'>사용가능한 아이디 입니다.</span>");
					}
				}
			});
			}}, 500);
	});
	
	$('#join_id').focusout(function(){
		clearInterval(set);
	});
	
	$('#join_password-re').focus(function(){
		set = setInterval(function(){
			var pass = $('#join_password').val();
			var repass = $('#join_password-re').val();
			if(pass == repass){
				$("label[for='log-password-re']").children().remove();
				$("label[for='log-password-re']").append("<span style='color:blue;position: relative;left:120px;'>비밀번호가 일치합니다.</span>");
			}else{
				$("label[for='log-password-re']").children().remove();
				$("label[for='log-password-re']").append("<span style='color:red;position: relative;left:120px;'>비밀번호가 일치하지 않습니다.</span>");
			}
		}, 500);
	});
	
	$('#join_password-re').focusout(function(){
		clearInterval(set);
	});
	
	$('#join_email').focus(function(){
		set = setInterval(function(){
			var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
			
			if($('#join_email').val() != ""){
				if($('#join_email').val().match(regExp)){
					$.ajax({
					type:'post',
					url:'emailCheck.do',
					data:'join_email='+$('#join_email').val(),
					success:function(result){
					if(result.check_id == 1){
						$("label[for='log-email']").children().remove();
						$("label[for='log-email']").append("<span style='color:red;position: relative;left:120px;'>사용중인 이메일 입니다.</span>");
					}else{
						$("label[for='log-email']").children().remove();
						$("label[for='log-email']").append("<span style='color:blue;position: relative;left:120px;'>사용가능한 이메일 입니다.</span>");
					}
				}
			});
					}else if(!$('#join_email').val().match(regExp)){
						$("label[for='log-email']").children().remove();
						$("label[for='log-email']").append("<span style='color:red;position: relative;left:120px;'>올바른 형식을 입력하세요.</span>");
					}}}, 500);
	});
	$('#join_email').focusout(function(){
		clearInterval(set);
	});
	/* 아이디 비밀번호 찾기 */
	$('#loginModal-button').click(function(){
		var msg = document.getElementById('log_header').innerHTML;
		if(msg!='로그인'){
		$('#log_header').text('로그인');
		$('#frm').empty();
		
		var find ='<div class="form-group group">'
			find += '<label for="log-email">아이디</label>'
			find += '<input type="text" class="form-control" name="id" id="id" placeholder="아이디" size="12"'
			find += 'maxlength="12" required>'
			find += '<a class="help-link" id="find_id" style="cursor: pointer;">아이디 찾기</a>'
			find += '</div>'
			find += '<div class="form-group group">'
			find += '<label for="log-password">암호</label>'
			find += '<input type="password" class="form-control" name="pw" id="pw" placeholder="암호" size="12"'
			find += 'maxlength="12" required>'
			find += '<a class="help-link" id="find_pass" style="cursor: pointer;">암호 찾기</a>'
			find += '</div>'
			find += '<input class="btn btn-success" type="submit" value="Login" id="tour">'

		$('#frm').append(find);

		find ='';
		}
	});
	
	$('#find_id').click(function(){
		$('#log_header').text('아이디 찾기');
		$('#frm').empty();
		var find = '<label>이메일</label>';
		find += '<input type="email" class="form-control" name="member_email" id="member_email" placeholder="가입시 작성한 이메일을 입력해주세요." required>';
		find += '<input class="btn btn-success" type="button" value="확인" id="femail">';
		$('#frm').append(find);
		$('#femail').click(function(){
			$.ajax({
				type:'post',
				url:'pwHelp.do',
				data:'member_email='+$('#member_email').val(),
				success:function(res){
					if(res.id == 0){
						alert('등록하지 않은 회원입니다.');
					}else{
						alert('가입하신 이메일로 아이디를 보내드렸습니다.');
						$('#frm').empty();
						$('#log_header').text('로그인');
						find = '<div class="form-group group">';
			            find +='<label for="log-email">아이디</label>';
			            find +='<input type="text" class="form-control" name="id" id="id" placeholder="아이디" size="12" maxlength="12" required>';
			            find +='<a class="help-link" href="#" id="find_id">아이디 찾기</a>';
			            find +='</div><div class="form-group group">';
			            find +='<label for="log-password">암호</label>';
			            find +='<input type="password" class="form-control" name="pw" id="pw" placeholder="암호" size="12" maxlength="12" required>';
			            find +='<a class="help-link" href="#" id="find_pass">암호 찾기</a></div>';
			            find +='<input class="btn btn-success" type="submit" value="Login" id="tour">';
						$('#frm').append(find);
					}
				}
			});
		});
		find ='';
	});
	
	$('#find_pass').click(function(){
		$('#log_header').text('암호 찾기');
		$('#frm').empty();
		var find = '<label>아이디</label>';
		find += '<input type="text" class="form-control" name="member_id" id="member_id" placeholder="아이디를 입력해주세요." required>';
		find += '<label>이메일</label>';
		find += '<input type="email" class="form-control" name="member_email" id="member_email" placeholder="가입시 작성한 이메일을 입력해주세요." required>';
		find += '<input class="btn btn-success" type="button" value="확인" id="find_pass">';
		$('#frm').append(find);
		$('#find_pass').click(function(){
			$.ajax({
				type:'post',
				url:'findpass_check.do',
				data:'member_id='+$('#member_id').val()+'&member_email='+$('#member_email').val(),
				success:function(res){
					if(res.exist == 0){
						alert('정확한 정보를 입력해 주세요.');
					}else{
						$('#frm').empty();
						$('#log_header').text('새 암호 설정');
						find='<label>새로운 암호</label>';
						find += '<input type="password" class="form-control" name="member_pass" id="member_pass" placeholder="새로운 암호를 입력해주세요." required>';
						find += '<label for="new-password-re">암호 재입력</label>';
						find += '<input type="password" class="form-control" name="member_email" id="member_pass_re" required>';
						find += '<input class="btn btn-success" type="button" value="확인" id="setpass">';
						$('#frm').append(find);

						$('#member_pass_re').focus(function(){
							set = setInterval(function(){
							var pass = $('#member_pass').val();
							var repass = $('#member_pass_re').val();
							if(pass == repass){
								$("label[for='new-password-re']").children().remove();
								$("label[for='new-password-re']").append("<span style='color:blue;position: relative;left:120px;'>비밀번호가 일치합니다.</span>");
							}else{
								$("label[for='new-password-re']").children().remove();
								$("label[for='new-password-re']").append("<span style='color:red;position: relative;left:120px;'>비밀번호가 일치하지 않습니다.</span>");
							}
							}, 500);
						});
	
						$('#member_pass_re').focusout(function(){
							clearInterval(set);
						});
						$('#setpass').click(function(){
							$.ajax({
								type:'post',
								url:'findpass_update.do',
								data:'member_id='+res.exid+'&member_email='+res.exemail+'&member_pass='+$('#member_pass_re').val(),
								success:function(res){
									$('#frm').empty();
									$('#log_header').text('로그인');
									find = '<div class="form-group group">';
						            find +='<label for="log-email">아이디</label>';
						            find +='<input type="text" class="form-control" name="id" id="id" placeholder="아이디" size="12" maxlength="12" required>';
						            find +='<a class="help-link" href="#" id="find_id">아이디 찾기</a>';
						            find +='</div><div class="form-group group">';
						            find +='<label for="log-password">암호</label>';
						            find +='<input type="password" class="form-control" name="pw" id="pw" placeholder="암호" size="12" maxlength="12" required>';
						            find +='<a class="help-link" href="#" id="find_pass">암호 찾기</a></div>';
						            find +='<input class="btn btn-success" type="submit" value="Login" id="tour">';
									$('#frm').append(find);
								}
							});
						});
					}
				}
			});
		});
		find ='';
	});
});
</script>
<!--Header-->
<!--Login Modal-->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
            <h2 id="log_header">로그인</h2>
          </div>
          <div class="modal-body">
          <form class="login-form" name="frm" id="frm" action="tourloginProcess.do" method="post">
            <div class="form-group group">
            	<label for="log-email">아이디</label>
              <input type="text" class="form-control" name="id" id="id" placeholder="아이디" size="12"
					maxlength="12" required>
              <a class="help-link" id="find_id" style="cursor: pointer;">아이디 찾기</a>
            </div>
            <div class="form-group group">
            	<label for="log-password">암호</label>
              <input type="password" class="form-control" name="pw" id="pw" placeholder="암호" size="12"
					maxlength="12" required>
              <a class="help-link" id="find_pass" style="cursor: pointer;">암호 찾기</a>
            </div>
            <input class="btn btn-success" type="submit" value="Login" id="tour">
          </form>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    <!--Join Modal-->
    <div class="modal fade" id="JoinModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
            <h2>회원가입</h2>
          </div>
          <div class="modal-body">
          <form class="join-form" method="post" action="tourJoin.do">
            <div class="form-group group">
            	<label for="log-nickname">이름</label>
              <input type="text" class="form-control" name="member_nickname" id="join_name" placeholder="홈페이지에서 사용될 이름 입니다." required>
            </div>
            <div class="form-group group">
            	<label for="log-id">아이디</label>
              <input type="text" class="form-control" name="member_id" id="join_id" placeholder="로그인시 사용될 아이디명 입니다." required>
            </div>
            <div class="form-group group">
            	<label for="log-password">암호</label>
              <input type="password" class="form-control" name="member_pass" id="join_password" placeholder="암호 입력" required>
            </div>
            <div class="form-group group">
            	<label for="log-password-re">암호 재입력</label>
              <input type="password" class="form-control" name="join-password-re" id="join_password-re" placeholder="암호 재입력" required>
            </div>
            <div class="form-group group">
            	<label for="log-email">이메일 주소</label>
              <input type="email" class="form-control" name="member_email" id="join_email" placeholder="아이디 및 암호 분실시 받아 보실수 있는 이메일 입니다." required>
            </div>
            <input class="btn btn-success" type="submit" value="join">
          </form>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    
    <header data-offset-top="150" data-stuck="250"><!--data-offset-top is when header converts to small variant and data-stuck when it becomes visible. Values in px represent position of scroll from top. Make sure there is at least 100px between those two values for smooth animation-->
    
      <!--Search Form-->
      <form class="search-form closed" role="form" autocomplete="off" id="frm1" name="frm1" method="post" action="search.go">
      	<div class="container">
          <div class="close-search"><i class="icon-delete"></i></div>
            <div class="form-group">
              <label class="sr-only" for="search-hd">검색</label>
              <input type="text" class="form-control"  name="searchKey" id="searchKey" placeholder="검색어를 입력 하세요.">
              <button type="submit"><i class="icon-magnifier"></i></button>
          </div>
        </div>
      </form>
      
    	<!--Split Background-->
    	<div class="left-bg"></div>
    	<div class="right-bg"></div>
      
    	<div class="container">
      	<a class="logo" href="/"><img src="resources/imgs/logo_w.png" alt="TourStory" style="height: 70px;width: 500px;"/></a>
 
      	<!--Mobile Menu Toggle-->
        <div class="menu-toggle"><i class="fa fa-list"></i></div>
        <div class="mobile-border"><span></span></div>
        
        <!--Main Menu-->
        <nav class="menu">
          <ul class="catalog">
          
          <!-- 여행스토리 -->
          	<li class="has-submenu" id="nav_01"><a href="list.go?board_category=korea">여행스토리<i class="fa fa-chevron-down"></i></a>
            	<ul class="submenu 01">
              	<li><a href="list.go?board_category=korea">국내여행</a></li>
              	<li><a href="list.go?board_category=abroad">해외여행</a></li>
                <li class="offer">
                	<div class="col-1">
                  	<p class="p-style2" id="klike_subject"></p>
                  </div>
                  <div class="col-2">
                  	<img id="klike_image" width="294px" height="180px"/>
                  	<a class="btn btn-block" id="klike_a">
                  	<span id="klike_nick"></span></a>
                  </div>
                </li>
              </ul>
            </li>
            
            <!-- 추천여행 -->
            <li class="has-submenu" id="nav_02"><a href="list.go?board_category=season">추천여행<i class="fa fa-chevron-down"></i></a>
            	<ul class="submenu 02">
              	<li><a href="list.go?board_category=season">시즌여행</a></li>
              	<li><a href="list.go?board_category=reply">후기여행</a></li>
                <li class="offer">
                	<div class="col-1">
                  	<p class="p-style2" id="rlike_subject"></p>
                  </div>
                  <div class="col-2">
                  	<img id="rlike_image" width="294px" height="180px"/>
                  	<a class="btn btn-block" id="rlike_a">
                  	<span id="rlike_nick"></span></a>
                  </div>
                </li>
              </ul>
            </li>
            
            <!-- 역사여행 -->
            <li class="has-submenu" id="nav_03"><a href="list.go?board_category=koreaH">역사여행<i class="fa fa-chevron-down"></i></a>
            	<ul class="submenu 03">
              	<li><a href="list.go?board_category=koreaH">한국사여행</a></li>
              	<li><a href="list.go?board_category=abroadH">해외사여행</a></li>
                <li class="offer">
                	<div class="col-1">
                  	<p class="p-style2" id="hlike_subject"></p>
                  </div>
                  <div class="col-2">
                  	<img id="hlike_image" width="294px" height="180px"/>
                  	<a class="btn btn-block" id="hlike_a">
                  	<span id="hlike_nick"></span></a>
                  </div>
                </li>
              </ul>
            </li>
            
            <!-- 테마별여행 -->
            <li class="has-submenu" id="nav_04"><a href="list.go?board_category=trip">테마별여행<i class="fa fa-chevron-down"></i></a>
            	<ul class="submenu 04">
              	<li><a href="list.go?board_category=trip">관광명소</a></li>
              	<li><a href="list.go?board_category=food">맛집여행</a></li>
              	<li><a href="list.go?board_category=train">기차여행</a></li>
              	<li><a href="list.go?board_category=cycle">자전거여행</a></li>
              	<li><a href="list.go?board_category=pack">배낭여행</a></li>
              	<li><a href="list.go?board_category=subway">지하철여행</a></li>
                <li class="offer">
                	<div class="col-1">
                  	<p class="p-style2" id="tlike_subject"></p>
                  </div>
                  <div class="col-2">
                  	<img id="tlike_image" width="294px" height="180px"/>
                  	<a class="btn btn-block" id="tlike_a">
                  	<span id="tlike_nick"></span></a>
                  </div>
                </li>
              </ul>
            </li>
            
            <!-- Q&A -->
            <li class="has-submenu" id="nav_05"><a href="noticePage.go?currentPage=1&qna_category=notice">Q & A<i class="fa fa-chevron-down"></i></a>
            	<ul class="submenu 05">
              	<li><a href="noticePage.go?currentPage=1&qna_category=notice">공지사항</a></li>
              	<li><a href="noticePage.go?currentPage=1&qna_category=cautious">유의사항</a></li>
              	<li><a href="noticePage.go?currentPage=1&qna_category=tour_cautious">여행시 주의 사항</a></li>
              	<li><a id="navi05-4" href="noticePage.go?currentPage=1&qna_category=tips">초보 여행 팁</a></li>
              	<li class="offer" id="navi05-4-info">
                </li>
              </ul>
            </li>
            
          </ul>
        </nav>
        <style>
        
        .navi-log-info {
			font-size: 1.25em;
			color: #fff;
			padding: 10px 40px;
			font-weight: normal;
			text-align: left;
			background: none;
			border: 1px solid #fff;
			vertical-align: middle;
			cursor: pointer;
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			white-space: nowrap;
			-webkit-transition: all 0.4s ease;
			-moz-transition: all 0.4s ease;
			transition: all 0.4s ease;
			outline: 0;
		}
		
		.navi-log-info:hover {
			border-color: transparent;
			background: #fff;
			color: #2f343b;
			text-decoration: none;
		}
		.navi-log-info span {
			display: inline-block;
			line-height: 1em;
		}
        </style>
        <!--Toolbar-->
        <div class="toolbar group">
          <button class="search-btn btn-outlined-invert"><i class="icon-magnifier"></i></button>
          <div class="middle-btns" id="tour_login">
            <c:if test="${sessionScope.id==null}">
            	<a class="login-btn btn-outlined-invert" id="loginModal-button" href="#" data-toggle="modal" data-target="#loginModal"><i class="icon-profile"></i> <span>로그인</span></a>
            	<a class="join-btn btn-outlined-invert" href="#" data-toggle="modal" data-target="#JoinModal"><i class="icon-todolist-add"></i> <span>회원가입</span></a>
            </c:if>
          </div>
          <c:if test="${sessionScope.id!=null}">
	          <div class="cart-btn">
				<a class="navi-log-info btn btn-outlined-invert" href="listTest.go?board_category=myinfo"><i class="icon-profile"></i>
            		<span style="font-size: .9em;">${sessionScope.nick}</span>
            	</a>
	            <!--Dropdown-->
	            <div class="cart-dropdown">
	              <span></span>
	              <div class="body">
	                <table>
	                  <tr>
	                    <th style="width: 25%"></th>
	                    <th style="width: 25%"></th>
	                    <th style="width: 50%"></th>
	                  </tr>
	                  <tr>
	                    <td>아이디 : </td>
	                    <td>${sessionScope.id}</td>
	                    <td></td>
	                  </tr>
	                  <tr>
	                    <td>닉네임 : </td>
	                    <td>${sessionScope.nick}</td>
	                    <td></td>
	                  </tr>
	                  <tr>
	                    <td>이메일 : </td>
	                    <td>${sessionScope.email}</td>
	                    <td></td>
	                  </tr>
	                  
	                </table>
	              </div>
	              <div class="footer group">
	                <div class="buttons">
	                  <a class="btn btn-outlined-invert" href="listTest.go?board_category=myinfo"><i class="icon-download"></i>내정보 수정</a>
	                  <a class="btn btn-outlined-invert" href="listTest.go?board_category=album"><i class="icon-map"></i>일정 추가</a>
	                  <a class="btn btn-outlined-invert" href="tourlogoutProcess.do"><i class="icon-delete"></i>로그아웃</a>
	                </div>
	                
	              </div>
	            </div><!--Dropdown Close-->
	          </div>
          
          </c:if>
          <!-- </div> -->
        </div><!--Toolbar Close-->
      </div>
    </header><!--Header Close-->
