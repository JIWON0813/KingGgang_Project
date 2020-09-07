<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<!--  
	이	   름 : listRentcarReservation.jsp
	개  발   자 : 정 우 철
	설	   명 : 관리자 렌트카 예약 목록 페이지
	-->

<script type="text/javascript">
function del(id){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	    location.href="deleteInsu.admin?id="+id
	}else{   //취소
	    return
	}
	}
</script>
<div align="center">
	<b>렌 트 카 예 약 목 록</b>
	<table border="1" width="800">
		<tr bgcolor="green">
			<th>예약 번호</th>
			<th>회원ID</th>
			<th>보험ID</th>
			<th>예약시간</th>
			<th>수령 예정일</th>
			<th>반납 예정일</th>
			<th>반납 여부</th>
			<th>결제 금액</th>
			<th>결제 상태</th>
			<th>수정 / 삭제</th>
		</tr> 
	<c:if test="${empty resList}">		
		<tr>
			<td colspan="10">
				등록된 예약이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${resList}">		
		<tr align="center">
			<td>${dto.res_id}</td>
			<td>${dto.member_id}</td>
			<td>${dto.r_id}</td>
			<td>${dto.insu_id}</td>
			<td>${dto.reservationday}</td>
			<td>${dto.receiptday}</td>
			<td>${dto.returnday}</td>
			<td>${dto.returncomplete}</td>
			<td>${dto.price}</td>
			<td>${dto.pstatus}</td>
			<td>
			<input type="button" onclick="location.href='updateInsu.admin?id=${dto.id}'" value="수정">
			<input type="button" onclick="javascript:del(${dto.id})" value="삭제">
			</td>
		</tr>		
	</c:forEach>
	</table>
</div>	