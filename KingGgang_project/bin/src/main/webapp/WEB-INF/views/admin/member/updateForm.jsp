<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	
	function checkUp() {

    /* 이메일, 휴대폰 번호 , 이미지파일
    var reemail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    var rehp = /^\d{3}-\d{3,4}-\d{4}$/; */
	  /*  var reimg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/; */
	   var form = document.e;	  
	   var repass = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	   	   	   	
	   if(e.nickname.value==""){
		   alert("닉네임을 입력해 주세요");
		   e.nickname.focus();
		   return;
	   } 
	   if(!e.password.value){
 	   alert("비밀번호를 입력해 주세요");
 	   e.password.focus();
 	   return;
   	   }
	   if(!check(repass,e.password,"비밀번호는 8~16자의 영문 대소문자와 숫자와 특수문자를 포함하여 입력")){
		   return;
	   }
	   if(!e.checkpw.value){
		   alert("비밀번호를 확인해 주세요")
		   e.checkpw.focus();
		   return;
	   }
   	   if(e.password.value != e.checkpw.value) {
      	   alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
           e.checkpw.value = "";
           e.checkpw.focus();
           return;
       }
    /* if(!check(reimg,e.filename,"이미지 파일만 업로드 가능")){
 	   return false;
    } */
    /* if(!check(reemail,join.email,"이메일을 정확히 입력")){
 	   return false;
    } */
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminmember.css">
<body>
<form name="e" action="updatePro.mem" method="post" enctype="multipart/form-data" >
<input type="hidden" name="id" value="${getMember.id}">
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">회원수정 페이지</h2>
                    <div class="join_form">
                        <table>
                            <colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th><span>아이디</span></th>
                                    <td><span>${getMember.id }</span></td> 
                                </tr>
                                <tr>
                                    <th><span>이름</span></th>
                                    <td>${getMember.name }</td>
                                </tr>
                                <tr>
                                    <th><span>닉네임</span></th>
                                    <td><input type="text" name="nickname" value="${getMember.nickname}"></td>
                                </tr>
                                <tr>
                                    <th><span>비밀번호</span></th>
                                    <td><input type="password" name="password" value="${getMember.password}"></td>
                                </tr>
                                <tr>
                                    <th><span>비밀번호 확인</span></th>
                                    <td><input type="password" name="checkpw" placeholder="비밀번호를 확인하세요"></td>
                                </tr>
                                <tr>
                                    <th><span>이메일</span></th>
                                    <td><input type="text" name="email" value="${getMember.email}"></td>
                                </tr>                           
                                <tr>
                                    <th><span>전화번호</span></th>
                                    <td><input type="text" name="hp" value="${getMember.hp}"></td>
                                </tr>
                                <tr>
                                    <th><span>프로필 사진</span></th>
                                    <td>
                                    <img src="${upLoadPath}//${getMember.filename}" width="30" height="30">
                                    <input type="file" name="filename">
                                    <input type="hidden" name="filename2" value="${getMember.filename}">
                                    <input type="hidden" name="filesize2" value="${getMember.filesize}">
                                    </td>
                                </tr>                              
                                <tr>
                                    <th><span>포인트</span></th>
                                    <td><input type="text" name="point" value="${getMember.point }"></td>
                                </tr>
                                <tr>
                                    <th><span>권한</span></th>
                                    <td><input type="text" name="auth" value="${getMember.auth }"></td>
                                </tr>                               
                            </tbody> 
                        </table>
                    <div class="btn_wrap">
                        <a href="javascript:checkUp()">수정하기</a>
                    </div>
                    <div class="btn_wrap">
                        <a href="home">취소</a>
                    </div>
                </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
    </form>
<%@ include file="/WEB-INF/views/bottom.jsp"%>