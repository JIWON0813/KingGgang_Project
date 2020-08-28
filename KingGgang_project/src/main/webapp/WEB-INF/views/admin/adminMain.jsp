<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
	이	   름 : adminMain.jsp
	개  발   자 : 김 지 원
	설	   명 : 관리자모드 메인 페이지
 -->
<c:if test="${login.auth==1 }">
<a href="insertHotel.admin">호텔 등록하기</a>
<br>
<a href="hotelList.hotel">호텔 목록보기</a>
<br>
<a href="main.mem">회원관리페이지로가기</a>
<br>
</c:if>
<c:if test="${login==null||login.auth==0 }">
<script>
	alert("관리자만 접근 가능합니다.");
	history.back();
</script>
</c:if>
<%@ include file="/WEB-INF/views/bottom.jsp"%>