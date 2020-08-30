<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script type="text/javascript">
		function check(){
			if (f.name.value==""){
				alert("차량 이름을 입력 해 주세요!!")
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
		<form name="f" method="post" action="insertRentcar_Ok.admin"
		enctype="multipart/form-data">
			<table width="600" align="center" border="1">
  				<tr>
					<td colspan="2" align=center>렌트카 등록</td>
 				</tr>
				<tr>
					<td width="150">제조사</td>
					<td class="m3">
						<select name="company">
							<option value="현대" selected="selected">현대</option>
							<option value="기아">기아</option>
							<option value="르노삼성">르노 삼성</option>
							<option value="쉐보레">쉐보레</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="150">차량 분류</td>
					<td>
						<select name="type">
							<option value="경차">경차</option>
							<option value="세단" selected="selected">세단</option>
							<option value="SUV">SUV</option>
						</select>
					</td>
  				</tr>
  				<tr>
					<td width="150">24시간 기준 대여료</td>
					<td class="m3">
						<input type="text" name="price">
					</td>
  				</tr>
  				<tr>
					<td width="150">차량 이름</td>
					<td>
						<input type="text" name="name">
					</td>
  				</tr>
  				<tr>
					<td width="150">연료 종류</td>
					<td>
						<select name="fuel">
							<option value="휘발유">휘발유(가솔린)</option>
							<option value="경유">경유(디젤)</option>
							<option value="LPG">LPG</option>
							<option value="하이브리드">하이브리드</option>
						</select>
					</td>
  				</tr>
  				<tr>
					<th width="20%" bgcolor="orange">차량 사진</th>
					<td><input type="file" name="filename" size="30"></td>
				</tr>
				<tr>
					<th width="20%">상품소개</th>
					<td align="left">
					<textarea name="contents" rows="7" cols="60"></textarea>
					</td>
				</tr>
				<tr>
					<td width="150">업체명</td>
					<td class="m3">
						<input type="text" name="rentcom">
					</td>
				</tr>
				<tr>
					<td width="150">업체 번호</td>
					<td class="m3">
						<input type="text" name="renthp1" style="width:40px;" maxlength="3">-
						<input type="text" name="renthp2" style="width:40px" maxlength="4">-
						<input type="text" name="renthp3" style="width:40px" maxlength="4">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href="javascript:check()">[전송]</a>
						<a href="listRentcar.admin">[취소]</a>
					</td>
  				</tr>
  			</table>
		</form>
	</body>