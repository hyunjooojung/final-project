<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>	

<input type="hidden" id="user_code" name="user_code" class="input_text" value="${loginMember.user_CODE}" />
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
                        <h4 class="mb-5" style="font-family: 'GmarketSansMedium'!important;">찜 목록</h4>
                        <div class="row">
                            <!-- place item-->
                            
                            
                            
                            
                             <c:if test="${!empty desBookList}">
                            <c:forEach var="desBookList" items="${desBookList}" varStatus="status" > 
                            
                            
                            <div class="col-sm-6 col-lg-4 mb-30px hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                                <div class="card h-100 border-0 shadow">
                                    <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${desBookList.img}" style="height:226px;"  />
                                        <a class="tile-link" href="https://www.visitbusan.net/uploadImgs/files/cntnts/20191222180829962_ttiel"></a>
                                        <div class="card-img-overlay-bottom z-index-20">
                                            <div class="d-flex text-white text-sm align-items-center">
                                            </div>
                                        </div>
                                       
                                    </div>
                                    <div class="card-body d-flex align-items-center">
                                        <div class="w-100">
                                            <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">${desBookList.name}</a></h6>
                                            <div class="d-flex card-subtitle mb-3">
                                                <p class="flex-grow-1 mb-0 text-muted text-sm"></p>
                                                <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                                </p>
                                            </div>
                                            <p class="card-text text-muted"><span class="h4 text-primary"></span> ${desBookList.usage_day_week} </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            </c:forEach>
                            </c:if>
                            
                            
                            
                            <c:if test="${!empty roomBookList}">
                            <c:forEach var="roomBookList" items="${roomBookList}" varStatus="status" > 
                            
                            
                            <div class="col-sm-6 col-lg-4 mb-30px hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                                <div class="card h-100 border-0 shadow">
                                    <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" style="height:226px;"src="${roomBookList.image}"  />
                                        <a class="tile-link" href="${path}/room/view?code=${roomBookList.code}"></a>
                                        <div class="card-img-overlay-bottom z-index-20">
                                            <div class="d-flex text-white text-sm align-items-center">
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="card-body d-flex align-items-center">
                                        <div class="w-100">
                                        <span class="badge badge-pill p-2 badge-primary-light" style="margin-bottom:10px;">숙소</span>
                                            <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">${roomBookList.name}</a></h6>
                                            <div class="d-flex card-subtitle mb-3">
                                                <p class="flex-grow-1 mb-0 text-muted text-sm"></p>
                                                <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                                </p>
                                            </div>
                                            <p class="card-text text-muted"><span class="h4 text-primary"></span> ${roomBookList.tel} </p>
                                            <c:if test="${empty roomBookList.tel}">
                                            <p class="card-text text-muted"><span class="h4 text-primary"></span> 051-329-5283 </p>
                                            
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            </c:forEach>
                            </c:if>
                            
                            <c:if test="${!empty resBookList}">
                            <c:forEach var="resBookList" items="${resBookList}" varStatus="status" > 
                            
                            
                            <div class="col-sm-6 col-lg-4 mb-30px hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                                <div class="card h-100 border-0 shadow">
                                    <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${resBookList.img_thumb}" style="height:226px;"  />
                                        <a class="tile-link" href="${path}/res/view?no=${resBookList.res_id}"></a>
                                        <div class="card-img-overlay-bottom z-index-20">
                                            <div class="d-flex text-white text-sm align-items-center">
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="card-body d-flex align-items-center">
                                        <div class="w-100">
                                        <span class="badge badge-pill p-2 badge-secondary-light" style="margin-bottom:10px;">맛집</span>
                                            <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">${resBookList.res_name}</a></h6>
                                            <div class="d-flex card-subtitle mb-3">
                                                <p class="flex-grow-1 mb-0 text-muted text-sm"></p>
                                                <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                                </p>
                                            </div>
                                            <p class="card-text text-muted"><span class="h4 text-primary"></span> ${resBookList.time} </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            </c:forEach>
                            </c:if>
                            
                            <c:if test="${!empty fesBookList}">
                            <c:forEach var="fesBookList" items="${fesBookList}" varStatus="status" > 
                            
                            
                            <div class="col-sm-6 col-lg-4 mb-30px hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                                <div class="card h-100 border-0 shadow">
                                    <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${fesBookList.img}" style="height:226px;" />
                                        <a class="tile-link" href="${path}/festival/FestivalDetail?fe_id=${fesBookList.fe_id}"></a>
                                        <div class="card-img-overlay-bottom z-index-20">
                                            <div class="d-flex text-white text-sm align-items-center">
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="card-body d-flex align-items-center">
                                        <div class="w-100">
                                        <span class="badge badge-pill p-2 badge-primary-light" style="margin-bottom:10px;">축제</span>
                                            <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">${fesBookList.fe_title}</a></h6>
                                            <div class="d-flex card-subtitle mb-3">
                                                <p class="flex-grow-1 mb-0 text-muted text-sm"></p>
                                                <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                                </p>
                                            </div>
                                            <p class="card-text text-muted"><span class="h4 text-primary"></span> ${fesBookList.time} </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            </c:forEach>
                            </c:if>
                            
                            <c:if test="${!empty kindBookList}">
                            <c:forEach var="kindBookList" items="${kindBookList}" varStatus="status" > 
                            
                            
                            <div class="col-sm-6 col-lg-4 mb-30px hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                                <div class="card h-100 border-0 shadow">
                                    <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="https://${kindBookList.img1}" style="height:226px;"  />
                                        <a class="tile-link" href="${path}/kind/view?kind_id=${kindBookList.kind_id}"></a>
                                        <div class="card-img-overlay-bottom z-index-20">
                                            <div class="d-flex text-white text-sm align-items-center">
                                            </div>
                                        </div>
                                        <div class="card-img-overlay-top text-end">
                                           
                                        </div>
                                    </div>
                                    <div class="card-body d-flex align-items-center">
                                        <div class="w-100">
                                        <span class="badge badge-pill p-2 badge-secondary-light" style="margin-bottom:10px;">착한가게</span>
                                            <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">${kindBookList.kind_name}</a></h6>
                                            <div class="d-flex card-subtitle mb-3">
                                                <p class="flex-grow-1 mb-0 text-muted text-sm"></p>
                                                <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                                </p>
                                            </div>
                                            <p class="card-text text-muted"><span class="h4 text-primary"></span> ${kindBookList.bsntime} </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            </c:forEach>
                            </c:if>
                            
                            
                            
                           
                          
                        </div>


                       
                    </div>
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