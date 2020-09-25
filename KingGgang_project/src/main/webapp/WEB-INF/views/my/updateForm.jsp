<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/top.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	이	   름 : updateForm.jsp
	개  발   자 : 원세호
	설	   명 : 멤버 정보수정 페이지
 -->


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminmember.css">

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
function checkUp() {

    
	   var form = document.e;	  
	   var repass = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	   var reemail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  
	   if(!e.passwd.value){
 	   alert("비밀번호를 입력해 주세요");
 	   e.passwd.focus();
 	   	return;
   	   }
	   if(!check(repass,e.passwd,"비밀번호는 8~16자의 영문 대소문자와 숫자와 특수문자를 포함하여 입력")){
		   return;
	   }
	   if(!e.checkpw.value){
		   alert("비밀번호를 확인해 주세요")
		   e.checkpw.focus();
		   return;
	   }
   	   if(e.passwd.value != e.checkpw.value) {
      	   alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
           e.checkpw.value = "";
           e.checkpw.focus();
           return;
       }
       if(!check(reemail,e.email,"이메일을 정확히 입력")){
 	   	return ;
       } 
   		 form.submit();		      
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
	
	</script>

<form name="e" action="updatePro.my" method="post" enctype="multipart/form-data" >
<input type="hidden" name="memberNum" value="${getMember.memberNum }">
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                <img class="d-block mx-auto mb-4" src="${pageContext.request.contextPath}/resources/main/images/logo.png" alt="">
                    <h2 class="sub_tit_txt">회원수정</h2>
                    <div class="join_form">
                        <table>
                            <colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th><font color="red">* </font><span>아이디</span></th>
                                    <td><input type="text" name="id" value="${getMember.id }" readonly></td> 
                                </tr>
                                <tr>
                                    <th><font color="red">* </font><span>이름</span></th>
                                    <td><input type="text" name="name" value="${getMember.name }" readonly></td>
                                </tr>
                                <tr>
                                    <th><font color="red">* </font><span>연락처</span></th>
                                    <td><input type="text" name="hp1" size="3" maxlength="3" value="${getMember.hp1}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">-
                                    	<input type="text" name="hp2" size="4" maxlength="4" value="${getMember.hp2}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">-
                                    	<input type="text" name="hp3" size="4" maxlength="4" value="${getMember.hp3}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                                    </td>
                                </tr>
                                <tr>
                                    <th><font color="red">* </font><span>비밀번호</span></th>
                                    <td><input type="password" name="passwd" value="${getMember.passwd}"></td>
                                </tr>
                                <tr>
                                    <th><font color="red">* </font><span>비밀번호 확인</span></th>
                                    <td><input type="password" name="checkpw" placeholder="비밀번호를 확인하세요"></td>
                                </tr>
                                <tr>
                                    <th><font color="red">* </font><span>이메일</span></th>
                                    <td><input type="text" name="email" value="${getMember.email}"></td>
                                </tr>                           
                                <tr>
                                    <th><span>자기소개</span></th>
                                    <td><textarea name="intro" rows="5" cols="60">${getMember.intro }</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>프로필 사진</span></th>
                                    <td>
                                    <c:if test="${getMember.profile_size>0 }">
                                    <img src="http://192.168.0.184:8080/img/${getMember.profile_name}" width="30" height="30">
                                    </c:if>
                                    <input type="file" name="profile_name" accept="image/*">
                                    <input type="hidden" name="filename2" value="${getMember.profile_name}">
                                    <input type="hidden" name="filesize2" value="${getMember.profile_size}">
                                    </td>
                                </tr>                              
                                <%-- <tr>
                                    <th><span>포인트</span></th>
                                    <td><input type="text" name="point" value="${getMember.point }"></td>
                                </tr>     --%>                       
                            </tbody> 
                        </table>
                        <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <font color="red">*</font> 표시는 반드시 입력해 주세요.
                        <br><br>
                    	<div align="center">
							<a class="join_bt2" 
									style="display: inline-block; margin-left: 30px;" href="javascript:checkUp()">
									수정하기</a>
			
							<a class="join_bt2" 
									style="display: inline-block; margin-left: 30px;" href="main.my">
									취소</a>
						</div>
                                    </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
    </form>

<%@ include file="/WEB-INF/views/admin/adminbottom.jsp"%>