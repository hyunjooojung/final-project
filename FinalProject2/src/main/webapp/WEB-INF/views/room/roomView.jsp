<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section style="font-family: 'GmarketSansMedium'!important;">

        <section class="d-flex align-items-center dark-overlay bg-cover" style="background-image: url(https://cdn03.collinson.cn/airport-guides/hero-images/busan/busan-59a90d0e-fa1e-4272-b78c-4bbeb56fbc92.png?h=500&la=en&w=1920); height: 300px;">
            <div class="container py-6 py-lg-7 text-white overlay-content text-center">
                <div class="row">

                </div>
            </div>
        </section>
        
	<c:set var="adress" value="${room.adress}" />
	<c:set var="gu" value="구"/>
	<c:set var="adressCut" value="${fn:indexOf(adress, gu)}" />

        <div class="container py-5">
            <div class="row">
                <div class="col-lg-8">
                    <div class="text-block">
                        <p class="text-primary"><i class="fa-map-marker-alt fa me-1"></i>${fn:substring(adress,0,adressCut+1)} </p>
                        <h1>${room.name}</h1>
                    </div>
                    <div class="text-block">


                        <!-- <h5 class="mb-3">숙소 정보</h5> -->
                        <div style="margin-bottom:20px;">
                            <p class=" text-sm text-primary" style="font-size:5px; margin-bottom: 2px;">Information</p>
                            <h4 class="mb-0">숙소 정보</h4>
                        </div>

                        <ul class="text-muted fw-light">
                            <li>숙소명 : ${room.name}</li>
                            <li>주소 : ${room.adress}</li>
                            <c:if test="${!empty room.tel}">
                            <li>연락처 : ${room.tel}</li>
                            </c:if>
                            <c:if test="${empty room.tel}">
                            <li>연락처 : 해당 정보가 없습니다.</li>
                            </c:if>
                            <li>가격 (1박) : ${price2}원</li>
                        </ul>

                    </div>


                    <div class="text-block">
                        <!-- <h5 class="mb-4">지도</h5> -->
                        <div style="margin-bottom:20px;">
                            <p class=" text-sm text-primary" style="font-size:5px; margin-bottom: 2px;">Location</p>
                            <h4 class="mb-0">위치</h4>
                        </div>

                        <div class="map_wrap">
                            <div id="map" style="width:850px;height:325px;"></div>

                            <div class="custom_typecontrol radius_border">
                                <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
                                <span id="btnSkyview" class="btn1" onclick="setMapType('skyview')">스카이뷰</span>
                            </div>

                            <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
                            <div class="custom_zoomcontrol radius_border">
                                <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>
                                <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
                            </div>

                            <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=20ac2dfad3cd59b659261a28d8b4c104"></script>
                            <script>
                                var container = document.getElementById('map');
                                var options = {
                                    center: new kakao.maps.LatLng(${room.mapy} , ${room.mapx}),
                                    level: 2,
                                    // draggable: false
                                };

                                var map = new kakao.maps.Map(container, options);

                                map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);

                                var markerPosition = new kakao.maps.LatLng(${room.mapy} , ${room.mapx});
                                var marker = new kakao.maps.Marker({
                                    position: markerPosition
                                });
                                marker.setMap(map);

                                function setMapType(maptype) {
                                    var roadmapControl = document.getElementById('btnRoadmap');
                                    var skyviewControl = document.getElementById('btnSkyview');
                                    if (maptype === 'roadmap') {
                                        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);
                                        roadmapControl.className = 'selected_btn';
                                        skyviewControl.className = 'btn1';
                                    } else {
                                        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
                                        skyviewControl.className = 'selected_btn';
                                        roadmapControl.className = 'btn1';
                                    }
                                }

                                // 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
                                function zoomIn() {
                                    map.setLevel(map.getLevel() - 1);
                                }

                                // 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
                                function zoomOut() {
                                    map.setLevel(map.getLevel() + 1);
                                }
                            </script>
                        </div>

                    </div>

                    <div class="text-block">
                        <p class=" text-sm text-primary" style="font-size:5px; margin-bottom: 2px;">Reviews </p>
                        <!-- <p class="subtitle text-sm text-primary">Reviews </p> -->
                        <h5 class="mb-4">리뷰 </h5>
                        <div class="d-flex d-block d-sm-flex review">
                            <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="${path}/resources/img/Busan/미모티콘1.png" alt="Padmé Amidala"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
                            <div>
                                <h6 class="mt-2 mb-1">김영도</h6>
                                <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i>
                                </div>
                                <p class="text-muted text-sm">숙소가 깔끔해서 좋았어요. </p>
                            </div>
                        </div>
                        <div class="d-flex d-block d-sm-flex review">
                            <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="${path}/resources/img/Busan/미모티콘2.jpeg" alt="Luke Skywalker"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
                            <div>
                                <h6 class="mt-2 mb-1">강인국</h6>
                                <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                                </div>
                                <p class="text-muted text-sm">교통편이 편해서 좋았어요. </p>
                            </div>
                        </div>
                        <div class="d-flex d-block d-sm-flex review">
                            <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="${path}/resources/img/Busan/미모티콘3.jpeg" alt="Princess Leia"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
                            <div>
                                <h6 class="mt-2 mb-1">김보성</h6>
                                <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                                </div>
                                <p class="text-muted text-sm">주변 관광지가 좋았어요. </p>
                            </div>
                        </div>
                        <div class="d-flex d-block d-sm-flex review">
                            <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="${path}/resources/img/Busan/미모티콘1.png" alt="Jabba Hut"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
                            <div>
                                <h6 class="mt-2 mb-1">최희정</h6>
                                <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i>
                                </div>
                                <p class="text-muted text-sm">굉장히 좋았어요.  </p>
                            </div>
                        </div>
                        <div class="py-5">
                        </div>
                    </div>
                </div>
                
                <!-- 예약 -->
                <div class="col-lg-4">
                    <div class="p-4 shadow ms-lg-4 rounded" style="top: 100px;">
                        <p class="text-muted"><span class="text-primary h2">￦ ${price2} </span> 1박</p>
                        <hr class="my-4">
                        <form class="form" id="booking-form" method="get" action="${path}/room/roomBooking">
                        <input type="hidden" id="loginUser" name="loginUser" class="input_text" value="${loginMember}" readonly  />
                            
                            <input type="hidden" name="code" value="${room.code}" readonly />
                            <div class="mb-4">
                                <label class="form-label text-lg" for="bookingDate">날짜 * </label>
                                <div class="datepicker-container datepicker-container-right">
                                    <input class="form-control" type="text" name="bookingDate" id="bookingDate" placeholder="날짜를 선택해주세요." required="required">
                                </div>
                            </div>

                            <div class="d-grid mb-4">
                                <button class="btn btn-primary" type="submit">예약하기</button>
                            </div>
                        </form>
                        <p class="text-muted text-sm text-center">Some additional text can be also placed here.</p>
                        <hr class="my-4">
                        <div class="text-center">
                        
                        	<c:if test="${loginMember != null}">
                            <p>
                                <a class="text-secondary text-sm" href="${path}/mem/bookmark?bmc_code=2&code=${room.code}&User_CODE=${loginMember.getUser_CODE()}">
                                	<i class="fa fa-heart"></i> 
                                	찜하기
                                </a>
                            </p>
                            </c:if>
                            <p class="text-muted text-sm">79 명이 찜 목록에 추가하였습니다. </p>
                            
                        </div>
							


                    </div>


                    <div class="p-4 shadow ms-lg-4 rounded" style="top: 100px; margin-top: 50px;">



                        <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(${room.image}) no-repeat; background-size: cover;">

                            <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">

                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </section>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>