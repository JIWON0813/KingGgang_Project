<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%-- <c:if test="${mbId=='admin' }"> --%>
<footer class="footer-box">
		<div class="container"> 
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3>관리자모드</h3>
								<ul class="menu_footer">
									<li><a href="memberList.mem">회원 목록</a></li>
									<li><a href="hotelList.hotel">호텔 목록보기</a></li>
									<li><a href="listRentcar.admin">렌트카 목록</a></li>
									<li><a href="listInsu.admin">렌트카_보험 목록</a></li>
									<li><a href="payList.admin">결제 목록으로 가기</a></li>
									<li><a href="commadmin.comm">돌하르방가기</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

<%-- <!-- 
	이	   름 : adminMain.jsp
	개  발   자 : 김 지 원
	설	   명 : 관리자모드 메인 페이지
 -->
<c:if test="${mbId=='admin' }">
<a href="insertHotel.admin">호텔 등록하기</a>
<br>
<a href="hotelList.hotel">호텔 목록보기</a>
<br>
<a href="main.mem">회원관리페이지로가기</a>
<br>
</c:if>
<c:if test="${mbId!='admin' }">
<script>
	alert("관리자만 접근 가능합니다.");
	history.back();
</script>
</c:if> --%>

<%@ include file="/WEB-INF/views/bottom.jsp"%>