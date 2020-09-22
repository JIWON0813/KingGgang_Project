<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/top.jsp"%>
<br><br><br><br>	
	<!--  
	이	   름 : contentRentcar_Admin.jsp
	개  발   자 : 정 우 철
	설	   명 : 관리자 렌트카 상세 페이지
	-->
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
	<table border="1" width="50%">
		<tr>
			<th width="15%" class="m2">차량 번호</th>
			<td width="35%" align="center">${rentcar.id}</td>
			<th width="15%" class="m2">차량 분류</th>
			<td width="35%" align="center">${rentcar.type}</td>
		</tr>
		<tr>
			<th width="15%" class="m2">상품명</th>
			<td width="35%" align="center">${rentcar.name}</td>
			<th width="15%" class="m2">제조회사</th>
			<td width="35%" align="center">${rentcar.company}</td>
		</tr>
		<tr>
			<th width="15%" class="m2">사진</th>
			<td width="40%" align="center" colspan="3">
				<img src="http://192.168.0.184:8080/img/${rentcar.filename}" style="width:450px; height:400px auto;">
			</td>
		</tr>
		<tr>
			<th width="15%" class="m2">업체명</th>
			<td width="35%" align="center">${rentcar.rentcom}</td>
			<th width="15%" class="m2">업체 번호</th>
			<td width="35%" align="center">${rentcar.renttel}</td>
		</tr>
		<tr>
			<th width="30%">예약 가능 여부</th>
			<td align="center" colspan="4">
				<c:if test="${rentcar.reservation == 0}">
					예약 없음
				</c:if>
				<c:if test="${rentcar.reservation == 1}">
					예약중
					<br>
					<c:forEach var="dto" items="${rentcarRes}">
						[${dto.receiptday}~${dto.returnday}]
						<br>
					</c:forEach>
				</c:if>
			</td>
			
		</tr>
		<tr>
			<th width="15%" class="m2">차량 소개</th>
			<td width="85%" colspan="3">
				<textarea name="contents" rows="5" cols="80" readOnly>${rentcar.contents}
				</textarea>
			</td>
		</tr>
	</table>
	<input type="button" value="돌아가기" 
				onClick="window.location='listRentcar.admin'">
	<input type="button" 
				onClick="location.href='updateRentcar.admin?id=${rentcar.id}'" value="수정">
	<input type="button" 
				onClick="javascript:del(${rentcar.id})" value="삭제">
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>