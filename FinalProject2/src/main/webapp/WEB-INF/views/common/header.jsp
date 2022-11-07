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
    <title>부산 맛집 메인</title>
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
    <!-- Tweaks for older IEs-->
    
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">

	<!-- 회원가입 추가!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="${path}/resources/css/classic.css">
    <link rel="stylesheet" href="${path}/resources/css/classic.date.css">
   
    <!-- Font Awesome CSS-->
    
	
	<!--맛집 달력-->
	<link rel="stylesheet" href="${path}/resources/css/classic.css">
    <link rel="stylesheet" href="${path}/resources/css/classic.date.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/c3c5f9da36.js" crossorigin="anonymous"></script>
    <!-- Style -->
    <link rel="stylesheet" href="${path}/resources/css/style.css">

	<!-- Summernote-->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    
    <style>
        .filter {
            margin-top: 200px;
            margin-left: 80px;
            padding-left: 30px;
            padding-top: 30px;
            padding-right: 20px;
            padding-bottom: 20px;
            border: 0.5px solid rgb(184, 183, 183);
            width: 325px;
            border-radius: 30px;
        }
        
        .board {
            width: 1300px;
            padding-left: 60px;
            padding-right: 60px;
            margin-left: 500px;
            margin-top: 30px;
        }
    </style>
    
</head>

<body style="padding-top: 72px;">

    <header class="header" style="font-family: 'GmarketSansMedium'!important;">
        <!-- Navbar-->
        <nav class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
            <div class="container-fluid">
                <div class="d-flex align-items-center">
                    <a class="navbar-brand nav-link" href="${path}"><img style="height: 40px; width: auto;" src="${path}/resources/img/Busan/부기부기.png" alt="Directory logo">&nbsp;&nbsp;</a>
                </div>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                
              
                <!-- Navbar Collapse -->
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-itemz">
                            <a class="nav-link active" style="font-size: 22px;" href="${path}">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="font-size: 20px;" href="${path}/kind/list">착한가게</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="font-size: 20px;" href="${path}/festival/main">축제</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="font-size: 20px;" href="${path}/res/Res">맛집</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="font-size: 20px;" href="${path}/room/list">숙소</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="font-size: 20px;" href="${path}/Des/list">명소</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="font-size: 20px;" href="${path}/board/list">게시판</a>
                        </li>
                        <c:if test="${loginMember == null}">
	                        <li class="nav-item">
	                            <a class="nav-link text-primary" style="font-size: 20px;" href="${path}/mem/moveLogin">Login</a>
	                        </li>
                       	</c:if>
                       	<c:if test="${loginMember != null}">
	                       	<li class="nav-item">
	                            <a class="nav-link" style="font-size: 20px;" href="${path}/mem/myInfo">내정보</a>
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