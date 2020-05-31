<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
#top_container button{
	text-decoration: none;
	border: 0;
	padding: 0;
	background: none;
	outline: none;
}
#top_container button:HOVER{
	color: #f72;
}
#top_container a{
	color:#777;
	background-color: #fff;
	height: 100px;
	font-size: 20px;
	font-weight: bold;
}
#top_container a:HOVER{
	text-decoration: none;
}

img {
	margin-top:25px;
	width: 200px;
	height: 50px;
}
#top_menu {
	margin-top: -100px;
	padding-right:70px;
	text-align: right;
}
#top_menu button{
	margin-top: 30px;
	color: #777;
	font-size: 16px;
	font-weight: bold;
}

</style>

<div id="top_container">
<a><img src="resources/imgs/logo.png"></a>
<a id="top_menu">
<script type="text/javascript">
$(function(){
	$("#top_login").click(function(){
        $('div.modal').modal({remote : 'jsp/login_modal.jsp'});
    })
})
</script>
	<button id="top_login">로그인</button>
	<div class="modal fade">
		  <div class="modal-dialog">
		    <div class="modal-content">
		        <!-- remote ajax call이 되는영역 -->
		    </div>
		  </div>
		</div>
	|
	<script type="text/javascript">

</script>
	<a id="top_join">회원가입</a>
	
</a>
</div>
