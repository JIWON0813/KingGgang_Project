<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<br><br><br><br>	
	<!--  
	이	   름 : updateInsuForm.jsp
	개  발   자 : 정 우 철
	설	   명 : 관리자 보험 수정 페이지
	-->    
    
	<script type="text/javascript">
		function check(){
			if (f.name.value==""){
				alert("보험명을 입력 해 주세요!!")
				f.name.focus()
				return
			}
			if (f.price.value==""){
				alert("보험료를 입력 해 주세요!!")
				f.price.focus()
				return
			}
			document.f.submit()
		}
		
	</script>
	<body>
		<form name="f" method="post" action="updateInsu_Ok.admin">
			<table width="600" align="center" border="1">
  				<tr>
					<td colspan="2" align=center>렌트카 등록</td>
 				</tr>
				<tr>
					<td width="150">보험사</td>
					<td class="m3">
						<input type="text" name="company" value="${insu.company}">
					</td>
				</tr>
				<tr>
					<td width="150">보험명</td>
					<td>
						<input type="text" name="name" value="${insu.name}">
					</td>
  				</tr>
  				<tr>
					<td width="150">24시간 기준 보험료</td>
					<td class="m3">
						<input type="text" name="price" value="${insu.price}">
					</td>
  				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href="javascript:check()">[전송]</a>
						<a href="listInsu.admin">[취소]</a>
					</td>
  				</tr>
  			</table>
  			<input type="hidden" name="id" value="${insu.id}">
		</form>
	</body>
<%@ include file="/WEB-INF/views/bottom.jsp"%>