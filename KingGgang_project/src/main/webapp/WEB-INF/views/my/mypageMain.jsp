<%@ include file="../top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	이	   름 : mypageMain.jsp
	개  발   자 : 원세호
	설	   명 : 마이페이지 메인 페이지
 -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style2.css">
<title>회원 마이 페이지</title>
</head>
<body>
<div class="section layout_padding">
<input type="hidden" name ="filename" value="${param.filename}"/>
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">마이페이지</h2>
                    <div class="join_form">
                        <table>
                            <colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            </colgroup>
                            <tbody>
                         		<tr>
                                    <th><a href="payment.my">&nbsp&nbsp&nbsp&nbsp&nbsp결제내역확인</a></th>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <th><a href="list.wish">&nbsp&nbsp&nbsp&nbsp&nbsp관심리스트</a></th>
                                </tr>
                                 <tr><td></td></tr>
                                <tr>
                                    <th><a href="update.my">&nbsp&nbsp&nbsp&nbsp&nbsp회원 정보 변경</a></th>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <th><a href="delete.my">&nbsp&nbsp&nbsp&nbsp&nbsp탈퇴 하기</a></th>
                                </tr><td></td></tr>
                         </tbody>
                        </table>
                      
                    <div class="btn_wrap">
                        <a href="home.do">홈으로</a>
                    </div>
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
        </div>
    </div>

</body>
</html>
<%@ include file="../bottom.jsp" %>