<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminmember.css">

<style>

	#input_group input {
		border:1px solid gray;
		background-color:rgba(0,0,0,0);
		color:gray;
		padding:5px;
		border-radius:5px;
	}
	
	#input_group input:hover{
		color:white;
		background-color:gray;
	}

</style>

<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3><img src="${pageContext.request.contextPath}/resources/img/낑깡logo.png" width="100" height="100">회원수정</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
<div class="section layout_padding" align="center">
<form name="join" method="post" action="comm_member_edit_ok.do?comm_memberNum=${comm_getMember.comm_memberNum }" 
							onsubmit="return check()" enctype="multipart/form-data">	
<table>
<%-- <input type="hidden" name="comm_memberNum" value="${comm_getMember.comm_memberNum}"/> --%>                 	
	<tr>
		<th width="150" align="center"><img src="${pageContext.request.contextPath}/resources/img/돌하르방.PNG" width="25" height="25">이름</th>
		<td><input type="text" name="comm_name" value="${comm_getMember.comm_name}" readOnly></td>
	</tr>			
    <tr>
		<th width="150" align="center"><img src="${pageContext.request.contextPath}/resources/img/돌하르방.PNG" width="25" height="25">닉네임</th>
		<td><input type="text" name="comm_nickname" value="${comm_getMember.comm_nickname}">
			<input type="button" value="중복체크" onclick="comm_idCheck()"/>
		</td>
	</tr>
	<tr>
		<th width="150" align="center"><img src="${pageContext.request.contextPath}/resources/img/돌하르방.PNG" width="25" height="25">생년월일</th>
		<td><input type="text" name="comm_birth" value="${comm_getMember.comm_birth}"></td>
	</tr>
	<tr>
		<th width="150" align="center"><img src="${pageContext.request.contextPath}/resources/img/돌하르방.PNG" width="25" height="25">프로필사진</th>
		<td><input type="file" name="filename">
			<!-- <input type="hidden" name="comm_profilesize"> -->
			<img src="http://localhost:8080/img/${comm_getMember.comm_profilename}" width="100" height="100">
		</td>
	</tr>
	<tr>
		<th width="150" align="center"><img src="${pageContext.request.contextPath}/resources/img/돌하르방.PNG" width="25" height="25">자기소개</th>
		<td><textarea name="comm_intro" rows="5" cols="60">${comm_getMember.comm_intro}</textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center" id="input_group">
			<input type="submit" value="수정">
			<input type="button" value="취소" onclick="window.location='commhome.comm'" >
		</td>
	</tr>
</table>
</form>              
</div>                   
<%@ include file="/WEB-INF/views/bottom.jsp"%>