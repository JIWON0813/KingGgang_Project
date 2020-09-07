<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	이	   름 : adminPayment.jsp
	개  발   자 : 원세호
	설	   명 : 관리자 결제 내역 페이지
 -->
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>관리자결제리스트</title>
</head>
<body>

<!-- 호텔 결제내역 -->

<form>
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                   	<h2 class="sub_tit_txt">호텔 결제 내역</h2>
                    
                        <table>
                           
                            <tbody>
                            
                            <c:if test = "${empty Phlist}">
                            <tr>
                            	<td colspan="9">호텔 결제 내역이 없습니다.</td>
                            </tr>
                            </c:if>
                      
                            	<tr>
                            	<td><span>상품 이름</span></td>
                            	 <td><span>상품 분류</span></td>
                            	 <td><span>구매처 전화번호</span></td>
                                 <td><span>구매자 아이디</span></td>
                                 <td><span>구매자 이름</span></td>
                                 <td><span>구매자 이메일</span></td>
                                 <td><span>결제 수량</span></td>
                                 <td><span>총 결제금액</span></td>
                                 <td><span>결제일</span></td>
                                </tr>
                            	<c:forEach var="dto" items="${Phlist}" varStatus="status">
                                <tr>
                                <td><span>${dto.h_name}</span></td>
                                <td><span>${dto.h_category}</span></td>
                                <td><span>${dto.h_hp}</span></td>
                                <td><span>${dto.m_id}</span></td>
                                <td><span>${dto.m_name}</span></td>
                                <td><span>${dto.m_email}</span></td>
                                <td><span>${dto.p_amount}</span></td>
                                 <td><span>${dto.p_amount*dto.p_price}</span></td>
                                 <td><span>${dto.p_paydate}</span></td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <!-- 이용날짜와 현재 날짜 비교 해서 지났으면 생기도록 -->
                    
                    
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
       

    </form>
                   
<!-- 렌트카 결제내역 -->

<form>
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                   	<h2 class="sub_tit_txt">렌트카 결제 내역</h2>
                    
                        <table>
                           <colgroup>
                              <!-- <col width="30%"/> -->
                                <col width="auto"/>
                            </colgroup> 
                            <tbody>
                            <tr>
                            <c:if test = "${empty Prlist}">
                            	<td colspan="9">렌트카 결제 내역이 없습니다.</td>
                            </tr>
                            </c:if>
                      
                                <td>
                                <div class="wrap wd668">
            					<div class="container">
             				    <div class="form_txtInput">
               				    <h2 class="sub_tit_txt"></h2>
                  				<div class="join_form">
                        		
                            	
                            	<tr>
                            	<td><span>상품 이름</span></td>
                            	 <td><span>상품 분류</span></td>
                            	 <td><span>구매처 이름</span></td>
                                 <td><span>구매자 아이디</span></td>
                                 <td><span>구매자 이름</span></td>
                                 <td><span>구매자 이메일</span></td>
                                 <td><span>결제 수량</span></td>
                                 <td><span>총 결제금액</span></td>
                                 <td><span>결제일</span></td>
                                </tr>
                            	<c:forEach var="dto" items="${Prlist}" varStatus="status">
                                <tr>
                                <td><span>${dto.r_name}</span></td>
                                <td><span>${dto.r_type}</span></td>
                                <td><span>${dto.r_company}</span></td>
                                <td><span>${dto.m_id}</span></td>
                                <td><span>${dto.m_name}</span></td>
                                <td><span>${dto.m_email}</span></td>
                                <td><span>${dto.p_amount}</span></td>
                                 <td><span>${dto.p_amount*dto.p_price}</span></td>
                                 <td><span>${dto.p_paydate}</span></td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                  
                    
                    
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
       

    </form>
    
</body>

</html>