<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
<body>
    <div class="container-fluid px-3">
        <div class="row min-vh-100">
            <div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
                <div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
                    <div class="mb-4">
                        <h1 style="font-family: 'GmarketSansMedium'!important;">SIGN UP</h1>
                        <p class="text-muted"></p>
                    </div>
                    <form class="form-validate" action="${path}/mem/signUp" method="post" style="font-family: 'GmarketSansMedium' !important;">
                        <div class="mb-4">
                            <label class="form-label" for="user_id">아이디</label>
                            <input class="form-control" name="user_id" id="user_id" type="text" placeholder="이메일 형식(test@email.com)" autocomplete="off" required data-msg="Please enter your id">
                            <input class="btn btn-outline-primary" style="margin-top : 10px; width: 100px; height: 35px;" type="button" id="checkDuplicate" value="중복검사">
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="user_pw">비밀번호</label>
                            <input class="form-control" name="user_pw" id="user_pw" type="password" placeholder="숫자,영문 혼합 8자리 이상" autocomplete="off" required data-msg="Please enter your password">
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="user_pw2">비밀번호 확인</label>
                            <input class="form-control" name="user_pw2" id="user_pw2" type="password" placeholder="비밀번호 확인" autocomplete="off" required data-msg="Please enter your password">
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="user_name">이름</label>
                            <input class="form-control" name="user_name" id="user_name" type="text" placeholder="이름" autocomplete="off" required data-msg="Please enter your name">
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="user_phone">전화번호</label>
                            <input class="form-control" name="user_phone" id="user_phone" placeholder="010-1111-2222" type="phone" required data-msg="Please enter your phone">
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="user_email">이메일</label>
                            <input class="form-control" name="user_email" id="user_email" placeholder="test@email.com" type="email" required data-msg="Please enter your email">
                        </div>
                        <div class="d-grid gap-2">
                            <button class="btn btn-lg btn-primary" type="submit">회원가입</button>
                        </div>
                        <hr class="my-3 hr-text letter-spacing-2" data-content="OR">
                        <div class="d-grid gap-2">
                            <button class="btn btn btn-outline-muted-na btn-block btn-social mb-3"><i class="btn-social-icon"><img class="trans2" src="${path}/resources/img/Busan/naver.ico.png"></i>네이버로 <span class="d-none d-sm-inline">로그인</span></button>
                            <button class="btn btn btn-outline-muted-ka btn-block btn-social mb-3"><i class="btn-social-icon"><img class="trans1" src="${path}/resources/img/Busan/kakao-talk.png"></i>카카오로 <span class="d-none d-sm-inline">로그인</span></button>
                        </div>
                        <hr class="my-4">
                        <div class="mb-4">
                            <div class="form-check">
                                <input class="form-check-input" id="loginRemember" type="checkbox">
                                <label class="form-check-label text-muted" for="loginRemember"> <span class="text-sm"><p class="text-sm text-muted"><a href="#">이용약관</a> 및 <a href="#">개인정보보호정책</a>에 동의합니다.</p></span></label>
                            </div>
                        </div>
                    </form>

                    <a class="close-absolute me-md-5 me-xl-6 pt-5" href="${path}">
                        <svg class="svg-icon w-3rem h-3rem">
                <use xlink:href="#close-1"> </use>
              </svg></a>

                </div>
            </div>
            <div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
                <!-- Image-->
                <div class="bg-cover h-100 me-n3" style="background-image: url(${path}/resources/img/Busan/로그인\ \(2\)\ \(6\).png);"></div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
	$(function () {
		$("#user_pw2").blur((event) => {
			let pass1 = $("#user_pw").val();			
			let pass2 = $("#user_pw2").val();
			
			if(pass1.trim() != pass2.trim()) {
				alert("비밀번호가 일치하지 않습니다.");
				
				$("#user_pw").val("");
				$(event.target).val("");
				$("#user_pw").focus();
			}
		});
    	
    	
	    $("#enrollSubmit").on("click", () => {
	    	// TODO 전송하기 전에 각 영역에 유효성 검사로직을 추가하는 부분!
	    	//return false;
	    });
	    
	    // 아이디 중복을 확인하는 AJAX 코드
	    $("#checkDuplicate").on("click", ()=>{
	    	let user_id = $("#user_id").val().trim();
	    	
	    	if(user_id.length < 4){
				alert("아이디는 최소 4글자입니다.")
				return;
	    	}
	    	
	    	$.ajax({
	    		type:"get",
	    		url:"${path}/mem/idCheck",
	    		data:{user_id}, // 속성 키값 이름으로 서버에 보낼경우 1개만 쓴다. 
	    		success:
	    			(data)=>{
	    				console.log(data);
	    				if(data.validate === true){
	    					alert("이미 사용중인 아이디입니다.")
	    				}else{
	    					alert("사용 가능합니다.")
	    				}
	    			},
	    		error:
	    			(e)=>{
	    				console.log(e);
	    			}
	    	});
	    });
	});
</script>
      <jsp:include page="/WEB-INF/views/common/footer.jsp"/>