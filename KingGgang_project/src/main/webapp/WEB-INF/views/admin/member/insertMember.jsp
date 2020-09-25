<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${mbId=='admin' }">
		<%@ include file="../admintop.jsp"%>
	</c:when>
	<c:otherwise>
		<%@ include file="../../top.jsp"%>
	</c:otherwise>
</c:choose>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
a.join_bt2 {

	background: #ff880e;
	width: 180px;
	text-align: center;
	height: 38px;
	color: #fff;
	font-weight: 300;

	}

a.join_bt2:hover, a.join_bt2:focus {
	background: #222;
	color: #fff !important;

	}
 </style>
<script type="text/javascript">
	function checkjoin() {
       var reid = /^[a-zA-Z0-9]{4,12}$/; 
       var repass = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; 
        
	   var form = document.join;
	   
	   if(join.id.value==""){
    	   alert("아이디를 입력해 주세요")
    	   join.id.focus();
    	   return;
       }
	   if(!check(reid,join.id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
           return;
       }
	   
	   if(join.idDuplication.value!="idCheck"){
		   alert("아이디 중복체크를 해주세요.");
		   return;
	   }
	   	   
	   if(join.name.value=="") {
           alert("이름을 입력해 주세요");
           join.name.focus();
           return;
       }
	   if(!join.passwd.value){
    	   alert("비밀번호를 입력해 주세요");
    	   join.passwd.focus();
    	   return;
       }
	   if(!check(repass,join.passwd,"비밀번호는 8~16자의 영문 대소문자와 숫자와 특수문자를 포함하여 입력")){
		   return;
	   }
	   if(!join.checkpw.value){
		   alert("비밀번호를 확인해 주세요")
		   join.checkpw.focus();
		   return;
	   }
       if(join.passwd.value != join.checkpw.value) {
           alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
           join.checkpw.value = "";
           join.checkpw.focus();
           return;
       }
       if(!join.email1.value){
    	   alert("이메일을 입력해 주세요");
    	   join.email1.focus();
    	   return;
       }
       if(!join.email2.value){
    	   alert("이메일을 입력해 주세요");
    	   join.email2.focus();
    	   return;
       }
       if(!join.hp1.value){
    	   alert("연락처를 입력해 주세요");
    	   join.hp1.focus();
    	   return;
       }
       if(!join.hp2.value){
    	   alert("연락처를 입력해 주세요");
    	   join.hp2.focus();
    	   return;
       }
       if(!join.hp3.value){
    	   alert("연락처를 입력해 주세요");
    	   join.hp3.focus();
    	   return;
       }
       var list = new Array();
	   <c:forEach items="${memberList}" var="userid">
	   list.push("${userid.id}");
	   </c:forEach> 
	   if(join.id.value==""){
    	   alert("아이디를 입력해 주세요")
    	   join.id.focus();
    	   return false;
       }
	   for(var i = 0;i<list.length;i++){
		   if(join.id.value == list[i]){
			   alert("이미 가입된 아이디 입니다.");
			   join.id.focus();
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
	   
	   function idCheck(){
	   var reid = /^[a-zA-Z0-9]{4,12}$/;
	   join.idDuplication.value="idCheck";
	   if(!check(reid,join.id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
           return;
       }
	   var list = new Array();
	   <c:forEach items="${memberList}" var="userid">
	   list.push("${userid.id}");
	   </c:forEach> 
	   if(join.id.value==""){
    	   alert("아이디를 입력해 주세요")
    	   join.id.focus();
    	   return;
       }
	   for(var i = 0;i<list.length;i++){
		   if(join.id.value == list[i]){
			   alert("이미 가입된 아이디 입니다.");
			   join.id.focus();
			   return;
		   }  
	   }
	   	  alert("사용 가능한 아이디 입니다.");
	   	  join.name.focus();
	   	  return;  
  	}
	   function inputIdCheck(){
		   document.join.idDuplication.value="idUnCheck";
	   }
	   function selectEmail(ele){
		    var $ele = $(ele);
		    var $email2 = $('input[name=email2]');

		    if($ele.val() == "1"){
		        $email2.attr('readonly', false);
		        $email2.val('');
		    } else {
		        $email2.attr('readonly', true);
		        $email2.val($ele.val());
		    }
		}
	   
</script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/adminmember.css">
	<div class="section layout_padding"></div>
<form name="join" action="insertMemberPro.mem"
	enctype="multipart/form-data" method="post">
	<div class="wrap wd668">
		<div class="container">
			<div class="form_txtInput">
				    <c:choose>
                		<c:when test="${mbId=='admin' }">
                		<h2 class="sub_tit_txt">회원등록</h2>
                		</c:when>
                		<c:otherwise>
                		<h2 class="sub_tit_txt">회원가입</h2>
                		</c:otherwise>
                	</c:choose>
				<div class="join_form">
					<table>
						<colgroup>
							<col width="30%" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<tr>
								<th><span>아이디</span><font color="red">*</font></th>
								<td><input type="text" name="id" placeholder="ID 를 입력하세요."
									onkeydown="inputIdCheck()"> <input type="button"
									value="중복체크" onclick="idCheck()"> <input type="hidden"
									name="idDuplication" value="idUnCheck"></td>

							</tr>
							<tr>
								<th><span>이름</span><font color="red">*</font></th>
								<td><input type="text" name="name" placeholder="이름을 입력하세요."></td>
							</tr>
							<tr>
								<th><span>성별</span><font color="red">*</font></th>
								<td><select name="gender">
										<option value="남">남성</option>
										<option value="여">여성</option>
								</select></td>
							</tr>
							<tr>
								<th><span>비밀번호</span><font color="red">*</font></th>
								<td><input type="password" name="passwd"
									placeholder="비밀번호를 입력해주세요."></td>
							</tr>
							<tr>
								<th><span>비밀번호 확인</span><font color="red">*</font></th>
								<td><input type="password" name="checkpw"
									placeholder="비밀번호를 확인하세요"></td>
							</tr>
							<tr>
								<th><span>생년월일</span><font color="red">*</font></th>
								<td><select name="birth_y">
										<c:set var="year" value="2020"></c:set>
										<c:forEach var="y" begin="1900" end="${year }">
											<option value="${year-y+1900}">${year-y+1900}</option>
										</c:forEach>
								</select> 년 <select name="birth_m">
										<c:forEach var="m" begin="1" end="12">
											<option value="${m}">${m}</option>
										</c:forEach>
								</select> 월 <select name="birth_d">
										<c:forEach var="d" begin="1" end="31">
											<option value="${d}">${d}</option>

										</c:forEach>
								</select> 일</td>
							</tr>
							
							<tr>
								<th><span>이메일</span><font color="red">*</font></th>
                                    <td>
                                    <input name="email1" type="text" size="10"> @ <input name="email2" type="text" size="10"> 
										<select name="select_email" onChange="selectEmail(this)"> 
											<option value="" selected>선택하세요</option> 
											<option value="naver.com">naver.com</option> 
											<option value="gmail.com">gmail.com</option> 
											<option value="hanmail.com">hanmail.com</option> 
											<option value="nate.com">nate.com</option>
											<option value="1">직접입력</option> 
										</select>
									</td>
							</tr>
							<tr>
								<th><span>연락처</span><font color="red">*</font></th>
								<td>
									<select name="hp1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
									- <input type="text" name="hp2" size="4" maxlength="4">
									- <input type="text" name="hp3" size="4" maxlength="4">
								</td>
							</tr>
							<tr>
								<th><span>자기소개</span></th>
								<td><textarea name="intro" rows="5" cols="60"></textarea></td>
							</tr>
							<tr>
								<th><span>프로필 사진</span></th>
								<td><input type="file" name="profile_name" accept="image/*">
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font
				color="red">*</font> 표시는 반드시 입력해 주세요.
			<br><br>
			<div align="center">
			     	<c:choose>
                		<c:when test="${mbId=='admin' }">
                		<a class="join_bt2" style="display: inline-block; margin-left: 30px;" href="javascript:checkjoin()">회원등록</a>
                		</c:when>
                		<c:otherwise>
                		<a class="join_bt2" style="display: inline-block; margin-left: 30px;" href="javascript:checkjoin()">회원가입</a>
                		</c:otherwise>
                	</c:choose>
                	<a class="join_bt2" style="display: inline-block; margin-left: 30px;" href="javascript:history.back()">취소</a>
			</div>
		</div>
	</div>
</form>
<%@ include file="../adminbottom.jsp"%>
							