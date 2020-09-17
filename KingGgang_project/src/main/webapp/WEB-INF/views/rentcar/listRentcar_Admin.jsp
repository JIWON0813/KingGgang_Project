<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/admin/admintop.jsp" %>
<br><br><br><br>
	<!--  
	이	   름 : listRentcar_Admin.jsp
	개  발   자 : 정 우 철
	설	   명 : 관리자 렌트카 목록 페이지
	-->
<style>
input{
border:1px solid green;
background-color:rgba(0,0,0,0);
color:green;
padding:5px;  
border-radius:5px;
}

input:hover{
color:white;
background-color:green;
}

</style>	
<script type="text/javascript">
function del(id){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	    location.href="deleteRentcar.admin?id="+id
	}else{   //취소
	    return
	}
	}
</script>
<div align="center">
	<b>렌 트 카 목 록</b>
	<br>
	<table border="1" width="800">
		<tr bgcolor="green" align="center">
			<th><font color="white">회사</font></th>
			<th width="40%"><font color="white">차량 이름</font></th>
			<th><font color="white">대차료</font></th>
			<th><font color="white">차량 분류</font></th>
			<th><font color="white">연료</font></th>
			<th><font color="white">예약 가능 여부</font></th>
			<th><font color="white">수정  / 삭제</font></th>
		</tr> 
	<c:if test="${empty rentcarList}">		
		<tr>
			<td colspan="6">
				등록된 차량이 없습니다.
			</td>
			<td>
				<input type="button" onclick="location.href='insertRentcar.admin'" value="차량 등록">
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${rentcarList}">		
		<tr align="center">
			<td>${dto.company}</td>
			<td>
				<a href="contentRentcar.admin?id=${dto.id}">
					${dto.name}
				</a>
			</td>
			<td>${dto.price}</td>
			<td>${dto.type}</td>
			<td>${dto.fuel}</td>
			<td>
			<c:if test="${dto.reservation == 0}">
			예약 가능
			</c:if>
			<c:if test="${dto.reservation == 1}">
			예약중
			</c:if>
			</td>
			<td>
			<input type="button" onclick="location.href='updateRentcar.admin?id=${dto.id}'" value="수정">
			<input type="button" onclick="javascript:del(${dto.id})" value="삭제">
			</td>
		</tr>		
	</c:forEach>
	</table>
	<div align="center">
	<br>
	<br>
	<input type="button" onclick="location.href='insertRentcar.admin'" value="차량 등록">
	<br>
	<br>
	<br>
	<a href="main.admin">관리자 홈으로 돌아가기</a>
	</div>
</div>
<%@ include file="/WEB-INF/views/admin/adminbottom.jsp"%>