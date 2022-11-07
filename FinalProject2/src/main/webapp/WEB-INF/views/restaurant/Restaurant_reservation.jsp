<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>	

<section class="py-5" style="font-family: 'GmarketSansMedium'!important;">
            <div class="container">
                <!-- Breadcrumbs -->
                
                <div class="d-flex flex-column flex-md-row justify-content-md-between align-items-md-center mb-4">
                    <h1 class="mb-3 mb-md-0 hero-heading mb-0">예약 완료</h1>
                    <div><a class="btn btn-link ps-0" href="${path}/res/view?no=${resList.res_id}"><i class="fa fa-arrow-left me-2"></i> 상세페이지로 가기</a></div>
                </div>
                <div class="card border-0 shadow mb-4">
                    <div class="card-body p-4">
                        <div class="text-block pb-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <h6> <a class="text-reset" href="detail-rooms.html">${param.res_name}</a></h6>
                                    <p class="text-muted text-sm mb-0">${resList.addr}</p>
                                    <div class="mt-n1"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                                    </div>
                                </div>
                                <a href="detail-rooms.html"><img class="ms-3 rounded flex-shrink-0" src="${resList.img}" alt="" width="100"></a>
                            </div>
                        </div>
                        <div class="text-block pt-3 pb-0">
                            <ul class="list-unstyled text-sm mb-0">
                                <li class="mb-3"><i class="fa fa-id-card fa-fw text-muted me-2"></i>${loginMember.user_name}</li>
                                <li class="mb-3"><i class="fas fa-users fa-fw text-muted me-2"></i>성인 : ${param.adult_num}명</li>
                                <li class="mb-3"><i class="fas fa-users fa-fw text-muted me-2"></i>청소년 : ${param.teenager_num}명</li>
                                <li class="mb-3"><i class="fas fa-users fa-fw text-muted me-2"></i>아동 : ${param.kids_num}명</li>
                                <li class="mb-3"><i class="far fa-calendar fa-fw text-muted me-2"></i>${param.pick_date} </li>
                                <li class="mb-0"><i class="fa fa-phone fa-fw text-muted me-2"></i>${loginMember.user_phone}</li>
                            </ul>
                        </div>
                    </div>
                </div>


            </div>
        </section>
        
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>