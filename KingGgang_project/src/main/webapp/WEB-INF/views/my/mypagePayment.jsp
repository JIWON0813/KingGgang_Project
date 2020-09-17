<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

a.join_bt2:hover, a.join_bt2:focus {
	background: #222;
	color: #fff !important;
}
footer.footer-box h2.pay {
    border-bottom: solid #d66c0b 4px;
    border-size: 50;
    margin-bottom: 25px;
}
</style>
<footer class="footer-box">
	<div class="container">
		<div class="row">
			<div class="col-md-12 white_fonts">
				<div class="row">
					<div class="full">
						<div align="center">
							<!-- 호텔 결제내역 -->
							<br><br><br>
							<h2 class="pay">호텔 결제 내역</h2>
							<div>
								<table>
									<tbody>
										<tr>
											<c:if test="${empty Phlist}">
												<td>호텔 결제 내역이 없습니다.</td>
											</c:if>
										</tr>

										<c:forEach var="dto" items="${Phlist}" varStatus="status">
											<td>
												<div>
													<table>
														<tbody>
															<!-- 사진을 누르면 해당 품목의 메인화면으로 a -->
															<tr>
																<td>호텔 이름</td>
																<td><span>${dto.h_name}</span></td>
															</tr>
															<tr>
																<td>숙 소</td>
																<td><span>${dto.h_category}</span></td>
															</tr>
															<tr>
																<td>숙소 연락처</td>
																<td><span>${dto.h_hp}</span></td>
															</tr>
															<tr>
																<td>예약 날짜</td>
																<td><span>${dto.startdate} ~
																		${dto.startdate}</span></td>
															</tr>
															<tr>
																<td>가 격</td>
																<td><span>${dto.p_price}</span></td>
															</tr>
															<tr>
																<td>결제한 날짜</td>
																<td><span>${dto.p_paydate}</span></td>
															</tr>
														</tbody>
													</table>
													<!-- 이용날짜와 현재 날짜 비교 해서 지났으면 생기도록 -->
													<br>
													<div>
														<a class="join_bt2"
															style="display: inline-block; margin-left: 30px;"
															href="/">이용자 후기 작성하기</a>
													</div>
												</div>
												<!-- 호텔 테이블 div -->
											</td>
											<c:choose>
												<c:when test="${status.count%2==0}"></c:when>
												<c:when test="${status.count%2!=0}"></c:when>
											</c:choose>

										</c:forEach>
									</tbody>
								</table>
							</div>
							<br><br>
							<br><br>
							<!-- 렌트카 결제내역 -->
							<div align="center">
								<h2>렌트카 결제 내역</h2>
								<div>
									<table>
										<tbody>
											<tr>
												<c:if test="${empty Prlist}">
													<td>등록된 관심 상품이 없습니다.</td>
												</c:if>
											</tr>

											<c:forEach var="dto" items="${Prlist}" varStatus="status">
												<td>
													<div align="center">
														<br> 
														<table>
															<tbody align="center">
																<!-- 사진을 누르면 해당 품목의 메인화면으로 a -->
																<tr>
																	<td>렌트카 이름</td>
																	<td><span>${dto.r_name}</span></td>
																</tr>
																<tr>
																	<td>렌트카 회사</td>
																	<td><span>${dto.r_company}</span></td>
																</tr>
																<tr>
																	<td>차 종</td>
																	<td><span>${dto.r_type}</span></td>
																</tr>
																<tr>
																	<td>예약날짜</td>
																	<td><span>${dto.receiptday}<br> ~
																			${dto.returnday}
																	</span></td>
																</tr>
																<tr>
																	<td>가 격</td>
																	<td><span>${dto.p_price}</span></td>
																</tr>
																<tr>
																	<td>결제날짜</td>
																	<td><span>${dto.p_paydate}</span></td>
																</tr>
															</tbody>
														</table>
														<br> 
													</div> <!-- 이용날짜와 현재 날짜 비교 해서 지났으면 생기도록 -->
													<div>
														<a class="join_bt2"
															style="display: inline-block; margin-left: 30px;"
															href="/">이용자 후기 작성하기</a>
													</div>
												</td>
												<c:choose>
													<c:when test="${status.count%2==0}">
													</c:when>
													<c:when test="${status.count%2!=0}">
													</c:when>
												</c:choose>

											</c:forEach>
										</tbody>
									</table>
									<br> <br> <br>
									<div align="center">
										<a class="join_bt"
											style="display: inline-block; margin-left: 30px;"
											href="main.my">마이페이지</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>


<%@ include file="/WEB-INF/views/bottom.jsp"%>