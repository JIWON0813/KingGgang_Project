<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!--  
	이	   름 : contentRentcar.jsp
	개  발   자 : 정 우 철
	설	   명 : 회원 렌트카 상세 페이지
	-->
  <script type="text/javascript">
  function showPopup(id)
  { window.open("reservation.rentcar?id="+id, "렌트카 예약 페이지", "width=1024, height=760, left=100, top=50"); }
  </script>
<div align="center">
	<table border="1" width="50%">
		<caption>차량 상세 보기</caption>
		<tr>
			<th width="15%">차량 번호</th>
			<td width="35%" align="center">${rentcar.id}</td>
			<th width="15%">차량 분류</th>
			<td width="35%" align="center">${rentcar.type}</td>
		</tr>
		<tr>
			<th width="15%">상품명</th>
			<td width="35%" align="center">${rentcar.name}</td>
			<th width="15%">제조회사</th>
			<td width="35%" align="center">${rentcar.company}</td>
		</tr>
		<tr>
			<th width="15%">사진</th>
			<td width="40%" align="center" colspan="3">
				<img src="http://localhost:8080/img/${rentcar.filename}" style="width:450px; height:400px auto;">
			</td>
		</tr>
		<tr>
			<th width="15%">업체명</th>
			<td width="35%" align="center">${rentcar.rentcom}</td>
			<th width="15%">업체 번호</th>
			<td width="35%" align="center">${rentcar.renttel}</td>
		</tr>
		<tr>
			<th width="30%">예약 가능 여부</th>
			<td align="center" colspan="4">
				<c:if test="${rentcar.reservation == 0}">
					예약 가능
				</c:if>
				<c:if test="${rentcar.reservation == 1}">
					예약중
				</c:if>
			</td>
			
		</tr>
		<tr>
			<th width="15%">차량 소개</th>
			<td width="85%" colspan="3">
				<textarea name="contents" rows="5" cols="80" readOnly>${rentcar.contents}
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="button" value="돌아가기" 
									onclick="window.location='main.rentcar'">
				<input type="button" value="예약하기"
									onclick="javascript:showPopup(${rentcar.id})">
			</td>
		</tr>
	</table>
</div>