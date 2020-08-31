<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script type="text/javascript">
		function check(){
			if (f.name.value==""){
				alert("보험명을 입력 해 주세요!!")
				f.id.focus()
				return
			}
			if (f.price.value==""){
				alert("보험료를 입력 해 주세요!!")
				f.paswd.focus()
				return
			}
			document.f.submit()
		}
		
	</script>
	<body>
		<form name="f" method="post" action="insertInsu_Ok.admin"
		enctype="multipart/form-data">
			<table width="600" align="center" border="1">
  				<tr>
					<td colspan="2" align=center>렌트카 등록</td>
 				</tr>
				<tr>
					<td width="150">보험사</td>
					<td class="m3">
						<input type="text" name="company">
					</td>
				</tr>
				<tr>
					<td width="150">보험명</td>
					<td>
						<input type="text" name="name">
					</td>
  				</tr>
  				<tr>
					<td width="150">24시간 기준 보험료</td>
					<td class="m3">
						<input type="text" name="price">
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