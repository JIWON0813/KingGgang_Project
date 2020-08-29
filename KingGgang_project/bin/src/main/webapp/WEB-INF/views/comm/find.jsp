<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function searchMember(mode){
	location.href="member_search.do?mode="+mode;
}

	function Check(){
		if (f.id.value==""){
			alert("아이디를 입력해 주세요!!")
			f.id.focus()
			return
		}
		if (f.passwd.value==""){
			alert("비밀번호를 입력해 주세요!!")
			f.passwd.focus()
			return
		}
		document.f.submit()
	}
</script>


<form name="f" method="post">
<c:if test="${empty searchMember}">
	<p>찾으시는 정보가 없습니다.</p>
</c:if>
<c:if test="${not empty searchMember }">
<c:if test="${requestScope.mode == 'search_id'}" var="String">	
		<h2>아이디는 ${searchMember}입니다.</h2>	
</c:if>
<c:if test="${requestScope.mode == 'pw'}" var="String">	
		<h2>비밀번호는 ${searchMember}입니다.</h2>	
</c:if>
</c:if>
</form>