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
										<li><a href="comm_newsfeed.do">> News Feed</a></li>
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
													href="comm_friendAll.do?login_comm_memberNum=${login_comm_memberNum }">> Friends
														목록</a></li>

											</c:if></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	<!-- End Footer -->
	<%@ include file="/WEB-INF/views/bottom.jsp"%>