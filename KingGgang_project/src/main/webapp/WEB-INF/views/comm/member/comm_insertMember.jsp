<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	   function comm_nicknameCheck(){
	   var reid = /^[a-zA-Z0-9]{4,12}$/;
	   join.idDuplication.value="idCheck";
	   if(!check(reid,join.id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
           return;
       }
	   var list = new Array();
	   <c:forEach items="${comm_memberList}" var="nick">
	   list.push("${nick.comm_nickname}");
	   </c:forEach> 
	   for(var i = 0;i<list.length;i++){
		   if(join.comm_nickname.value == list[i]){
			   alert("이미 가입된 닉네임 입니다.");
			   join.comm_nickname.focus();
			   return;
		   }  
	   }
	   	  alert("사용 가능한 닉네임 입니다.");
	   	  join.comm_birth_y.focus();
	   	  return;  
 		}	   	   
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminmember.css">
<form name="join" action="comm_insert.do" enctype="multipart/form-data" method="post">
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
							<tr>
								<th><span>이름</span></th>
								<td><input type="text" name="name" value="${getMember.name}"></td>
							</tr>
							<tr>
								<th><span>닉네임</span></th>
								<td><input type="text" name="comm_nickname" placeholder="닉네임을 입력하세요."></td>
							</tr>
							<tr>
								<th><span>생년월일</span></th>
								<td>
									<input type="text" name="comm_birth_y" value="${getMember.birth_y}" }> 년 
									<input type="text" name="comm_birth_m" value="${getMember.birth_m}"> 월 
									<input type="text" name="comm_birth_d" value="#{getMember.birth_d}">일
								</td>
							</tr>
							<tr>
								<th><span>프로필사진</span></th>
								<td><input type="file" name="comm_profile_name"></td>
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
				<input type="submit" value="조회" >
				<input type="button" value="취소" onclick="window.location='commhome.comm'" >
			</div>
		</div>
	</div>
</form>
<%@ include file="/WEB-INF/views/bottom.jsp"%>