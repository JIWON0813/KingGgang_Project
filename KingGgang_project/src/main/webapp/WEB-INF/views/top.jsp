<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kingGgang top</title>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Metas -->
<title>낑깡</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">


<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" />
<!-- Pogo Slider CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/pogo-slider.min.css" />
<!-- Site CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/style.css" />
<!-- Responsive CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/responsive.css" />
<!-- Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/main/css/custom.css" />

</head>

<body id="home" data-spy="scroll" data-target="#navbar-wd"
	data-offset="98">

	<!-- LOADER -->
	<div id="preloader">
		<div class="loader">
			<img
				src="${pageContext.request.contextPath}/resources/main/images/loader.gif"
				alt="#" />
		</div>
	</div>
	<!-- end loader -->
	<!-- END LOADER -->

	<!-- Start header -->
	<header class="top-header">
	<div class="header_top">

		<div class="container">
			<div class="row">
				<div class="logo_section">
					<a class="navbar-brand" href="home.do"><img
						src="${pageContext.request.contextPath}/resources/main/images/logo.png"
						alt="image"></a>
				</div>
				<div class="site_information">
					<ul>
						<li><a href="#"><img
								src="${pageContext.request.contextPath}/resources/main/images/orange.png"
								alt="#" />제주하면 낑깡~!</a></li>
						<c:if test="${mbId == null }">
							<li><a href="login.log"><img
									src="${pageContext.request.contextPath}/resources/main/images/orange.png"
									alt="#" />로그인</a></li>
						</c:if>
						<c:if test="${mbId != null }">
							<li>
								<c:if test="${profilename == null }">
								<img src="http://localhost:8080/img/default.jpg" width="25" height="25">	
								</c:if>
								<c:if test="${profilename != null }">		
								<img src="http://localhost:8080/img/${profilename}" width="25" height="25">
								</c:if>
									${name}님&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.log"><img
									src="${pageContext.request.contextPath}/resources/main/images/orange.png"
									alt="#" />로그아웃</a>
							</li>
							<li>
								<a class="join_bt" href="main.my">마이페이지</a>
							</li>
						</c:if>
						<c:if test="${mbId == null }">			
						<li><a class="join_bt" href="insertMember.mem?join=1">Join
								us</a></li>
						</c:if>
						<c:if test="${mbId == 'admin' }">
							<li><a href="main.admin">관리자모드</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
    
     <!-- Start header -->
    <header class="top-header">
	</div>
	<div class="header_bottom">
		<div class="container">
			<div class="col-sm-12">
				<div class="menu_orange_section" style="background: #ff880e;">
					<nav class="navbar header-nav navbar-expand-lg">
					<div class="menu_section">
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbar-wd"
							aria-controls="navbar-wd" aria-expanded="false"
							aria-label="Toggle navigation">
							<span></span> <span></span> <span></span>
						</button>
						<div class="collapse navbar-collapse justify-content-end"
							id="navbar-wd">
							<ul class="navbar-nav">
								<li><a class="nav-link active" href="home.do">Home</a></li>
								<li><a class="nav-link" href="main.hotel">호텔 예약</a></li>
								<li><a class="nav-link" href="firstPage.rentcar">렌트카 예약</a></li>
								<li><a class="nav-link" href="commhome.comm">커뮤니티</a></li>
								<li><a class="nav-link" href="Q_list.board">문의</a></li>
								<li><a class="nav-link" href="list.notice">공지사항</a>
							</ul>
						</div>
					</div>
					</nav>
				</div>
			</div>
		</div>
	</div>
	</header>
