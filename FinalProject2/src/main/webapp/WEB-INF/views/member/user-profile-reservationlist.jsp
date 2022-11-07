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

                <div class="col-lg-9 ps-lg-5" style="font-family: 'GmarketSansMedium'!important;">
                    <h1 class="hero-heading mb-0">마이페이지</h1>
                    <div class="text-block">
                        <p> <span class="badge badge-secondary-light"></span></p>
                        <p class="text-muted"> </p>
                        <p class="text-muted"> </p>
                    </div>
                    <div class="text-block">
                        <h4 class="mb-5">예약 목록</h4>
                    </div>
                    <div class="d-flex justify-content-between align-items-center flex-column flex-lg-row mb-5">
                        <div class="me-3">
                            <p class="mb-3 mb-lg-0"> <strong>숙소 : ${acrReserCount} 개 / 맛집 : ${grpReserCount} 개 </strong>예약내역이 있습니다.</p>
                        </div>
                       
                    </div>
                    
                   
                    
                    
                    
                    <c:if test="${!empty roomReserDetail}">
                            <c:forEach var="roomReserDetail" items="${roomReserDetail}" varStatus="status" >
                    <div class="d-flex shadow">
                        <a class="list-group-item list-group-item-action p-4"  href="${path}/room/view?code=${roomReserDetail.code}">
                            <div class="row">
                                <div class="col-lg-4 align-self-center mb-4 mb-lg-0">
                                    <div class="d-flex align-items-center mb-3" style="width:380px;">
                                        <h2 class="h5 mb-0">${roomReserDetail.name}</h2>
                                    </div>
                                    <p class="text-sm text-muted">${roomReserDetail.adress}</p><span class="badge badge-pill p-2 badge-secondary-light">숙소</span>
                                </div>
                                <div class="col-lg-8">
                                    <div class="row" style="margin-left:150px;">
                                        <div class="col-6 col-md-4 col-lg-4 py-4 mb-4 mb-lg-0"style="width:150px;">
                                            <h6 class="label-heading">체크인</h6>
                                            <p class="text-sm fw-bold">${roomReserDetail.ar_in}</p>
                                            <h6 class="label-heading">인원 수 </h6>
                                            <p class="text-sm fw-bold mb-0">${roomReserDetail.ar_people}</p>
                                        </div>
                                        <div class="col-6 col-md-4 col-lg-3 py-3" style="width:150px;">
                                            <h6 class="label-heading" style="margin-top:6px;">체크아웃</h6>
                                            <p class="text-sm fw-bold">${roomReserDetail.ar_out}</p>
                                            <h6 class="label-heading">요금</h6>
                                            <p class="text-sm fw-bold mb-0">${roomReserDetail.price}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                                        <div class="col-12 col-lg-3 align-self-center row" style="text-align:center;"><span class="text-primary text-sm text-uppercase me-4 me-lg-0"><i class="fa fa-check fa-fw me-2"> </i>결제 완료</span><br class="d-none d-lg-block"><span class="text-primary text-sm text-uppercase"><i class="fa fa-check fa-fw me-2"> </i>확인</span>
                                            <button type="button" class="btn btn-outline-primary" onclick="location.href='${path}/mem/deleteRoomReser?ar_code=${roomReserDetail.ar_code}'" style="width:110px; margin-left:60px;">취소하기</button>
                                        </div>
                        
                        </div>
                        </c:forEach>
                        </c:if>
                        
                        
                        
                        
                        
                        
                        <c:if test="${!empty resReserDetail}">
                            <c:forEach var="resReserDetail" items="${resReserDetail}" varStatus="status" >
                        <div class="d-flex shadow">
                        <a class="list-group-item list-group-item-action p-4" href="${path}/res/view?no=${resReserDetail.res_id}" >
                            <div class="row">
                                <div class="col-lg-4 align-self-center mb-4 mb-lg-0">
                                    <div class="d-flex align-items-center mb-3" style="width:380px;">
                                        <h2 class="h5 mb-0">${resReserDetail.res_name}</h2>
                                    </div>
                                    <p class="text-sm text-muted">${resReserDetail.addr}</p><span class="badge badge-pill p-2 badge-primary-light" >맛집</span>
                                    
                                </div>
                                <div class="col-lg-8">
                                    <div class="row" style="margin-left:80px; " >
                                        <div class="col-6 col-md-4 col-lg-4 py-4 mb-4 mb-lg-0">
                                            <h6 class="label-heading">방문예정날짜</h6>
                                            <p class="text-sm fw-bold">${resReserDetail.gr_time}</p>
                                            <h6 class="label-heading">어른 수 </h6>
                                            <p class="text-sm fw-bold mb-0">${resReserDetail.adult_num} 명</p>
                                            <h6 class="label-heading" style="margin-top:8px;">청소년 수 </h6>
                                            <p class="text-sm fw-bold mb-0">${resReserDetail.teenager_num} 명</p>
                                        </div>
                                        <div class="col-6 col-md-4 col-lg-3 py-3" style="width:150px;">
                                            <h6 class="label-heading" style="margin-top:6px;">방문예정시각</h6>
                                            <p class="text-sm fw-bold">${resReserDetail.going_time}시</p>
                                            
                                            <h6 class="label-heading">아동 수 </h6>
                                            <p class="text-sm fw-bold mb-0">${resReserDetail.kids_num} 명</p>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                                        <div class="col-12 col-lg-3 align-self-center row" style="text-align:center;"><span class="text-primary text-sm text-uppercase me-4 me-lg-0"><i class="fa fa-check fa-fw me-2"> </i>결제 완료</span><br class="d-none d-lg-block"><span class="text-primary text-sm text-uppercase"><i class="fa fa-check fa-fw me-2"> </i>확인</span>
                                            <button type="button" class="btn btn-outline-primary" onclick="location.href='${path}/mem/deleteResReser?gp_code=${resReserDetail.gp_code}'" style="width:110px; margin-left:60px;">취소하기</button>
                                        </div>
                    </div>
                        </c:forEach>
                        </c:if>
                        
                        
                        
                        

                        
                    <!-- Pagination -->
                  
                </div>

                
            </div>
        </div>
    </section>

       <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <!-- JavaScript files-->
    <script>
        // ------------------------------------------------------- //
        //   Inject SVG Sprite - 
        //   see more here 
        //   https://css-tricks.com/ajaxing-svg-sprite/
        // ------------------------------------------------------ //
        function injectSvgSprite(path) {

            var ajax = new XMLHttpRequest();
            ajax.open("GET", path, true);
            ajax.send();
            ajax.onload = function(e) {
                var div = document.createElement("div");
                div.className = 'd-none';
                div.innerHTML = ajax.responseText;
                document.body.insertBefore(div, document.body.childNodes[0]);
            }
        }
        // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
        // use your own URL in production, please :)
        // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
        //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
        injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');
    </script>
    <!-- jQuery-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>
        var basePath = ''
    </script>
    <!-- Main Theme JS file    -->
    <script src="js/theme.js"></script>
</body>

</html>