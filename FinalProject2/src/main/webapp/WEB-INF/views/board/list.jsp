<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<c:set var="searchType" value="${param.searchType}"/>
<c:if test="${empty searchType}">
	<c:set var="searchType" value="${'title'}"/>
</c:if>

   <section class="d-flex align-items-center bg-dark-light bg-cover" style=" font-family: 'GmarketSansMedium'!important; "><img style="margin-left:1100px;" class="img-fluid" src="${path}/resources/img/Busan/board_main.jpg" />

        <div class="container py-6 py-lg-7 overlay-content text-left">
            <div class="row" style="margin-left:-1200px;">
                <br class="col-xl-10 ">
                <span style=" margin-bottom: 2px; font-size:20px; font-weight: bold; color:#4E66F8;">Board</span></br>
                <span style="font-size:30px; font-weight: bold;">게시판</span></br>
                <span>게시판에서 공지사항, 리뷰, 문의를 확인해보세요</span>
            </div>
        </div>
    </section>

<!-- 검색창 시작 -->
<input type="hidden" id="searchType" name="searchType" class="input_text" value="${param.searchType}" readonly  />
<input type="hidden" id="searchValue" name="searchValue" class="input_text" value="${param.searchValue}" readonly  />
<input type="hidden" id="boardCategory" name="boardCategory" class="input_text" value="${param.boardCategory}" readonly  />
<div style="margin-top:-100px;">
        <div class="col-lg-3 pt-3 filter" style="font-family: 'GmarketSansMedium'!important; margin-bottom: 600px">
        <form action="${path}/board/list" method="get" class="pe-xl-3">
            <div class="mb-0">
                <label class="form-label">게시글 검색</label>
                
                <ul class="list-inline mt-xl-1 mb-0">
                    <li class="list-inline-item">
                        <div class="form-check">
                        <c:if test="${searchType == 'title'}">
                            <input class="form-check-input" type="radio" name="searchType" id="searchType" value="title" checked/>
                            <label class="form-check-label" for="type_0">제목</label>
                        </c:if>
                        <c:if test="${searchType != 'title'}">
                            <input class="form-check-input" type="radio" name="searchType" id="searchType" value="title"/>
                            <label class="form-check-label" for="type_0">제목</label>
                        </c:if>
                        </div>
                    </li>
                    
                    <li class="list-inline-item">
                        <div class="form-check">
                        <c:if test="${searchType == 'content'}">
                            <input class="form-check-input" type="radio" name="searchType" id="searchType" value="content" checked/>
                            <label class="form-check-label" for="type_1">내용</label>
                        </c:if>
                        <c:if test="${searchType != 'content'}">
                            <input class="form-check-input" type="radio" name="searchType" id="searchType" value="content" />
                            <label class="form-check-label" for="type_1">내용</label>
                        </c:if>
                        </div>
                    </li>
                    
                    <li class="list-inline-item">
                        <div class="form-check">
                        <c:if test="${searchType == 'writer'}">
                            <input class="form-check-input" type="radio" name="searchType" id="searchType" value="writer" checked/>
                            <label class="form-check-label" for="type_2">작성자</label>
                        </c:if>
                        <c:if test="${searchType != 'writer'}">
                            <input class="form-check-input" type="radio" name="searchType" id="searchType" value="writer" />
                            <label class="form-check-label" for="type_2">작성자</label>
                        </c:if>
                        </div>
                    </li>
                </ul>
            </div>
            
            <div class="mb-4" style="margin-top:10px; font-family: 'GmarketSansMedium'!important;">
                <div class="input-label-absolute input-label-absolute-right">
                    <div class="label-absolute1"><i class="fa fa-search"></i></div>
                    
                    <input class="form-control1 pe-4" type="search" name="searchValue" id="form_search" value="${param.searchValue}" placeholder="Keywords" >
                </div>
            </div>
            <div class="mb-4" style="margin-top:-10px;">
                <button class="btn btn-primary" type="submit"><i class="fas fa-search me-1"></i>검색</button>
            </div>
            
            <label class="form-label" for="form_neighbourhood">게시판</label></br>
            <script src="http://code.jquery.com/jquery-latest.js"></script>
            <select class="selectpicker form-control2" onchange="select('${path}/board/list')" name="boardCategory" id="form_neighbourhood" data-style="btn-selectpicker" data-live-search="true" data-selected-text-format="count &gt; 1" data-none-selected-text="board_0">
                    <c:if test="${empty param.boardCategory}"> 
                    <option value="0">전체 </option>            
                    <option value="1">공지 게시판    </option>                               
                    <option value="2">리뷰 게시판    </option>
                    <option value="3">문의 게시판    </option>
                    </c:if>
                    
                    <c:if test="${param.boardCategory == 0}"> 
                    <option value="0" selected>전체 </option>            
                    <option value="1">공지 게시판    </option>                               
                    <option value="2">리뷰 게시판    </option>
                    <option value="3">문의 게시판    </option>
                    </c:if>
                    
                    <c:if test="${param.boardCategory == 1}">
                    <option value="0">전체 </option>             
                    <option value="1" selected>공지 게시판    </option>                               
                    <option value="2">리뷰 게시판    </option>
                    <option value="3">문의 게시판    </option>
                    </c:if>
                    
                    <c:if test="${param.boardCategory == 2}">  
                    <option value="0">전체 </option>           
                    <option value="1">공지 게시판    </option>                               
                    <option value="2" selected>리뷰 게시판    </option>
                    <option value="3">문의 게시판    </option>
                    </c:if>
                    
                    <c:if test="${param.boardCategory == 3}">  
                    <option value="0">전체 </option>           
                    <option value="1" >공지 게시판    </option>                               
                    <option value="2">리뷰 게시판    </option>
                    <option value="3" selected>문의 게시판    </option>
                    </c:if>
            </select>
              </form>
    	
    </div>
       <script type="text/javascript">
		    function select(pageUrl) {
		        var selectCate = document.getElementById("form_neighbourhood").value;
		        var searchType = document.getElementById("searchType").value;
		        var searchValue = document.getElementById("form_search").value;
		        
		        if(selectCate != null && selectCate.length > 0){
                    pageUrl = pageUrl + "?boardCategory=" + selectCate;
                }

                if(searchType != null && searchType.length > 0){
                    pageUrl = pageUrl + "&searchType=" + searchType;
                }

                if(searchType != null && searchType.length > 0){
                    pageUrl = pageUrl + "&searchValue=" + searchValue;
                }
                window.location.href = encodeURI(pageUrl);
		    }
	</script> 
 
    <!-- 테이블 부분 -->
    <div class="mb-4" style="margin-left:1600px; font-family: 'GmarketSansMedium'!important;">          
        
    </div>
    
    <div class="board" style="font-family: 'GmarketSansMedium'!important; margin-top:-900px;">
    <c:if test="${loginMember != null}">
        <a class="btn btn-primary" style="margin-left:1000px; margin-top:-65px;" href="${path}/board/write"> 글쓰기 </a>
   </c:if>

        <table class="table">
            <thead>
                <tr>
                    <th class="w40">NO</th>
                    <th class="expand">제목</th>
                    <th class="w80">작성자</th>
                    <th class="w80">작성일</th>
                    <th class="w40">조회수</th>
                </tr>
            </thead>

            <tbody>

				<c:if test="${empty list}">
				<tr>
					<td colspan="6">조회된 글이 없습니다.</td>
				</tr>
				</c:if>
				
				<c:if test="${!empty list}">
				<c:forEach var="board" items="${list}">
                <tr>
                    <td><c:out value="${board.b_code}"/></td>                                                       
                    <td class="title indent text-align-left">
                    <a class="text-black" href="${path}/board/view?b_code=${board.b_code}">	
                    <c:out value="${board.title}"/>
                    </a>
       				</td>
      				<td><c:out value="${board.user_id}"/></td> <!-- ${board.user_id} -->
                    <td><c:out value="${board.bDate}"/></td>        
                    <td style="border-right: none;"><c:out value="${board.readCount}"/></td>
               </tr>   
			   </c:forEach>
			   </c:if>
            </tbody>
        </table>
    </div>
    </div>

<!-- 페이지부 시작 -->
    <div style="margin-top:50px; margin-left:400px; padding-bottom:50px; font-family: 'GmarketSansMedium'!important;">
        <nav aria-label="Page navigation example">
            <ul class="pagination pagination-template d-flex justify-content-center mb-6">
            
            <!-- 맨처음 -->
                <li class="page-item">
                    <a class="page-link" onclick="movePage('${path}/board/list?page=1')"><i class="fa fa-angle-left"></i></a>
                </li>
                
            <!-- 이전 페이지 -->
                <li class="page-item">
                    <a class="page-link" onclick="movePage('${path}/board/list?page=${pageInfo.getPrevPage()}')"><i class="fa fa-angle-left"></i></a>
                </li>
            <!-- 페이지 수 -->    
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
                                        <a class="page-link" onclick="movePage('${path}/board/list?page=${status.current}');">
                                            <c:out value="${status.current}"/>
                                        </a>
                                    </li>

                                </c:if>

                            </c:forEach>
                
            <!-- 다음 페이지 -->
                <li class="page-item">
                    <a class="page-link" onclick="movePage('${path}/board/list?page=${pageInfo.getNextPage()}')"><i class="fa fa-angle-right"></i></a>
                </li>
                
            <!-- 마지막 페이지 -->
                <li class="page-item">
                    <a class="page-link" onclick="movePage('${path}/board/list?page=${pageInfo.getEndPage()}')"> <i class="fa fa-angle-right"></i></a>
                </li>
            </ul>
        </nav>
    </div>
    
    <script type="text/javascript">
    function movePage(pageUrl){
    	var searchType = document.getElementById("searchType").value;
    	var searchValue = document.getElementById("searchValue").value;
    	var boardCategory = document.getElementById("boardCategory").value;
    	
    	if(searchType != null && searchType.length > 0){
            pageUrl = pageUrl + "&searchType=" + searchType;
        }

        if(searchValue != null && searchValue.length > 0){
            pageUrl = pageUrl + "&searchValue=" + searchValue;
        }

        if(boardCategory != null && boardCategory.length > 0){
            pageUrl = pageUrl + "&boardCategory=" + boardCategory;
        }
        window.location.href = encodeURI(pageUrl);
    }   
    </script> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>