<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<input type="hidden" id="search" name="search" class="input_text" value="${param.search}" readonly  />
<input type="hidden" id="place" name="place" class="input_text" value="${param.place}" readonly  />
	<!-- 상단 이미지 -->
    <section style="font-family: 'GmarketSansMedium'!important;">
        <section class="d-flex align-items-center dark-overlay bg-cover" style="background-image: url(../resources/img/Busan/부산일러스트1.png); height: 500px;">
            <div class="container py-7 py-lg-7 text-white overlay-content text-center" style="margin-top: 100px;">
                <h2 class="display-3 fw-bold text-shadow">부산숙소</h2>
            </div>
        </section>
		

        <!-- 검색바 -->
        <div class="container">
            <div class="search-bar rounded p-3 p-lg-4 position-relative mt-n5 z-index-20">
                <form action="${path}/room/list" autocomplete="off">
                    <div class="row" style="justify-content: center;">

                        <div class="col-xl-3 col-md-6 mb-4">
                            <label class="form-label" for="form_search">검색</label>
                            <input type="text" class="form-control" id="search" name="search" placeholder="검색어" value="${param.search}">
                        </div>

                        <div class="col-xl-3 col-md-6 mb-4">
                            <label class="form-label" for="place">지역</label>
                            <select class="form-control" id="place" name="place" >
                            
                          <option value="" disabled selected>지역 선택</option>
                          <option value="강서구">강서구</option>
                          <option value="북구">북구</option>
                          <option value="금정구">금정구</option>
                          <option value="기장군">기장군</option>
                          <option value="사상구">사상구</option>
                          <option value="부산진구">부산진구</option>
                          <option value="연제구">연제구</option>
                          <option value="동래구">동래구</option>
                          <option value="사하구">사하구</option>
                          <option value="서구">서구</option>
                          <option value="동구">동구</option>
                          <option value="남구">남구</option>
                          <option value="중구">중구</option>
                          <option value="수영구">수영구</option>
                          <option value="해운대구">해운대구</option>
                          <option value="영도구">영도구</option>
                        </select>
                        </div>

                        <div class="col-xl-3 col-md-6 mb-4">
                            <label class="form-label" for="form_dates">날짜</label>
                            <div class="datepicker-container datepicker-container-left">
                                <input class="form-control" type="text" name="bookingDate" id="bookingDate" placeholder="날짜 선택">
                            </div>
                        </div>

                        <div class="col-xl-1 col-md-6 mb-4" style="margin-top: 33px;">                        
                            <button class="btn btn-primary d-flex" type="submit"> <i class="fas fa-search me-1 mt-1"></i>Search</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- 숙소 리스트 -->
        <section class="py-5">
            <div class="container">

                <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
                    <div class="me-3">
                        <p class="mb-3 mb-md-0"><strong>${countResult}</strong> 개의 항목</p>
                    </div>
                    <div>

                       <select class="selectpicker " name="sortKeyword" id="sortKeyword" data-style="btn-selectpicker " title="정렬" onchange="movePage2(this.value)">                     	
                          		 <option value="DESC">조회수 ▲   </option>
                				<option value="ASC">조회수 ▼   </option>
                        </select>
                    </div>
                </div>

                <div class="row">
                	<c:if test="${empty list}">
                	검색된 결과가 없습니다.
                	</c:if>
                	<c:if test="${!empty list}">
                		<c:forEach var="room" items="${list}">
                		
		                    <!-- place item-->
		                    <div class="col-sm-6 col-lg-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
		                        <div class="card h-100 border-0 shadow">
		                            <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" style="height:400px; object-fit: none" src="${room.image}" alt="Modern, Well-Appointed Room" />
		                                <a class="tile-link" href="${path}/room/view?code=${room.code}"></a>
		
		                            </div>
		                            <div class="card-body d-flex align-items-center">
		                                <div class="w-100">
		                                    <h6 class="card-title"><a class="text-decoration-none text-dark" href="${path}/room/view?code=${room.code}">${room.name}</a></h6>
		                                    <div class="d-flex card-subtitle mb-3">
		                                        <p class="flex-grow-1 mb-0 text-muted text-sm">${room.adress}</p>
		                                        <!-- <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
		                                        <i class="fa fa-star text-warning"></i>
		                                        <i class="fa fa-star text-warning"></i>
		                                        <i class="fa fa-star text-warning"></i>
		                                        <i class="fa fa-star text-warning"></i>
		                                        <i class="fa fa-star text-warning"></i>
		                                        </p> -->
		                                        <p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
	                                    		<c:if test="${room.readcount > 0 && room.readcount < 10}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${room.readcount > 10 && room.readcount < 100}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${room.readcount > 100 && room.readcount < 1000}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    		
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${room.readcount > 1000 && room.readcount < 10000}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${room.readcount > 10000}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    		
	                                    		</c:if>
	                                    	</p>
		                                    </div>
		                                    <p class="card-text text-muted"><span class="h4 text-primary">￦${room.price}</span> 1박</p>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
	                    </c:forEach>
                   </c:if>
                   
                </div>
                <!-- Pagination -->
                <nav aria-label="Page navigation example">
                    <ul class="pagination pagination-template d-flex justify-content-center">
                     <li class="page-item">
                            <button class="page-link" onclick="movePage('${path}/room/list?page=1')"> <i class="fa fa-angle-left"></i></button>
                        </li>
                        <li class="page-item">
                            <button class="page-link" onclick="movePage('${path}/room/list?page=${pageInfo.getPrevPage()}')"> <i class="fa fa-angle-left"></i></button>
                        </li>
                        
	                        <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status"> <!-- 1~5 -->
	                        
	                        	<c:if test="${pageInfo.currentPage == status.current}">
	                        		<li class="page-item active">
	                        			<a class="page-link">
	                        				<c:out value="${status.current}"/>	
	                        			</a>
	                        		</li>
	                        	</c:if>
	                        	
	                        	<c:if test="${pageInfo.currentPage != status.current}">
	                        		<li class="page-item">
	                        			<a class="page-link" onclick="movePage('${path}/room/list?page=${status.current}');">
	                        				<c:out value="${status.current}"/>	
	                        			</a>
	                        		</li>
	                        	
	                        	</c:if>
	                        	
	                        </c:forEach>
                        
                       
                        <li class="page-item">
                            <button class="page-link" onclick="movePage('${path}/room/list?page=${pageInfo.getNextPage()}')"> <i class="fa fa-angle-right"></i></button>
                        </li>
                        <li class="page-item">
                            <button class="page-link" onclick="movePage('${path}/room/list?page=${pageInfo.getMaxPage()}')"> <i class="fa fa-angle-right"></i></button>
                        </li>
                    </ul>
                </nav>
            </div>
        </section>

        <section class="py-7">
            <div class="container">
                <div class="text-center">
                    <p class="subtitle text-primary">Review</p>
                    <h2 class="mb-5">리뷰</h2>
                </div>
                <!-- Slider main container-->
                <div class="swiper-container testimonials-slider testimonials">
                    <!-- Additional required wrapper-->
                    <div class="swiper-wrapper pt-2 pb-5">
                        <!-- Slides-->
                        <div class="swiper-slide p-4">
                            <div class="testimonial card rounded-3 shadow border-0">
                                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${path}/resources/img/Busan/미모티콘1.png" alt="..."></div>
                                <div class="text">
                                    <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                                    <p class="testimonial-text" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;  width: 400px;">깔끔한 숙소를 쉽게 찾았어요.</p><strong>김영도</strong>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide p-4">
                            <div class="testimonial card rounded-3 shadow border-0">
                                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${path}/resources/img/Busan/미모티콘2.jpeg" alt="..."></div>
                                <div class="text">
                                    <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                                    <p class="testimonial-text" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;  width: 400px;">저렴한 숙소를 쉽게 찾았어요.</p><strong>강인국</strong>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide p-4">
                            <div class="testimonial card rounded-3 shadow border-0">
                                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${path}/resources/img/Busan/미모티콘3.jpeg" alt="..."></div>
                                <div class="text">
                                    <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                                    <p class="testimonial-text" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;  width: 400px;">교통편이 편리한 숙소를 쉽게 찾았어요.</p><strong>김보성</strong>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide p-4">
                            <div class="testimonial card rounded-3 shadow border-0">
                                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${path}/resources/img/Busan/미모티콘1.png" alt="..."></div>
                                <div class="text">
                                    <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                                    <p class="testimonial-text" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;  width: 400px;">정리된 숙소 덕분에 결정하기 편했어요.</p><strong>김유정</strong>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide p-4">
                            <div class="testimonial card rounded-3 shadow border-0">
                                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${path}/resources/img/Busan/미모티콘3.jpeg" alt="..."></div>
                                <div class="text">
                                    <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                                    <p class="testimonial-text" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;  width: 400px;">숙소를 간편하게 찾았어요.</p><strong>김무균</strong>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide p-4">
                            <div class="testimonial card rounded-3 shadow border-0">
                                <div class="testimonial-avatar"><img class="avatar avatar-lg p-1" src="${path}/resources/img/Busan/미모티콘2.jpeg" alt="..."></div>
                                <div class="text">
                                    <div class="testimonial-quote"><i class="fas fa-quote-right"></i></div>
                                    <p class="testimonial-text" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;  width: 400px;">예약하기 쉬웠어요.</p><strong>정현주</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-pagination"> </div>
                </div>
            </div>
        </section>
    </section>

<script type="text/javascript">
function movePage(pageUrl){
	var detail = document.getElementById("search"); 
	var gugunnm = document.getElementById("place"); 
	
	if(detail != null && detail.value.length > 0){
		pageUrl = pageUrl + '&search=' + detail.value;
	}
	
	if(gugunnm != null && gugunnm.value.length > 0){
		pageUrl = pageUrl + '&place=' + gugunnm.value; 
	}
	
	window.location.href = encodeURI(pageUrl);	
}

function movePage2(sort){
	
	var pageUrl = "${path}/room/list?"
	
	var detail = document.getElementById("search"); 
	var gugunnm = document.getElementById("place"); 
	
	pageUrl = pageUrl + 'sortKeyword=' + sort;
	
// 	alert(detail.value);
// 	alert(gugunnm.value);
	
	if(detail != null && detail.value.length > 0){
		pageUrl = pageUrl + '&search=' + detail.value;
	}
	
	if(gugunnm != null && gugunnm.value.length > 0){
		pageUrl = pageUrl + '&place=' + gugunnm.value; 
	}
	


	
	window.location.href = encodeURI(pageUrl);
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>