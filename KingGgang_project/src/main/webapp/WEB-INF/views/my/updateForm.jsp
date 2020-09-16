<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	이	   름 : updateForm.jsp
	개  발   자 : 원세호
	설	   명 : 멤버 정보수정 페이지
 -->
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>회원수정페이지</title>
</head>
<script type="text/javascript">
		function check(){
			if (e.passwd.value==""){
				alert("비밀번호를 입력해 주세요!!")
				e.passwd.focus()
				return
			}
			if (e.passwd.value!=e.checkpw.value){
				alert("비밀번호가 일치하지 않습니다.");
				e.passwd.focus();
				return;
			}
			document.e.submit()
		}
	</script>
<body>
<form name="e" action="updatePro.my" method="post" enctype="multipart/form-data" >
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
                                    <th><span>이름</span></th>
                                    <td><input type="text" name="name" value="${getMember.name}" readOnly></td>
                                </tr>
                                <tr>
                                    <th><span>비밀번호</span></th>
                                    <td><input type="password" name="passwd" value="${getMember.passwd}"></td>
                                </tr>
                                <tr>
                                	<th><span>비밀번호확인</span></th>
                                	<td><input type="password" name="checkpw"></td>
                                </tr>
                                <tr>
                                    <th><span>이메일</span></th>
                                    <td><input type="text" name="email" value="${getMember.email}"></td>
                                </tr>
                                <tr>
                                    <th><span>전화번호</span></th>
                                    <td><input type="text" name="hp1" value="${getMember.hp1}"></td>-
                                    <td><input type="text" name="hp2" value="${getMember.hp2}"></td>-
                                    <td><input type="text" name="hp3" value="${getMember.hp3}"></td>
                                </tr>
                                <tr>
                                    <th><font align="center">프로필 사진</font></th>
                                    <td>
                                    <img src="http://localhost:8080/img/${getMember.profile_name}" width="30" height="30">
                                    <input type="file" name="filename">
                                    <input type="hidden" name="filename2" value="${getMember.profile_name}">
                                    <input type="hidden" name="filesize2" value="${getMember.profile_size}">
                                    </td>
                                </tr>
                            </tbody> 
                        </table>
                    <div class="btn_wrap">
                        <a href="javascript:check()">수정하기</a>
                    </div>
                    <div class="btn_wrap">
                        <a href="main.my">취소</a>
                    </div>
                </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
    </form>
</body> 
</html>