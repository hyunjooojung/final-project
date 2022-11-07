<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

  <!-- Hero Section-->
    <section class="pt-7 pb-5 d-flex align-items-end dark-overlay bg-cover" style="background-image: url('${f.img}'); font-family: 'yg-jalnan'!important;">
        <div class="container overlay-content">
            <div class="d-flex justify-content-between align-items-start flex-column flex-lg-row align-items-lg-end">
                <div class="text-white mb-4 mb-lg-0">
                    <h1 class="text-shadow verified">${f.place}</h1>
                    <p style="font-size: 20px;">${f.subtitle}</p>
                </div>

            </div>
        </div>
    </section>

    <section class="py-6" style="font-family: 'GmarketSansMedium'!important;">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <!-- About Listing-->
                    <div class="text-block">
                        <p class=" text-sm text-primary" style="font-size:5px; margin-bottom: 2px;">Info</p>
                        <h3 class="mb-3" style="border-bottom: 1;">정보</h3>
                        <table style="border-spacing: 20px; border-collapse: separate;">
                            <!-- <table class="table text-sm mb-0"> -->
                            <tr>
                                <th class="ps-0">명칭</th>
                                <td class="pe-0  border-0">${f.title}</td>
                            </tr>
                            <tr>
                                <th class="ps-0">주소</th>
                                <td class="pe-0  border-0">${f.addr1}</td>
                            </tr>
                            <tr>
                                <th class="ps-0">연락처</th>
                                <td class="pe-0 border-0">${f.tel}</td>
                            </tr>
                            <tr>
                                <th class="ps-0">이용요금</th>
                                <c:if test="${f.amount == '1'}"><td class="pe-0  border-0">유료</td></c:if>
                                <c:if test="${f.amount == '2'}"><td class="pe-0  border-0">무료</td></c:if>
                            </tr>
                            <tr>
                                <th class="ps-0">홈페이지</th>
                                <td class="pe-0  border-0"><a href="${f.homepage}">${f.homepage}</a></td>
                            </tr>
                            <tr>
                                <th class="ps-0">기간</th>
                                <td class="pe-0 border-0">${f.time}</td>
                            </tr>
                        </table>
                    </div>

                    <div class="text-block">
                        <!-- Listing Location-->
                        <p class=" text-sm text-primary" style="font-size:5px; margin-bottom: 2px;">Location</p>
                        <h3 class="mb-4">위치</h3>
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
                                    center: new kakao.maps.LatLng(${f.lat}, ${f.lng}),
                                    level: 2,
                                    // draggable: false
                                };

                                var map = new kakao.maps.Map(container, options);

                                map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);

                                var markerPosition = new kakao.maps.LatLng(${f.lat}, ${f.lng});
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
                        <p class=" text-sm text-primary" style="font-size:5px; margin-bottom: 2px;">Contents</p>
                        <h3 class="mb-4">상세설명</h3>
                        <p>${f.detail}</p>

                    </div>


                    <!-- 여기가 끝 -->
                </div>

                <!--여기부터 사이드 부분-->
                <div class="col-lg-4">
                    <div class="ps-xl-4">
                        <!-- Opening Hours      -->
                        <div class="card border-0 shadow mb-5">
                            <div class="card-header bg-gray-100 py-4 border-0">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div>
                                        <p class=" text-sm text-primary" style="font-size:5px; margin-bottom: 2px;">Poster</p>
                                        <h4 class="mb-0">포스터</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <img src="${path}/resources/img/Busan/FireWork.gif" alt="부산불꽃축제" style="width: 100%; height: auto; background-color: rgb(246, 249, 252);" />
                            </div>
                        </div>
                        <!-- Contact-->
                        <div class="card border-0 shadow mb-5">
                            <div class="card-header bg-gray-100 py-4 border-0">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div>
                                        <p class=" text-sm text-primary" style="font-size:5px; margin-bottom: 2px;">Schedule</p>
                                        <h4 class="mb-0">행사 일정</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <img src="${path}/resources/img/Busan/FireWork.jpg" alt="부산행사일정" style="width: 100%; height: auto; background-color: rgb(246, 249, 252);" />
                            </div>
                        </div>

                        <div class="text-center">
                            <p>
                                <a class="text-secondary text-sm" href="${path}/mem/bookmark?bmc_code=4&code=${f.fe_id}&User_CODE=${loginMember.getUser_CODE()}"> 
                                	<i class="fa fa-heart"></i> 
                                	찜 하기
                                </a>
                            </p>
                            <span>79명이 즐겨찾는 축제입니다. </span>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>


    <div class="py-4 bg-gray-100">
        <div class=" container">
            <p class="subtitle text-secondary text-sm text-primary mb-0 ">Look around other festivals</p>
            <h5 class="mb-4 ">추천 축제</h5>
            <!-- Slider main container-->
            <div class="swiper-container swiper-container-mx-negative items-slider ">
                <!-- Additional required wrapper-->
                <div class="swiper-wrapper pb-5 ">
                    <!-- Slides-->
                    <c:forEach items="${flist}" begin="0" step="1" var="fe">
                    <div class="swiper-slide h-auto px-2 ">
                        <!-- venue item-->
                        <div class="w-100 h-100 " data-marker-id="59c0c8e33b1527bfe2abaf92 ">
                            <div class="card h-100 border-0 shadow ">
                                <div class="card-img-top overflow-hidden dark-overlay bg-cover " style="background-image: url(${fe.img_thumb}); min-height: 200px; ">
                                    <a class="tile-link " href="detail.html "></a>
                                    <div class="card-img-overlay-bottom z-index-20 ">
                                        <h4 class="text-white text-shadow ">${fe.place}</h4>
                                        <p class="mb-2 text-xs ">
                                        	<c:if test="${fe.readcount > 0 && fe.readcount < 10}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${fe.readcount > 10 && fe.readcount < 100}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${fe.readcount > 100 && fe.readcount < 1000}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    		
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${fe.readcount > 1000 && fe.readcount < 10000}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${fe.readcount > 10000}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    		
	                                    		</c:if>
                                        </p>
                                    </div>

                                    <div class="card-img-overlay-top d-flex justify-content-between align-items-center ">
                                        <a class="card-fav-icon position-relative z-index-40 " href="javascript: void(); ">
                                            <svg class="svg-icon text-white ">
                                                <use xlink:href="#heart-1 "></use>
                                            </svg>
                                        </a>
                                    </div>

                                </div>

                                <div class="card-body ">
                                    <p class="text-s text-muted text-uppercase mb-1 ">${fe.title}</p>
                                    <p class="text-sm mb-0 " style="color: rgb(128, 152, 251); ">${fe.subtitle}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>

                </div>
                <!-- If we need pagination-->
                <div class="swiper-pagination "></div>
            </div>
        </div>
    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
