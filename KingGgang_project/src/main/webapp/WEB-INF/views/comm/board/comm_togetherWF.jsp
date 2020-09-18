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
<style>
	 #input_group input{
		border:1px solid brown;
		background-color:rgba(0,0,0,0);
		color:brown;
		padding:5px;
		border-radius:5px;
	}
	textarea {
		border:1px solid brown;
		border-radius:5px;
	}
	
	input.te {
		border:1px solid brown;
		border-radius:5px;
	}
	#input_group input:hover{
		color:white;
		background-color:brown;
	}

</style>

<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3><img src="${pageContext.request.contextPath}/resources/img/낑깡logo.png" width="100" height="100">글 작성</h3>
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
		<table>
			<tr align="center">
				<th width="20%" bgcolor="orange"><font color="white">작 성 자</font></th>
				<td align="center">${comm_nickname}</td>
			</tr>
			<tr align="center">
				<th width="20%" bgcolor="brown"><font color="white">제 목</font></th>
				<td><input type="text" name="ttitle" size="48" class="te"></td>
			</tr>
			<tr align="center">
				<th width="20%" bgcolor="orange"><font color="white">이메일</font></th>
				<td><input type="text" name="temail" size="48" class="te"></td>
			</tr>
			<tr align="center">
				<th width="20%" bgcolor="brown"><font color="white">내 용</font></th>
				<td><textarea name="tcontent" rows="10" cols="50"></textarea></td>

			</tr>
			<tr>
				<td colspan="2" align="center" id="input_group">
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