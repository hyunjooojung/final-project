<%@page import="fp.busan.mvc.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Main</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <!-- Price Slider Stylesheets -->
    <link rel="stylesheet" href="${path}/resources/vendor/nouislider/nouislider.css">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <link rel="stylesheet" href="${path}/resources/vendor/magnific-popup/magnific-popup.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${path}/resources/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${path}/resources/css/custom.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>

<body style="padding-top: px;">
    <header class="header" style="font-family: 'GmarketSansMedium'!important;">
        <!-- Navbar-->
        
        <nav class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-black">
            <div class="container-fluid">
                <div class="d-flex align-items-center">
                    <a class="navbar-brand nav-link" href="${path}"><img style="height: 40px; width: auto;" src="${path}/resources/img/Busan/부기부기 (2).png" alt="Directory logo">&nbsp;&nbsp;</a>
                </div>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                <!-- Navbar Collapse -->
                
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-itemz">
                            <a class="nav-link active text-light" style="font-size: 22px;" href="${path}">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" style="font-size: 20px;" href="${path}/kind/list">착한가게</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" style="font-size: 20px;" href="${path}/festival/main">축제</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" style="font-size: 20px;" href="${path}/res/Res">맛집</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" style="font-size: 20px;" href="${path}/room/list">숙소</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" style="font-size: 20px;" href="${path}/Des/list">명소</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" style="font-size: 20px;" href="${path}/board/list">게시판</a>
                        </li>
                        <c:if test="${loginMember == null}">
                        <li class="nav-item">
                            <a class="nav-link text-primary" style="font-size: 20px;" href="${path}/mem/moveLogin">Login</a>
                        </li>
                       	</c:if>
                       	
                       	<c:if test="${loginMember != null}">
                       	<li class="nav-item">
                            <a class="nav-link text-light" style="font-size: 20px;" href="${path}/mem/myInfo">내정보</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-primary" style="font-size: 20px;" href="${path}/mem/logout">Logout</a>
                        </li>
                       	</c:if>
                       	
                    </ul>
                </div>
        </nav>
        <!-- /Navbar -->
    </header>