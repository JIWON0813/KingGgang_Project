<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
<body>

<!-- 호텔 결제내역 -->

<form>
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                   	<h2 class="sub_tit_txt">호텔 결제 내역</h2>
                    <div class="join_form">
                        <table>
                           <colgroup>
                              <!-- <col width="30%"/> -->
                                <col width="auto"/>
                            </colgroup> 
                            <tbody>
                            <tr>
                            <c:if test = "${empty Phlist}">
                            	<td>호텔 결제 내역이 없습니다.</td>
                            </tr>
                            </c:if>
             				<c:forEach var="dto" items="${Phlist}" varStatus="status">
                      
                                <td>
                                <div class="wrap wd668">
            					<div class="container">
             				    <div class="form_txtInput">
               				    <h2 class="sub_tit_txt"></h2>
                  				<div class="join_form">
                        		<table>
                           		 <!--<colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            	</colgroup>-->
                            	<tbody>
                            	<!-- 사진을 누르면 해당 품목의 메인화면으로 a -->
                            	<tr>
                                <td><span>${dto.h_name}</span></td>
                                </tr>
                                <tr>
                                    <td><span>${dto.h_category}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.h_hp}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.startdate}일 부터 ${dto.startdate}까지 </span></td>
                                </tr>
                                <tr>
                                    <td><span>${dto.p_price}</span></td>
                                </tr>
                                <tr>
                                    <td><span>${dto.p_paydate}</span></td>
                                </tr>
                                 
                            </tbody>
                        </table>
                        <!-- 이용날짜와 현재 날짜 비교 해서 지났으면 생기도록 -->
                    <div class="btn_wrap">
                        <a href="/">이용자 후기 작성하기</a>
                    </div>
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
       </div>
                                 	</td>
                            <c:choose>
                                	<c:when test = "${status.count%2==0}">
                                	</tr>
                               		<tr>
                               		</c:when>
                               	 	<c:when test = "${status.count%2!=0}">
                               	 	</c:when>
                               	</c:choose>
                               	
                     </c:forEach>
                        </tr>    
                         </tbody>
                        </table>
                    </div>
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
        </div>
    </form>
                   
<!-- 렌트카 결제내역 -->

<form>
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                   	<h2 class="sub_tit_txt">렌트카 결제 내역</h2>
                    <div class="join_form">
                        <table>
                           <colgroup>
                              <!-- <col width="30%"/> -->
                                <col width="auto"/>
                            </colgroup> 
                            <tbody>
                            <tr>
                            <c:if test = "${empty Prlist}">
                            	<td>등록된 관심 상품이 없습니다.</td>
                            </tr>
                            </c:if>
             				<c:forEach var="dto" items="${Prlist}" varStatus="status">
                                <td>
                                <div class="wrap wd668">
            					<div class="container">
             				    <div class="form_txtInput">
               				    <h2 class="sub_tit_txt"></h2>
                  				<div class="join_form">
                        		<table>
                           		 <!--<colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            	</colgroup>-->
                            	<tbody>
                            	<!-- 사진을 누르면 해당 품목의 메인화면으로 a -->
                            	<tr>
                                <td><span>${dto.r_name}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.r_company}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.r_type}</span></td>
                                </tr>
                                <tr>
                                    <td><span>${dto.receiptday}일 부터 ${dto.returnday}까지</span></td>
                                </tr>
                                <tr>
                                    <td><span>${dto.p_price}</span></td>
                                </tr>
                                <tr>
                                    <td><span>${dto.p_paydate}</span></td>
                                </tr>
                            </tbody>
                        </table>
                    <!-- 이용날짜와 현재 날짜 비교 해서 지났으면 생기도록 -->
                    <div class="btn_wrap">
                        <a href="/">이용자 후기 작성하기</a>
                    </div>
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
       </div>
                                 	</td>
                                <c:choose>
                                	<c:when test = "${status.count%2==0}">
                                	</tr>
                               		<tr>
                               		</c:when>
                               	 	<c:when test = "${status.count%2!=0}">
                               	 	</c:when>
                               	</c:choose>
                               	
                     </c:forEach>
						</tr>
                         </tbody>
                        </table>
                    <div class="btn_wrap">
                        <a href="main.my">마이페이지</a>
                    </div>
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
        </div>
    </form>
    
</body>

</html>