<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/views/top.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지글</title>
</head>
<body>
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
											<span class="theme_color">글목록 
										</h2>
									</div>
									<table border="1" width="800">
										<tr bgcolor="orange">
											<th>글제목</th>
											<th>글쓴이</th>
											<th>mode</th>
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
</body>
</html>
<%@ include file="/WEB-INF/views/bottom.jsp"%>