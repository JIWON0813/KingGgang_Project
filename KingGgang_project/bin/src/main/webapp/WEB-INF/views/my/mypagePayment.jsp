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
<title>결제리스트</title>
</head>
<body>
<!-- 결제완료 -->
<h1>호텔 결제 내역</h1>
<!-- 호텔 결제 내역 -->
<from>
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                   	<h2 class="sub_tit_txt">호텔</h2>
                    <div class="join_form">
                    <c:forEach var="dto" items="${Phlist}" varStatus="status">
                    <choose>
                    <c:when test = "${dto.valid==1}">
                        <table>
                           <colgroup>
                              <!-- <col width="30%"/> -->
                                <col width="auto"/>
                            </colgroup> 
                            <tbody>
                            <tr>
                            <choose>
                            <c:when test = "${empty Phlist}">
                            	<td>결제내역이 없습니다.</td>
                            </tr>
                            </tbody>
                            </table>
                            </c:when>
                            <c:otherwise>
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
                            	<tr>
                                <td><span>결제 완료</span></td>
                                </tr>
                            	<tr>
                                <td><span>${dto.h_name}</span></td>
                                </tr>
                                <!-- <c:if test="${dto.filesize>0}">
								<tr height="30">
								<td><span>
								<img src="${upLoadPath}/${dto.filename}" width="50" height="50">
								${dto.filename}</a>
								</span></td>
								</tr>	
								</c:if>	-->
                                 <tr>
                                    <td><span>${dto.h_category}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.h_hp}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.p_amount}</span></td>
                                </tr>
                                <tr>
                                    <td><span>${dto.p_amount*dto.p_price}</span></td>
                                </tr>
                                <tr>
                                    <td><span>${dto.p_paydate}</span></td>
                                </tr>
                                <!--  결제 날짜 /이용 날짜/ 결제가격 /수량 -->
                            </tbody>
                        </table>
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
                               	</tr>
                        </tbody>
                        </table>
                        </c:otherwise>
                        </choose>
                        </c:when>
                        
                       	<c:otherwise>
                       	<table>
                           <colgroup>
                              <!-- <col width="30%"/> -->
                                <col width="auto"/>
                            </colgroup> 
                            <tbody>
                            <tr>
                            <choose>
                            <c:when test = "${empty Phlist}">
                            	<td>예약내역이 없습니다.</td>
                            </tr>
                            </tbody>
                            </table>
                            </c:when>
                            <c:otherwise>
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
                            	<tr>
                                <td><span>예약 완료</span></td>
                                </tr>
                            	<tr>
                                <td><span>${dto.h_name}</span></td>
                                </tr>
                                <!-- <c:if test="${dto.filesize>0}">
								<tr height="30">
								<td><span>
								<img src="${upLoadPath}/${dto.filename}" width="50" height="50">
								${dto.filename}</a>
								</span></td>
								</tr>	
								</c:if>	
                                 <tr>
                                    <td><span>${dto.content}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.category}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.p_amount}</span></td>
                                </tr>
                                <tr>
                                    <td><span>${dto.p_amount*dto.p_price}</span></td>
                                </tr>
                                <tr>
                                    <td><span>${dto.p_paydate}</span></td>
                                </tr>
                                <!--  결제 날짜 /이용 날짜/ 결제가격 /수량 -->
                            </tbody>
                        </table>
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
                               	</tr>
                        </tbody>
                        </table>
                        </c:otherwise>
                        </choose>
                       	</c:otherwise>
                       	</choose> 
                        </c:forEach> 
                        
                    </div> <!-- join_form E -->
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
     </form>
                   
<!-- 렌트카 결제 내역 -->
<form>
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                   	<h2 class="sub_tit_txt">렌트카</h2>
                    <div class="join_form">
                        <table>
                           <colgroup>
                              <!-- <col width="30%"/> -->
                                <col width="auto"/>
                            </colgroup> 
                            <tbody>
                            <tr>
                            <c:if test = "${empty rlist}">
                            	<td>결제 내역이 없습니다.</td>
                            </tr>
                            </c:if>
             				<c:forEach var="dto" items="${rlist}">
             				<c:if test = "${dto.type}">
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
                            	<tr>
                                <td><span>${dto.company}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.type}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.name}</span></td>
                                </tr>
                                
                                <c:if test="${dto.filesize>0}">
								<tr height="30">
								<td><span>
								<img src="${upLoadPath}/${dto.filename}" width="50" height="50">
								${dto.filename}</a>
								</span></td>
								</tr>	
								</c:if>	
                                 <tr>
                                    <td><span>${dto.price}</span></td>
                                </tr>
                            </tbody>
                        </table>
                        </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
       </div>
                                 	</td>
                                <c:choose>
                                	<c:when test = "${count%2==0}">
                                	</tr>
                               		<tr>
                               		</c:when>
                               	 	<c:when test = "${count%2!=0}">
                               	 	</c:when>
                               	</c:choose>
                               	</tr>
                               </c:if>
                     </c:forEach>
						
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
    
    <!-- 결제 완료 전 -->
<h1>예약 내역</h1>

<!-- 호텔 예약후 미결제 내역 -->
<form>
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                   	<h2 class="sub_tit_txt">호텔</h2>
                    <div class="join_form">
                        <table>
                           <colgroup>
                              <!-- <col width="30%"/> -->
                                <col width="auto"/>
                            </colgroup> 
                            <tbody>
                            <tr>
                            <c:if test = "${empty hlist}">
                            	<td>등록된 관심 상품이 없습니다.</td>
                            </tr>
                            </c:if>
             				<c:forEach var="dto" items="${hlist}" varStatus="status">
                      
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
                            	
                            	<tr>
                                <td><span>${dto.name}</span></td>
                                </tr>
                                <c:if test="${dto.filesize>0}">
								<tr height="30">
								<td><span>
								<img src="${upLoadPath}/${dto.filename}" width="50" height="50">
								${dto.filename}</a>
								</span></td>
								</tr>	
								</c:if>	
                                 <tr>
                                    <td><span>${dto.content}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.category}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.location}</span></td>
                                </tr>
                            </tbody>
                        </table>
                    <div class="btn_wrap">
                        <a href="">결제하러 가기</a> <!-- 결제페이지로 -->
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
                               	</tr> 
                     </c:forEach>
                            
                         </tbody>
                        </table>
                    </div>
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
        </div>
    </form>
                   
<!-- 렌트카 예약후 미결제 내역 -->
<form>
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                   	<h2 class="sub_tit_txt">관심리스트(렌트카)</h2>
                    <div class="join_form">
                        <table>
                           <colgroup>
                              <!-- <col width="30%"/> -->
                                <col width="auto"/>
                            </colgroup> 
                            <tbody>
                            <tr>
                            <c:if test = "${empty rlist}">
                            	<td>등록된 관심 상품이 없습니다.</td>
                            </tr>
                            </c:if>
             				<c:forEach var="dto" items="${rlist}">
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
                            	<tr>
                                <td><span>${dto.company}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.type}</span></td>
                                </tr>
                                 <tr>
                                    <td><span>${dto.name}</span></td>
                                </tr>
                                
                                <c:if test="${dto.filesize>0}">
								<tr height="30">
								<td><span>
								<img src="${upLoadPath}/${dto.filename}" width="50" height="50">
								${dto.filename}</a>
								</span></td>
								</tr>	
								</c:if>	
                                 <tr>
                                    <td><span>${dto.price}</span></td>
                                </tr>
                            </tbody>
                        </table>
                    <div class="btn_wrap">
                        <a href="">결제하러 가기</a> <!-- 결제페이지로 -->
                    </div>
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
       </div>
                                 	</td>
                                <c:choose>
                                	<c:when test = "${count%2==0}">
                                	</tr>
                               		<tr>
                               		</c:when>
                               	 	<c:when test = "${count%2!=0}">
                               	 	</c:when>
                               	</c:choose>
                               	</tr>
                     </c:forEach>
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