<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 
	이	   름 : comm_tcontent.jsp
	개  발   자 : 최 인 아
	설	   명 : 투게더게시판 상세보기
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/top.jsp"%>
<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3><font size=7>낑</font><font size=3>깡</font><font size=7>같</font><font size=3>이</font><font size=7>따</font><font size=3>러갈래?</font></h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
<div class="section layout_padding">
<div align="center">
	<table width="800">
		<tr align="center" height="30">
			<th bgcolor="orange">작 성 자</th>
			<td width="30%">${getTogether.tname}</td>
			<th bgcolor="orange">작 성 일</th>
			<td width="30%"><fmt:formatDate value="${getTogether.tregdate}" pattern="yyyy년MM월dd일"/></td>
		</tr>
		<tr align="center" height="30">
			<th bgcolor="orange">제 목</th>
			<td width="30%">${getTogether.ttitle}</td>
			<th bgcolor="orange">조 회 수</th>
			<td width="30%">${getTogether.treadcount}</td>
		</tr>
		<tr align="center" height="30">
			<th bgcolor="orange">이 메 일</th>
			<td width="30%">${getTogether.temail}</td>
		</tr>
		<tr height="80">
			<td>${getTogether.tcontent}</td>
		</tr>
	
		<tr>
			<td align="center" colspan="4">
				<input type="button" value="글수정"
				onclick="window.location='comm_tupdateForm.do?togetherNum=${getTogether.togetherNum}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제"
				onclick="window.location='comm_tdeletePro.do?togetherNum=${getTogether.togetherNum}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록" onclick="window.location='comm_togetherList.do'">
			</td>
		</tr>
	</table>
</div>
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>