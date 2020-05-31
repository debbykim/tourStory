<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>Tour Story</title>
 
    <!--SEO Meta Tags-->
	<meta name="keywords" content="Tour, Story" />

    <!--Mobile Specific Meta Tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!--Favicon-->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <!--Master Slider Styles-->
    <link href="resources/masterslider/style/masterslider.css" rel="stylesheet" media="screen">
    <!--Styles-->
    <link href="resources/css/styles.css" rel="stylesheet" media="screen">
    <!--Modernizr-->
		<script src="resources/js/libs/modernizr.custom.js"></script>
    <!--Adding Media Queries Support for IE8-->
    <!--[if lt IE 9]>
      <script src="js/plugins/respond.js"></script>
    <![endif]-->
    
    <script src="resources/js/jquery-2.2.3.js"></script>
		<script src="resources/js/jquery-ui.js"></script>	
    <link rel="stylesheet" href="resources/css/jquery-ui.css" />
    <script type="text/javascript">
	var dep;
	var arr;
	var month;
	var depArray=[];
	var arrArray=[];
	var depObj; 
	var arrObj;
	var betweenDay;
	var scheduleName;
	var set;
	var yearchk;
	var monthchk;
	var arrmonthchk;
	var countdate;
    $(document).ready(function() {
		var Page = ${pv.currentPage}
		var length = parseInt($('#len').val())
		var numlist=[]

		for(var i=0;i<length;i++){
			numlist.push($('#numlist_'+i).val());
		}
		$.each(numlist, function(index,value){
    	$(".story_"+value).click(function(){
    		$.ajax({
    			type:'GET',
    			dataType:'text',
    			url:'viewajax.go?currentPage='+Page+'&num='+value,
    			success:function(res){
    				$('.storyview').empty();
    				$('.storyview').append(res);
    			}
    		});
    	});
		})
    	
		$('#re_password').focus(function(){
    		if($('#re_password').val() != ""){
    			set = setInterval(function(){
    				var pass=$('#b_password').val();
        			var repass=$('#re_password').val();
        		alert(pass+"////"+repass);
        		
        		if(pass != repass){
        			$('#pwmsg').remove();
        			$('#repassLabel').append('<span id="pwmsg" style="color:red;">비밀번호가 일치하지 않습니다.</span>');
        		}else{
        			$('#pwmsg').remove();
        		}
    		}, 500);
        	}
    	});//end focus

	$('#re_password').focusout(function(){
		clearInterval(set);
	});//end focusout
    	
    $('#upPassBtn').bind('click',function(){
    	$.ajax({
    		type:'post',
    		url:'pwUpdate.do',
    		data:'member_pass='+$('#b_password').val()+'&member_nickname='+$('#nickname').val(),
    		success:function(result){
    			alert("비밀번호 수정 완료");
    			window.location = "/tourstory/";
    		}
    	});
    });//end bind
    
	$('#check').bind('click',function(){
    	
		$('#tripdate').val(countdate);
		$('#schedulename').val($('#schname').val());
		if($('#tripdate').val()!="" && $('#schedulename').val()!="")
		$.ajax({
		type:'post',
		url:'tour_map.go',
		data:'tripdate='+$('#tripdate').val()+'&schedulename='+$('#schedulename').val(),
		success:function(result){
			if(result.schedule_chk=='1')
				alert("동일한 스케줄 명이 이미 있습니다.");
			else if(result.schedule_chk=='0'){
			$('#inner_content').empty();
			$('#inner_content').append("<iframe id='tour_schedule_map' src='tour_callMap.go'></iframe>");
			}
		}
		});
		
		else if ($('#tripdate').val()=="") {
			alert("날짜를 선택해주세요");
		}
		else if ($('#schedulename').val()=="") {
			alert("제목을 작성해 주세요");
		}
	});
	
	$('#dep').datepicker({
		showOn: "both"
		
    });
	$('#arr').datepicker({
		showOn: "both"
    });
	
	$('#dep').bind('change',function(){
		dep = new Date($('#dep').val());
		dep = dep.getFullYear() + "-" + ("00"+(dep.getMonth() + 1)).slice(-2) + "-" +("00"+ dep.getDate()).slice(-2);
		depArray = dep.split("-"); 
		
		depObj= new Date(depArray[0], depArray[1], depArray[2]); 
		
		if(depArray[0]%4==0 && depArray[0]%100 !=0 || depArray[0]%400 ==0){
			if(depArray[1]==01 || depArray[1]==03 || depArray[1]==05 || depArray[1]==07 || depArray[1]==08 || depArray[1]==10 || depArray[1]==12){
				monthchk = 0 ; 
			}else{
				monthchk = 1;
			}
			yearchk = 0 ;
		}else{
			if(depArray[1]==01 || depArray[1]==03 || depArray[1]==05 || depArray[1]==07 || depArray[1]==08 || depArray[1]==10 || depArray[1]==12){
				monthchk = 0 ; 
			}else{
				monthchk = 1;
			}
			
			yearchk=1;
		}
		date();
	});
	
	$('#arr').bind('change',function(){
		arr = new Date($('#arr').val());
		arr = arr.getFullYear() + "-" + ("00"+(arr.getMonth() + 1)).slice(-2) + "-" + ("00"+arr.getDate()).slice(-2);
		arrArray = arr.split("-"); 
		arrObj= new Date(arrArray[0], arrArray[1], arrArray[2]);
		
		if(depArray[0]%4==0 && depArray[0]%100 !=0 || depArray[0]%400 ==0){
			if(depArray[1]==01 || depArray[1]==03 || depArray[1]==05 || depArray[1]==07 || depArray[1]==08 || depArray[1]==10 || depArray[1]==12){
				arrmonthchk = 0 ; 
			}else{
				arrmonthchk = 1;
			}
			yearchk = 0 ;
		}else{
			if(depArray[1]==01 || depArray[1]==03 || depArray[1]==05 || depArray[1]==07 || depArray[1]==08 || depArray[1]==10 || depArray[1]==12){
				arrmonthchk = 0 ; 
			}else{
				arrmonthchk = 1;
			}
			
			yearchk=1;
		}
		
		date();
	});
	
});

function date(){
	//alert("yearchk:"+yearchk+"////monthchk:"+monthchk+"///출발일 : "+depArray[1]+"/////도착일:"+arrArray[1])
	if(arrObj == null || depObj==null){
		$('.tripdate').text(" ");
	}else{
		
	  if (yearchk==0 && depArray[1]==02 && (arrArray[1]>depArray[1])){
		var be = arrObj - depObj;
		betweenDay = be / (24 * 3600 * 1000);
		$('.tripdate').text((betweenDay-2)+"박 "+(betweenDay-1)+"일");
		countdate = betweenDay-1;
		
	  }else if(monthchk==1 && (arrArray[1]<depArray[1])){
			var be = arrObj - depObj;
			betweenDay = be / (24 * 3600 * 1000);
			if(betweenDay>0){
			$('.tripdate').text((betweenDay-1)+"박 "+(betweenDay)+"일");
			countdate=betweenDay;
			}else if(betweenDay==0 && arrArray[1]==depArray[1]) {
			$('.tripdate').text((betweenDay)+"박 "+(betweenDay+1)+"일");	
			countdate=betweenDay+1;
			}else if(betweenDay==0 && arrArray[1]>depArray[1]){
				$('.tripdate').text((betweenDay+1)+"박 "+(betweenDay+2)+"일");
				countdate=betweenDay+2;
			}else{
				alert("도착일이 출발일보다 빠릅니다.날짜를 다시 입력해주세요.")
			}
			
		}else if (monthchk==0 && (arrArray[1]>depArray[1])){
					
			var be = arrObj - depObj;
			betweenDay = be / (24 * 3600 * 1000);
			//alert(betweenDay);
			   if(betweenDay>0){
				
				$('.tripdate').text((betweenDay+1)+"박 "+(betweenDay+2)+"일");
				countdate= betweenDay+2;
				}else if(betweenDay==0 && arrArray[1]==depArray[1]) {
				
				$('.tripdate').text((betweenDay)+"박 "+(betweenDay+1)+"일");	
				countdate=betweenDay+1;
				}else if(betweenDay==0 && arrArray[1]>depArray[1]){
					
					$('.tripdate').text((betweenDay+1)+"박 "+(betweenDay+2)+"일");
					countdate=betweenDay+2;
				}else{	
					alert("도착일이 출발일보다 빠릅니다.날짜를 다시 입력해주세요.")
				}
		
		}else if (depArray[1]==2 && (arrArray[1]>depArray[1])){
			var be = arrObj - depObj;
			betweenDay = be / (24 * 3600 * 1000);
			if(betweenDay>0){
				$('.tripdate').text((betweenDay-3)+"박 "+(betweenDay-2)+"일");
				countdate=betweenDay-2;
			    }else if (betweenDay=0){
			    	$('.tripdate').text((betweenDay-2)+"박 "+(betweenDay-1)+"일");
			    	countdate=betweeDay-1;
			    }else{
					alert("도착일이 출발일보다 빠릅니다.날짜를 다시 입력해주세요.")
				}
			
		}else{
		var be = arrObj - depObj;
		betweenDay = be / (24 * 3600 * 1000);
		if(betweenDay>=0){
			$('.tripdate').text((betweenDay)+"박 "+(betweenDay+1)+"일");
			countdate=betweenDay+1;
		}else{
			alert("도착일이 출발일보다 빠릅니다.날짜를 다시 입력해주세요.")
		}
		}
	}
} //end date()
    </script>
</head>
<body>


	<%@include file="navi.jsp"%>
    <!--Page Content-->
    <div class="page-content">
    
      <!--Breadcrumbs-->
      <ol class="breadcrumb">
        <li><a href="/tourstory/">Home</a></li>
        <li><a href="listTest.go?board_category=myinfo">My Page</a></li>
        <c:if test="${cate=='myinfo' }">
        <li>내 정보 </li></c:if>
        <c:if test="${cate=='story' }">
        <li>나의 여행</li></c:if>
        <c:if test="${cate=='Myalbum' }">
        <li>나의 앨범</li></c:if>
        <c:if test="${cate=='album' }">
        <li>일정 만들기</li></c:if>
      </ol><!--Breadcrumbs Close-->
      
      <!--Catalog Grid-->
      <section class="catalog-grid">
      	<div class="container">
          <h2 class="side-menu-title">My Page</h2>
          
          <div class="row">
          
            <!--Filters-->
          	<div class="filters-mobile col-lg-3 col-md-3 col-sm-4">
            	<div class="shop-filters">
              		<hr class="green-line">
              		        		
              		 <!-- a 타입 -->
              		 <c:if test="${cate=='myinfo'}">
	              			<a class="side-menu-focused" href="listTest.go?board_category=myinfo">내 정보</a>
		              		<a class="side-menu-01" href="listTest.go?board_category=story">나의 여행</a>
		              		<a class="side-menu-01" href="listTest.go?board_category=Myalbum">나의 앨범</a>
		              		<a class="side-menu-01" href="listTest.go?board_category=album">일정 만들기</a> 
	              	</c:if>
	              	<c:if test="${cate=='story'}">
	              			<a class="side-menu-01" href="listTest.go?board_category=myinfo">내 정보</a>
		              		<a class="side-menu-focused" href="listTest.go?board_category=story">나의 여행</a>
		              		<a class="side-menu-01" href="listTest.go?board_category=Myalbum">나의 앨범</a>
		              		<a class="side-menu-01" href="listTest.go?board_category=album">일정 만들기</a> 
	              	</c:if>
	              	<c:if test="${cate=='Myalbum'}">
	              			<a class="side-menu-01" href="listTest.go?board_category=myinfo">내 정보</a>
		              		<a class="side-menu-01" href="listTest.go?board_category=story">나의 여행</a>
		              		<a class="side-menu-focused" href="listTest.go?board_category=Myalbum">나의 앨범</a>
		              		<a class="side-menu-01" href="listTest.go?board_category=album">일정 만들기</a> 
	              	</c:if>
	              	<c:if test="${cate=='album'}">
	              			<a class="side-menu-01" href="listTest.go?board_category=myinfo">내 정보</a>
		              		<a class="side-menu-01" href="listTest.go?board_category=story">나의 여행</a>
		              		<a class="side-menu-01" href="listTest.go?board_category=Myalbum">나의 앨범</a>
		              		<a class="side-menu-focused" href="listTest.go?board_category=album">일정 만들기</a> 
	              	</c:if>
              </div>
            </div>
            
            <!--Tiles-->
          	<div class="col-lg-9 col-md-9 col-sm-8">
            	<div class="row">
            	<!--Orders History-->
            	 <section class="contain-notice extra-space-bottom">
            	 <div class="container-notice" style="margin-top: -21px;">
            	 <h2 id="notice_mainTitle" class="text-center-mobile notice_mainTitle" style="margin-bottom: 5px;">
            	 <c:choose>
			          <c:when test="${cate == 'myinfo'}">
			          	내  정 보
			          </c:when>
			          
			          <c:when test="${cate == 'story'}">
			          	나 의  여 행
			          </c:when>
			          
			          <c:when test="${cate == 'Myalbum'}">
			          	나 의  앨 범
			          </c:when>
			          
			          <c:when test="${cate == 'album'}">
			          	일 정  만 들 기
			          </c:when>
		         </c:choose>
		         </h2>
		         <hr class="green-line" style="margin-top: 1px;">
		         <div  class="storyview">
            	</div>
		         <c:if test="${cate == 'myinfo'}">  <!-- 내정보  -->
		         	<div class="inner">
            <table>
              <tbody>
                <tr>
                  <th style="width: 120px; text-align: center;">닉네임</th>
                  <td>${sessionScope.nick}<input type="hidden" id="nickname" name="member_nickname" value="${sessionScope.nick}"></td>
                </tr>
                <tr>
                  <th style="text-align: center;">아이디</th>
                  <td>${sessionScope.id}</td>
                </tr>
                <tr>
                  <th style="text-align: center;">암호 입력</th>
                  <td><input type="password" name="member_pass" id="b_password"/></td>
                </tr>
                <tr>
                  <th style="text-align: center;">암호 재입력</th>
                  <td id="repassLabel"><input type="password" id="re_password"/></td>
                </tr>
                <tr>
                  <th style="text-align: center;">이메일</th>
                  <td>${sessionScope.email}</td>
                </tr>
                <tr>
                  <td></td>
                  <td><button style="float: right;margin-right: 50px;width: 100px;height: 60px;" id="upPassBtn">수정하기</button></td>
                </tr>
              </tbody>
            </table>
          </div>
		         </c:if>
		         <input type="hidden" id="len" value="${length}" />
		         <c:if test="${cate == 'story' || cate == 'Myalbum'}">  <!-- 나의 여행 or 나의 앨범 -->
            	<div>
            	
            	
            	<c:forEach var="i" items="${aList}" varStatus="status">
            	<input type="hidden" id="numlist_${status.index}" value="${i.board_num}" >
                <!--Tile-->
                <div class="col-lg-4 col-md-6 col-sm-12">
                  <div class="tile">
                    <div class="price-label">여행지</div>
                    		<%-- <c:url var="content" value="view.go">
							 <c:param name="currentPage" value="${pv.currentPage}"/>
							 <c:param name="num" value="${i.board_num}"/>					 
							</c:url> --%>
                    <a class ="story_${i.board_num}" href="#"><img height="250px" src="http://syronia.iptime.org/tourimgs/temp/${i.board_subject}/${i.board_upload}"></a>
                    <div class="footer">
                     <c:choose>
                     <c:when test="${not empty i.board_subject}">
                      <a href="#">${i.board_subject}</a>
                      <span>${i.member_board_nick }</span>
                      </c:when>
                      <c:otherwise>
                      </br>
                        <span style="height:23px ">${i.member_board_nick }</span>
                      </c:otherwise>
                      </c:choose>
                      <div class="tools">
                      <!-- 별?? -->
                        <div class="rate">
                          <c:choose>
                        
                        	<c:when test="${i.board_like>=5&&i.board_like<15}">
	                          	<span class="active"></span>
	                          	<span></span>
	                          	<span></span>
	                          	<span></span>
	                          	<span></span>
	                       	</c:when>
	                        
	                        <c:when test="${i.board_like>=15&&i.board_like<25}">
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span></span>
	                          	<span></span>
	                          	<span></span>
	                       	</c:when>

	                       	<c:when test="${i.board_like>=25&&i.board_like<35}">
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span></span>
	                          	<span></span>
	                       	</c:when>

	                       	<c:when test="${i.board_like>=35&&i.board_like<45}">
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span></span>
	                       	</c:when>
	                       	
	                       	<c:when test="${i.board_like>=45}">
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                          	<span class="active"></span>
	                       	</c:when>
	                       	<c:otherwise>
	                       		<span></span>
	                       		<span></span>
	                       		<span></span>
	                       		<span></span>
	                       		<span></span>
	                       	</c:otherwise>
                         </c:choose>
                        </div>
                        <!--Add To Cart Button-->
                        <a class="add-cart-btn" href="#"><span>계획추가</span><i class="icon-shopping-cart"></i></a>
                        
                      </div>
                    </div>
                  </div>
                </div>
                </c:forEach>
               
                </div>
                  </c:if>
                  <div id="inner_content">
                  <c:if test="${cate =='album' }">
                 	<form action="tour_map.go" method="post" id="tourgo">
						<p style="text-align: center;">출발 <input type="text" id="dep"/></p>
						<p style="text-align: center;">도착 <input type="text" id="arr"/></p>
						<p style="text-align: center;">여행 제목<input type="text" id="schname"/></p>
						<p class="tripdate" style="text-align: center;"></p>
						<p style="text-align: center;"><button type="button" id="check">확인</button>&nbsp;<button type="reset">취소</button></p>
						<input type="hidden" id="tripdate" name="tripdate" value="">
						<input type="hidden"id="schedulename" name="schedulename" value=""/>
					</form>
                  </c:if>
                  </div>
                </div> 
                </section>
              </div>
              <!--Pagination-->
              
              <c:if test="${cate == 'story'||cate== 'Myalbum' }">
           	  <c:if test="${pv.totalPage>=1 }">
              <ul class="pagination">
            
             	<!-- 이전 출력 시작 -->
              	<c:if test="${pv.startPage>1}">
                <li class="prev-page"><a class="icon-arrow-left" href="listTest.go?currentPage=${pv.startPage-pv.blockPage}&board_category=${cate}"></a></li>
                </c:if>
                <!-- 이전 출력 끝 -->

				<!-- 페이지 출력 시작 -->
                <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">		
                 	  <c:url var="currPage" value="listTest.go">
					  <c:param name="currentPage" value="${i}" />
					  <c:param name="board_category" value="${cate }" />
					  </c:url>
					  
              		  <li>
              		  <a href="${currPage}"> <c:out value="${i}" />
              		  </a></li>
				</c:forEach>
				<!-- 페이지 출력 끝 -->

				<!-- 다음 출력 시작 -->
                <c:if test="${pv.totalPage>pv.endPage}">
                <li class="next-page"><a class="icon-arrow-right" href="listTest.go?currentPage=${pv.startPage+pv.blockPage}&board_category=${cate}"></a></li>
                </c:if>
                <!--  다음 출력 끝 -->
              </ul>
              </c:if>
              </c:if>
            </div>    
          </div>
        </div>
      </section><!--Catalog Grid Close-->
   
    </div><!--Page Content Close-->

	<%@include file="index_list.jsp"%>
	<%@include file="footer.jsp"%>
	
	
		<!--Javascript (jQuery) Libraries and Plugins-->
		
    	<script src="resources/js/libs/jquery.easing.min.js"></script>
		<script src="resources/js/plugins/bootstrap.min.js"></script>
		<script src="resources/js/plugins/smoothscroll.js"></script>
		<script src="resources/js/plugins/jquery.validate.min.js"></script>
		<script src="resources/js/plugins/icheck.min.js"></script>
		<script src="resources/js/plugins/jquery.placeholder.js"></script>
		<script src="resources/js/plugins/jquery.stellar.min.js"></script>
		<script src="resources/js/plugins/jquery.touchSwipe.min.js"></script>
		<script src="resources/js/plugins/jquery.shuffle.min.js"></script>
   		<script src="resources/js/plugins/lightGallery.min.js"></script>
	    <script src="resources/js/plugins/owl.carousel.min.js"></script>
	    <script src="resources/js/plugins/masterslider.min.js"></script>
	    <script src="resources/js/plugins/jquery.nouislider.min.js"></script>
		<script src="resources/js/scripts.js"></script>
</body>
</html>
    
