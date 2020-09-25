<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="../top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 
	이	   름 : mypageWishlist.jsp
	개  발   자 : 원세호
	설	   명 : 관심리스트 페이지
 -->
<div class="section layout_padding"></div>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>관심리스트</title>
</head>
<body>

<!-- 호텔 관심리스트  -->

<form>
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                   	<h2 class="sub_tit_txt">관심리스트(호텔)</h2>
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
                            	<tbody>
                            	<tr align="center">
                                <td><b>${dto.name}</b></td>
                                </tr>
                                <c:if test="${dto.filesize>0}">
								<tr height="30">
								<td><span>
								<a href="hotelDetail.hotel?no=${dto.no}">
								<img src="http://192.168.0.184:8080/img/${dto.filename}" width="350" height="350">
								</a>
								</span></td>
								</tr>	
								</c:if>	           
                            </tbody>
                        </table>
                        <div align="center">
							<a class="join_bt2" 
									style="display: inline-block; margin-left: 30px;" href="delete.wish?f_no=${dto.no}">
									관심리스트 삭제</a>
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
                    <br><br>
                    	<div align="center">
							<a class="join_bt2" 
									style="display: inline-block; margin-left: 30px;" href="main.my">
									마이페이지로 가기</a>
						</div>
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
        </div>
    </form>
    
</body>
</html>
<div class="section layout_padding"></div>
<%@ include file="../bottom.jsp" %>