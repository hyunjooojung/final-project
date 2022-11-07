<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

 <div class="progress rounded-0 sticky-top" style="height: 8px; top: 72px;">
        <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <section class="py-5" style="font-family: 'GmarketSansMedium'!important;">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <p class="subtitle text-primary">Book your holiday home</p>
                    <h1 class="h2 mb-5"> 숙박 규정 </h1>
                    <div class="text-block">
                        <div class="alert alert-warning text-sm mb-3">
                            <div class="d-flex align-items-center">
                                <svg class="svg-icon svg-icon svg-icon-light w-2rem h-2rem me-3 text-reset flex-shrink-0">
                      <use xlink:href="#heart-1"> </use>
                    </svg>
                                <div><strong>많은 사람들이 이 숙소에 관심이 있습니다.</strong> 지난주 이 숙소는 43회 조회 되었습니다.</div>
                            </div>
                        </div>
                    </div>
                    <div class="text-block">
                        <h5 class="mb-4" style="font-family: 'GmarketSansMedium'!important;">숙박 일정</h5>
                        <div class="row mb-3">
                            <div class="col-md-6 d-flex align-items-center mb-3 mb-md-0">
                                <div class="date-tile me-3">
                                    <div class="text-uppercase"> <span class="text-sm"> <c:out value="${checkInArr[1]}" />월 </span><br><strong class="text-lg"><c:out value="${checkInArr[2]}" /></strong></div>
                                </div>
                                <p class="text-sm mb-0">체크인<br>3PM - 7PM</p>
                            </div>
                            <div class="col-md-6 d-flex align-items-center">
                                <div class="date-tile me-3">
                                    <div class="text-uppercase"> <span class="text-sm"><c:out value="${checkOutArr[1]}" />월</span><br><strong class="text-lg"><c:out value="${checkOutArr[2]}" /></strong></div>
                                </div>
                                <p class="text-sm mb-0">체크 아웃<br>11AM</p>
                            </div>
                        </div>
                    </div>
                    <div class="text-block">
                        <h5 class="mb-4" style="font-family: 'GmarketSansMedium'!important;">숙박시 주의 사항</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-secondary-light flex-shrink-0 me-4"><i class="fa fas fa-child text-secondary fa-fw text-center"></i></div>
                                    <div><span class="text-sm">어린이는 보호자와 이동해주세요.</span></div>
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-secondary-light flex-shrink-0 me-4"><i class="fa fas fa-glass-cheers text-secondary fa-fw text-center"></i></div>
                                    <div><span class="text-sm">파티나 이벤트는 삼가해주세요.</span></div>
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-secondary-light flex-shrink-0 me-4"><i class="fa fa-smoking-ban text-secondary fa-fw text-center"></i></div>
                                    <div><span class="text-sm">숙소는 금연 구역입니다.</span></div>
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-secondary-light flex-shrink-0 me-4"><i class="fa fa-cat text-secondary fa-fw text-center"></i></div>
                                    <div><span class="text-sm">반려 동물는 입장할 수 없습니다.</span></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <form action="${path}/room/insertBooking" method="post">
                    <input type="hidden" id="loginMemberId" name="loginMemberId" class="input_text" value="${loginMember.user_id}" readonly  />
                    <input type="hidden" id="code" name="code" class="input_text" value="${code}" readonly  />
                    <input type="hidden" id="checkIn" name="checkIn" class="input_text" value="${checkIn}" readonly  />
                    <input type="hidden" id="checkOut" name="checkOut" class="input_text" value="${checkOut}" readonly  />
                    <input type="hidden" id="price" name="price" class="input_text" value="${price}" readonly  />
                    <input type="hidden" id="day" name="day" class="input_text" value="${day}" readonly  />
	                        <div class="text-block">
	                            <label class="h5" for="form_guests" style="font-family: 'GmarketSansMedium'!important;">인원수</label>
	                            <div class="row">
	                                <div class="col-lg-6 mb-3">
	                                    <select class="selectpicker form-control" name="guests" id="form_guests" data-style="btn-selectpicker" title=" ">
	                              <option value="1" selected>1 명</option>
	                              <option value="2">2 명</option>
	                              <option value="3">3 명</option>
	                              <option value="4">4 명</option>
	                              <option value="5">5 명</option>
	                            </select>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="text-block">
	
	                            <div class="row">
	                                <div class="mb-4 col-md-6">
	                                    <label class="form-label" for="card-name">카드 소유자명</label>
	                                    <input class="form-control" type="text" name="card-name" placeholder="Name on card" id="card-name">
	                                </div>
	                                <div class="mb-4 col-md-6">
	                                    <label class="form-label" for="card-number">카드 번호</label>
	                                    <input class="form-control" type="text" name="card-number" placeholder="Card number" id="card-number">
	                                </div>
	                                <div class="mb-4 col-md-4">
	                                    <label class="form-label" for="expiry-date">유효 날짜</label>
	                                    <input class="form-control" type="number" name="expiry-date" placeholder="MM/YY" id="expiry-date ex)1010">
	                                </div>
	                                <div class="mb-4 col-md-4">
	                                    <label class="form-label" for="cvv">CVC/CVV</label>
	                                    <input class="form-control" type="number" name="cvv" placeholder="123" id="cvv">
	                                </div>
	                                <div class="mb-4 col-md-4">
	                                    <label class="form-label" for="zip">우편번호</label>
	                                    <input class="form-control" type="number" name="zip" placeholder="123" id="zip">
	                                </div>
	                            </div>
	
	
	
	                        </div>
	
	                        <div class="text-block">
	                            <button type="button"  onclick="kakaoPay('${path}/room/kakaoPay?')" >
	                            <img src="https://developers.kakao.com/tool/resource/static/img/button/pay/payment_icon_yellow_medium.png">
	                            </button>
	
	                        </div>
	                        <input type="hidden" id="userName" value="${loginMember.user_name}">
	                        <input type="hidden" id="roomName" value="${room.name}">
	                        <input type="hidden" id="userCode" value="${loginMember.getUser_CODE()}">
	                        <input type="hidden" id="totalPrice" value="${room.price * day}">
	                        
	                        <script type="text/javascript">
	                        
	                        	
	                        
	                        	 function kakaoPay(pageUrl){
	                        		
	                        		var partner_order_id = document.getElementById("code").value; // 가맹점 주문번호 (숙소 코드로 처리)
	                        		var partner_user_id = document.getElementById("userName").value; // 가맹점 회원 id (회원 이름)
	                        		var item_name = document.getElementById("roomName").value; // 상품명 (숙소 이름으로 처리)
	                        		var quantity = document.getElementById("day").value; // 상품 수량 (숙박일 day로 처리)
	                        		var total_amount = document.getElementById("totalPrice").value; // 상품 총액 (숙박비 * day로 처리)
	                        		 var userCode = document.getElementById("userCode").value;
	                        		var checkIn = document.getElementById("checkIn").value;
	                        		var checkOut = document.getElementById("checkOut").value;
	                        		var people = document.getElementById("form_guests").value;
	                        		
	                        		alert('카톡 결제'); 
	                        		
	                        		
	                        		 
	                        		
	                        		 var form = document.createElement('form'); // 폼객체 생성
	                        		
	                        		
	                        		var objs1;
	                        		objs1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	                        		objs1.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
	                        		objs1.setAttribute('name', 'partner_order_id'); // 객체이름
	                        		objs1.setAttribute('value', partner_order_id); //객체값
	                        		form.appendChild(objs1);
	                        		
	                        		var objs2;
	                        		objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	                        		objs2.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
	                        		objs2.setAttribute('name', 'partner_user_id'); // 객체이름
	                        		objs2.setAttribute('value', partner_user_id); //객체값
	                        		form.appendChild(objs2);
	                        		
	                        		var objs3;
	                        		objs3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	                        		objs3.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
	                        		objs3.setAttribute('name', 'item_name'); // 객체이름
	                        		objs3.setAttribute('value', item_name); //객체값
	                        		form.appendChild(objs3);
	                        		
	                        		var objs4;
	                        		objs4 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	                        		objs4.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
	                        		objs4.setAttribute('name', 'quantity'); // 객체이름
	                        		objs4.setAttribute('value', quantity); //객체값
	                        		form.appendChild(objs4);
	                        		
	                        		var objs5;
	                        		objs5 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	                        		objs5.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
	                        		objs5.setAttribute('name', 'total_amount'); // 객체이름
	                        		objs5.setAttribute('value', total_amount); //객체값
	                        		form.appendChild(objs5);
	                        		
	                        		 var objs6;
	                        		objs6 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	                        		objs6.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
	                        		objs6.setAttribute('name', 'userCode'); // 객체이름
	                        		objs6.setAttribute('value', userCode); //객체값
	                        		form.appendChild(objs6);
	                        		
	                        		var objs7;
	                        		objs7 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	                        		objs7.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
	                        		objs7.setAttribute('name', 'checkIn'); // 객체이름
	                        		objs7.setAttribute('value', checkIn); //객체값
	                        		form.appendChild(objs7);
	                        		
	                        		var objs8;
	                        		objs8 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	                        		objs8.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
	                        		objs8.setAttribute('name', 'checkOut'); // 객체이름
	                        		objs8.setAttribute('value', checkOut); //객체값
	                        		form.appendChild(objs8);
	                        		
	                        		var objs9;
	                        		objs9 = document.createElement('input'); // 값이 들어있는 녀석의 형식
	                        		objs9.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
	                        		objs9.setAttribute('name', 'people'); // 객체이름
	                        		objs9.setAttribute('value', people); //객체값
	                        		form.appendChild(objs9);
	                        		
	                        		form.setAttribute('method', 'post'); //get,post 가능
	                        		form.setAttribute('action', "${path}/room/kakaoPay"); //보내는 url
	                        		document.body.appendChild(form);
	                        		form.submit(); 
			   
	                        	} 
	                        	
	                        	
	                        	
	                        </script>
	
	                        <div class="text-block" style="font-family: 'GmarketSansMedium'!important;">
	                            <h6 style="font-family: 'GmarketSansMedium'!important;">취소 정책</h6>
	                            <p class="text-sm text-muted">취소하지 마세요.</p>
	                            <p class="text-sm text-muted">취소 정책 취소 정책 취소 정책 취소 정책 취소 정책 취소 정책 </p>
	                        </div>
	                        
	                        <div class="row form-block flex-column flex-sm-row">
	
	            <!-- <button class="col text-center px-3" type="submit"><div class="btn btn-primary px-3"> 예약 완료</div><i class="fa-chevron-right fa ms-2"></i></button> -->
	            <div class="col text-center"><button class="btn btn-primary px-3" type="submit"> 예약 완료<i class="fa-chevron-right fa ms-2"></i></button></div>
	        </div>
	
	</form>
	                </div>
	                
	
	
	
	                <div class="col-lg-5 ps-xl-5">
	                    <div class="card border-0 shadow">
	                        <div class="card-body p-4">
	                            <div class="text-block pb-3">
	                                <div class="d-flex align-items-center">
	                                    <div>
	                                        <h6> <a class="text-reset" href="detail-rooms.html"> <c:out value="${room.name}"/> </a></h6>
	                                        <p class="text-muted text-sm mb-0"><c:out value="${room.adress}"/></p>
	                                        <div class="mt-n1"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i>
	                                        </div>
	                                    </div>
	                                    <a class="flex-shrink-0" href="detail-rooms.html"><img class="ms-3 rounded" src="${room.image}" alt="" width="100"></a>
	                                </div>
	                            </div>
	                            <div class="text-block py-3">
	                                <ul class="list-unstyled mb-0">
	                                    <li class="mb-3"><i class="fas fa-users fa-fw text-muted me-2"></i>예약자 : <c:out value="${loginMember.user_name}" /> </li>
	                                    <li class="mb-0"><i class="far fa-calendar fa-fw text-muted me-2"></i> <c:out value="${checkInArr[0]}" />년 <c:out value="${checkInArr[1]}" />월 <c:out value="${checkInArr[2]}" />일 <i class="fas fa-arrow-right fa-fw text-muted mx-3"></i><c:out value="${checkOutArr[0]}" />년 <c:out value="${checkOutArr[1]}" />월 <c:out value="${checkOutArr[2]}" />일</li>
	                                </ul>
	                            </div>
	                            <div class="text-block pt-3 pb-0">
	                                <table class="w-100">
	                                    <tbody>
	                                        <tr>
	                                            <th class="fw-normal py-2">￦ <c:out value="${room.price}" /> x <c:out value="${day}" /> 박</th>
	                                            
	                                            <td class="text-end py-2">￦ <c:out value="${room.price*day}" /> </td>
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
	                                    <h6 class="text-primary" style="font-family: 'GmarketSansMedium'!important;">Flexible – free cancellation</h6>
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