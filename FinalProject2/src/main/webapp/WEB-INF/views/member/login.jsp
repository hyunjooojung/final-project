<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<c:if test="${cookie.CustomCheck.value != null}">
	<c:set var="checked" value="checked"/>
</c:if>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>	

 <div class="container-fluid px-3">
        <div class="row min-vh-100">
            <div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
                <div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
                        <h1 style="font-family: 'GmarketSansMedium'!important;">LOGIN</h1>
                    <form class="form-validate" action="${path}/mem/login" method="post"style="font-family: 'GmarketSansMedium'!important;">
                        <div class="mb-4">
                            <label class="form-label" for="loginUsername">아이디</label>
                            <input class="form-control" name="userId" id="userId" type="email" placeholder="아이디" autocomplete="off"  data-msg="Please enter your email"
                            value="${cookie.CustomCheck.value}" required="required">
                        </div>
                        <div class="mb-4">
                            <div class="row">
                                <div class="col">
                                    <label class="form-label" for="loginPassword">비밀번호</label>
                                </div>                           
                            </div>
                            <input class="form-control" name="userPwd" id="userPwd" placeholder="비밀번호" type="password"  data-msg="Please enter your password"
                            required="required">
                        </div>
                        <div class="mb-4">
                            <div class="form-check">
                                <input class="form-check-input" id="loginRemember" name="loginRemember" type="checkbox" ${checked}>
                                <label class="form-check-label text-muted" for="loginRemember"> <span class="text-sm">아이디 저장</span></label>
                            </div>
                        </div>
                        <!-- Submit-->
                        <div class="d-grid">
                            <button class="btn btn-lg btn-primary" type="submit">로그인</button>
                        </div>
                        <hr class="my-3 hr-text letter-spacing-2" data-content="OR">
                     </form>
                      	
                        <div class="d-grid gap-2">
                            
                           <div style="text-align:center; width:100%">
	                           <a href="${path}/mem/naver">
	                           	<img width="65%"  src="${path}/resources/img/Busan/naver.png"/>
	                           </a>
                           </div>
                           
                           <div style="text-align:center; width:100%">
	                           <a href="https://kauth.kakao.com/oauth/authorize?client_id=299265b3d27538f35ac8fa36f09f60e5&redirect_uri=http://localhost/fp/mem/kakao&response_type=code">
	                            	<img width="65%" src="${path}/resources/img/Busan/kakao.png">
	                            </a>
                            </div>
                                                                                
                        </div>
                        
                        <hr class="my-4">
                        <p class="text-center"><small class="text-muted text-center">아직 계정이 없으신가요?<a href="${path}/mem/moveSignup">회원가입</a></small></p>
                    
                    <a class="close-absolute me-md-5 me-xl-6 pt-5" href="${path}">
                        <svg class="svg-icon w-3rem h-3rem">
                <use xlink:href="#close-1"> </use>
              </svg></a>
                </div>
            </div>
            <div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
                <!-- Image-->
                <div class="bg-cover h-100 me-n3" style="background-image: url(${path}/resources/img/Busan/로그인2\ \(2\).png);"></div>
            </div>
        </div>
    </div>
    

 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>