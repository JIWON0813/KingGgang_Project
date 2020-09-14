<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script type="text/javascript">
	function comm_loginCheck(){
		if (f.comm_nickname.value==""){
			alert("닉네임을 입력해 주세요!!")
			f.comm_nickname.focus()
			return
		}
		document.f.submit();
		
	}
</script>
<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3><img src="${pageContext.request.contextPath}/resources/img/낑깡logo.png" width="100" height="100">로그인</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
<div class="section layout_padding" align="center">
<form name="f" action="comm_loginOk.do" method="post">
	<input type="hidden" name="memberNum" value="${memberNum }" />
	<%-- <input type="hidden" name="comm_memberNum" value="${comm_memberNum}"> --%>
		<table>
			<tr>
				<th width="150" align="center">닉네임</th>
				<td><input type="text" name="comm_nickname" placeholder="닉네임을 입력하세요.">
					<input type="button" value="로그인" onclick="javascript:comm_loginCheck()">
				</td>
			</tr>
		</table>
</form>
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>