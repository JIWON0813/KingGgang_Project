<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
		String msg = (String)request.getAttribute("msg");
		String url = (String)request.getAttribute("url");
%>
<c:if test="${status == 1}">
	<script type="text/javascript">
		alert("<%=msg%>")
		opener.location.href='<%=url%>';
		window.close()
	</script>
</c:if>
<c:if test="${status != 1}">
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>
</c:if>
