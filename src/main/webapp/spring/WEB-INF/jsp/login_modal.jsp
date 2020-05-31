<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
<!--Login Modal-->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
            <h2>로그인</h2>
          </div>
          <div class="modal-body">
          <form class="login-form">
            <div class="form-group group">
            	<label for="log-email">아이디</label>
              <input class="form-control" name="log-email" id="" placeholder="아이디" required>
              <a class="help-link" href="#">아이디 찾기</a>
            </div>
            <div class="form-group group">
            	<label for="log-password">암호</label>
              <input type="text" class="form-control" name="log-password" id="log-password" placeholder="패스워드" required>
              <a class="help-link" href="#">암호 찾기</a>
            </div>
            <div class="checkbox">
              <label><input type="checkbox" name="remember">로그인 기억 하기</label>
            </div>
            <input class="btn btn-success" type="submit" value="Login">
          </form>
          <a class="btn" style="float: right;margin-top: -47px;" data-toggle="modal" data-target="#JoinModal">회원가입</a>
          </div>
          
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
