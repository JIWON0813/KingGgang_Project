<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	이	   름 : confirm.jsp
	개  발   자 : 원세호
	설	   명 : 멤버 정보수정/삭제 확인 페이지
 -->
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>회원탈퇴페이지</title>
</head>
<script type="text/javascript">
		function check(){
			if (d.id.value==""){
				alert("아이디를 입력해 주세요!!")
				d.id.focus()
				return
			}
			if (d.password.value==""){
				alert("비밀번호를 입력해 주세요!!")
				d.password.focus()
				return
			}
			document.d.submit()
		}
	</script>
<body>

<c:if test = "${type==1}">
<form name="d" method="post" action="deletePro.my" enctype="multipart/form-data">
<!-- <input type="hidden" name ="filename" value="${param.filename}"/> -->
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                    <h1 class="sub_tit_txt">회원 탈퇴 페이지</h1>
                    <h2 class="sub_tit_txt">아이디와 비밀번호를 입력하세요.</h2>
                    <div class="join_form">
                        <table>
                            <colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th><span>아이디</span></th>
                                    <td><input type="text" name="id" placeholder="ID 를 입력하세요."></td>
                                </tr>
                               	<tr>
                                    <th><span>비밀번호</span></th>
                                    <td><input type="password" name="password" placeholder="비밀번호를 입력해주세요."></td>
                                </tr>
                         </tbody>
                        </table>
                    <div class="btn_wrap">
                        <a href="javascript:check()">탈퇴하기</a>
                    </div>
</c:if>
<c:if test = "${type==2}">
<form name="d" method="post" action="updateForm.my" enctype="multipart/form-data">
<!-- <input type="hidden" name ="filename" value="${param.filename}"/> -->
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                	<h1 class="sub_tit_txt">회원정보 수정페이지</h1>
                    <h2 class="sub_tit_txt">아이디와 비밀번호를 입력하세요.</h2>
                    <div class="join_form">
                        <table>
                            <colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th><span>아이디</span></th>
                                    <td><input type="text" name="id" placeholder="ID 를 입력하세요."></td>
                                </tr>
                               	<tr>
                                    <th><span>비밀번호</span></th>
                                    <td><input type="password" name="password" placeholder="비밀번호를 입력해주세요."></td>
                                </tr>
                         </tbody>
                        </table>
                    <div class="btn_wrap">
                        <a href="javascript:check()">수정하기</a>
                    </div>
</c:if>
                    <div class="btn_wrap">
                        <a href="home">취소</a>
                    </div>
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
        </div>
    </form>
</body>
</html>