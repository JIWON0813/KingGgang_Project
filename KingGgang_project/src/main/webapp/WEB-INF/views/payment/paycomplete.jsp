<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ include file="/WEB-INF/views/top.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	이	   름 : mypagePayment.jsp
	개  발   자 : 원세호
	설	   명 : 결제 내역 페이지
 -->
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>마이결제리스트</title>
</head>

<style>

a.join_bt2 {

	background: #ff880e;

	width: 180px;

	text-align: center;

	height: 38px;

	line-height: 38px;

	color: #fff;

	font-weight: 300;

}

a.join_bt2:hover, a.join_bt2:focus {

	background: #222;

	color: #fff !important;

}

footer.footer-box h2.pay {

	text-decoration: underline solid orange;

}

</style>
<body>

<div class="section layout_padding"></div>
<!-- 호텔 결제내역 -->
<c:if test="${status == 1}">
<form>
	     <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">${buyer_name}님의 결제 내역</h2>
                    <div class="join_form">
                        <table>
                            <colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            </colgroup>
                           <tbody>
                                <tr>
                                    <th><span>상품이름</span></th>
                                    <td>${pldto.p_name}</td>
                                </tr>
                                <tr>
                                    <th><span>업체 전화번호</span></th>
                                    <td>${pldto.hp}</td>
                                </tr>
                                <tr>
                                    <th><span>대여날짜</span></th>
                                    <td>${pldto.startDate}</td>
                                </tr>
                                <tr>
                                    <th><span>반납날짜</span></th>
                                    <td>${pldto.endDate}</td>
                                </tr>
                                <tr>
                                    <th><span>결제 금액</span></th>
                                    <td>${pldto.price}</td>
                                </tr>
                                <tr>
                                    <th><span>결제 일</span></th>
                                    <td>${pldto.payDate}</td>
                                </tr>
                            </tbody> 
                        </table>
                        
                       		<div>

								<a class="join_bt2"

									style="display: inline-block; margin-left: 30px;" href="HotelFin.pay">확인</a>

							</div> 
                   
                    
                </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
    </form>
</c:if> 
<!-- 렌트카 결제 내역 --> 
<c:if test="${status == 2}">
<form>
	     <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">${buyer_name}님의 결제 내역</h2>
                    <div class="join_form">
                        <table>
                            <colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th><span>상품이름</span></th>
                                    <td>${pldto.p_name}</td>
                                </tr>
                                <tr>
                                    <th><span>업체 전화번호</span></th>
                                    <td>${pldto.hp}</td>
                                </tr>
                                <tr>
                                    <th><span>대여날짜</span></th>
                                    <td>${pldto.startDate}</td>
                                </tr>
                                <tr>
                                    <th><span>반납날짜</span></th>
                                    <td>${pldto.endDate}</td>
                                </tr>
                                <tr>
                                    <th><span>결제 금액</span></th>
                                    <td>${pldto.price}</td>
                                </tr>
                                <tr>
                                    <th><span>결제 일</span></th>
                                    <td>${pldto.payDate}</td>
                                </tr>
                            </tbody> 
                        </table>
                        <div>

								<a class="join_bt2"

									style="display: inline-block; margin-left: 30px;" href="rentcarFin.pay">확인</a>

							</div> 
                 
                </div> 
            </div>
        </div> 
    </form>
</c:if> 
<div class="section layout_padding"></div>
</body>

</html>
<%@ include file="/WEB-INF/views/bottom.jsp"%>