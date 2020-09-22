<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	이	   름 : mypagePayment.jsp
	개  발   자 : 원세호
	설	   명 : 결제 내역 페이지
 -->
<%@ include file="/WEB-INF/views/top.jsp"%> 
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

a.join_bt2:hover,
a.join_bt2:focus {
	background: #222;
	color: #fff !important;
}

</style>

    <footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
							<div class="full">
							<div align="left">
							<!-- 호텔 결제내역 -->
                   	<h2>호텔 결제 내역</h2>
                    <div>
                        <table> 
                            <tbody>
                            <tr>
                            <c:if test = "${check1 ==1}">
                            
             				<c:forEach var="dto" items="${plist}" varStatus="status">
                                <td>
                                <div>
            					<div>
             				    <div>
                  				<div>
                        		<table>
                            	<tbody>
                            	<!-- 사진을 누르면 해당 품목의 메인화면으로 a -->
                            	<tr>
                            		<td>호텔 이름</td>
                               		<td><span>${dto.p_name}</span></td>
                                </tr>
                                <tr>
                                	<td>숙 소</td>
                                    <td><span>${dto.type}</span></td>
                                </tr>
                                 <tr>
                                 	<td>숙소 연락처</td>
                                    <td><span>${dto.hp}</span></td>
                                </tr>
                                 <tr>
                                 	<td>예약 날짜</td>
                                    <td><span>${dto.startDate}
                                    			~ ${dto.endDate}</span></td>
                                </tr>
                                <tr>
                                	<td>가 격</td>
                                    <td><span>${dto.price}</span></td>
                                </tr>
                                <tr>
                                	<td>결제한 날</td>
                                    <td><span>${dto.payDate}</span></td>
                                </tr>
                                 
                            </tbody>
                        </table>
                        <!-- 이용날짜와 현재 날짜 비교 해서 지났으면 생기도록 -->
                    <div>
                        <a class="join_bt2" style="display: inline-block; margin-left:30px;" href="insertReview.re?type=1&name=${dto.p_name}&filename=${dto.filename}">이용자 후기 작성하기</a>
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
                     </c:if>
                        </tr>    
                         </tbody>
                        </table>
                    </div>
                    
								<!-- 렌트카 결제내역 -->
					<div align="right">
                   		<h2>렌트카 결제 내역</h2>
                    <div>
                        <table>
                            <tbody>
                            <tr>
                            <c:if test = "${check1 == 2}">
                            
             				<c:forEach var="dto" items="${plist}" varStatus="status">
                                <td>
                                <div align="center">
                                <br>
                                <br>
                        		<table>
                            	<tbody align="center">
                            	<!-- 사진을 누르면 해당 품목의 메인화면으로 a -->
                            	<tr>
                            	<td>렌트카 이름</td>
                                <td><span>${dto.p_name}</span></td>
                                </tr>
                                 <tr>
                                 <td>렌트카 회사 전화번호</td>
                                    <td><span>${dto.hp}</span></td>
                                </tr>
                                 <tr>
                                 	<td>차 종</td>
                                    <td><span>${dto.type}</span></td>
                                </tr>
                                <tr>
                                	<td>예약날짜</td>
                                    <td><span>${dto.startDate}<br>
                                    			 ~ ${dto.endDate}</span></td>
                                </tr>
                                <tr>
                                	<td>가 격</td>
                                    <td><span>${dto.price}</span></td>
                                </tr>
                                <tr>
                                	<td>결제날</td>
                                    <td><span>${dto.payDate}</span></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                        </div>
                        </div>
                    <!-- 이용날짜와 현재 날짜 비교 해서 지났으면 생기도록 -->
                    <div>
                        <a class="join_bt2" style="display: inline-block; margin-left:30px;" href="insertReview.re?type=2&name=${dto.p_name}&filename=${dto.filename}">이용자 후기 작성하기</a>
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
                     </c:if>
						</tr>
                         </tbody>
                        </table>
                        <br>
                        <br>
                        <br>
                    <div align="center">
                        <a class="join_bt" style="display: inline-block; margin-left:30px;" href="main.my">마이페이지</a>
                    </div>
               </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
        </div>
							</div>
						</div>
					</div>
					</div>
</footer>
                   

<%@ include file="/WEB-INF/views/bottom.jsp"%>