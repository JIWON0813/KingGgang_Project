<%@ include file="/WEB-INF/views/top.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminmember.css">
<script type="text/javascript">
function comm_checkjoin() {
	   var form = document.join;
	   
	   if(join.comm_nickname.value==""){
    	   alert("닉네임을 입력해 주세요")
    	   join.comm_nickname.focus();
    	   return;
		}
	   
	   if(join.comm_idDuplication.value!="comm_idCheck"){
		   alert("닉네임 중복체크를 해주세요.");
		   return;
	   }
	   var list = new Array();
	   <c:forEach items="${comm_memberList}" var="userid">
	   list.push("${userid.comm_nickname}");
	   </c:forEach> 
	   if(join.comm_nickname.value==""){
    	   alert("닉네임을 입력해 주세요")
    	   join.comm_nickname.focus();
    	   return false;
		}
	   for(var i = 0;i<list.length;i++){
		   if(join.comm_nickname.value == list[i]){
			   alert("이미 가입된 닉네임 입니다.");
			   join.comm_nickname.focus();
			   return false;
		   }  
	   }
      	form.submit()		      
}
function comm_idCheck(){
	   join.comm_idDuplication.value="comm_idCheck";
	   var list = new Array();
	   <c:forEach items="${comm_memberList}" var="userid">
	   list.push("${userid.comm_nickname}");
	   </c:forEach> 
	   if(join.comm_nickname.value==""){
    	   alert("닉네임을 입력해 주세요")
    	   join.comm_nickname.focus();
    	   return;
		}
	   for(var i = 0;i<list.length;i++){
		   if(join.comm_nickname.value == list[i]){
			   alert("이미 가입된 닉네임 입니다.");
			   join.comm_nickname.focus();
			   return;
		   }  
	   }
	   	  alert("사용 가능한 닉네임 입니다.");
	   	  join.comm_birth.focus();
	   	  return;  
  	}
function comm_inputIdCheck(){
		   document.join.comm_idDuplication.value="comm_idUnCheck";
}   
</script>
<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3>회원가입</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
<div class="section layout_padding" align="center">
	<form name="join" action="comm_member_input_ok.do" enctype="multipart/form-data" method="post">
		<table width=600">
			<input type="hidden" name="comm_memberNum">
				<tr>
					<th width="150" align="center">이름</th>
					<td><input type="text" name="comm_name" value=${name } readOnly></td>
				</tr>
				<tr>
					<th width="150" align="center">닉네임</th>
					<td><input type="text" name="comm_nickname" placeholder="닉네임을 입력하세요." onkeydown="comm_inputIdCheck()">
						<input type="button" value="중복체크" onclick="comm_idCheck()">
                        <input type="hidden" name= "comm_idDuplication" value="comm_idUnCheck"> 
					</td>
				</tr>
				<tr>
					<th width="150" align="center">생년월일</th>
					<td><input type="text" name="comm_birth" value=${birth } readOnly></td>
				</tr>
				<tr>
					<th width="150" align="center">프로필사진</th>
					<td><input type="file" name="comm_profilename">
						<input type="hidden" name="comm_profilesize"></td>
				</tr>
				<tr>
					<th width="150" align="center">자기소개</th>
					<td><textarea name="comm_intro" rows="5" cols="60"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록" onclick="javascript:comm_checkjoin()">
						<input type="button" value="취소" onclick="window.location='commhome.comm'" >
					</td>
				</tr>
		</table>
	</form>
</div> 
<%@ include file="/WEB-INF/views/bottom.jsp"%>