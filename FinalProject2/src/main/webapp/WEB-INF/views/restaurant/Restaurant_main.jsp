<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<jsp:include page="/WEB-INF/views/common/header.jsp"/>	

<section class="hero-home">
        <div class="swiper-container hero-slider">
            <div class="swiper-wrapper dark-overlay">
                <div class="swiper-slide" style="background-image:url(${path}/resources/img/Busan/foodimg1.png)"></div>
            </div>
        </div>

        <div class="container py-6 py-md-7 text-white z-index-20" style="font-family: 'GmarketSansMedium'!important;">
            <div class="row">
                <div style="width:950px;">
                    <div class="text-center text-lg-start">
                        <p class="subtitle letter-spacing-4 mb-2 text-secondary text-shadow">The best restaurant experience</p>
                        <h5 class="display-5 fw-bold text-shadow">부산 맛집을 검색해보세요!</h5>
                    </div>
                    <div class="search-bar mt-5 p-3 p-lg-1 ps-lg-4">
                        <form action="${path}/res/mainSearch" method="get">
                            <div class="row">
                                <div class=" d-flex align-items-center form-group" style="width:500px;">
                                    <input class="form-control border-0 shadow-0" type="text"  id="detail" name="detail" value="${param.detail}" placeholder="&nbsp;&nbsp;검색어">
                                </div>

                                <div class=" d-flex align-items-center form-group no-divider" style="width:268px;">
                                    <select class="selectpicker" id="gugunnm" name="gugunnm" title="지역" data-style="btn-form-control">
                          <option value=""></option>
                          <option value="강서구">강서구</option>
                          <option value="금정구">금정구</option>
                          <option value="기장군">기장군</option>
                          <option value="남구">남구</option>
                          <option value="동구">동구</option>
                          <option value="동래구">동래구</option>
                          <option value="부산진구">부산진구</option>
                          <option value="북구">북구</option>
                          <option value="사상구">사상구</option>
                          <option value="사하구">사하구</option>
                          <option value="서구">서구</option>
                          <option value="수영구">수영구</option>
                          <option value="연제구">연제구</option>
                          <option value="영도구">영도구</option>
                          <option value="중구">중구</option>
                          <option value="해운대구">해운대구</option>
                                    </select>
                                </div>
                                <div class="col-lg-2 d-grid">
                                    <button class="btn btn-primary rounded-pill h-100" type="submit">Search </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section style="font-family: 'GmarketSansMedium'!important;">
        <div class="container">
            <div class="row mt-4 mb-3">
                <div class="text-center pb-lg-4">
                    <p class="text-sm subtitle text-secondary mt-3">The Restaurant recommend</p>
                    <h2>결정장애를 위한 랜덤맛집</h2>
                </div>
            </div>
        </div>
        
        
        
        <div class="container-fluid">
            <div class="row">
            
            
            <c:if test="${!empty Flist}">
            <c:forEach var="restaurant" items="${Flist}" step="1" begin="1" end="9">
            
            
            <!-- 메인 사진 -->
            
            
            
            
                <div class="col-6 col-lg-4 col-xl-3 px-0">
                    <div class="d-flex align-items-center dark-overlay hover-scale-bg-image" style="min-height: 400px;"><img class="bg-image" src="${restaurant.img}" alt="">
                         <a class="tile-link" href="${path}/res/view?no=${restaurant.res_id}"></a>
                        <div class="p-3 p-sm-5 text-white z-index-20">
                            <h4 class="h2"><c:out value="${restaurant.res_name}"/></h4>
                            <p class="mb-4"><c:out value="${restaurant.addr}"/></p>
                            <a class="btn btn-link text-reset ps-0 stretched-link text-decoration-none" href="#">상세보기<i class="fa fa-chevron-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
                
                </c:forEach>
                </c:if>










                <section class="py-3 bg-gray-100 mt-5 mb-5">
                    <div class="container">
                        <div class="text-center pb-lg-4">
                            <p class="text-sm subtitle text-secondary mt-3">The Random restaurant recommend</p>
                            <h2>이달의 맛집 추천</h2>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <!-- Slider main container-->
                        <div class="swiper-container swiper-container-mx-negative items-slider-full px-lg-5 pt-3">
                            <!-- Additional required wrapper-->
                            <div class="swiper-wrapper pb-5">
                                <!-- Slides-->
                                
                                <c:if test="${!empty list}">
          						  <c:forEach var="restaurant" items="${list}" varStatus="status" begin="9" end="17">
                                
                                
                                <div class="swiper-slide h-auto px-1">
                                    <!-- venue item-->
                                    <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                                        <div class="card h-100 border-0 shadow">
                                            <div class="card-img-top overflow-hidden dark-overlay bg-cover" style="background-image: url(${restaurant.img}); min-height: 200px;">
                                                 <a class="tile-link" href="${path}/res/view?no=${restaurant.res_id}"></a>
                                                <div class="card-img-overlay-bottom z-index-20">
                                                    <h4 class="text-white text-shadow">${restaurant.res_name}</h4>
                                                    <p class="mb-2 text-xs">
                                                        <i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                    </i>
                                                    </p>
                                                </div>
                                                <div class="card-img-overlay-top d-flex justify-content-between align-items-center">
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <p class="text-sm text-muted mb-3"><svg class="icon-bs theme-line-1"><use xlink:href="#beach-1 "></use></svg> 위치 : ${restaurant.addr}</p>
                                                <p class="text-sm text-muted mb-3"><svg class="icon-bs theme-line-1"><use xlink:href="#time-1"></use></svg> 운영시간 : ${restaurant.time}</p>
                                                <p class="text-sm text-muted mb-3"><svg class="icon-bs theme-line-0"><use xlink:href="#calls-2"></use></svg> 전화번호 : ${restaurant.tel}</p>
                                                <p class="text-sm mb-0"><a class="me-1" href="#">상세보기<i class="fa fa-chevron-right ms-2"></i></a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                               
                                
                                </c:forEach>
                </c:if>
                            </div>
                            <!-- If we need pagination-->
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </section>


    <section class="py-5" style="font-family: 'GmarketSansMedium'!important;">
        <div class="container">
            <div class="text-center">
                <p class="text-sm subtitle text-secondary mt-3">The Best Reviews</p>
                <h2 class="mb-5">인기 리뷰</h2>
            </div>
            <!-- Slider main container-->
            <div class="swiper-container testimonials-slider testimonials">
                <!-- Additional required wrapper-->
                <div class="swiper-wrapper pt-2 pb-5">
                    <!-- Slides-->
                    <div class="swiper-slide p-4">
                        <div class="testimonial card rounded-3 shadow border-0">
                            <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${path}/resources/img/Busan/펄슨1.png" alt="..."></div>
                            <div class="text">
                                <p class="testimonial-text">#거대갈비<br>거대갈비는 고기가 정말 맛있고, 부드러웠습니다!! 다음에 부산 오게된다면 재방문 의사 있습니다. </p><strong>김보성</strong>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide p-4">
                        <div class="testimonial card rounded-3 shadow border-0">
                            <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${path}/resources/img/Busan/펄슨2.png" alt="..."></div>
                            <div class="text">
                                <p class="testimonial-text">#해운대소문난암소갈비집<br>부산 암소갈비 웨이팅 정말 길었지만 기다리는 보람이 있습니다. 존맛탱!!</p><strong>김미니</strong>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide p-4">
                        <div class="testimonial card rounded-3 shadow border-0">
                            <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${path}/resources/img/Busan/펄슨3.png" alt="..."></div>
                            <div class="text">
                                <p class="testimonial-text">#해성막창<br>부산하면 해성막창! 강추합니다 꼭 드세요!! 곱창전골까지 완벽합니다 필수에요.</p><strong>김하니</strong>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide p-4">
                        <div class="testimonial card rounded-3 shadow border-0">
                            <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${path}/resources/img/Busan/펄슨4.png" alt="..."></div>
                            <div class="text">
                                <p class="testimonial-text">#할매국밥<br>부산 동구 오전 9시 오픈시간 맞춰서 도착했는데 이곳 완전 찐입니다 ㅋㅋ 양 푸짐하고 고기 잡내없이 촉촉합니다.</p><strong>강인국</strong>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide p-4">
                        <div class="testimonial card rounded-3 shadow border-0">
                            <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${path}/resources/img/Busan/펄슨5.png" alt="..."></div>
                            <div class="text">
                                <p class="testimonial-text">#톤쇼우<br>주말 테이블링 열리자마자 예약했는데 4시간 웨이팅 희희.. 참고하세용 버크셔 숯불향, 육질, 육즙 최고! 카레는 인생카레에요!!</p><strong>신무균</strong>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide p-4">
                        <div class="testimonial card rounded-3 shadow border-0">
                            <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${path}/resources/img/Busan/펄슨6.png" alt="..."></div>
                            <div class="text">
                                <p class="testimonial-text ">#이가네떡볶이<br>물 없이 무로만 만든다는 그 유명한 떢볶이!! 무 단맛이 나는데 적당하고 딱 좋아요!! 부산 시장 구경하면 한번쯤 먹으면 좋은곳 </p><strong>정현주</strong>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination "> </div>
            </div>
        </div>
    </section>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>