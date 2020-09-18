<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		   alert("아이디 중복체크를 해주세요.");
		   return;
	   }
	   var clist = new Array();
	   <c:forEach items="${comm_memberList}" var="id">
	   clist.push("${id.comm_nickname}");
	   </c:forEach> 
	   if(join.comm_nickname.value==""){
    	   alert("닉네임을 입력해 주세요")
    	   join.comm_nickname.focus();
    	   return false;
		}
	   for(var i = 0;i<clist.length;i++){
		   if(join.comm_nickname.value == clist[i]){
			   alert("이미 가입된 닉네임 입니다.");
			   join.comm_nickname.focus();
			   return false;
		   }  
	   }
      	form.submit()		      
}
function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
    return false;
}  
function comm_idCheck(){
	   join.comm_idDuplication.value="comm_idCheck";
	   var clist = new Array();
	   <c:forEach items="${comm_memberList}" var="id">
	   clist.push("${id.comm_nickname}");
	   </c:forEach> 
	   if(join.comm_nickname.value==""){
    	   alert("닉네임을 입력해 주세요")
    	   join.comm_nickname.focus();
    	   return;
		}
	   for(var i = 0;i<clist.length;i++){
		   if(join.comm_nickname.value == clist[i]){
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
		<td><input type="text" name="comm_nickname" value="${comm_getMember.comm_nickname}" onkeydown="comm_inputIdCheck()">
						<input type="button" value="중복체크" onclick="comm_idCheck()">
                        <input type="hidden" name= "comm_idDuplication" value="comm_idUnCheck">
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
		<td colspan="2" align="center">
			<input type="submit" value="수정">
			<input type="button" value="취소" onclick="window.location='commhome.comm'" >
		</td>
	</tr>
</table>
</form>              
</div>                   
<%@ include file="/WEB-INF/views/bottom.jsp"%>