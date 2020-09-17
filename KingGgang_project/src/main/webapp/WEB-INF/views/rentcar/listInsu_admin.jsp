<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/admintop.jsp" %>
<br><br><br><br>	
	<!--  
	이	   름 : listInsu_Admin.jsp
	개  발   자 : 정 우 철
	설	   명 : 관리자 보험 목록 페이지
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
	    location.href="deleteInsu.admin?id="+id
	}else{   //취소
	    return
	}
	}
</script>
<div align="center">
	<b>렌 트 카 보 험 목 록</b>
	<br>
	<table border="1" width="800">
		<tr bgcolor="green" align="center">
			<th><font color="white">보험 번호</font></th>
			<th><font color="white">보험사</font></th>
			<th width="40%"><font color="white">보험명</font></th>
			<th><font color="white">보험료</font></th>
			<th><font color="white">수정  / 삭제</font></th>
		</tr> 
	<c:if test="${empty insuList}">		
		<tr>
			<td colspan="4">
				등록된 보험이 없습니다.
			</td>
			<td>
				<input type="button" onclick="location.href='insertInsu.admin'" value=" 보험  등록 ">
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
	<br>
	<br>
	<br>
	<a href="main.admin">관리자 홈으로 돌아가기</a>
	</div>
</div>
<%@ include file="/WEB-INF/views/admin/adminbottom.jsp"%>