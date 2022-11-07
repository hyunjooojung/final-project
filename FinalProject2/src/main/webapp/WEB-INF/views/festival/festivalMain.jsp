<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

  <section class="hero-home">
        <div class="swiper-container hero-slider">
            <div class="swiper-wrapper ">
                <div class="swiper-slide dark-overlay" style="background-image:url(${path}/resources/img/Busan/Busan1.jpg)"></div>
            </div>
        </div>
        <div class="container py-6 py-md-7 text-white z-index-20">
            <div class="row">
                <div class="col-xl-10">
                    <div class="text-center text-lg-start" style="font-family: 'GmarketSansMedium'!important;">
                        <!-- <p class="subtitle letter-spacing-4 mb-2 text-light  text-shadow">Experience various festivals in Busan</p> -->
                        <h1 class="display-3 fw-bold text-shadow">부산 축제</h1>
                    </div>
                    <div class="search-bar mt-5 p-3 p-lg-1 ps-lg-4">
                        <form action="${path}/festival/FestivalSearch" method="get">
                            <div class="row" style="font-family: 'GmarketSansMedium'!important;">
                                <div class="col-lg-2 d-flex align-items-center form-group">
                                    <input class="form-control border-0 shadow-0" type="text" name="title" placeholder="검색어">
                                </div>
                                <div class="col-lg-2 d-flex align-items-center form-group no-divider">
                                    <select class="selectpicker" title="운영기간(월)" data-style="btn-form-control" name="time" size="5">
                                        <option value="1월">01월    </option>
                                        <option value="2월">02월    </option>
                                        <option value="3월">03월    </option>
                                        <option value="4월">04월    </option>
                                        <option value="5월">05월    </option>
                                        <option value="6월">06월    </option>
                                        <option value="7월">07월    </option>
                                        <option value="8월">08월    </option>
                                        <option value="9월">09월    </option>
                                        <option value="10월">10월    </option>
                                        <option value="11월">11월    </option>
                                        <option value="12월">12월    </option>
                                    </select>
                                </div>

                                <div class="col-lg-2 d-flex align-items-center form-group no-divider">
                                    <select class="selectpicker" title="지역" data-style="btn-form-control" name="location" onchange="movePage(this.value)" size="5">
                                        <option value="중구" <c:if test="${param.location == '중구'}">selected="selected"</c:if>>중구</option>
                                        <option value="서구"<c:if test="${param.location == '서구'}">selected="selected"</c:if>>서구</option>
                                        <option value="동구"<c:if test="${param.location == '동구'}">selected="selected"</c:if>>동구</option>
                                        <option value="영도구"<c:if test="${param.location == '영도구'}">selected="selected"</c:if>>영도구</option>
                                        <option value="부산진구"<c:if test="${param.location == '부산진구'}">selected="selected"</c:if>>부산진구</option>
                                        <option value="동래구"<c:if test="${param.location == '동래구'}">selected="selected"</c:if>>동래구</option>
                                        <option value="남구"<c:if test="${param.location == '남구'}">selected="selected"</c:if>>남구</option>
                                        <option value="북구"<c:if test="${param.location == '북구'}">selected="selected"</c:if>>북구</option>
                                        <option value="해운대구"<c:if test="${param.location == '해운대구'}">selected="selected"</c:if>>해운대구</option>
                                        <option value="사하구"<c:if test="${param.location == '사하구'}">selected="selected"</c:if>>사하구</option>
                                        <option value="금정구"<c:if test="${param.location == '금정구'}">selected="selected"</c:if>>금정구</option>
                                        <option value="강서구"<c:if test="${param.location == '강서구'}">selected="selected"</c:if>>강서구</option>
                                        <option value="연제구"<c:if test="${param.location == '연제구'}">selected="selected"</c:if>>연제구</option>
                                        <option value="수영구"<c:if test="${param.location == '수영구'}">selected="selected"</c:if>>수영구</option>
                                        <option value="사상구"<c:if test="${param.location == '사상구'}">selected="selected"</c:if>>사상구</option>
                                        <option value="기장군"<c:if test="${param.location == '기장군'}">selected="selected"</c:if>>기장군</option>
                                    </select>
                                </div>

                                <div class="col-lg-2 d-flex align-items-center form-group no-divider">
                                    <select class="selectpicker" title="편의시설 유/무" data-style="btn-form-control" name="convenient">
                                        <option value="1">유</option>
                                        <option value="null">무</option>
                                    </select>
                                </div>

                                <div class="col-lg-2 d-flex align-items-center form-group no-divider">
                                    <select class="selectpicker" title="이용요금" data-style="btn-form-control" name="fare">
                                        <option value="1">유료</option>
                                        <option value="2">무료</option>
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

    <section class="py-5 bg-gray-100 shadow" style="font-family: 'GmarketSansMedium'!important;">
       
        <div class="container">
        <c:if test="${param.location != null && param.location.length() > 0}">
            <h1>${param.location}</h1>
        </c:if>
        <c:if test="${param.location == null}">
            <h1>중구</h1>
        </c:if>
            <p class="lead mb-5">이 지역은 부산광역시 15구, 1군 가운데 그 행정구역이 가장 좁으면서도 국제시장, 자갈치시장 등의 상가와, 수출입 화물선과 국내외 여객선이 쉴새없이 드나들고 있는 부산항의 중심지이자 국가경제의 전략적인 역할을 담당하고 있는 해상운송만의 전진기지라 할 수 있고, 부산에서도 가장 많은 금융기관, 남포동을 중심으로 한 부산상권의 중심지로서 유행과 멋을 창조, 선도하는 패션의 진원지이다. 현재 중구의 관할 동은 중앙동, 동광동,
                대청동, 보수동, 부평동, 광복동, 남포동, 영주1, 2동 등이 있다.</p>
            <h5>행정 구역 </h5>
            <ul class="nav nav-pills-custom">
            <c:if test="${!empty Glist}">
            	<c:forEach var = "dong" begin = "0" step = "1" items="${Glist}">
                	<li class="nav-item"><a class="nav-link" href="#">${dong}</a></li>
                </c:forEach>
            </c:if>
            </ul>
        </div>
        
    </section>

    <section class="pt-1" style="font-family: 'GmarketSansMedium'!important;">
        <div class="container-fluid">
            <div class="row">
            
	            <c:if test="${!empty Flist}">
	            	<c:forEach var="flist" items="${Flist}" step="1" begin="0" end="8">
		                
		                <div class="col-6 col-lg-4 col-xl-3 px-0">
		                    <div class="d-flex align-items-center dark-overlay hover-scale-bg-image" style="min-height: 400px;"><img class="bg-image" src="${flist.img_thumb}" alt="">
		                        <div class="p-3 p-sm-5 text-white z-index-20">
		                            <h4 class="h2">${flist.place}</h4>
		                            <p class="mb-4">${flist.subtitle}</p>
		                            <a class="btn btn-link text-reset ps-0 stretched-link text-decoration-none" href="${path}/festival/FestivalDetail?fe_id=${flist.fe_id}">
		                            	더 보기
		                            </a>
		                        </div>
		                    </div>
		                </div>
		                
	                </c:forEach>
	            </c:if>
            
            </div>
        </div>
    </section>
    
<script type="text/javascript">
function movePage(location){
		
		var pageUrl  = "${path}/festival/main?";
			
 		if(location != null && location.length > 0 ){
			pageUrl = pageUrl + '&location='+ location;
		}
 		
		alert(pageUrl);
		window.location.href = encodeURI(pageUrl);
		//window 빼면 안되는 버그가 있어요! location.href 사용시 페이지 이동 x
		// => window 붙이면 가능!
		
		
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
