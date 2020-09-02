<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminmember.css">
<script>
function comm_checkjoin() {
	if(join.comm_idDuplication.value!="comm_idCheck"){
	   alert("닉네임 중복체크를 해주세요.");
	   return;
	}
	   form.submit()		      
}
function comm_idCheck(){
	   var c_list = new Array();
	   join.comm_idDuplication.value="comm_idCheck";
	   <c:forEach items="${comm_memberList}" var="comm_userid">
	   c_list.push("${comm_userid.comm_nickname}");
	   </c:forEach> 
	   for(var i = 0;i<c_list.length;i++){
		   if(join.comm_nickname.value == c_list[i]){
			   alert("이미 가입된 닉네임 입니다.");
			   join.comm_nickname.focus();
			   return;
		   }  
	   }
	   	  alert("사용 가능한 아이디 입니다.");
	   	  return;  
}
function comm_inputIdCheck(){
	   document.join.comm_idDuplication.value="comm_idUnCheck";
}


</script>


<form name="join" action="comm_member_input_ok.do" enctype="multipart/form-data" method="post">
	<div class="wrap wd668">
		<div class="container">
			<div class="form_txtInput">
				<h2 class="sub_tit_txt">회원가입</h2>
				<div class="join_form">
					<table>
						<colgroup>
							<col width="30%" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<input type="hidden" name="comm_memberNum">
							<tr>
								<th><span>이름</span></th>
								<td><input type="text" name="comm_name" placeholder="이름을 입력하세요."></td>
							</tr>
							<tr>
								<th><span>닉네임</span></th>
								<td>
									<input type="text" name="comm_nickname" placeholder="닉네임을 입력하세요." onkeydown="comm_inputIdCheck()">
									<input type="button" value="중복체크" onclick="comm_idCheck()">
									<input type="hidden" name= "comm_idDuplication" value="comm_idUnCheck"> 
								</td>
							</tr>
							<tr>
								<th><span>생년월일</span></th>
								<td>
									<input type="text" name="comm_birth" placeholder="생일을 입력하세요.">  
								</td>
							</tr>
							<tr>
								<th><span>프로필사진</span></th>
								<td><input type="file" name="comm_profilename">
									<input type="hidden" name="comm_profilesize"></td>
							</tr>
							<tr>
								<th><span>자기소개</span></th>
								<td>
									<textarea name="comm_intro" rows="5" cols="60"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btn_wrap">
				<input type="submit" value="조회" onclick="javascript:comm_checkjoin()">
				<input type="button" value="취소" onclick="window.location='commhome.comm'" >
			</div>
		</div>
	</div>
</form>
<%@ include file="/WEB-INF/views/bottom.jsp"%>