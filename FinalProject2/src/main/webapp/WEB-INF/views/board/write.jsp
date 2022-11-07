<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

 <section class="d-flex align-items-center bg-dark-light bg-cover" style=" font-family: 'GmarketSansMedium'!important; "><img style="margin-left:1100px;" class="img-fluid" src="${path}/resources/img/Busan/board_main.jpg" />

        <div class="container py-6 py-lg-7 overlay-content text-left">
            <div class="row" style="margin-left:-1200px;">
                <br class="col-xl-10 ">
                <span style=" margin-bottom: 2px; font-size:20px; font-weight: bold; color:#4E66F8;">게시판</span></br>
                <span style="font-size:30px; font-weight: bold;">자유게시판</span></br>

            </div>
        </div>
        </div>
    </section>

    <section class="py-4" style="font-family: 'GmarketSansMedium'!important;">
        <div class="container">
            <form action="${path}/board/write" method="post">
                <table>
                    <tr class="py-2">
                        <td class="py-2">제목</td>
                        <td class="py-2"><input class="form-control" type="text" name="title" placeholder="제목을 입력하세요" required></td>
                    </tr>
                    <tr class="py-2">
                        <td class="py-2">글쓴이</td>
                        <td class="py-2"><input class="form-control" type="text" name="user_id" value="${loginMember.user_id}" readonly></td>
                    </tr>
                </table>

                <select class="selectpicker form-control py-2" name="b_ccode" id="form_type" data-style="btn-selectpicker" title="" aria-describedby="propertyTypeHelp" style="width: 500px;" required>
                  <option value="">선택되지 않음</option>
                  <option value="1">공지게시판</option>
                  <option value="2">리뷰게시판</option>
                  <option value="3">문의게시판</option>
                </select>

                <div class="py-2">
                    <textarea id="summernote" name="content"></textarea>
                    <script>
                        $('#summernote').summernote({
                            placeholder: '내용을 작성해주세요',
                            tabsize: 2,
                            height: 400,
                            toolbar: [
                                ['style', ['style']],
                                ['font', ['bold', 'underline', 'clear']],
                                ['color', ['color']],
                                ['para', ['ul', 'ol', 'paragraph']],
                                ['table', ['table']],
                                // ['insert', ['link', 'picture', 'video']],
                                ['view', ['fullscreen', 'codeview', 'help']]
                            ]
                        });
                    </script>
                </div>

                <div class="py-2">
                    <input class="form-control" id="formFile" type="file">
                </div>

                <div class="py-2" style="text-align: right;">
                    <button class="btn btn-muted mb-2" type="submit">완료</button>
                    <button class="btn btn-light mb-2" type="button" onclick="">취소</button>
                </div>
				<input name="user_code" id="user_code" value="${loginMember.getUser_CODE()}" type="hidden">
            </form>
        </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>