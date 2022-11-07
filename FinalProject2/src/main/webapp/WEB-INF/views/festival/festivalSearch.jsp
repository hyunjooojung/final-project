<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

  <div class="container-fluid py-5 px-lg-5" style="background-color: white;">

        <div class="row border-bottom mb-4" style="background-image: url(${path}/resources/img/Busan/Board.jpg); height: 250px; background-size: cover;">
            <div class="col-12 mt-6">
                <h1 class="display-4 fw-bold text-serif mb-4 text-light" style="text-align: center; font-family: 'GmarketSansMedium'!important;">FESTIVAL</h1>
            </div>
        </div>

        <div class="row" style="font-family: 'GmarketSansMedium'!important;">
            <div class="col-lg-3 pt-3">
                <form class="pe-xl-3" action="${path}/festival/FestivalSearch" method="get">
                    <div class="mb-4">
                        <label class="form-label" for="form_search">검색</label>
                        <div class="input-label-absolute input-label-absolute-right">
                            <div class="label-absolute"><i class="fa fa-search"></i></div>
                            <input class="form-control pe-4" type="search" name="title" placeholder="검색어" id="title" value="${param.title}">
                        </div>
                    </div>
                    <div class="mb-4 ">
                        <label class="form-label" for="form_neighbourhood ">운영기간</label>
                        <select class="selectpicker form-control" name="time" id="time" placeholder="운영기간을 선택하세요">
		                  <option value="1월"<c:if test="${param.time == '1월'}"> selected="selected" </c:if>>01월</option>
		                  <option value="2월"<c:if test="${param.time == '2월'}"> selected="selected" </c:if>>02월</option>
		                  <option value="3월"<c:if test="${param.time == '3월'}"> selected="selected" </c:if>>03월</option>
		                  <option value="4월"<c:if test="${param.time == '4월'}"> selected="selected" </c:if>>04월</option>
		                  <option value="5월"<c:if test="${param.time == '5월'}"> selected="selected" </c:if>>05월</option>
		                  <option value="6월"<c:if test="${param.time == '6월'}"> selected="selected" </c:if>>06월</option>
		                  <option value="7월"<c:if test="${param.time == '7월'}"> selected="selected" </c:if>>07월</option>
		                  <option value="8월"<c:if test="${param.time == '8월'}"> selected="selected" </c:if>>08월</option>
		                  <option value="9월"<c:if test="${param.time == '9월'}"> selected="selected" </c:if>>09월</option>
		                  <option value="10월"<c:if test="${param.time == '10월'}"> selected="selected" </c:if>>10월</option>
		                  <option value="11월"<c:if test="${param.time == '11월'}"> selected="selected" </c:if>>11월</option>
		                  <option value="12월"<c:if test="${param.time == '12월'}"> selected="selected" </c:if>>12월</option>
              			</select>
                    </div>
                    
                    <div class="mb-4 ">
                        <label class="form-label " for="form_category ">지역</label>
                        <select class="selectpicker form-control " name="location" id="location" placeholder="지역을 선택하세요">
                            <option value="중구"<c:if test="${param.location == '중구'}"> selected="selected" </c:if>>중구   </option>
                            <option value="서구"<c:if test="${param.location == '서구'}"> selected="selected" </c:if>>서구   </option>
                            <option value="동구"<c:if test="${param.location == '동구'}"> selected="selected" </c:if>>동구  </option>
                            <option value="영도구"<c:if test="${param.location == '영도구'}"> selected="selected" </c:if>>영도구  </option>
                            <option value="부산진구"<c:if test="${param.location == '부산진구'}"> selected="selected" </c:if>>부산진구   </option>
                            <option value="동래구"<c:if test="${param.location == '동래구'}"> selected="selected" </c:if>>동래구   </option>
                            <option value="남구"<c:if test="${param.location == '남구'}"> selected="selected" </c:if>>남구   </option>
                            <option value="북구"<c:if test="${param.location == '북구'}"> selected="selected" </c:if>>북구   </option>
                            <option value="해운대구"<c:if test="${param.location == '해운대구'}"> selected="selected" </c:if>>해운대구    </option>
                            <option value="사하구"<c:if test="${param.location == '사하구'}"> selected="selected" </c:if>>사하구    </option>
                            <option value="금정구"<c:if test="${param.location == '금정구'}"> selected="selected" </c:if>>금정구    </option>
                            <option value="강서구"<c:if test="${param.location == '강서구'}"> selected="selected" </c:if>>강서구    </option>
                            <option value="연제구"<c:if test="${param.location == '연제구'}"> selected="selected" </c:if>>연제구    </option>
                            <option value="수영구"<c:if test="${param.location == '수영구'}"> selected="selected" </c:if>>수영구    </option>
                            <option value="사상구"<c:if test="${param.location == '사상구'}"> selected="selected" </c:if>>사상구    </option>
                            <option value="기장군"<c:if test="${param.location == '기장군'}"> selected="selected" </c:if>>기장군    </option>
             			</select>
                    </div>

                    <div class="pb-4">
                        <div class="collapse" id="moreFilters">
                            <div class="mb-4 ">
                                <label class="form-label">이용요금</label>
                                <ul class="list-unstyled mb-0">
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="fare" name="fare" value="1"
                                            	<c:if test="${param.fare == '1'}"> checked="checked"</c:if>>
                                            <label class="form-check-label" for="cuisine_0">유료</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="fare" name="fare" value="2"
                                            	<c:if test="${param.fare == '2'}"> checked="checked"</c:if>>
                                            <label class="form-check-label" for="cuisine_1">무료</label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="collapse" id="moreFilters">
                            <div class="mb-4 ">
                                <label class="form-label">편의시설 유/무</label>
                                <ul class="list-unstyled mb-0">
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="convenient" name="convenient" value="1" 
                                            <c:if test="${param.convenient == '1'}"> checked="checked"</c:if>>
                                            <label class="form-check-label " for="type_0 ">유</label>

                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="convenient" name="convenient" value="2"
                                            <c:if test="${param.convenient == '2'}"> checked="checked"</c:if>>
                                            <label class="form-check-label" for="type_1">무</label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <button class="btn btn-link btn-collapse ps-0 text-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#moreFilters" aria-expanded="false" aria-controls="moreFilters" data-expanded-text="Less filters" data-collapsed-text="More filters">More filters</button>
                    </div>
                    <div class="mb-4">
                        <button class="btn btn-primary" type="submit"> <i class="fas fa-search me-1"></i>Search</button>
                    </div>

                </form>
            </div>

            <div class="col-lg-9 ">
                <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4 ">
                    <div class="me-3 ">
                        <p class="mb-3 mb-md-0 "><strong>${count}</strong>개 축제가 있습니다</p>
                    </div>
                    <div>
                        <label class="form-label me-2 " for="sort "></label>
                        <select class="selectpicker " name="sort " id="sort " data-style="btn-selectpicker " title="정렬" onchange="movePage2(this.value)">                     	
                          		<option value="readcount" <c:if test="${param.sort=='readcount'}">selected="selected"</c:if>>조회순</option>                        	
	                         	<option value="registration" <c:if test="${param.sort=='registration'}">selected="selected"</c:if>>최신순</option>
                        </select>
                    </div>
                </div>

                <div class="row ">
                    <!-- venue item-->
                  	<c:forEach var="Flist" step="1" begin="0" items="${list}">
	                    <div class="col-sm-6 col-xl-4 mb-5 hover-animate " data-marker-id="59c0c8e33b1527bfe2abaf92 ">
	                        <div class="card h-100 border-0 shadow ">
	                            <div class="card-img-top overflow-hidden dark-overlay bg-cover " style="background-image: url(${Flist.img_thumb}); min-height: 200px; ">
	                                <a class="tile-link " href="${path}/festival/FestivalDetail?fe_id=${Flist.fe_id}"></a>
	                                <div class="card-img-overlay-bottom z-index-20 ">
	                                    <h4 class="text-white text-shadow ">${Flist.place}</h4>
	                                    	<p class="mb-2 text-xs ">
	                                    		<c:if test="${Flist.readcount > 0 && Flist.readcount < 10}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${Flist.readcount > 10 && Flist.readcount < 100}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${Flist.readcount > 100 && Flist.readcount < 1000}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    		
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${Flist.readcount > 1000 && Flist.readcount < 10000}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-gray-300 "></i>
	                                    		</c:if>
	                                    		<c:if test="${Flist.readcount > 10000}">
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    			
	                                    			<i class="fa fa-star text-warning "></i>	                                    		
	                                    		</c:if>
	                                    	</p>
	                                </div>
	                            </div>
	
	                            <div class="card-body ">
	                                <p class="text-sm text-muted mb-3 ">${Flist.title}</p>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                                   
                <!-- Pagination -->
                <nav aria-label="Page navigation example ">
                    <ul class="pagination pagination-template d-flex justify-content-center ">
                    
                    	<li class="page-item ">
                            <a class="page-link " onclick="movePage('${path}/festival/FestivalSearch?page=1');">
                            	<i class="fa fa-angle-left "></i><i class="fa fa-angle-left "></i>
                            </a>
                        </li>
                    	
                       	<li class="page-item ">
                            <a class="page-link " onclick="movePage('${path}/festival/FestivalSearch?page=${pageInfo.prevPage}');">
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
                        			<a class="page-link" onclick="movePage('${path}/festival/FestivalSearch?page=${status.current}');">
                        				<c:out value="${status.current}"/>	
                        			</a>
                        		</li>
                        	</c:if>
                        </c:forEach>
                        
                        <li class="page-item ">
                            <a class="page-link " onclick="movePage('${path}/festival/FestivalSearch?page=${pageInfo.nextPage}')">
                            	<i class="fa fa-angle-right "></i>
                            </a>
                        </li>
                        
                        <li class="page-item ">
                            <a class="page-link " onclick="movePage('${path}/festival/FestivalSearch?page=${pageInfo.getMaxPage()}')">
                            	<i class="fa fa-angle-right "></i><i class="fa fa-angle-right "></i>
                            </a>
                        </li>
                    </ul>
                </nav>
                
                
            	</div>
        	</div>
    	</div>
 	</div>

<script type="text/javascript">
function movePage(pageUrl){
		
		var title  = document.getElementById("title"); 							//	검색
 		
		var time =  document.getElementById("time"); 							// 운영기간
 		var timeselect = time.options[time.selectedIndex].value;
			
 		var location = document.getElementById("location"); 					// 지역
 		var locationselect = location.options[location.selectedIndex].value;
 		
 		var fare = document.getElementsByName("fare"); 							// 요금
 		
 		var convenient = document.getElementsByName("convenient"); 				// 편의시설유무
		
 		var sort = "${param.sort}";
 		
		if(title.value != null && title.value.length > 0 ){
			pageUrl = pageUrl + '&title='+ title.value;
		}
		
		if(timeselect != null && timeselect.length > 0 ){
			pageUrl = pageUrl + '&time='+ timeselect;
		}

		if(locationselect != null && locationselect.length > 0 ){
			pageUrl = pageUrl + '&location='+ locationselect;
		}
		
		if(fare != null && fare.length > 0 ){
			for(var i = 0; i < fare.length; i++){
				if(fare[i].checked == true){
					pageUrl = pageUrl + '&fare=' + fare[i].value;	
				}
			}
		}
		
		if(convenient != null && convenient.length > 0 ){
			for(var i = 0; i < convenient.length; i++){
				if(convenient[i].checked == true){
					pageUrl = pageUrl + '&convenient=' + convenient[i].value;	
				}
			}
		}
		
		if(sort == 'fe_id'){
			pageUrl = pageUrl + '&sort=';
		} else {
			pageUrl = pageUrl + '&sort=' + sort;
		}
		
		
//  		alert(pageUrl);
		window.location.href = encodeURI(pageUrl);
		//window 빼면 안되는 버그가 있어요! location.href 사용시 페이지 이동 x
		// => window 붙이면 가능!
		
		
}
function movePage2(sort){
	
	var pageUrl = "${path}/festival/FestivalSearch?"
	
	var title  = document.getElementById("title"); 				//	검색
		
	var time =  document.getElementById("time"); 				// 운영기간
	var timeselect = time.options[time.selectedIndex].value;
		
	var location = document.getElementById("location"); 		// 지역
	var locationselect = location.options[location.selectedIndex].value;
		
	var fare = document.getElementsByName("fare"); 				// 요금
		
	var convenient = document.getElementsByName("convenient"); 	// 편의시설유무
			
	if(title.value != null && title.value.length > 0 ){
		pageUrl = pageUrl + '&title='+ title.value;
	}
	
	if(timeselect != null && timeselect.length > 0 ){
		pageUrl = pageUrl + '&time='+ timeselect;
	}

	if(locationselect != null && locationselect.length > 0 ){
		pageUrl = pageUrl + '&location='+ locationselect;
	}
	
	if(fare != null && fare.length > 0 ){
		for(var i = 0; i < fare.length; i++){
			if(fare[i].checked == true){
				pageUrl = pageUrl + '&fare=' + fare[i].value;	
			}
		}
	}
	
	if(convenient != null && convenient.length > 0 ){
		for(var i = 0; i < convenient.length; i++){
			if(convenient[i].checked == true){
				pageUrl = pageUrl + '&convenient=' + convenient[i].value;	
			}
		}
	}
	
	pageUrl = pageUrl + '&sort=' + sort;
	
// 	alert(pageUrl);
	
	window.location.href = encodeURI(pageUrl);
	//window 빼면 안되는 버그가 있어요! location.href 사용시 페이지 이동 x
	// => window 붙이면 가능!
	
	
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
