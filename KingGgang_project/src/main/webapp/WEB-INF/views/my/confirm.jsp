<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ include file="../top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	이	   름 : confirm.jsp
	개  발   자 : 원세호
	설	   명 : 멤버 정보수정/삭제 확인 페이지
 -->
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminmember.css">
<title>회원탈퇴페이지</title>
</head>
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
		function check(){
			if (d.passwd.value==""){
				alert("비밀번호를 입력해 주세요!!")
				d.passwd.focus()
				return
			}
			document.d.submit()
		}
	</script>

<div class="section layout_padding"></div>
<c:if test = "${type==1}">
<form name="d" method="post" action="deletePro.my" enctype="multipart/form-data">
<!-- <input type="hidden" name ="filename" value="${param.filename}"/> -->
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">회원탈퇴</h2>
                    <div class="join_form">
                        <table>
                            <colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            </colgroup>
                            <tbody>                            
                               	<tr>
                                    <th><span>비밀번호</span></th>
                                    <td><input type="password" name="passwd" placeholder="비밀번호 입력해주세요."></td>
                                </tr>
                         </tbody>
                        </table>
                        <br>
                        <br>
                    <div >
                        <a class="join_bt2" 
									style="display: inline-block; margin-left: 30px;"  href="javascript:check()">
						탈퇴하기</a>
						<a class="join_bt2" 
									style="display: inline-block; margin-left: 30px;" href="main.my">
									취소</a>
                    </div>
                    </div>
                    </div>
                    </div>
                    </div>
</c:if>
<c:if test = "${type==2}">
<form name="d" method="post" action="updateForm.my" enctype="multipart/form-data">
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
                               	<tr>
                                    <th><span>비밀번호</span></th>
                                    <td><input type="password" name="passwd" placeholder="비밀번호 입력해주세요." ></td>
                                </tr>
                         </tbody>
                        </table>
                        <br>
                        <br>
                    	<div>
							<a class="join_bt2" 
									style="display: inline-block; margin-left: 30px;" href="javascript:check()">
									수정하기</a>
							<a class="join_bt2" 
									style="display: inline-block; margin-left: 30px;" href="main.my">
									취소</a>
						</div>
						</c:if>
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
       </div>
    </form>
    <div class="section layout_padding"></div>
    <%@ include file="../bottom.jsp" %>