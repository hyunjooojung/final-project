<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- Hero Section-->
    <section class="pt-7 pb-5 d-flex align-items-end dark-overlay bg-cover" style="background-image: url('${d.img}'); font-family: 'GmarketSansMedium !important';">
        <div class="container overlay-content">
            <div class="d-flex justify-content-between align-items-start flex-column flex-lg-row align-items-lg-end">
                <div class="text-white mb-4 mb-lg-0" style="font-family: 'GmarketSansMedium'!important;">

                    <h1 class="text-shadow verified">${d.place}</h1>
                    <p><i class="fa-map-marker-alt fas me-2"></i> ${d.addr}</p>
                    <p class="mb-0 d-flex align-items-center"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200 me-4">                   </i>8
                        Reviews
                    </p>
                </div>
                <div class="calltoactions"><a class="btn btn-primary" href="${path}/mem/bookmark?bmc_code=1&code=${d.de_id}&User_CODE=${loginMember.getUser_CODE()}">찜 하기</a></div>
            </div>
        </div>
    </section>
    <section class="py-6">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <!-- About Listing-->

                    <div class="text-block" style="font-family: 'GmarketSansMedium'!important;">
                        <h3 class="mb-3">${d.title}</h3>
                        <p class="text-muted"> ${d.subtitle}</p>
                        <p class="text-muted"> ${d.detail} </p>
                  </div>
                    <div class="text-block">
                        <!-- 위치-->
                        <h3 class="mb-4" style="font-family: 'GmarketSansMedium'!important;">위치</h3>
                        <div class="map_wrap">
                            <div id="map" style="width:850px;height:325px;"></div>

                            <div class="custom_typecontrol radius_border">
                                <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
                                <span id="btnSkyview" class="btn1" onclick="setMapType('skyview')">스카이뷰</span>
                            </div>

                            <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
                            <div class="custom_zoomcontrol radius_border">
                                <span onclick="zoomIn()"><img src="${path}/resources/img/Busan/ico_plus.png" alt="확대"></span>
                                <span onclick="zoomOut()"><img src="${path}/resources/img/Busan/ico_minus.png" alt="축소"></span>
                            </div>

                            <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=20ac2dfad3cd59b659261a28d8b4c104"></script>
                            <script>
                                var container = document.getElementById('map');
                                var options = {
                                    center: new kakao.maps.LatLng(${d.lat}, ${d.lng}),
                                    level: 2,
                                    // draggable: false
                                };

                                var map = new kakao.maps.Map(container, options);

                                map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);

                                var markerPosition = new kakao.maps.LatLng(${d.lat}, ${d.lng});
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
                        <!-- Gallery-->
                        <h3 class="mb-4" style="font-family: 'GmarketSansMedium'!important;">사진 보기</h3>
                        <div class="row gallery ms-n1 me-n1">
                            <div class="col-lg-4 col-6 px-1 mb-2">
                                <a href="${path}/resources/img/Busan/restaurant-1515164783716-8e6920f3e77c.jpg"><img class="img-fluid" src="${path}/resources/img/Busan/restaurant-1515164783716-8e6920f3e77c.jpg" alt="..."></a>
                            </div>
                            <div class="col-lg-4 col-6 px-1 mb-2">
                                <a href="${path}/resources/img/Busan/restaurant-1466978913421-dad2ebd01d17.jpg"><img class="img-fluid" src="${path}/resources/img/Busan/restaurant-1466978913421-dad2ebd01d17.jpg" alt="..."></a>
                            </div>
                            <div class="col-lg-4 col-6 px-1 mb-2">
                                <a href="${path}/resources/img/Busan/restaurant-1477763858572-cda7deaa9bc5.jpg"><img class="img-fluid" src="${path}/resources/img/Busan/restaurant-1477763858572-cda7deaa9bc5.jpg" alt="..."></a>
                            </div>
                            <div class="col-lg-4 col-6 px-1 mb-2">
                                <a href="${path}/resources/img/Busan/restaurant-1505275350441-83dcda8eeef5.jpg"><img class="img-fluid" src="${path}/resources/img/Busan/restaurant-1505275350441-83dcda8eeef5.jpg" alt="..."></a>
                            </div>
                            <div class="col-lg-4 col-6 px-1 mb-2">
                                <a href="${path}/resources/img/Busan/restaurant-1508766917616-d22f3f1eea14.jpg"><img class="img-fluid" src="${path}/resources/img/Busan/restaurant-1508766917616-d22f3f1eea14.jpg" alt="..."></a>
                            </div>
                            <div class="col-lg-4 col-6 px-1 mb-2">
                                <a href="${path}/resources/img/Busan/restaurant-1430931071372-38127bd472b8.jpg"><img class="img-fluid" src="${path}/resources/img/Busan/restaurant-1430931071372-38127bd472b8.jpg" alt="..."></a>
                            </div>
                        </div>
                    </div>
                    <!-- Amenities-->
                    <div class="text-block" style="font-family: 'GmarketSansMedium'!important;">
                        <h3 class="mb-4">Amenities</h3>
                        <ul class="amenities-list list-inline">
                            <li class="list-inline-item mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="icon-circle bg-secondary mr-2"><i class="fa fa-check"></i></div><span>이용요금  무료</span>
                                </div>
                            </li>

                            <li class="list-inline-item mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="icon-circle bg-secondary mr-2"><i class="fa fa-check"></i></div><span>접근로	출입구까지 턱이 없어 휠체어 접근 가능함</span>
                                </div>
                            </li>
                            <li class="list-inline-item mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="icon-circle bg-secondary mr-2"><i class="fa fa-check"></i></div><span>주차가능</span>
                                </div>
                            </li>
                            <li class="list-inline-item mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="icon-circle bg-secondary mr-2"><i class="fa fa-check"></i></div><span>화장실	장애인 화장실 있음_무장애 편의시설</span>
                                </div>
                            </li>
                            <li class="list-inline-item mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="icon-circle bg-secondary mr-2"><i class="fa fa-check"></i></div><span>편의시설</span>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <!-- Amenities-->


                    <div class="text-block" style="font-family: 'GmarketSansMedium'!important;">
                        <p class="subtitle text-sm text-primary">Reviews </p>
                        <h5 class="mb-4">리뷰보기 </h5>
                        <div class="media d-block d-sm-flex review">
                            <div class="text-md-center mr-4 mr-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="${path}/resources/img/avatar/avatar-8.jpg" alt="Padmé Amidala"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
                            <div class="media-body">
                                <h6 class="mt-2 mb-1">부산롯데팬</h6>
                                <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i>
                                </div>
                                <p class="text-muted text-sm">해 질때쯤 가면 진짜 하늘 맑고 예쁘고 핑크빛 하늘 바다에 비치면서 사진 찍는데 진짜 눈으로 보는것만 못해서 넋놓고 보게 되서 좋네요 ㅋㅋㅋㅋ 코로나 때문에 맘편하게 못 봤지만 그래도 지나가다 너무 예뻐서 사진도 찍었어요 주변에 강아지랑 산책하는 사람 엄청 많아요 바다라 바람 불면 꽤 추우니까 옷 따듯하게 입고 가시고 근처에 공중전화기에 핸드폰 보조배터리 빌리는 곳도 있었어요 단 돈 500원!
                                    주변에 카페랑 식당이 많은데 그 근처는 다 이런 뷰겠네요 !
                                </p>
                            </div>
                        </div>
                        <div class="media d-block d-sm-flex review" style="font-family: 'GmarketSansMedium'!important;">
                            <div class="text-md-center mr-4 mr-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="${path}/resources/img/avatar/avatar-2.jpg" alt="Luke Skywalker"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
                            <div class="media-body">
                                <h6 class="mt-2 mb-1">부기랑</h6>
                                <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                                </div>
                                <p class="text-muted text-sm">해수욕장 과 편의시설(식당,편의점,술집 호텔)이 길 건너에 같이있어 너무나도 편리한 장소 입니다 가족끼리 연인끼리 많이 오시네요~ 해수욕장에서 바라보는 광안대교 뷰는 예술 입니다 야경은 정말 정말 멋집니다 </p>
                            </div>
                        </div>
                        <div class="media d-block d-sm-flex review">
                            <div class="text-md-center mr-4 mr-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="${path}/resources/img/avatar/avatar-3.jpg" alt="Princess Leia"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
                            <div class="media-body">
                                <h6 class="mt-2 mb-1">부기랑팬이에요</h6>
                                <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                                </div>
                                <p class="text-muted text-sm">광안리 해수욕장은 언제 와도 좋은거 같아요. 해가 쨍쨍한 낮이랑 야경이 좋은 밤 모습이 서로 다르게 예뻐요. 바다만 있지 않고 주변엔 식당이나 카페, 놀거리 등등이 정말 많고 저녁때가 되면 버스킹도 자주 하러 오세요! 그리고 이제 코로나도 점점 완화되고 있는 추세니 여름에 오시면 물놀이 하시고 바로 근처에 식당 정말 많으니까 맛있는것들 드시면 좋을것 같고 가을에 불꽃축제하면 구경들 많이 오세요.
                                    일출도 잘보여서 해돋이 보러 오시면 좋아요! 부산을 처음 오는 분이라면 광안리 해수욕장에 오셔서 많이 즐기고 가실 수있을거 같아요.</p>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="pl-xl-4">
                        <div class="ps-xl-4">
                            <div class="card border-0 shadow mb-5">
                                <div class="card-header bg-gray-100 py-4 border-0">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div>
                                            <p class="subtitle text-sm text-primary">Opening hours by day</p>
                                            <h4 class="mb-0" style="font-family: 'GmarketSansMedium'!important;">영업시간</h4>
                                        </div>
                                        <svg class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-muted flex-shrink-0">
                                      <use xlink:href="#wall-clock-1"> </use>
                                    </svg>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table class="table text-sm mb-0">
                                        <tr>
                                            <th class="pl-0" style="font-family: 'GmarketSansMedium'!important;">일요일</th>
                                            <td class="pr-0 text-right">09:00 am~18:00 pm</td>
                                        </tr>
                                        <tr>
                                            <th class="pl-0" style="font-family: 'GmarketSansMedium'!important;">월요일</th>
                                            <td class="pr-0 text-right">09:00 am~18:00 pm</td>
                                        </tr>
                                        <tr>
                                            <th class="pl-0" style="font-family: 'GmarketSansMedium'!important;">화요일</th>
                                            <td class="pr-0 text-right">09:00 am~18:00 pm</td>
                                        </tr>
                                        <tr>
                                            <th class="pl-0" style="font-family: 'GmarketSansMedium'!important;">수요일</th>
                                            <td class="pr-0 text-right">09:00 am~18:00 pm</td>
                                        </tr>
                                        <tr>
                                            <th class="pl-0" style="font-family: 'GmarketSansMedium'!important;">목요일</th>
                                            <td class="pr-0 text-right">09:00 am~18:00 pm</td>
                                        </tr>
                                        <tr>
                                            <th class="pl-0" style="font-family: 'GmarketSansMedium'!important;">금요일</th>
                                            <td class="pr-0 text-right">09:00 am~18:00 pm</td>
                                        </tr>
                                        <tr>
                                            <th class="pl-0" style="font-family: 'GmarketSansMedium'!important;">토요일</th>
                                            <td class="pr-0 text-right">09:00 am~18:00 pm</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <!-- 연락처-->
                            <div class="card border-0 shadow mb-5">
                                <div class="card-header bg-gray-100 py-4 border-0">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div>
                                            <p class="subtitle text-sm text-primary" style="font-family: 'GmarketSansMedium'!important;">Info</p>
                                            <h4 class="mb-0" style="font-family: 'GmarketSansMedium'!important;">정보</h4>
                                        </div>
                                        <svg class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-muted flex-shrink-0">
                      <use xlink:href="#fountain-pen-1"> </use>
                    </svg>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <ul class="list-unstyled mb-4" style="font-family: 'GmarketSansMedium'!important;">
                                        <li class="mb-2"> <a class="text-gray-00 text-sm text-decoration-none" href="#"><i class="fa fa-phone me-3"></i><span class="text-muted">${d.tel}</span></a></li>
                                        <li class="mb-2"> <a class=" text-sm text-decoration-none" href="#"><i class="fa fa-envelope me-3"></i><span class="text-muted">info@example.com</span></a></li>
                                        <li class="mb-2"> <a class=" text-sm text-decoration-none" href="#"><i class="fa fa-globe me-3"></i><span class="text-muted">www.example.com</span></a></li>
                                        <li class="mb-2"> <a class="text-blue text-sm text-decoration-none" href="#"><i class="fab fa-facebook me-3"></i><span class="text-muted">Facebook</span></a></li>
                                        <li class="mb-2"> <a class=" text-sm text-decoration-none" href="#"><i class="fab fa-twitter me-3"></i><span class="text-muted">Twitter</span></a></li>
                                        <li class="mb-2"> <a class=" text-sm text-decoration-none" href="#"><i class="fab fa-instagram me-3"></i><span class="text-muted">Instagram</span></a></li>
                                        <li class="mb-2"> <a class=" text-sm text-decoration-none" href="#"><i class="fab fa-google-plus me-3"></i><span class="text-muted">Google+</span></a></li>
                                    </ul>

                                </div>
                            </div>
                            <div class="text-center" style="font-family: 'GmarketSansMedium'!important;">
                                <a class="text-secondary" href="${path}/mem/bookmark?bmc_code=1&code=${d.de_id}&User_CODE=${loginMember.getUser_CODE()}"> <i class="fa fa-heart"></i> 찜 하기 </a>
                                </p><span>79명의 사람이 찜하기를 눌렀습니다  </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- If we need pagination-->
            <div class="swiper-pagination"></div>
            
        </div>
     </section> 

<jsp:include page="/WEB-INF/views/common/footer.jsp" />