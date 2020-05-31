<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
    <script type="text/javascript">
   
    $(document).ready(function(){
       $('#send').click(function(){
    	$.ajax({
        	type:"post",
        	url:"consul.go",
        	success:function(res){
        		$('#qc-name').val("");
        		$('#qc-email').val("");
        		$('#qc-message').val("");
        	   alert("고객상담이 접수되었습니다.감사합니다.");
        	}
        	
    	});
        })	
        	
        });
    
    </script>
    </html>
<!--Sticky Buttons-->
    <div class="sticky-btns">
    	<form class="quick-contact ajax-form" method="post"  name="quick-contact">
      	<h3>고객상담 접수</h3>
        <p class="text-muted">불편한 일이나 문제가 있으신 부분에 대하여 써주시면 이메일로 답장 드리겠습니다.</p>
        <div class="form-group">
        	<label for="qc-name">이름</label>
          <input value="" class="form-control input-sm" type="text" name="name" id="qc-name" placeholder="이름을 입력해 주세요.">
        </div>
        <div class="form-group">
        	<label for="qc-email">E-mail</label>
          <input value="" class="form-control input-sm" type="email" name="email" id="qc-email" placeholder="답장 받으실 이메일.">
        </div>
        <div class="form-group">
        	<label for="qc-message">상담내용</label>
          <textarea value="" class="form-control input-sm" name="message" id="qc-message" placeholder="내용을 입력해 주세요."></textarea>
        </div>
        <!-- Validation Response -->
        <div class="response-holder"></div>
        <!-- Response End -->
        <input id = "send" class="btn btn-success btn-sm btn-block" type="button" value="보내기">
      </form>
    	<span id="qcf-btn"><i class="fa fa-envelope"></i></span>
      <span id="scrollTop-btn"><i class="fa fa-chevron-up"></i></span>
    </div><!--Sticky Buttons Close-->
    
    
<!--Subscription Widget-->
<section class="subscr-widget">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<h2 class="light-color">Site Map</h2>
				<div class="col-lg-2_1 col-md-2_1 col-sm-2_1">
					<h2>여행스토리</h2>
					<ul class="list-unstyled">
						<li><a href="list.go?board_category=korea" style="color: #fff;">국내여행</a></li>
						<li><a href="list.go?board_category=abroad" style="color: #fff;">해외여행</a></li>
					</ul>
				</div>
				<div class="col-lg-2_1 col-md-2_1 col-sm-2_1">
					<h2>추천여행</h2>
					<ul class="list-unstyled">
						<li><a href="list.go?board_category=season" style="color: #fff;">시즌여행</a></li>
						<li><a href="list.go?board_category=reply" style="color: #fff;">후기여행</a></li>
					</ul>
				</div>
				<div class="col-lg-2_1 col-md-2_1 col-sm-2_1">
					<h2>역사여행</h2>
					<ul class="list-unstyled">
						<li><a href="list.go?board_category=koreaH" style="color: #fff;">한국사여행</a></li>
						<li><a href="list.go?board_category=abroadH" style="color: #fff;">해외사여행</a></li>
					</ul>
				</div>
				<div class="col-lg-2_1 col-md-2_1 col-sm-2_1">
					<h2>테마별여행</h2>
					<ul class="list-unstyled">
						<li><a href="list.go?board_category=trip" style="color: #fff;">관광명소</a></li>
						<li><a href="list.go?board_category=food" style="color: #fff;">맛집여행</a></li>
						<li><a href="list.go?board_category=train" style="color: #fff;">기차여행</a></li>
						<li><a href="list.go?board_category=cycle" style="color: #fff;">자전거여행</a></li>
						<li><a href="list.go?board_category=pack" style="color: #fff;">배낭여행</a></li>
						<li><a href="list.go?board_category=subway" style="color: #fff;">지하철여행</a></li>
					</ul>
				</div>
				<div class="col-lg-2_1 col-md-2_1 col-sm-2_1">
					<h2>Q & A</h2>
					<ul class="list-unstyled">
						<li><a href="noticePage.go?qna_category=notice" style="color: #fff;">공지사항</a></li>
						<li><a href="noticePage.go?qna_category=cautious" style="color: #fff;">유의사항</a></li>
						<li><a href="noticePage.go?qna_category=tour_cautious" style="color: #fff;">여행시 주의사항</a></li>
						<li><a href="noticePage.go?qna_category=tips" style="color: #fff;">초보 여행팁</a></li>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
</section>
<!--Subscription Widget Close-->
