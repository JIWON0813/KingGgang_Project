<%@ include file="/WEB-INF/views/top.jsp"%>
<br><br><br><br>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!--  
	이	   름 : updateRentcarForm.jsp
	개  발   자 : 정 우 철
	설	   명 : 관리자 렌트카 수정 페이지
	-->

	<script type="text/javascript">
		function check(){
			if (f.name.value==""){
				alert("차량 이름을 입력  해 주세요!!")
				f.id.focus()
				return
			}
			if (f.price.value==""){
				alert("대여료를 입력 해 주세요!!")
				f.paswd.focus()
				return
			}
			document.f.submit()
		}
		
	</script>
	<body>
		<form name="f" method="post" action="updateRentcar_Ok.admin"
		enctype="multipart/form-data">
			<table width="600" align="center" border="1">
  				<tr>
					<td colspan="2" align=center class="m2">렌트카 수정</td>
 				</tr>
				<tr>
					<td width="150" class="m3">제조사</td>
					<td class="m3">
						<select name="company">
							<option value="현대" 
								<c:if test="${rentcar.company eq '현대'}">
									selected
								</c:if>
								>현대
							</option>
							<option value="기아"
								<c:if test="${rentcar.company eq '기아'}">
									selected
								</c:if>
								>기아
							</option>
							<option value="르노삼성"
								<c:if test="${rentcar.company eq '르노삼성'}">
									selected
								</c:if>
								>르노 삼성
							</option>
							<option value="쉐보레"
								<c:if test="${rentcar.company eq '쉐보레'}">
									selected
								</c:if>
								>쉐보레
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="150" class="m3">차량 분류</td>
					<td class="m3">
						<select name="type">
								
							<option value="경차"
							<c:if test="${rentcar.type eq '경차'}">
									selected
							</c:if>
								>경차
							</option>
							<option value="세단"
							<c:if test="${rentcar.type eq '세단'}">
									selected
							</c:if>
								>세단
							</option>
							<option value="SUV"
							<c:if test="${rentcar.type eq 'SUV'}">
									selected
							</c:if>
								>SUV
							</option>
						</select>
					</td>
  				</tr>
  				<tr>
					<td width="150">24시간 기준 대여료</td>
					<td>
						<input type="text" name="price" value="${rentcar.price}">
					</td>
  				</tr>
  				<tr>
					<td width="150">차량 이름</td>
					<td>
						<input type="text" name="name" value="${rentcar.name}">
					</td>
  				</tr>
  				<tr>
					<td width="150">연료 종류</td>
					<td>
						<select name="fuel">
							<option value="휘발유"
							<c:if test="${rentcar.fuel eq '휘발유'}">
									selected
							</c:if>
								>휘발유(가솔린)
							</option>
							<option value="경유"
							<c:if test="${rentcar.fuel eq '경유'}">
									selected
							</c:if>
								>경유(디젤)
							</option>
							<option value="LPG"
							<c:if test="${rentcar.fuel eq 'LPG'}">
									selected
							</c:if>
								>LPG
							</option>
							<option value="하이브리드"
							<c:if test="${rentcar.fuel eq '하이브리드'}">
									selected
							</c:if>	
								>하이브리드
							</option>
						</select>
					</td>
  				</tr>
  				<tr>
					<th width="20%" bgcolor="orange">차량 사진</th>
					<td><input type="file" name="filename" size="30">
						<c:if test="${!(rentcar.filename == null)}">
							현재 사진 이름 : ${rentcar.filename}
						</c:if>
					</td>
				</tr>
				<tr>
					<th width="20%">상품소개</th>
					<td align="left">
					<textarea name="contents" rows="7" cols="60">${rentcar.contents}</textarea>
				</td>
				</tr>
				<tr>
					<td width="150">업체명</td>
					<td>
						<input type="text" name="rentcom" value="${rentcar.rentcom}">
					</td>
				</tr>
				<tr>
					<td width="150">업체 번호</td>
					<td>
						<input type="text" name="renthp1" style="width:40px;" maxlength="3" value="${rentcar.renthp1}">-
						<input type="text" name="renthp2" style="width:40px" maxlength="4" value="${rentcar.renthp2}">-
						<input type="text" name="renthp3" style="width:40px" maxlength="4" value="${rentcar.renthp3}">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href="javascript:check()">[전송]</a>
						<a href="listRentcar.admin">[취소]</a>
					</td>
  				</tr>
  				<tr>
  				<td><input type="hidden" name="ogFilename" value="${rentcar.filename}"></td>
  				<td><input type="hidden" name="ogFilesize" value="${rentcar.filesize}"></td>
  				<td><input type="hidden" name="id" value="${rentcar.id}"></td>
  				<td><input type="hidden" name="pickupplace" value="${rentcar.pickupplace}"></td>
  				<td><input type="hidden" name="lat" value="${rentcar.lat}"></td>
  				<td><input type="hidden" name="lng" value="${rentcar.lng}"></td>
  				</tr>
  			</table>
		</form>
	</body>
<%@ include file="/WEB-INF/views/bottom.jsp"%>