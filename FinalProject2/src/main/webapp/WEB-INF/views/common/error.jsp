<%@page import="fp.busan.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

 	<div class="mh-full-screen d-flex align-items-center dark-overlay"><img class="bg-image" src="${path}/resources/img/photo/aron-visuals-3jBU9TbKW7o-unsplash.jpg" alt="Not found">
        <div class="container text-white text-lg overlay-content py-6 py-lg-0">
            <h1 class="display-3 fw-bold mb-5">Oops, that page is not here.</h1>
            <p class="fw-light mb-5">Elit adipisicing aliquip irure non consequat quis ex fugiat dolor in irure pariatur eu aute. Ea tempor nisi sit in Lorem exercitation mollit ut veniam in do eu excepteur. </p>
            <p class="mb-6"> <a class="btn btn-outline-light" href="index.html"><i class="fa fa-home me-2"></i>Start from the Homepage</a></p>
            <p class="h4 text-shadow">Error 404</p>
        </div>
    </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>