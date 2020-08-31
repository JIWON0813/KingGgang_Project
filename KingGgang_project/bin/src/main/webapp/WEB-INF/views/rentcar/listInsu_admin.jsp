<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<b>렌 트 카 보 험 목 록</b>
	<table border="1" width="800">
		<tr bgcolor="green">
			<th>보험 번호</th>
			<th>보험사</th>
			<th width="40%">보험명</th>
			<th>보험료</th>
			<th>수정 / 삭제</th>
		</tr> 
	<c:if test="${empty insuList}">		
		<tr>
			<td colspan="5">
				등록된 보험이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${insuList}">		
		<tr align="center">
			<td>${dto.id}</td>
			<td>${dto.company}</td>
			<td>${dto.name}</td>
			<td>${dto.price}</td>
			<td>
			<input type="button" onclick="location.href='updateInsu.admin?id=${dto.id}'" value="수정">
			<input type="button" onclick="javascript:del(${dto.id})" value="삭제">
			</td>
		</tr>		
	</c:forEach>
	</table>
	<div align="center">
	<br>
	<br>
	<input type="button" onclick="location.href='insertInsu.admin'" value="보험 등록">
	</div>
</div>	