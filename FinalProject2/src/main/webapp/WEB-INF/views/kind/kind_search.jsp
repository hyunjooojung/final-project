<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section
	style="font-family: 'GmarketSansMedium' !important; background-color: rgb(246, 249, 252);">
	<section class="d-flex align-items-center dark-overlay bg-cover"
		style="background-image: url('${path}/resources/img/Busan/그림1.png'); height: 350px;">
		<div class="container py-7 py-lg-7 text-white overlay-content"
			style="margin-top: 50px; text-align: center;">
			<p class="subtitle text-white">good-price store</p>
			<h1 class="display-4 fw-bold text-shadow">착한가게</h1>
		</div>
	</section>

	<!-- 검색바 -->
	<div class="container">
		<div
			class="search-bar rounded p-3 gap-lg-1 position-relative mt-n5 z-index-20">

			<form name="form" method="get" action="${path}/kind/list">

				<div class="row" style="justify-content: center;">
					<!-- 지역 선택 -->
					<div class="col-xl-3 col-md-6 mb-4 " style="margin-top: 5px;">
						<label for="adress">지역</label> <select class="form-control"
							id="adress" name="adress">
							<option disabled selected>지역을 선택하세요.</option>
							<option value="강서구"<c:if test="${param.adress == '강서구'}"> selected="selected" </c:if>>강서구</option>
							<option value="북구" <c:if test="${param.adress == '북구'}"> selected="selected" </c:if>>북구</option>
							<option value="금정구" <c:if test="${param.adress == '금정구'}"> selected="selected" </c:if>>금정구</option>
							<option value="기장군" <c:if test="${param.adress == '기장군'}"> selected="selected" </c:if>>기장군</option>
							<option value="사상구" <c:if test="${param.adress == '사상구'}"> selected="selected" </c:if>>사상구</option>
							<option value="부산진구" <c:if test="${param.adress == '부산진구'}"> selected="selected" </c:if>>부산진구</option>
							<option value="연제구" <c:if test="${param.adress == '연제구'}"> selected="selected" </c:if>>연제구</option>
							<option value="동래구" <c:if test="${param.adress == '동래구'}"> selected="selected" </c:if>>동래구</option>
							<option value="사하구" <c:if test="${param.adress == '사하구'}"> selected="selected" </c:if>>사하구</option>
							<option value="서구" <c:if test="${param.adress == '서구'}"> selected="selected" </c:if>>서구</option>
							<option value="동구" <c:if test="${param.adress == '동구'}"> selected="selected" </c:if>>동구</option>
							<option value="남구" <c:if test="${param.adress == '남구'}"> selected="selected" </c:if>>남구</option>
							<option value="중구" <c:if test="${param.adress == '중구'}"> selected="selected" </c:if>>중구</option>
							<option value="수영구" <c:if test="${param.adress == '수영구'}"> selected="selected" </c:if>>수영구</option>
							<option value="해운대구" <c:if test="${param.adress == '해운대구'}"> selected="selected" </c:if>>해운대구</option>
							<option value="영도구" <c:if test="${param.adress == '영도구'}"> selected="selected" </c:if>>영도구</option>
						</select>
					</div>

					<!-- 주차유무 -->
					<div class="col-xl-3 col-md-6 mb-4" style="margin-top: 5px;">
						<label for="parking">주차유무</label> <select class="form-control"
							id="parking" name="parking">
							<option disabled selected>주차를유무를 선택하세요.</option>
							<option value="Y"
								<c:if test="${param.parking == 'Y'}"> selected="selected" </c:if>>주차가능</option>
							<option value="N"
								<c:if test="${param.parking == 'N'}"> selected="selected" </c:if>>주차불가</option>
						</select>
					</div>

					<!-- 업종 -->
					<div class="col-xl-3 col-md-6 mb-4" style="margin-top: 5px;">
						<label for="cn">업종</label> <select class="form-control " id="cn"
							name="cn">
							<option disabled selected>업종을 선택하세요.</option>
							<option value="음식점"
								<c:if test="${param.cn == '음식점'}"> selected="selected" </c:if>>식당</option>
							<option value="이미용"
								<c:if test="${param.cn == '이미용'}"> selected="selected" </c:if>>미용업</option>
							<option value="기타"
								<c:if test="${param.cn == '기타'}"> selected="selected" </c:if>>기타</option>
						</select>
					</div>

					<div class="col-xl-jhj col-md-6 mb-4">
						<label for="kind_name">검색</label> <input
							type="text" class="form-control" id="search" name="search"
							placeholder="검색어" value="${param.search}">
					</div>
					<div class="col-xl-1 col-md-6 mb-4" style="margin-top: 28px;">
						<button class="btn btn-primary" type="submit">
							<i class="fas fa-search me-1"></i>검색
						</button>
					</div>
				</div>
			</form>
		</div>

	</div>


	<div>
		<div class="container ">
			<br>
			<!-- 정렬 부분 -->
			<div
				class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4 ">
				<div class="me-3 ">
					<p class="mb-3 mb-md-0 text-muted">
						<strong>${countResult}</strong> 개의 항목
					</p>
				</div>
				<div>
					<select class="selectpicker " name="sort" id="sort" placeholder="정렬"
						data-style="btn-selectpicker " onchange="movePage2(this.value)">
						<option value="ASC" <c:if test="${param.sort == 'ASC'}"> selected="selected" </c:if>>오름차순</option>
						<option value="DESC" <c:if test="${param.sort == 'DESC'}"> selected="selected" </c:if>>내림차순</option>
					</select>
				</div>
			</div>



			<div class="row ">
				<c:if test="${!empty list}">
					<c:forEach var="kind" items="${list}">

						<!-- dark-overlay -->
						<!-- venue item-->
						<div class="col-sm-6 col-lg-4 mb-5 hover-animate "
							data-marker-id="59c0c8e33b1527bfe2abaf92 ">
							<div class="card h-100 border-0 shadow ">
							
								<div class="card-img-top overflow-hidden bg-cover "
									style="background-image: 
									<c:if test="${kind.img1 != null}">url(https://${kind.img1});</c:if>
									<c:if test="${kind.img1 == null}">url('https://image.kyobobook.co.kr/newimages/giftshop_new/goods/400/1890/S1558598345368.jpg');</c:if>
									min-height: 200px; ">
									<a class="tile-link "
											href="${path}/kind/view?kind_id=${kind.kind_id}&kind_add=${fn:split(kind.adress, ' ')[1]}"></a>
									<div
										class="card-img-overlay-top d-flex justify-content-between align-items-center ">
										<a class="card-fav-icon position-relative z-index-40 "
											href="${path}/mem/bookmark?bmc_code=5&code=${kind.kind_id}&User_CODE=${loginMember.getUser_CODE()}"> <svg
												class="svg-icon text-white ">
                                        <use xlink:href="#heart-1"></use>
                                        
                                    </svg>
										</a>
									</div>
								</div>

								<!-- 설명부분-->
								<div class="card-bod-jhj ">
									<h5 class="text-shadow ">${kind.kind_name}</h5>
									<p class="mb-2 text-xs nav-jhj ">
									<p class="flex-grow-1 mb-0 text-muted text-sm">${kind.adress}</p>
									<p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
									
									<c:choose>
										<c:when test="${kind.cnt >= 0}">
											<i class="fa fa-star text-warning"></i>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${kind.cnt > 10}">
											<i class="fa fa-star text-warning"></i>
										</c:when>
										<c:otherwise>
											<i class="fa fa-star text-gray-300 "></i>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${kind.cnt > 20}">
											<i class="fa fa-star text-warning"></i>
										</c:when>
										<c:otherwise>
											<i class="fa fa-star text-gray-300 "></i>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${kind.cnt > 30}">
											<i class="fa fa-star text-warning"></i>
										</c:when>
										<c:otherwise>
											<i class="fa fa-star text-gray-300 "></i>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${kind.cnt > 40}">
											<i class="fa fa-star text-warning"></i>
										</c:when>
										<c:otherwise>
											<i class="fa fa-star text-gray-300 "></i>
										</c:otherwise>
									</c:choose>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>

          <nav aria-label="Page navigation example">
                <ul class="pagination pagination-template d-flex justify-content-center pd_jhj1 ">
                   
                    <li class="page-item ">
                    	<a class="page-link " onclick="movePage('${path}/kind/list?page=1');">
                         	<i class="fa fa-angle-left "></i><i class="fa fa-angle-left "></i>
                    	</a>
                    </li>
                    
                    <li class="page-item ">
                        <button class="page-link" onclick="movePage('${path}/kind/list?page=${pageInfo.prevPage}')"> <i class="fa fa-angle-left"></i></button>
                    </li>
                    
					
 						<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" varStatus="status">
                           <c:if test="${pageInfo.currentPage == status.current}">
                               <li class="page-item active">
                                   <a class="page-link">
                                       <c:out value="${status.current}" />
                                   </a>
                               </li>
                           </c:if>

                           <c:if test="${pageInfo.currentPage != status.current}">
                               <li class="page-item">
                                   <a class="page-link" onclick="movePage('${path}/kind/list?page=${status.current}');">
                                       <c:out value="${status.current}" />
                                   </a>
                               </li>
                           </c:if>
                       </c:forEach>
                    
                    
                    <li class="page-item ">
                        <button class="page-link" onclick="movePage('${path}/kind/list?page=${pageInfo.nextPage}')"> <i class="fa fa-angle-right"></i></button>
                    </li>
                    
                    <li class="page-item ">
                       <a class="page-link " onclick="movePage('${path}/kind/list?page=${pageInfo.getMaxPage()}')">
                       		<i class="fa fa-angle-right "></i><i class="fa fa-angle-right "></i>
                       </a>
                    </li>
                </ul>
            </nav>
        </div>
        <br>
    </section>
    

<script type="text/javascript">
	function movePage(pageUrl) {

		// 		주소 select
		var adress = document.getElementById("adress");
		var adresSelect = adress.options[adress.selectedIndex].value;

		// 		주차 select
		var parking = document.getElementById("parking");
		var parkingSelect = parking.options[parking.selectedIndex].value;

		// 종목 select
		var cn = document.getElementById("cn");
		var cnSelect = cn.options[cn.selectedIndex].value;

		// 검색 input 
		var searchName = document.getElementById("search");
		
		// 정렬 
		var sort = document.getElementById("sort");
		var sortSelect = sort.options[sort.selectedIndex].value;

		if (adresSelect.length != 10) {
			pageUrl = pageUrl + '&adress=' + adresSelect;
		}

		if (parkingSelect.length != 13) {
			pageUrl = pageUrl + '&parking=' + parkingSelect;
		}

		if (cnSelect.length != 10) {
			pageUrl = pageUrl + '&cn=' + cnSelect;
		}

		if (searchName.value != null && searchName.value.length > 0) {
			pageUrl = pageUrl + '&search=' + searchName.value;
		}
		
		if(sortSelect != null&& sortSelect.length > 0){
			pageUrl = pageUrl + '&sort=' + sortSelect;
		}

// 		alert(pageUrl);
		
		window.location.href = encodeURI(pageUrl);
	}
	
	
	function movePage2(sort){
		
		var pageUrl = "${path}/kind/list?"
		
		// 		주소 select
		var adress = document.getElementById("adress");
		var adresSelect = adress.options[adress.selectedIndex].value;

		// 		주차 select
		var parking = document.getElementById("parking");
		var parkingSelect = parking.options[parking.selectedIndex].value;

		// 		종목 select
		var cn = document.getElementById("cn");
		var cnSelect = cn.options[cn.selectedIndex].value;

		// 		검색 input 
		var searchName = document.getElementById("search");
		
		// 정렬 
// 		var sort = document.getElementById("sort");
// 		var sortSelect = sort.options[sort.selectedIndex].value;

		if (adresSelect.length != 10) {
			pageUrl = pageUrl + '&adress=' + adresSelect;
		}

		if (parkingSelect.length != 13) {
			pageUrl = pageUrl + '&parking=' + parkingSelect;
		}

		if (cnSelect.length != 10) {
			pageUrl = pageUrl + '&cn=' + cnSelect;
		}

		if (searchName.value != null && searchName.value.length > 0) {
			pageUrl = pageUrl + '&search=' + searchName.value;
		}
		
		pageUrl = pageUrl + '&sort=' + sort;

// 		alert(pageUrl);
		
		window.location.href = encodeURI(pageUrl);
	}
	
	
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />

