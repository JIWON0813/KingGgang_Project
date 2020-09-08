<%@ include file="../adminMain.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function deleteCo(no){
		var dele = confirm("쿠폰을 삭제하시겠습니까?")	
		if(dele){
			window.location.href="deleteCoupon.co?no="+no
		}else{
			window.location.href="couponList.co"
		}
	}
</script>
	<div align="center">
		<table border="1" width="800">
		<tr bgcolor="skyblue">
			<th>쿠폰번호</th>
			<th>쿠폰이름</th>
			<th>할인율</th>
			<th>생성일</th>
			<th>소유회원</th>
			<th>수정|삭제</th>
		</tr>
		<c:if test="${empty couponList}">
			<tr>
					<td colspan="6">등록된 쿠폰이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${couponList }">
			<tr>
				<td>${dto.no }</td>
				<td>${dto.name}</td>
				<td>${dto.dis}%</td>
				<td>${dto.regdate }</td>
				<td>${dto.m_id }</td>
				<td><a href="updateCoupon.co?no=${dto.no }">수정</a>|<a href="javascript:deleteCo('${dto.no }')">삭제</a></td> 
			</tr>
		</c:forEach>
			<tr>
				<td colspan="6"><a href="insertCoupon.co">쿠폰생성</a></td>
			</tr>
		</table>
	</div>
<%@ include file="../adminbottom.jsp"%>