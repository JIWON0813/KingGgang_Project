<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- 
	이	   름 : payins.jsp
	개  발   자 : 원세호
	설	   명 : 결제 진행 페이지
 -->

<<<<<<< HEAD
<P> 결제 진행 테스트 페이지 </P>
</body>
</html>
=======


<form action="insert.pay" method="post">
	
	<p>타입(1,2)</p>
	<p><input type = "text" name= "type"></p><br>
	<p>상품번호(1,2,3)</p>
	<p><input type = "text" name= "p_no"></p><br>
	<p>수량</p>
	<p><input type = "text" name= "amount"></p><br>
	<p>가격</p>
	<p><input type = "text" name= "price"></p><br>
	<!-- 로그인 세션에서 받아올 m_id -->
	<p>회원아이디(q)</p>
	<p><input type = "text" name= "m_id"></p><br>
	<p><input type="submit" value="결제하기"></p>
</form>
<a href="main.my">마이페이지로 가기</a><p>

	<%=request.getContextPath()%>
>>>>>>> refs/remotes/origin/master

