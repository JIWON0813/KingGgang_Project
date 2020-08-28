<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- loginAdmin.jsp -->
<%
	String loginId = (String)session.getAttribute("mbId");
	if(!(loginId.equals("admin"))){%>
	<script type="text/javascript">
		location.href="admin.jsp"
	</script>
<%		return;
	}
%>