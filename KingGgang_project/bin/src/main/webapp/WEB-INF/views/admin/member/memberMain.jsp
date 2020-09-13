<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	
</script>
<br>
<a href="insertMember.mem">회원등록페이지</a><br>
<a href="memberList.mem">회원전체보기</a><br>
<a href="couponList.co">쿠폰리스트로가기</a><br>
<c:if test="${empty member.id }">
<a href="login.log">로그인</a>
</c:if>
<c:if test="${!empty member.id }">
${member.name } 님  <img src="${upLoadPath}//${member.profile_name}" width="50" height="50">
<a href="logout.log">로그아웃</a>
</c:if>
<%@ include file="/WEB-INF/views/bottom.jsp"%>
