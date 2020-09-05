<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-6 layout_padding">
				<div class="full paddding_left_15">
					<div class="heading_main text_align_left">
						<div class="container">
							<div class="form_txtInput">
								<div class="heading_main text_align_left">
									<h2>
										<span class="theme_color">친구목록
									</h2>
								</div>
								<table border="1" width="800">
									<tr bgcolor="orange">
										<th>이름</th>
										<th>comm_memberNum</th>
										<th>friendNum</th>
									</tr>
									<c:if test="${empty friendList}">
										<tr>
											<td colspan="6">등록된 친구가 없습니다.</td>
										</tr>
									</c:if>

									<c:forEach var="dto" items="${friendList }">
										<tr>
											<%-- <img src="http://localhost:8080/img/${profilename}" width="50" height="50"> --%>
											<td>${dto.f_name }</td>
											<td>${dto.comm_memberNum }</td>
											<td>${dto.friendNum }</td>
											<td><a
												href="comm_friendContent.do?comm_memberNum=${dto.comm_memberNum}">상세보기</a></td>
											<td><a
												href="comm_deleteFriend.do?friendNum=${dto.friendNum}">친구삭제</a></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="wrap wd668" align="center"></div>
		<%@ include file="/WEB-INF/views/bottom.jsp"%>