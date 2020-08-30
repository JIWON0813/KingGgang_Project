<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
		String url = (String)request.getAttribute("url");
%>
<script type="text/javascript">
	location.href="<%=url%>"
</script>