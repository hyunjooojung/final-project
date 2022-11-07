<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="progress rounded-0 sticky-top" style="height: 8px; top: 72px;">
        <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <section class="py-5" style="font-family: 'GmarketSansMedium'!important;">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <p class="subtitle text-primary">Book your holiday home</p>
                    <h1 class="h2 mb-5"> 예약 완료! </h1>
                    <div class="text-block">
                        <p class="text-muted"> <c:out value="${loginMember.user_name}"/> 님, 예약해주셔서 감사합니다. </p>
                        <p class="text-muted mb-5">편안하고 즐거운 관광 되시길 바랍니다.</p>
                        <p class="text-center mb-5">
                            <a class="btn btn-primary mx-2 mb-2" href="user-booking-detail.html"> <i class="far fa-file me-2"></i>예약 확인</a><a class="btn btn-outline-muted mb-2" href="${path}/room/list">다른 숙소 보기</a></p>
                        <p class="mb-5 text-center"><img class="img-fluid" src="img/illustration/undraw_celebration_0jvk.svg" alt="" style="width: 400px;"></p>
                    </div>
                </div>

                <div class="col-lg-5 ps-xl-5">
                    <div class="card border-0 shadow">
                        <div class="card-body p-4">
                            <div class="text-block pb-3">
                                <div class="d-flex align-items-center" style="justify-content: space-between;">
                                    <div>
                                        <h6> <a class="text-reset" href="detail-rooms.html"><c:out value="${room.name}"/></a></h6>
                                        <p class="text-muted text-sm mb-0"><c:out value="${room.adress}"/></p>
                                        <div class="mt-n1"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                                        </div>
                                    </div>
                                    <a class="flex-shrink-0" href="${path}/room/view?code=${code}"><img class="ms-3 rounded" src="${room.image}" alt="" width="100"></a>
                                </div>
                            </div>
                            <div class="text-block py-3">
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-3"><i class="fas fa-users fa-fw text-muted me-2"></i>예약자 : <c:out value="${loginMember.user_name}"/> </li>
                                    <li class="mb-0"><i class="far fa-calendar fa-fw text-muted me-2"></i><c:out value="${checkInArr[0]}" />년 <c:out value="${checkInArr[1]}" />월 <c:out value="${checkInArr[2]}" />일  <i class="fas fa-arrow-right fa-fw text-muted mx-3"></i><c:out value="${checkOutArr[0]}" />년 <c:out value="${checkOutArr[1]}" />월 <c:out value="${checkOutArr[2]}" />일  </li>
                                </ul>
                            </div>
                            <div class="text-block pt-3 pb-0">
                                <table class="w-100">
                                    <tbody>
                                        <tr>
                                            <th class="fw-normal py-2">￦<c:out value="${room.price}" /> x <c:out value="${day}" /> 박</th>
                                            <td class="text-end py-2">￦<c:out value="${room.price*day}" /></td>
                                        </tr>

                                    </tbody>
                                    <tfoot>
                                        <tr class="border-top">
                                            <th class="pt-3">합계</th>
                                            <td class="fw-bold text-end pt-3">￦<c:out value="${room.price*day}" /></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer bg-primary-light py-4 border-0">
                            <div class="d-flex align-items-center">
                                <div>
                                    <h6 class="text-primary">Flexible – free cancellation</h6>
                                    <p class="text-sm text-primary opacity-8 mb-0">Cancel within 48 hours of booking to get a full refund. <a href="#" class="text-reset ms-3">More details</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>