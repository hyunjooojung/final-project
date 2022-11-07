<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>	


<input type="hidden" id="detail" name="detail" class="input_text" value="${param.detail}" />
<input type="hidden" id="gugunnm" name="gugunnm" class="input_text" value="${param.gugunnm}" />
<input type="hidden" id="pricefrom" name="pricefrom" class="input_text" value="${param.pricefrom}" />
<input type="hidden" id="priceto" name="priceto" class="input_text" value="${param.priceto}" />
<input type="hidden" id="time" name="time" class="input_text" value="${param.time}" />

<!-- 사진 시작-->
        <section class="d-flex align-items-center dark-overlay bg-cover" style="background-image: url(${path}/resources/img/Busan/restaurant_main.jpg); font-family: 'GmarketSansMedium'!important; ">
            <div class="container py-6 py-lg-7 text-white overlay-content text-center">
                <div class="row">
                    <div class="col-xl-10 mx-auto">
                        <h1 class="display-3 fw-bold text-shadow">Restaurant</h1>
                        <p class="text-lg text-shadow">Uncover the best places to eat, drink, and shop nearest to you.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- 사진/검색 끝-->

        <div class="container-fluid py-5 px-lg-5" style="font-family: 'GmarketSansMedium'!important;">
            <div class="row">
                <!--------------------- 필터 시작 --------------------->
                <div class="col-lg-3 pt-3">
                    <form class="pe-xl-3" action="${path}/res/subSearch" method="get">
                        <div class="mb-4">
                            <label class="form-label" for="form_search">검색</label>
                            <div class="input-label-absolute input-label-absolute-right">
                                <div class="label-absolute"><i class="fa fa-search"></i></div>
                                <input class="form-control pe-4" type="search" name="detail" value="${param.detail}" placeholder="검색어" id="form_search">
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="form_neighbourhood">지역</label>
                            <select class="selectpicker form-control" name="gugunnm" id="form_neighbourhood" placeholder="지역을 선택해주세요">
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


                        <div class="pb-4">
                            <div class="collapse" id="moreFilters">
                                <div class="mb-4">
                                    <label class="form-label">대표메뉴 가격</label>
                                    <div class="text-primary" id="slider-snap"></div>
                                    <div class="nouislider-values">
                                        <div class="min">최저가 ₩ <span id="slider-snap-value-from"></span></div>
                                        <div class="max">최고가 ₩ <span id="slider-snap-value-to"></span></div>
                                    </div>
                                    <input type="hidden" name="pricefrom" id="slider-snap-input-from" value="40">
                                    <input type="hidden" name="priceto" id="slider-snap-input-to" value="110">
                                </div>
								
								  <!-- Price Slider-->
						        <script src="${path}/resources/vendor/nouislider/nouislider.min.js"></script>
						        <script>
						            var snapSlider = document.getElementById('slider-snap');
						
						            noUiSlider.create(snapSlider, {
						                start: [10000, 100000],
						                snap: false,
						                connect: true,
						                step: 1000,
						                range: {
						                    'min': 10000,
						                    'max': 100000
						                }
						            });
						            var snapValues = [
						                document.getElementById('slider-snap-value-from'),
						                document.getElementById('slider-snap-value-to')
						            ];
						            var inputValues = [
						                document.getElementById('slider-snap-input-from'),
						                document.getElementById('slider-snap-input-to')
						            ];
						            snapSlider.noUiSlider.on('update', function(values, handle) {
						                snapValues[handle].innerHTML = Math.floor(values[handle]);
						                inputValues[handle].value = Math.floor(values[handle]);
						            })
						        </script>

                                <div class="mb-4">
                                    <label class="form-label" for="form_neighbourhood">오픈시간</label>
                                    <select class="selectpicker form-control" name="time" id="time" placeholder="오픈시간을 선택해주세요">
			                          <option value="07">7시    </option>
			                          <option value="08">8시    </option>
			                          <option value="09">9시   </option>
			                          <option value="10">10시   </option>
			                          <option value="11">11시    </option>
			                          <option value="12">12시    </option>
                      				</select>
                                </div>


                            </div>
                            <div class="mb-4">
                                <button class="btn btn-link btn-collapse ps-0 text-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#moreFilters" aria-expanded="false" aria-controls="moreFilters" data-expanded-text="Less filters" data-collapsed-text="More filters">More filters</button>
                            </div>
                            <div class="mb-4">
                                <button class="btn btn-primary" type="submit" style="font-size:10px;"> <i class="fas fa-search me-1"></i>Search </button>
                            </div>
                        </div>
                    </form>
                </div>

                <!----------------------------- 필터 끝 ---------------------------->




                <div class="col-lg-9" style="font-family: 'GmarketSansMedium';">
                    <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
                        <div class="me-3">
                            <p class="mb-3 mb-md-0"><strong>${count} </strong> results found</p>
                        </div>
                        <div>
                        <label class="form-label me-2 " for="sort "></label>
                        <select class="selectpicker " name="sort " id="sort " data-style="btn-selectpicker " title="정렬" onchange="movePage2(this.value)">                     	
                          		<option value="readcount" <c:if test="${param.sort=='readcount'}">selected="selected"</c:if>>조회순</option>                        	
	                         	<option value="registration" <c:if test="${param.sort=='registration'}">selected="selected"</c:if>>최신순</option>
                        </select>
                    </div>
                    </div>
                    <div class="row">
                    
                     <c:if test="${!empty list}">
            		<c:forEach var="restaurant" items="${list}" varStatus="status" >
                    
                    
                    
                        <!-- venue item-->
                        <div class="col-sm-6 col-xl-4 mb-5 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden dark-overlay bg-cover" style="background-image: url(${restaurant.img}); min-height: 200px;">
                                     <a class="tile-link" href="${path}/res/view?no=${restaurant.res_id}"></a>
                                    <div class="card-img-overlay-bottom z-index-20">
                                        <h4 class="text-white text-shadow">${restaurant.res_name}</h4>
                                        <p class="mb-2 text-xs">
                                        
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
                                    <div class="card-img-overlay-top d-flex justify-content-between align-items-center">
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p class="text-sm text-muted mb-3" style="font-family: 'GmarketSansMedium'!important;"> ${restaurant.detail}</p>
                                    <p class="text-sm text-muted text-uppercase mb-1"><a href="#" class="text-dark">${restaurant.addr}</a></p>
                                    <p class="text-sm mb-0"><a class="me-1" href="#">Restaurant,</a><a class="me-1" href="#">Contemporary</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        
                        </c:forEach>
                        </c:if>
                        
                        <!-- page 부 종료-->		
                        <nav aria-label="Page navigation example ">
                    <ul class="pagination pagination-template d-flex justify-content-center ">
                    
                    	<li class="page-item ">
                            <a class="page-link " onclick="movePage('${path}/res/mainSearch?page=1');">
                            	<i class="fa fa-angle-left "></i><i class="fa fa-angle-left "></i>
                            </a>
                        </li>
                    	
                       	<li class="page-item ">
                            <a class="page-link " onclick="movePage('${path}/res/mainSearch?page=${pageInfo.prevPage}');">
                            	<i class="fa fa-angle-left "></i>
                            </a>
                        </li>
                        
                        <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
                        	<c:if test="${pageInfo.currentPage == status.current}">
                        		<li class="page-item active">
                        			<a class="page-link">
                        				<c:out value="${status.current}"/>	
                        			</a>
                        		</li>
                        	</c:if>
                        	
                        	<c:if test="${pageInfo.currentPage != status.current}">
                        		<li class="page-item">
                        			<a class="page-link" onclick="movePage('${path}/res/mainSearch?page=${status.current}');">
                        				<c:out value="${status.current}"/>	
                        			</a>
                        		</li>
                        	</c:if>
                        </c:forEach>
                        
                        <li class="page-item ">
                            <a class="page-link " onclick="movePage('${path}/res/mainSearch?page=${pageInfo.nextPage}')">
                            	<i class="fa fa-angle-right "></i>
                            </a>
                        </li>
                        
                        <li class="page-item ">
                            <a class="page-link " onclick="movePage('${path}/res/mainSearch?page=${pageInfo.maxPage}')">
                            	<i class="fa fa-angle-right "></i><i class="fa fa-angle-right "></i>
                            </a>
                        </li>
                    </ul>
                </nav>
                        
                        
                    </div>
                    <!-- Pagination -->
                   
                </div>
            </div>
        </div>
        
       <script type="text/javascript">
	function movePage(pageUrl){
		var detail = document.getElementById("detail"); 
		var gugunnm = document.getElementById("gugunnm"); 
		var pricefrom = document.getElementById("pricefrom"); 
		var priceto = document.getElementById("priceto");
		var time = document.getElementById("time");
		var sort = "${param.sort}";
		pageUrl = pageUrl + '&detail=' + detail.value + '&gugunnm=' + gugunnm.value + '&pricefrom=' + pricefrom.value + '&priceto=' + priceto.value + '&time=' + time.value + '&sort=' + sort; 
		
		
		location.href = encodeURI(pageUrl);	
	}
	
	
	function movePage2(sort){
		
		var pageUrl = "${path}/res/subSearch?"
		
		var detail = document.getElementById("detail"); 
		var gugunnm = document.getElementById("gugunnm"); 
		var pricefrom = document.getElementById("pricefrom"); 
		var priceto = document.getElementById("priceto");
		var time = document.getElementById("time");
		pageUrl = pageUrl + '&detail=' + detail.value + '&gugunnm=' + gugunnm.value + '&pricefrom=' + pricefrom.value + '&priceto=' + priceto.value + '&time=' + time.value + '&sort=' + sort; 
		
//	 	alert(pageUrl);
		
		location.href = encodeURI(pageUrl);	
		//window 빼면 안되는 버그가 있어요! location.href 사용시 페이지 이동 x
		// => window 붙이면 가능!
		
		
	}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>












