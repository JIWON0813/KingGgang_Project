<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 
	이	   름 : mypageWishlist.jsp
	개  발   자 : 원세호
	설	   명 : 관심리스트 페이지
 -->

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
                           		 <!--<colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            	</colgroup>-->
                            	<tbody>
                            	<!-- 사진을 누르면 해당 품목의 메인화면으로 a -->
                            	<tr>
                                <td><span>${dto.name}</span></td>
                                </tr>
                                <c:if test="${dto.filesize>0}">
								<tr height="30">
								<td><span>
								<img src="http://192.168.0.184:8080/img/${dto.filename}" width="50" height="50">
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
                                 <tr>
                                    <td><span>${status.count}</span></td>
                                </tr>
                            </tbody>
                        </table>
                    <div class="btn_wrap">
                        <a href="delete.wish?f_no=${dto.no}">관심리스트에서 삭제하기</a>
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