<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이	   름 : comm_togetherWF.jsp
	개  발   자 : 최 인 아
	설	   명 : 투게더글쓰기페이지
-->
<%@ include file="/WEB-INF/views/top.jsp"%> 
<script type="text/javascript">
	function check(){
		if (f.ttitle.value==""){
			alert("제목을 입력해주세요!!")
			f.ttitle.focus()
			return false
		}
		if (f.temail.value==""){
			alert("이메일을 입력해주세요!!")
			f.temail.focus()
			return false
		}
		if (f.tcontent.value==""){
			alert("내용을 입력해주세요!!")
			f.tcontent.focus()
			return false
		}
		return true
	}
</script>
<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3><img src="${pageContext.request.contextPath}/resources/img/낑깡logo.png" width="100" height="100">낑.같.따 글쓰기</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
<div class="section layout_padding">
<div align="center">
	<form name="f" action="comm_togetherWP.do" method="post" onsubmit="return check()">										
		<table width="600">
			<tr>
				<th width="20%" bgcolor="orange" align="center"><font color="white">작 성 자</font></th>
				<td><!-- <input type="text" name="tname" size="40"> -->${comm_nickname}</td>
			</tr>
			<tr>
				<th width="20%" bgcolor="brown" align="center"><font color="white">제 목</font></th>
				<td><input type="text" name="ttitle" size="40"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="orange" align="center"><font color="white">이메일</font></th>
				<td><input type="text" name="temail" size="40"></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="brown" align="center"><font color="white">내 용</font></th>
				<td><textarea name="tcontent" rows="10" cols="40"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="orange">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='comm_togetherList.do'">				
				</td>
			</tr>
		</table>
	</form>
</div>
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>