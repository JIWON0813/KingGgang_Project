<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/top.jsp"%>
<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3><img src="${pageContext.request.contextPath}/resources/img/낑깡logo.png" width="100" height="100">친구목록</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
<div class="section layout_padding" align="center">
		<div class="row">
			<c:if test="${empty friendList}">
				<h2>친구추가한 사람이 없습니다.</h2>
			</c:if>
			<c:forEach var="dto" items="${friendList }">
			<div class="col-md-3 col-sm-6 col-xs-12">
				<c:if test="${dto.f_comm_profilename  == null}">
			 		<img src="${pageContext.request.contextPath}/resources/img/basic.jpg" width="200" height="200">
			 	</c:if>
				<c:if test="${dto.f_comm_profilename  != null}">
			 		<img src="http://localhost:8080/img/${dto.f_comm_profilename}" width="200" height="200">
			 	</c:if>
			 		<a href="comm_otherPage.do?comm_memberNum=${dto.comm_memberNum}">
						<p><font size=5>${dto.f_name }(${dto.f_comm_nickname })</font></p>
					</a>
						<p><a href="comm_deleteFriend.do?friendNum=${dto.friendNum}">친구삭제</a></p>
			</div>
			</c:forEach>
		</div>
	<div class="row margin-top_30">
		<div class="col-sm-12">
			<div class="full">
				<div class="center">
						<a class="main_bt" id="more_btn_a"
                        href="javascript:loadNextPage();">See More ></a>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>

