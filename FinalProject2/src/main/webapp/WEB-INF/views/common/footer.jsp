<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="path2" value="${pageContext.request.servletPath}"/>

<footer class="position-relative z-index-10 d-print-none" style="font-family: 'GmarketSansMedium'!important;">
        <!-- Main block - menus, subscribe form-->
        <div class="py-5 bg-gray-200 text-muted ">
            <div class="container ">
                <div class="row ">

                    <div class="col-lg-5 col-md-6 mb-5 mb-lg-0 ">
                        <h6 class="text-uppercase text-dark mb-3 ">회사정보</h6>
                        <p>상호:(주)BoogiRang</p>
                        <p>공동대표: 강인국,김영도,김보성,김유정,신무균,정현주,최희정</p>
                        <p>주소: 서울 강남구</p>
                        <p>개인정보관리 책임자: 강인국</p>
                        <p>사업자 등록번호: 2022.08.0716</p>
                        <ul class="list-inline ">
                            <li class="list-inline-item "><a class="text-muted text-primary-hover " href="# " target="_blank " title="twitter "><i class="fab fa-twitter "></i></a></li>
                            <li class="list-inline-item "><a class="text-muted text-primary-hover " href="# " target="_blank " title="facebook "><i class="fab fa-facebook "></i></a></li>
                            <li class="list-inline-item "><a class="text-muted text-primary-hover " href="# " target="_blank " title="instagram "><i class="fab fa-instagram "></i></a></li>
                            <li class="list-inline-item "><a class="text-muted text-primary-hover " href="# " target="_blank " title="pinterest "><i class="fab fa-pinterest "></i></a></li>
                            <li class="list-inline-item "><a class="text-muted text-primary-hover " href="# " target="_blank " title="vimeo "><i class="fab fa-vimeo "></i></a></li>
                        </ul>
                    </div>

                    <div class="col-lg-4 col-md-6 mb-5 mb-lg-0 ">
                        <h6 class="text-uppercase text-dark mb-3 ">근무시간</h6>
                        <p>근무시간: 월 ~ 금 AM 9:00 ~ PM 5:00</p>
                        <p>점심시간: PM12 :00 ~ PM 1 : 00</p>
                        <p>고객센터: AM 09: 00 ~ PM6 : 00</p>
                    </div>

                    <div class="col-lg-3 mb-5 mb-lg-0 ">
                        <div class="fw-bold text-uppercase text-dark mb-3 ">고객센터 C/S Center</div>
                        <p>Tel: 02.5555.5555</p>
                        <p>Fax: 02.5555.0000</p>
                        <p>Email: rlaqhtjd789@naver.com</p>
                        <p>KakaoTalk ID: Team4</p>
                        <p>오전 9시부터 오후 6시까지 상담가능</p>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- JavaScript files-->
    <script>
        // ------------------------------------------------------- //
        //   Inject SVG Sprite - 
        //   see more here 
        //   https://css-tricks.com/ajaxing-svg-sprite/
        // ------------------------------------------------------ //
        function injectSvgSprite(path) {

            var ajax = new XMLHttpRequest();
            ajax.open("GET", path, true);
            ajax.send();
            ajax.onload = function(e) {
                var div = document.createElement("div");
                div.className = 'd-none';
                div.innerHTML = ajax.responseText;
                document.body.insertBefore(div, document.body.childNodes[0]);
            }
        }


        // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
        // use your own URL in production, please :)
        // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
        //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
        injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');
    </script>
    <!-- jQuery-->
    <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="${path}/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="${path}/resources/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="${path}/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="${path}/resources/vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>
        var basePath = ''
    </script>
    <!-- Main Theme JS file    -->
    <script src="${path}/resources/js/theme.js"></script>
    
	<!--맛집 달력 -->
	<script src="${path}/resources/js/main.js"></script>
    <script src="${path}/resources/js/popper.min.js"></script>
    <script src="${path}/resources/js/bootstrap.min.js"></script>
    <script src="${path}/resources/js/picker.js"></script>
    <script src="${path}/resources/js/picker.date.js"></script>

	<!-- 숙소 달력 -->
	<c:if test="${fn:contains(path2,'room')}">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.19.0/jquery.daterangepicker.min.js"></script>
    	<script src="${path}/resources/js/datepicker-detail.js"></script>
    </c:if>
   
    
</body>

</html>