<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- 사진 부분 -->
<section class="hero-home dark-overlay mb-5">
	<img class="bg-image"
		src="${path}/resources/img/Busan/photo-1467987506553-8f3916508521.jpg">
	<div class="container py-7">
		<div class="overlay-content text-center text-white">
			<h1 class="display-3 text-serif font-weight-bold text-shadow mb-0"
				style="font-family: 'GmarketSansMedium' !important;">BUSAN 명 소</h1>
		</div>
	</div>
</section>

<!-- 검색 부분 -->
<section style="font-family: 'GmarketSansMedium' !important;">
	<div class="container-fluid py-5 px-lg-5">
		<div class="row border-bottom mb-4"></div>

		<div class="row">
			<div class="col-lg-3 pt-3">
				<form class="pr-xl-3" action="${path}/Des/list" method="GET">
				
					<div class="mb-4">
						<label class="form-label" for="form_search">검색</label>
						<div class="input-label-absolute input-label-absolute-right">
							<div class="label-absolute">
								<i class="fa fa-search"></i>
							</div>
							<input class="form-control pr-4" type="search" id="name" name="name" placeholder="검색어를 입력해주세요."
								<c:if test="${param.name != null}">value=${param.name}</c:if>
							>							
						</div>
					</div>

					  <div class="mb-4 ">
                        <label class="form-label " for="form_category ">지역</label>                      
                        <select class="selectpicker form-control" name="gugunnm" id="gugunnm" placeholder="지역을 선택하세요">
                            <option value="중구"<c:if test="${param.gugunnm == '중구'}"> selected="selected" </c:if>>중구   </option>
                            <option value="서구"<c:if test="${param.gugunnm == '서구'}"> selected="selected" </c:if>>서구   </option>
                            <option value="동구"<c:if test="${param.gugunnm == '동구'}"> selected="selected" </c:if>>동구  </option>
                            <option value="영도구"<c:if test="${param.gugunnm == '영도구'}"> selected="selected" </c:if>>영도구  </option>
                            <option value="부산진구"<c:if test="${param.gugunnm == '부산진구'}"> selected="selected" </c:if>>부산진구   </option>
                            <option value="동래구"<c:if test="${param.gugunnm == '동래구'}"> selected="selected" </c:if>>동래구   </option>
                            <option value="남구"<c:if test="${param.gugunnm == '남구'}"> selected="selected" </c:if>>남구   </option>
                            <option value="북구"<c:if test="${param.gugunnm == '북구'}"> selected="selected" </c:if>>북구   </option>
                            <option value="해운대구"<c:if test="${param.gugunnm == '해운대구'}"> selected="selected" </c:if>>해운대구    </option>
                            <option value="사하구"<c:if test="${param.gugunnm == '사하구'}"> selected="selected" </c:if>>사하구    </option>
                            <option value="금정구"<c:if test="${param.gugunnm == '금정구'}"> selected="selected" </c:if>>금정구    </option>
                            <option value="강서구"<c:if test="${param.gugunnm == '강서구'}"> selected="selected" </c:if>>강서구    </option>
                            <option value="연제구"<c:if test="${param.gugunnm == '연제구'}"> selected="selected" </c:if>>연제구    </option>
                            <option value="수영구"<c:if test="${param.gugunnm == '수영구'}"> selected="selected" </c:if>>수영구    </option>
                            <option value="사상구"<c:if test="${param.gugunnm == '사상구'}"> selected="selected" </c:if>>사상구    </option>
                            <option value="기장군"<c:if test="${param.gugunnm == '기장군'}"> selected="selected" </c:if>>기장군    </option>
             			</select>
             			
                    </div>

					  <div class="mb-4" style="font-family: 'GmarketSansMedium'!important;">
                            <label class="form-label">Tag</label>
                            <ul class="list-unstyled mb-0">

                                <li>
                                    <div class="custom-control custom-checkbox">
                                        <input class="custom-control-input" type="checkbox" id="middle_size_rm" name="middle_size_rm"
                                        <c:if test="${param.middle_size_rm != null}">checked="checked"</c:if>>
                                        <label class="custom-control-label" for="middle_size_rm">편의시설</label>
                                    </div>
                                </li>
                                <li>
                                    <div class="custom-control custom-checkbox">
                                        <input class="custom-control-input" type="checkbox" id="homePage" name="homePage"
                                        <c:if test="${param.homePage != null}">checked="checked"</c:if>>
                                        <label class="custom-control-label" for="homePage">홈페이지</label>
                                    </div>
                                </li>
                                <li>
                                    <div class="custom-control custom-checkbox">
                                        <input class="custom-control-input" type="checkbox" id=trfcInfo name="trfcInfo"
                                        <c:if test="${param.trfcInfo != null}">checked="checked"</c:if>>
                                        <label class="custom-control-label" for="trfcInfo">교통정보</label>
                                    </div>
                                </li>
                            </ul>
                        </div>

					<button class="btn btn-primary" type="submit">
						<i class="fas fa-search me-1"></i>SEARCH
					</button>
				</form>
			</div>
		
			<div class="col-lg-9">
				<!-- 정렬 부분-->
				<div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4 ">
					<div class="me-3 ">
						<p class="mb-3 mb-md-0 ">
							<strong>${count}</strong> 개의 항목
						</p>
					</div>
					
					<div>
						<select class="selectpicker " name="sort " id="sort" data-style="btn-selectpicker " placeholder="정렬" onchange="movePage2(this.value)">
							<option value="ASC" <c:if test="${param.sort == 'ASC'}"> selected="selected"</c:if>>조회수△</option>
							<option value="DESC"<c:if test="${param.sort == 'DESC'}"> selected="selected"</c:if>>조회수▽</option>
						</select>
					</div>
					
				</div>

				<!-- 리스트 시작! -->
				<div class="row">
				<c:forEach var="d" begin="0" items="${list}">
					<div class="col-sm-6 col-xl-4 mb-5 hover-animate"
						data-marker-id="59c0c8e33b1527bfe2abaf92">
						<div class="card h-100 border-0 shadow">
							<div class="card-img-top overflow-hidden dark-overlay bg-cover"
								style="background-image: url(${d.thumb}); min-height: 200px;">
								<a class="tile-link" href="${path}/Des/detail?de_id=${d.de_id}"></a>
								<div class="card-img-overlay-bottom z-index-20">
									<h4 class="text-white text-shadow">${d.title}</h4>
									<p class="mb-2 text-xs">
										<i class="fa fa-star text-warning"></i><i
											class="fa fa-star text-warning"></i><i
											class="fa fa-star text-warning"></i><i
											class="fa fa-star text-warning"></i><i
											class="fa fa-star text-gray-300"> </i>
									</p>
								</div>
								<div
									class="card-img-overlay-top d-flex justify-content-between align-items-center">
									<div class="badge badge-transparent badge-pill px-3 py-2">#당일치기</div>
									<a class="card-fav-icon position-relative z-index-40"
										href="Sightsdetail.html"> <svg class="svg-icon text-white">
                                            <use use
												xlink:href="#heart-1"> </use>
                                        </svg></a>
								</div>
							</div>
							<div class="card-body">
								<p class="testimonial-text" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;  width: 400px;">${d.detail}</p>
								<p class="text-sm text-muted text-uppercase mb-1">
									By <a href="#" class="text-dark">BOOGIRANG</a>
								</p>
								<p class="text-sm mb-0">
									<a class="mr-1" href="#">Restaurant,</a><a class="mr-1"
										href="Sightsdetail.html">Contemporary</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>

					<!-- 페이지 순서-->
					<!-- Pagination -->
					 <nav aria-label="Page navigation example ">
                    <ul class="pagination pagination-template d-flex justify-content-center ">
                    
                    	<li class="page-item ">
                            <a class="page-link " onclick="movePage('${path}/Des/list?page=1');">
                            	<i class="fa fa-angle-left "></i><i class="fa fa-angle-left "></i>
                            </a>
                        </li>
                    	
                       	<li class="page-item ">
                            <a class="page-link " onclick="movePage('${path}/Des/list?page=${pageInfo.prevPage}');">
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
                        			<a class="page-link" onclick="movePage('${path}/Des/list?page=${status.current}');">
                        				<c:out value="${status.current}"/>	
                        			</a>
                        		</li>
                        	</c:if>
                        </c:forEach>
                        
                        <li class="page-item ">
                            <a class="page-link " onclick="movePage('${path}/Des/list?page=${pageInfo.nextPage}')">
                            	<i class="fa fa-angle-right "></i>
                            </a>
                        </li>
                        
                        <li class="page-item ">
                            <a class="page-link " onclick="movePage('${path}/Des/list?page=${pageInfo.getMaxPage()}')">
                            	<i class="fa fa-angle-right "></i><i class="fa fa-angle-right "></i>
                            </a>
                        </li>
                    </ul>
                </nav>
                
				</div>
			</div>
</section>

<!-- 10월의 명소 -->
<section class="pt-9" style="font-family: 'GmarketSansMedium' !important;">
	
	<div class="container-fluid">
		<div class="row mb-5">
			<div class="col-lg-4">
				<h2>10월의 인기 명소</h2>
				<p class="text-muted mb-0">시원한 가을 공기로 변한 요즘, 이제 부산여행 가을ver.을
					맞이하시죠!</p>
			</div>
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="row">
			<c:forEach var="re" items="${relist}">		
			<div class="col-6 col-lg-4 col-xl-3 px-0">
				<div class="d-flex align-items-center dark-overlay hover-scale-bg-image" style="min-height: 400px;">
					<img class="bg-image" src="${re.thumb}" alt="">
					<div class="p-3 p-sm-5 text-white z-index-20">
						<h4 class="h2">${re.place}</h4>
					
						<a	class="btn btn-link text-reset pl-0 stretched-link text-decoration-none" href="${path}/Des/detail?de_id=${re.de_id}">
							더 보기<i class="fa fa-chevron-right ml-2"></i>
						</a>	
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>

<script type="text/javascript">
function movePage(pageUrl){
		
		var name  = document.getElementById("name"); 							//	검색
 			
 		var gugunnm = document.getElementById("gugunnm"); 						// 지역
 		var gugunnmselect = gugunnm.options[gugunnm.selectedIndex].value;
 		
 		var middle_size_rm = document.getElementsByName("middle_size_rm");  	// 편의시설
 		var homePage = document.getElementsByName("homePage");					// 홈페이지
 		var trfcInfo = document.getElementsByName("trfcInfo");					// 교통정보

		if(name.value != null && name.value.length > 0 ){
			pageUrl = pageUrl + '&name='+ name.value;
		}
		
		if(gugunnmselect != null && gugunnmselect.length > 0 ){
			pageUrl = pageUrl + '&gugunnm='+ gugunnmselect;
		}
		
		if(middle_size_rm != null && middle_size_rm.length > 0 ){
			for(var i = 0; i < middle_size_rm.length; i++){
				if(middle_size_rm[i].checked == true){
					pageUrl = pageUrl + '&middle_size_rm=' + middle_size_rm[i].value;	
				}
			}
		}
		
		if(homePage != null && homePage.length > 0 ){
			for(var i = 0; i < homePage.length; i++){
				if(homePage[i].checked == true){
					pageUrl = pageUrl + '&homePage=' + homePage[i].value;	
				}
			}
		}
		
		if(trfcInfo != null && trfcInfo.length > 0 ){
			for(var i = 0; i < trfcInfo.length; i++){
				if(trfcInfo[i].checked == true){
					pageUrl = pageUrl + '&trfcInfo=' + middle_size_rm[i].value;	
				}
			}
		}
		
		var sort = '${param.sort}';
		if(sort != null && sort.length > 0){
				pageUrl = pageUrl + '&sort=' + sort;
		}
		
		
// 		alert(pageUrl);
		window.location.href = encodeURI(pageUrl);
		//window 빼면 안되는 버그가 있어요! location.href 사용시 페이지 이동 x
		// => window 붙이면 가능!
		
		
}

function movePage2(sort){
	
	var pageUrl = "${path}/Des/list?"
	
	var name  = document.getElementById("name"); 							//	검색
		
	var gugunnm = document.getElementById("gugunnm"); 						// 지역
	var gugunnmselect = gugunnm.options[gugunnm.selectedIndex].value;
	
	var middle_size_rm = document.getElementsByName("middle_size_rm");  	// 편의시설
	var homePage = document.getElementsByName("homePage");					// 홈페이지
		var trfcInfo = document.getElementsByName("trfcInfo");					// 교통정보

	if(name.value != null && name.value.length > 0 ){
		pageUrl = pageUrl + '&name='+ name.value;
	}
	
	if(gugunnmselect != null && gugunnmselect.length > 0 ){
		pageUrl = pageUrl + '&gugunnm='+ gugunnmselect;
	}
	
	if(middle_size_rm != null && middle_size_rm.length > 0 ){
		for(var i = 0; i < middle_size_rm.length; i++){
			if(middle_size_rm[i].checked == true){
				pageUrl = pageUrl + '&middle_size_rm=' + middle_size_rm[i].value;	
			}
		}
	}
	
	if(homePage != null && homePage.length > 0 ){
		for(var i = 0; i < homePage.length; i++){
			if(homePage[i].checked == true){
				pageUrl = pageUrl + '&homePage=' + homePage[i].value;	
			}
		}
	}
	
	if(trfcInfo != null && trfcInfo.length > 0 ){
		for(var i = 0; i < trfcInfo.length; i++){
			if(trfcInfo[i].checked == true){
				pageUrl = pageUrl + '&trfcInfo=' + middle_size_rm[i].value;	
			}
		}
	}
	
	pageUrl = pageUrl + '&sort=' +sort;
	
// 	alert(pageUrl + '&sort=' +sort);
	
	window.location.href = encodeURI(pageUrl);
	//window 빼면 안되는 버그가 있어요! location.href 사용시 페이지 이동 x
	// => window 붙이면 가능!
	
	
}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />