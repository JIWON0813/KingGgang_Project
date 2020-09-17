<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이	   름 : comm_writeForm.jsp
	개  발   자 : 최 인 아
	설	   명 : 글쓰기폼
 -->
<%@ include file="/WEB-INF/views/top.jsp"%>

<script type="text/javascript">
	function check(){
		if (f.file_name.value==""){
			alert("사진을 등록하세요!!")
			f.file_name.focus()
			return false
		}
		if (f.content.value==""){
			alert("내용을 입력하세요!!")
			f.content.focus()
			return false
		}
		if (f.look.checked == false){
			alert("공개범위를 선택해주세요!!")
			f.look.focus()
			return false
		}
		return true
}
</script>

<style>

	#input_group input {
		border:1px solid red;
		background-color:rgba(0,0,0,0);
		color:red;
		padding:5px;
		
		border-radius:5px;
	}
	
	#input_group input:hover{
		color:white;
		background-color:red;
	}

</style>

<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3><img src="${pageContext.request.contextPath}/resources/img/낑깡logo.png" width="100" height="100">새 게시글</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
<div class="section layout_padding" align="center">
	<form name="f" action="comm_writePro.do" method="post" onsubmit="return check()" enctype="multipart/form-data">
		<table width="600">
			<tr>
				<th width="150" align="center"><img src="${pageContext.request.contextPath}/resources/img/flower.png" width="30" height="30">사진명</th>
				<td><input type="file" name="file_name"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" placeholder="내용을 입력하세요.." cols="100" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<th width="150" align="center"><img src="${pageContext.request.contextPath}/resources/img/flower.png" width="30" height="30">태그하기</th>
				<td><input type="text" name="hashtag" placeholder="#태그를 입력하세요"></td>
			</tr>
			<tr>
				<th width="150"><img src="${pageContext.request.contextPath}/resources/img/flower.png" width="30" height="30">공개범위</th>
				<td>
					전체공개 <input type="checkbox" name="look" value="전체공개" />
					&nbsp;
           			회원공개 <input type="checkbox" name="look" value="회원공개" />
           			&nbsp;
					비공개 <input type="checkbox" name="look" value="비공개" />			
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" id="input_group">
					<input type="submit" value="글쓰기" >
					<input type="reset" value="다시작성">	
					<input type="button" value="뒤로가기" onclick="window.location='comm_myPage.do'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>