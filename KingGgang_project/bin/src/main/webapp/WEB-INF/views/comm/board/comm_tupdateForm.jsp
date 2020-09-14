<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이	   름 : comm_tupdateForm.jsp
	개  발   자 : 최 인 아
	설	   명 : 투게더 글쓰기 수정 폼
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/WEB-INF/views/top.jsp"%>
<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3><img src="${pageContext.request.contextPath}/resources/img/낑깡logo.png" width="100" height="100">게시물 수정</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
<div class="section layout_padding">
<div align="center">
	<form name="f" action="comm_tupdatePro.do" method="post" onsubmit="return check()">
	<input type="hidden" name="togetherNum" value="${getTogether.togetherNum}">
	<table width="600">
		<tr>
			<th bgcolor="orange">작 성 자</th>
			<td width="30%">${getTogether.tname}</td>
		</tr>
		<tr>
			<th bgcolor="orange">제 목</th>
			<td><input type="text" name="ttitle" value="${getTogether.ttitle}"></td>
			<th bgcolor="orange">이 메 일</th>
			<td colspan="3"><input type="text" name="temail" value="${getTogether.temail}"></td>
		</tr>
		
		<tr height="80">
			<td colspan="4"><textarea name="tcontent" cols="100" rows="5">${getTogether.tcontent}</textarea></td>
		</tr>
		
		<tr>
			<td align="center" colspan="4">
				<input type="submit" value="글수정" onclick="window.location='comm_tupdatePro.do?togetherNum=${getTogether.togetherNum}'">
				<input type="button" value="글목록" onclick="window.location='comm_togetherList.do'">
			</td>
		</tr>
	</table>
	</form>
</div>
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>