<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
 	   function checkjoin() {
       var reid = /^[a-zA-Z0-9]{4,12}$/; 
       var repass = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; 
       
       /* 이메일, 휴대폰 번호 ,이미지파일
       var reemail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
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
	   if(join.nickname.value==""){
		   alert("닉네임을 입력해 주세요");
		   join.nickname.focus();
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
      /*  if(join.filename!=null||join.filename!=""){
    	   if(!check(reimg,join.filename,"이미지 파일만 업로드 가능"));
    	   return;
       } */
       /* if(!check(reemail,join.email,"이메일을 정확히 입력")){
    	   return false;
       } */
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
	   
	   
</script>

<section id="four" class="wrapper style1 special fade-up">
					<div class="container">		
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminmember.css">
<form name="join" method="post" action="comm_member_edit_ok.do" onsubmit="return check()" enctype="multipart/form-data">			
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">회원수정</h2>
                    <div class="join_form">
                        <table>
                            <colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            </colgroup>                           
                            <tbody>
                            <input type="hidden" name="memberNum" value="${getMember.memberNum}"/>
                               
                                <tr>
                                    <th><span>닉네임</span></th>
                                    <td><input type="text" name="nickname" value="${getMember.nickname}"></td>
                                </tr>
                           
					<th><span>생년월일</span></th>
					<td>
						<input type="text" name="birth_y" 
													size="4" maxlength="4" value="${getMember.birth_y}"> 년
						<input type="text" name="birth_m" class="box"
													size="2" maxlength="2" value="${getMember.birth_m}"> 월
						<input type="text" name="birth_d" class="box"
													size="2" maxlength="2" value="${getMember.birth_d}"> 일
					</td>
  				</tr>
  					<tr>
				<th><span>프로필사진</span></th>
				<td><input type="file" name="profile_name" value="${getMember.profile_name}">
				</td>
			</tr>
  				<tr>
					<th><span>자기소개</span></th>
					<td>
						<textarea name="intro" rows="5" cols="60">${getMember.intro}</textarea>
					</td>
  				</tr>
                            </tbody>
                        </table>                 
                    </div>                   
                    </div>
                    <div class="btn_wrap">
                    <input type="submit" value="조회" >
						<input type="reset" value="취소" >
                      	<a href="javascript:checkjoin()">다음</a>
                    </div>
                </div> 
            </div>
    </form>
<%@ include file="/WEB-INF/views/bottom.jsp"%>