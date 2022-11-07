<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>	


    <section class="py-5" style="font-family: 'GmarketSansMedium'!important;">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 me-lg-auto">
                    <div class="card border-0 shadow mb-6 mb-lg-0">
                        <div class="card-header bg-gray-100 py-4 border-0 text-center">
                            <a class="d-inline-block" href="#"><img class="d-block avatar avatar-xxl p-2 mb-2" src="${path}/resources/img/avatar/회원.png" alt=""></a>
                            <h5><c:out value="${loginMember.user_name}" /></h5>
                            <p class="text-muted text-sm mb-0"></p>
                        </div>
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm me-2">
                                    <a class="d-inline-block" href="${path}/mem/myInfo"><img class="d-block avatar avatar-s p-2 mb-2" src="${path}/resources/img/Busan/ic_my.png" alt=""></a>
                                </div>
                                <form class="mb-0"><a href="${path}/mem/myInfo">나의 정보</a></form>


                            </div>
                            <hr>
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm me-2">
                                    <a class="d-inline-block" href="${path}/mem/myLike?user_CODE=${loginMember.user_CODE}"><img class="d-block avatar avatar-m p-1 mb-1" src="${path}/resources/img/Busan/like.png" alt=""></a>

                                </div>
                                <div>
                                    <form class="mb-0"><a href="${path}/mem/myLike?user_CODE=${loginMember.user_CODE}">찜 목록</a>
                                    </form>
                                </div>
                            </div>
                            <hr>
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm me-2">
                                    <a class="d-inline-block" href="${path}/mem/myReview?user_CODE=${loginMember.user_CODE}"><img class="d-block avatar avatar-m p-1 mb-1" src="${path}/resources/img/Busan/review.png" alt=""></a>

                                </div>
                                <div>
                                    <form class="mb-0"><a href="${path}/mem/myReview?user_CODE=${loginMember.user_CODE}">게시글 목록</a></form>
                                </div>
                            </div>
                            <hr>
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm me-2">
                                    <a class="d-inline-block" href="${path}/mem/myReservation?user_CODE=${loginMember.user_CODE}"><img class="d-block avatar avatar-m p-1 mb-1" src="${path}/resources/img/Busan/cart.png" alt=""></a>

                                </div>
                                <div>
                                    <form class="mb-0"><a href="${path}/mem/myReservation?user_CODE=${loginMember.user_CODE}">예약 목록</a></form>
                                </div>
                            </div>
                            <hr>
                        </div>
                    </div>
                </div>

               <div class="col-lg-9 ps-lg-5">
                    <h1 class="hero-heading mb-0" style="font-family: 'GmarketSansMedium'!important;">마이페이지</h1>
                    <div class="text-block">
                        <p> <span class="badge badge-secondary-light"></span></p>
                        <p class="text-muted"> </p>
                        <p class="text-muted"> </p>
                    </div>
                    <div class="text-block">
                        <div class="row">
                            <div class="col-lg-7 mb-5 mb-lg-0" style="font-family: 'GmarketSansMedium';">
                                <div class="text-block">
                                    <div class="row mb-3">
                                        <div class="col-sm-9">
                                            <h5>나의 정보</h5>
                                        </div>
                                        <div class="col-sm-3 text-end">
                                            <button class="btn btn-link ps-0 text-primary collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#personalDetails" aria-expanded="false" aria-controls="personalDetails">자세히 보기</button>
                                        </div>
                                    </div>
                                    <p class="text-sm text-muted"><i class="fa fa-id-card fa-fw me-2"></i> <c:out value="${loginMember.user_name}" /> <br><i class="fa fa-envelope-open fa-fw me-2"></i> <c:out value="${loginMember.user_email}" /> <span class="mx-2"></span> <br><i class="fa fa-phone fa-fw me-2"></i><c:out value="${loginMember.user_phone}" /></p>
                                    <div class="collapse" id="personalDetails">
                                        <form action="${path}/mem/update" method="post">
                                        
                                            <div class="row pt-4">
                                                <div class="mb-4 col-md-6">
                                                    <label class="form-label" for="name">이름</label>
                                                    <input class="form-control" type="text" name="user_name" id="user_name" placeholder="${loginMember.user_name}">
                                                </div>
                                                <br>
                                                <div class="mb-4 col-md-6">
                                                    <label class="form-label" for="email">아이디</label>
                                                    <input class="form-control" type="email" name="user_id" id="user_id" placeholder="${loginMember.user_email}">
                                                </div>
                                                <div class="mb-4 col-md-6">
                                                    <label class="form-label" for="phone">전화번호</label>
                                                    <input class="form-control" type="text" name="user_phone" id="user_phone" placeholder="${loginMember.user_phone}">
                                                </div>
                                            </div>
                                            <button class="btn btn-outline-primary">정보수정</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="text-block">
                                    <div class="row mb-3">
                                        <div class="col-sm-9">
                                            <h5>비밀번호 변경</h5>
                                        </div>
                                        <div class="col-sm-3 text-end">
                                            <button class="btn btn-link ps-0 text-primary collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#address" aria-expanded="false" aria-controls="address">자세히 보기</button>
                                        </div>
                                    </div>
                                    <div class="collapse" id="address">
                                        <form action="${path}/mem/update" method="post">
                                            <div class="row pt-4">
                                                <div class="mb-4 col-md-6">
                                                    <label class="form-label" for="user_pw">비밀번호</label>
                                                    <input class="form-control" type="text" name="user_pw" id="user_pw" placeholder="숫자,영문 혼합 8자리 이상">
                                                </div>

                                            </div>
                                            <button class="btn btn-outline-primary" type="submit" >비밀번호 변경</button>
                                        </form>
                                        <br>
                                        <hr>
                                        <br>
                                            <button class="btn btn-outline-primary" id="deleteMember">탈퇴하기</button>
                                    </div>
                                </div>
                            </div>
    </section>
    
    <script type="text/javascript">
	$(function () {
		$("#deleteMember").on("click", (e) => {
			if(confirm("정말로 탈퇴하시겠습니까?!")) {
				location.replace('${path}/mem/delete');
			}
		});
		
		$("#updatePwd").on("click", (e) => {
			const url = "${path}/member/updatePwd";
			const status = "left=500px,top=200px,width=400px,height=210px"
			
			open(url, "", status);
		});
	});
	</script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    

</html>