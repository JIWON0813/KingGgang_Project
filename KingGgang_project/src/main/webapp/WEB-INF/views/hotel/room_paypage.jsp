<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
function check(){
	if(confirm("취소하시겠습니까?")){
		alert('취소되었습니다.');
		location.href="main.hotel";
	}
	else{
		return;
	}
	
}
</script>

<%@ include file="../top.jsp"%>
<h1 align="center">내 역 확 인</h1>
<div align="center">
<form action="payment.hotel" >
	<input type="hidden" name="id" value="${dto.id}" />
	<input type="hidden" name="price" value="${dto.totalprice}" />
	<table border="1" width="1000">
				<tr>
					<td colspan="2"><img src="http://192.168.0.184:8080/img/${roomdto.filename}"
						width="250" height="250">
					<td width="15%">방 이름
					<td>${roomdto.name}
				</tr>

				<tr>
				<td>예약날짜
				<td>${dto.startdate}
				<td>퇴실날짜
				<td>${dto.enddate}
				</tr>
					<tr>
					<td>총 결제 가격
					<td>${dto.totalprice}
					<td>결제 ID
					<td>${mbId}
				</tr>
				<tr>
				<td colspan="4" align="center">
				<input type="submit" value="결제하기">
				<input type="button" value="취소하기" onclick="javascript:check()">
				</td>
				</tr>
	</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>