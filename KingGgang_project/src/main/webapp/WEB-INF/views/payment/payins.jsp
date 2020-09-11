<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- 
	이	   름 : payins.jsp
	개  발   자 : 원세호
	설	   명 : 결제 진행 페이지
 -->

<P> 결제 진행 테스트 페이지 </P>
</body>
</html>



<form action="insert.pay" method="post">
	<c:if test = "${type==1}">
	<input type="hidden" name="id" value="${id}">
	</c:if>
	<c:if test = "${type==2}">
	<input type ="hidden" name="res_id" value="${res_id}">
	</c:if>
	<input type = "hidden" name= "price" value="${price}">
	<input type = "hidden" name= "type" value="${type}">
	<!-- m_no = member_Num(session 에서 받아옴) -->
	<input type = "hidden" name= "m_no" value="1">
	<input type="submit" value="결제하기">
</form>
<a href="main.my">마이페이지로 가기</a><p>

	


