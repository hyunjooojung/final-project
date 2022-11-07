<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>	

    <!-- 사진 시작-->
    <section class="pt-7 pb-5 d-flex align-items-end dark-overlay bg-cover" style="background-image: url('${path}/resources/img/Busan/restaurant_main.jpg');">
        <div class="container overlay-content">
            <div class="d-flex justify-content-between align-items-start flex-column flex-lg-row align-items-lg-end">
                <div class="text-white mb-4 mb-lg-0">
                    <div class="badge badge-pill badge-transparent px-3 py-2 mb-4">Eat &amp; Drink</div>
                    <h1 class="text-shadow verified">${restaurant.res_name}</h1>
                    <p><i class="fa-map-marker-alt fas me-2"></i> ${restaurant.addr}</p>
                    
                     <c:if test="${restaurant.readcount > 0 && restaurant.readcount < 1000}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${restaurant.readcount > 999 && restaurant.readcount < 2000}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${restaurant.readcount > 1999 && restaurant.readcount < 3000}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    		
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${restaurant.readcount > 2999 && restaurant.readcount < 4000}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${restaurant.readcount > 3999}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    		
	                                    		</c:if>
                    
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- 사진 끝-->



    <section class="py-6" style="font-family: 'GmarketSansMedium'!important; margin-bottom: -100px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <!-- About Listing-->
                    <div class="text-block">
                        <p class=" text-sm text-secondary" style="font-size:5px; margin-bottom: 2px;">Store name</p>
                        <h3 class="mb-3">${restaurant.res_name}</h3>
                        <p class="text-muted"> ${restaurant.detail} </p>
                      
                    </div>
                    <div class="text-block">
                        <!-- Listing Location-->
                        <div>
                            <p class=" text-sm text-secondary" style="font-size:5px; margin-bottom: 2px;">Location</p>
                            <h4 class="mb-3">위치 </h4>
                        </div>
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
                                    center: new kakao.maps.LatLng(${restaurant.lng}, ${restaurant.lat}),
                                    level: 2,
                                    // draggable: false
                                };

                                var map = new kakao.maps.Map(container, options);

                                map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);

                                var markerPosition = new kakao.maps.LatLng(${restaurant.lng}, ${restaurant.lat});
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
                            -->
                        </div>
                    </div>
                    <div class="text-block">
                        <!-- Gallery-->
                        <p class=" text-sm text-secondary" style="font-size:5px; margin-bottom: 2px;">Photos</p>
                        <h4 class="mb-3">사진 </h4>
                        <div class="row gallery ms-n1 me-n1">
                            <div class="col-lg-4 col-6 px-1 mb-2">
                                <a href="${path}/resources/img/photo/restaurant-1515164783716-8e6920f3e77c.jpg"><img class="img-fluid" style="height:159px; width:288px;" src="${restaurant.img_thumb}" alt="..."></a>
                            </div>
                            <div class="col-lg-4 col-6 px-1 mb-2">
                                <a href="${path}/resources/img/photo/restaurant-1466978913421-dad2ebd01d17.jpg"><img class="img-fluid" style="height:159px;  width:288px;" src="${path}/resources/img/Busan/detail1.jpg" alt="..."></a>
                            </div>
                            <div class="col-lg-4 col-6 px-1 mb-2">
                                <a href="${path}/resources/img/photo/restaurant-1477763858572-cda7deaa9bc5.jpg"><img class="img-fluid" style="height:159px;  width:288px;" src="${path}/resources/img/Busan/detail2.jpg" alt="..."></a>
                            </div>
                            <div class="col-lg-4 col-6 px-1 mb-2">
                                <a href="${path}/resources/img/photo/restaurant-1505275350441-83dcda8eeef5.jpg"><img class="img-fluid" style="height:159px;" src="${path}/resources/img/Busan/detail6.png" alt="..."></a>
                            </div>
                            <div class="col-lg-4 col-6 px-1 mb-2">
                                <a href="${path}/resources/img/photo/restaurant-1508766917616-d22f3f1eea14.jpg"><img class="img-fluid" src="${path}/resources/img/Busan/detail4.jpg" alt="..."></a>
                            </div>
                            <div class="col-lg-4 col-6 px-1 mb-2">
                                <a href="${path}/resources/img/photo/restaurant-1430931071372-38127bd472b8.jpg"><img class="img-fluid" src="${path}/resources/img/Busan/detail5.jpg" alt="..."></a>
                            </div>
                           
                        </div>
                    </div>
                    <!-- Amenities-->
                    <div class="text-block">
                        <div style="margin-bottom:20px;">
                            <p class=" text-sm text-secondary" style="font-size:5px; margin-bottom: 2px;">Facility</p>
                            <h4 class="mb-0">시설 </h4>
                        </div>
                        <ul class="amenities-list list-inline">
                            <li class="list-inline-item mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="icon-circle bg-secondary me-2"><i class="fa fa-check"></i></div><span>Elevator</span>
                                </div>
                            </li>
                            <li class="list-inline-item mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="icon-circle bg-secondary me-2"><i class="fa fa-check"></i></div><span>Vegan friendly</span>
                                </div>
                            </li>
                            <li class="list-inline-item mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="icon-circle bg-secondary me-2"><i class="fa fa-check"></i></div><span>Alcohol served</span>
                                </div>
                            </li>
                            <li class="list-inline-item mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="icon-circle bg-secondary me-2"><i class="fa fa-check"></i></div><span>No smoking</span>
                                </div>
                            </li>
                            <li class="list-inline-item mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="icon-circle bg-secondary me-2"><i class="fa fa-check"></i></div><span>Parking spaces (paid)</span>
                                </div>
                            </li>
                            <li class="list-inline-item mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="icon-circle bg-secondary me-2"><i class="fa fa-check"></i></div><span>WiFi</span>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>


                <div class="col-lg-4">
                    <div class="ps-xl-4">
                        <!-- Opening Hours      -->
                        <div class="card border-0 shadow mb-5">
                            <div class="card-header bg-gray-100 py-4 border-0">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div>
                                        <p class=" text-sm text-secondary" style="font-size:5px; margin-bottom: 2px;">Information</p>
                                        <h4 class="mb-0">정보 </h4>
                                    </div>
                                    <svg class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-muted flex-shrink-0">
                      <use xlink:href="#wall-clock-1"> </use>
                    </svg>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="table text-sm mb-0">

                                    <tr>
                                        <th class="ps-0">Location</th>
                                        <td class="pe-0 text-end">${restaurant.addr}</td>
                                    </tr>
                                    <tr>
                                        <th class="ps-0">Time</th>
                                        <td class="pe-0 text-end">${restaurant.time}</td>
                                    </tr>
                                    <tr>
                                        <th class="ps-0">Phone</th>
                                        <td class="pe-0 text-end">${restaurant.tel}</td>
                                    </tr>
                                    <tr>
                                        <th class="ps-0">Email</th>
                                        <td class="pe-0 text-end">restaurant@gmail.com</td>
                                    </tr>
                                    <tr>
                                        <th class="ps-0">Page</th>
                                        <td class="pe-0 text-end">${restaurant.homepage}</td>
                                    </tr>

                                </table>
                            </div>

                        </div>
                        <!-- Contact-->
                        
                        <div class="p-4 shadow ms-lg-1 rounded sticky-top" style="top: 100px;">
                            <p class=" text-sm text-secondary" style="font-size:3px; margin-bottom: 2px; ">Reservation</p>
                            <h4 class="mb-0">예약 </h4>
                            <hr class="my-4">
                            <form class="form" id="booking-form" method="get" action="${path}/res/reservation" autocomplete="off">
                           
								<input type="hidden" id="memberId" name="memberId" class="input_text" value="${loginMember.user_id}" />
								<input type="hidden" id="res_name" name="res_name" class="input_text" value="${restaurant.res_name}" />
                                <label class="form-label" for="guests" style=" margin-left:10px;">날짜</label>

                                <div class="form-group">
                                    <input type="text" class="form-control" id="pick-date" name="pick_date" placeholder="Pick A Date">
                                </div>

                                <div class="mb-4">
                                    <label class="form-label" for="guests" style="margin-left:10px; margin-top:20px;">시간</label>
                                    <select class="form-control" type="number" name="time" id="time">
                                    <option value="0">00:00</option>
                                    <option value="1">01:00</option>
                                    <option value="2">02:00</option>
                                    <option value="3">03:00</option>
                                    <option value="4">04:00</option>
                                    <option value="5">05:00</option>
                                    <option value="6">06:00</option>
                                    <option value="7">07:00</option>
                                    <option value="8">08:00</option>
                                    <option value="9">09:00</option>
                                    <option value="10">10:00</option>
                                    <option value="11">11:00</option>
                                    <option value="12">12:00</option>
                                    <option value="13">13:00</option>
                                    <option value="14">14:00</option>
                                    <option value="15">15:00</option>
                                    <option value="16">16:00</option>
                                    <option value="17">17:00</option>
                                    <option value="18">18:00</option>
                                    <option value="19">19:00</option>
                                    <option value="20">20:00</option>
                                    <option value="21">21:00</option>
                                    <option value="22">22:00</option>
                                    <option value="23">23:00</option>
                                    <option value="24">24:00</option>
                                  </select>
                                </div>
                                <div >
                                    <label class="form-label" for="guests" style=" margin-left:10px;">인원</label>
                                    <div class="mb-2" style=" margin-left:10px;"   >
                                        <label class="form-label" style="color:black;">성인</label>
                                        <div class="d-flex align-items-center" >
                                            <div class="btn btn-items btn-items-decrease">-</div>
                                            <input class="form-control input-items " name="adult_num" type="number" value="0" >
                                            <div class="btn btn-items btn-items-increase">+</div>
                                        </div>
                                    </div>
                                    <div class="mb-2" style=" margin-left:10px;">
                                        <label class="form-label" style="color:black;">청소년</label>
                                        <div class="d-flex align-items-center" >
                                            <div class="btn btn-items btn-items-decrease">-</div>
                                            <input class="form-control input-items " name="teenager_num"  type="number" value="0" >
                                            <div class="btn btn-items btn-items-increase">+</div>
                                        </div>
                                    </div>
                                    <div class="mb-0" style=" margin-left:10px;">
                                        <label class="form-label" style="color:black;">아동</label>
                                        <div class="d-flex align-items-center">
                                            <div class="btn btn-items btn-items-decrease">-</div>
                                            <input class="form-control input-items " name="kids_num" type="number" value="0" >
                                            <div class="btn btn-items btn-items-increase">+</div>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${!empty loginMember}">
                                <div class="d-grid mb-4" style="margin-top:30px; ">
                                    <button class="btn btn-primary" type="submit" style="font-size:12px; width:200px; margin-left:70px;">Reservation</button>
                                </div>
                                </c:if>
                                <c:if test="${empty loginMember}">
                                	<p class="text-muted text-sm" style="color:red; margin-left:100px; margin-top:20px;">로그인을 해주세요 </p>
                                 </c:if>
                            </form>
                            <hr class="my-4">
                            <div class="text-center">
                            <c:if test="${!empty loginMember}">
                                <p>
                                    <a class="text-secondary text-sm" href="${path}/mem/bookmark?bmc_code=3&code=${restaurant.res_id}&User_CODE=${loginMember.getUser_CODE()}">
                                     <i class="fa fa-heart" style="color:red;"></i>&nbsp&nbsp&nbsp찜하기
                                    </a>
                                     <p>79 people bookmarked this place </p>
                                </p>
                                </c:if>
                                
                                
                            </div>

                        </div>



                    </div>

                </div>
                <div class="text-block">
					<p class=" text-sm text-primary"
						style="font-size: 5px; margin-bottom: 2px;">Listing Reviews</p>
					<h5 class="mb-4">리뷰</h5>
					<div class="d-flex d-block d-sm-flex review">
						<div class="text-md-center flex-shrink-0 me-4 me-xl-5">
							<img class="d-block avatar avatar-xl p-2 mb-2"
								src="${path}/resources/img/Busan/미모티콘2.jpeg" alt="Padmé Amidala"><span
								class="text-uppercase text-muted text-sm">Oct 2022</span>
						</div>
						<div>
							<h6 class="mt-2 mb-1">신무균</h6>
							<div class="mb-2">
								<i class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i>
							</div>
							<p class="text-muted text-sm">${kind.kind_name}이 유명해서 방문해보았습니다. 
							부산식 특유의 맛이며 가족들과 함께 방문하기 좋을 것 같습니다.</p>
						</div>
					</div>
					<div class="d-flex d-block d-sm-flex review">
						<div class="text-md-center flex-shrink-0 me-4 me-xl-5">
							<img class="d-block avatar avatar-xl p-2 mb-2"
								src="${path}/resources/img/Busan/미모티콘3.jpeg" alt="Luke Skywalker"><span
								class="text-uppercase text-muted text-sm">Oct 2022</span>
						</div>
						<div>
							<h6 class="mt-2 mb-1">김유정</h6>
							<div class="mb-2">
								<i class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-gray-200"></i>
							</div>
							<p class="text-muted text-sm">평일 점심에 팀원들과 ${kind.kind_name}에서 식사했습니다! 
							양도 많고 맛있게 잘 먹었습니다.</p>
						</div>
					</div>
					<div class="d-flex d-block d-sm-flex review">
						<div class="text-md-center flex-shrink-0 me-4 me-xl-5">
							<img class="d-block avatar avatar-xl p-2 mb-2"
								src="${path}/resources/img/Busan/미모티콘1.png" alt="Princess Leia"><span
								class="text-uppercase text-muted text-sm">Oct 2022</span>
						</div>
						<div>
							<h6 class="mt-2 mb-1">정현주</h6>
							<div class="mb-2">
								<i class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-primary"></i><i
									class="fa fa-xs fa-star text-gray-200"></i><i
									class="fa fa-xs fa-star text-gray-200"></i>
							</div>
							<p class="text-muted text-sm">부산 놀러갈때마다 꼭 챙겨먹던 ${kind.kind_name}입니다. 최근에는
								맛이 조금 변한것 같네요.</p>
						</div>
					</div>

					<div class="py-5">
						<button class="btn btn-outline-primary"  onclick="location.href='${path}/board/list?boardCategory=2'" type="button"
							data-bs-toggle="collapse" data-bs-target="#leaveReview"
							aria-expanded="false" aria-controls="leaveReview">리뷰작성</button>
							
							
					</div>
				</div>

            </div>
        </div>




    </section>

    <section class="py-3 bg-gray-100 ">
                    <div class="container">
                        <div class="text-center pb-lg-4">
                            <p class="text-sm subtitle text-secondary mt-3">The Random restaurant recommend</p>
                            <h2>근처 추천 맛집</h2>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <!-- Slider main container-->
                        <div class="swiper-container swiper-container-mx-negative items-slider-full px-lg-5 pt-3">
                            <!-- Additional required wrapper-->
                            <div class="swiper-wrapper pb-5">
                                <!-- Slides-->
                                
                                <c:if test="${!empty list}">
          						  <c:forEach var="restaurant" items="${list}" varStatus="status" begin="17" end="25">
                                
                                
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
                                                    <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                                        <svg class="svg-icon text-white">
                                        <use xlink:href="#heart-1"> </use>
                                      </svg></a>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
