<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<footer class="footer-box">
		<div class="container"> 
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3>공지사항목록</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-6 layout_padding">
					<div class="full paddding_left_15">
						<div class="heading_main text_align_left">
							<div class="container">
								<div class="form_txtInput">
									<div class="heading_main text_align_left"></div>
									</div>
									<table border="1" width="800">
										<tr bgcolor="orange" align="center">
											<th>글제목</th>
											<th>글쓴이</th>
											<th colspan="2">mode</th>
										</tr>
										<c:if test="${empty noticeList}">
											<tr>
												<td colspan="3">등록된 글이 없습니다.</td>
											</tr>
										</c:if>

										<c:forEach var="dto" items="${noticeList}">
											<tr>
											<c:if test="${comm_login != null }">
												<td><a href="comm_noticeContent.do?comm_noticeNum=${dto.comm_noticeNum}">${dto.comm_ntitle }</a></td>
											</c:if>	
											<c:if test="${comm_login == null }">
												<td><a href="comm_message.do">${dto.comm_ntitle }</a></td>
											</c:if>	
												<td>${dto.comm_nnickname }</td>	
												
												<td><a href="comm_notice_edit.do?comm_noticeNum=${dto.comm_noticeNum }">글수정</a></td>
												<td><a href="comm_noticeDelete.do?comm_noticeNum=${dto.comm_noticeNum}">글삭제</a></td>
											</tr>
											
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>