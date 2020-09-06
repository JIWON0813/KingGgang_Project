<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<%-- <%@ include file="index_top.jsp" %>  --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>낑깡</title>
<meta charset="utf-8" />
</head>

<body>
		<!-- Header -->
		<!-- Start Footer -->
		 <footer class="footer-box">
			<div class="container">
				<div class="row">
					<div class="col-md-12 white_fonts">
						<div class="row">
							<div class="col-sm-6 col-md-6 col-lg-3">
								<div class="full">
									<h3>돌하르방</h3>
								</div>
								<div class="full">
									<ul class="menu_footer">
										<li><a href="comm_writeForm.do">> Write</a></li>
										<li><a href="comm_myPage.do">> Mypage</a></li>
										<li><a href="comm_bookMark.do">> BookMark</a></li>
										<li><a href="commadmin.comm">> 관리자모드</a></li>
										<li><c:if test="${comm_login == null }">
												<a href="comm_login.do?memberNum=${memberNum }">> 로그인</a>
												<a href="comm_checkMember.do?memberNum=${memberNum}">> 가입하기</a>

											</c:if> <c:if test="${comm_login != null }">
												<a
													href="comm_member_delete.do?comm_memberNum=${comm_memberNum }">> 회원탈퇴</a>
												<a
													href="comm_member_edit.do?comm_memberNum=${comm_memberNum }">> 수정</a>
												<a href="comm_memberList.do">> 목록</a>
												<li><a
													href="comm_friendAll.do?comm_memberNum=${comm_memberNum }">> Friends
														목록</a></li>
												<li><a href="#" onclick="window.open('roomList', '_blank', 'width=600 height=600')">> 채팅 목록</a></li>
											</c:if></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<div class="section layout_padding">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="full">
						<div class="heading_main text_align_center">
							<h2>
								<span class="theme_color"></span>뉴스피드
							</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<c:if test="${empty boardList}">
					<h4>등록된 페이지가 없습니다.</h4>
				</c:if>
				<c:forEach var="dto" items="${boardList}">
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="full services_blog">
							<a href=""><img class="img-responsive"
								src="http://localhost:8080/img/${dto.file_name}" alt="#" /></a>
						</div>
					</div>
				</c:forEach>
				<div class="row margin-top_30">
					<div class="col-sm-12">
						<div class="full">
							<div class="center">
								<a class="main_bt" href="#">See More ></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<!-- End Footer -->
	<%@ include file="/WEB-INF/views/bottom.jsp"%>