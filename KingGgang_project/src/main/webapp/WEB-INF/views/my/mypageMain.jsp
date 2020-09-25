<%@ include file="../top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 
	이	   름 : mypageMain.jsp
	개  발   자 : 원세호
	설	   명 : 마이페이지 메인 페이지
 -->
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
                                    <th><a href="payment.my">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제내역확인</a></th>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <th><a href="list.wish">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관심리스트</a></th>
                                </tr>
                                 <tr><td></td></tr>
                                <tr>
                                    <th><a href="update.my">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 정보 변경</a></th>
                                </tr>
                                <tr><td></td></tr>
                                <tr>
                                    <th><a href="delete.my">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;탈퇴 하기</a></th>
                                </tr><td></td></tr>
                         </tbody>
                        </table>
                      <br><br>
                    	<div align="center">
							<a class="join_bt2" 
									style="display: inline-block; margin-left: 30px;" href="home.do">
									홈으로 가기</a>
						</div>
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
        </div>
    </div>

</body>
</html>
<%@ include file="../bottom.jsp" %>