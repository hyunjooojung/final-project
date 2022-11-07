<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
 <section class="mb-0" style="font-family: 'GmarketSansMedium' !important">
        <div class="container py-6">

            <div class="row">
                <div class="col-xl-8 col-lg-10 mx-auto">
                    <p class=" py-1 mb-2 fw-light ">
                    <c:if test="${board.b_ccode == 1}">
                        <a class="text-black " href="blog.html">공지게시판</a>
                    </c:if>
                    <c:if test="${board.b_ccode == 2}">
                        <a class="text-black " href="blog.html">리뷰게시판</a>
                    </c:if>
                    <c:if test="${board.b_ccode == 3}">
                        <a class="text-black " href="blog.html">문의게시판</a>
                    </c:if>
                        <h1 class="display-4 mb-0 ">${board.title}</h1>
                    </p>
                </div>
            </div>                             

            <div class="row ">
                <div class="col-xl-8 col-lg-10 mx-auto ">
                   <p class="py-2 mb-2 fw-light ">
                        <a href=" "></a>작성자 <a href="# "> ${board.user_id} </a>
                        <span class="mx-1 ">|</span> ${board.bDate} 
                        <span class="mx-1 ">|</span>
 						<c:if test="${ !empty loginMember && (loginMember.user_id == board.user_id) }">
                        <a class="mx-2 " href="${path}/board/updateboard?b_code=${board.b_code}"> 수정&nbsp;<i class="fa fa-pen"></i></a>
                        <span class="mx-1 ">|</span>
                        <a class="mx-2 " href="${path}/board/deleteboard?b_code=${board.b_code}"> 삭제&nbsp;X</a>
                   		</c:if>
                    </p> 
                </div>
            </div>

            <div class="row ">
                <div class="col-xl-8 col-lg-10 mx-auto ">
                    <!-- lg와 xl중에 choice-->
                    <div class="text-content ">
                        <img class="img-fluid mb-5 " src="${path}/resources/img/Busan/busan2-1.jpg " alt=" ">
                        <p>${board.content}</p>
                        <figure class="figure mb-3 ">
                            <img class="figure-img img-fluid w-100 " src="${path}/resources/img/Busan/FireWork.gif " alt="Example blog post alt. ">
                            <figcaption class="figure-caption text-center ">이런 형태의 박물관도 어딘가에는 존재하겠죠? </figcaption>
                        </figure>
                        <br><br>
                        <!-- <p>박물관 외관은 최근에 지어진 건물이다보니 깔끔하고 좋았습니다. <br>둘러보는 재미가 쏠쏠한 장소였습니다 아이들과 방문하기 좋고 가족단위로 가도 좋을 장소라고 생각이 드네요
                        </p>
                        <ul>
                            <li>돈 모아서 포르쉐 타이칸 구매하기</li>
                            <li>제주도에서 한달살기</li>
                        </ul> -->
                    </div>
                    <br>
                    <hr>
                    <!-- 댓글보기 컨테이너 -->
                    <div class="mt-4 ">
                        <div>
                            <div style="width: 50%; float: left; ">
                                <h6 class="text-uppercase text-muted ">${commentcount}개의 댓글</h6>
                            </div>
                            <div style="width: 50%; text-align: right; float: left ">
                                <button class="btn btn-light mb-2 " type="button " onclick=" ">새로고침</button>
                            </div>
                        </div>
                    </div>

                    <div class="py-5 ">
                        <!-- 댓글 반복문 -->
                        <c:if test="${!empty comment}">
                        <c:forEach var="comment" items="${comment}">
                        <div class="mb-2">
                            <div>
                                <h5>${comment.user_id}</h5>
                                
                                <p class="text-uppercase text-sm text-muted "><i class="far fa-clock "></i>${comment.c_date}</p>
                                <p class="text-muted ">${comment.c_content}</p>
                                <c:if test="${ !empty loginMember && (loginMember.user_id == comment.user_id) }">
                                <p><a class="btn btn-link " href="${path}/board/deletecomment?c_code=${comment.c_code}&b_code=${board.b_code}"><i class="fa fa-trash "></i> 삭제</a>
                                    <a class="btn btn-link " href="# "><i class="fa fa-exclamation-circle "></i> 신고</a>
                                </p>
                                </c:if>
                            </div>
                        </div>
                        <hr>
                        </c:forEach>
                        </c:if>
                        <!-- 댓글 반복문 끝 -->                       
                    </div>
                    <!-- 댓글보기 컨테이너 끝 -->

                    <!-- 댓글작성 컨테이너 -->
                    <div class="mb-3 ">
                   
                   <c:if test="${loginMember != null}">
                        <button class="btn btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#leaveComment" aria-expanded="false" aria-controls="leaveComment">댓글달기</button>
                   </c:if>
                   
                        <div class="collapse " id="leaveComment">
                            <div class="mt-4 ">
                           
                                <h5 class="mb-4 ">댓글 작성</h5>
                                
                                <form action="${path}/board/writecomment" method="post" class="form " id="comment-form">
                                <input type="hidden" name="b_code" value="${board.b_code}"/>
                                    <div class="mb-4 ">
                                        <textarea class="form-control " name="c_content" id="comment" rows="4 " placeholder="내용을 작성해주세요 "></textarea>
                                    </div>
                                    <button class="btn btn-primary " type="submit"><i class="far fa-comment "></i> 제출하기 </button>
                                </form>
                               
                            </div>
                        </div>
                    </div>
                    <!-- 댓글작성 컨테이너 끝 -->
                </div>
            </div>
        </div>
    </section>    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
