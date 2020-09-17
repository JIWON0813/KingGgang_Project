<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${mbId=='admin' }">
	<%@ include file="../admintop.jsp"%>
	</c:when>
	<c:otherwise>
	<%@ include file="../../top.jsp" %>
	</c:otherwise>
</c:choose>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function checkjoin() {
       var reid = /^[a-zA-Z0-9]{4,12}$/; 
       var repass = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; 
       var reemail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
       /* 휴대폰 번호 ,이미지파일
          var rehp = /^\d{3}-\d{3,4}-\d{4}$/; */
	   /* var reimg = /(.*?)\.(jpg|jpeg|png|gif|bmp|"")$/; */
	   
       
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
       if(!join.email.value){
    	   alert("이메일을 입력해 주세요");
    	   join.email.focus();
    	   return;
       }
       if(!check(reemail,join.email,"이메일을 정확히 입력")){
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
<<<<<<< HEAD
=======
=======
>>>>>>> branch 'jieun' of https://github.com/JIWON0813/KingGgang_Project.git

	  form.submit() 
 	   }
<<<<<<< HEAD
      
>>>>>>> branch 'seho' of https://github.com/JIWON0813/KingGgang_Project.git
=======

<<<<<<< HEAD
=======
      	form.submit()
	   }
>>>>>>> branch 'jieun' of https://github.com/JIWON0813/KingGgang_Project.git
>>>>>>> branch 'ina2' of https://github.com/JIWON0813/KingGgang_Project.git

=======
>>>>>>> branch 'ina2' of https://github.com/JIWON0813/KingGgang_Project.git

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
	   
	   
</script>
<div class="section layout_padding">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminmember.css">
<form name="join" action="insertMemberPro.mem" enctype="multipart/form-data" method="post">
	    <div class="section">
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                <img class="d-block mx-auto mb-4" src="${pageContext.request.contextPath}/resources/main/images/logo.png" alt="">
                    <h2 class="sub_tit_txt">회원가입</h2>
                    <div class="join_form">
                        <table>
                            <colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            </colgroup>                           
                            <tbody>
                                <tr>
                                    <th><font color="red">* </font><span>아이디</span></th>
                                    <td><input type="text" name="id" placeholder="ID 를 입력하세요." onkeydown="inputIdCheck()">
                                	<input type="button" value="중복체크" onclick="idCheck()">
                                	<input type="hidden" name= "idDuplication" value="idUnCheck"> 
                                	</td>  
                                	                             	
                                </tr>
                                <tr>
                                    <th><font color="red">* </font><span>이름</span></th>
                                    <td><input type="text" name="name" placeholder="이름을 입력하세요."></td>
                                </tr>
                                <tr>
								<th><font color="red">* </font><span>성별</span></th>
									<td>
										<select name="gender">
											<option value="남">남성</option>
											<option value="여">여성</option>
										</select>
									</td>
								</tr>
                                <tr>
                                    <th><font color="red">* </font><span>비밀번호</span></th>
                                    <td><input type="password" name="passwd" placeholder="비밀번호를 입력해주세요."></td>
                                </tr>
                                <tr>
                                    <th><font color="red">* </font><span>비밀번호 확인</span></th>
                                    <td><input type="password" name="checkpw" placeholder="비밀번호를 확인하세요"></td>
                                </tr>
                                <tr>
									<th><font color="red">* </font><span>생년월일</span></th>
									<td>
										<select name="birth_y">
											<c:set var="year" value="2020"></c:set>
											<c:forEach var="y" begin="1900" end="${year }">
											<option value="${year-y+1900}">${year-y+1900}</option> 
											</c:forEach>
										</select> 년 
										<select name="birth_m">
											<c:forEach var="m" begin="1" end="12">
											<option value="${m}">${m}</option>
											</c:forEach>
										</select> 월
										<select name="birth_d">
											<c:forEach var="d" begin="1" end="31">
											<option value="${d}">${d}</option>
											</c:forEach>
										</select> 일
									</td>
  								</tr>
                                <tr>
                                    <th><font color="red">* </font><span>이메일</span></th>
                                    <td><input type="text" name="email"></td>
                                </tr>                    
                                <tr>
									<th><font color="red">* </font><span>연락처</span></th>
									<td>
										<input type="text" name="hp1"
													size="3" maxlength="3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> -
										<input type="text" name="hp2"
													size="4" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> -
										<input type="text" name="hp3"
													size="4" maxlength="4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									</td>
  								</tr>
  								<tr>
									<th><span>자기소개</span></th>
									<td>
									<textarea name="intro" rows="5" cols="60"></textarea>
									</td>
  								</tr>
                                <tr>
                                	<th><span>프로필 사진</span></th>
                                	<td><input type="file" name="profile_name" accept="image/*">
                                </tr>                           
                            </tbody>
                        </table>                 
                    </div>                   
                    </div>
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <font color="red">*</font> 표시는 반드시 입력해 주세요.
                    <div class="btn_wrap">
                      	<a href="javascript:checkjoin()">회원가입</a>
                    </div>
                </div> 
            </div>
            </div>
    </form>
    </div>
<%@ include file="../adminbottom.jsp"%>
