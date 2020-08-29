<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../index_top.jsp"%>
	<script type="text/javascript">

		function check(){
			if (f.id.value==""){
				alert("아이디를 입력해 주세요!!")
				f.id.focus()
				return
			}
			if (f.passwd.value==""){
				alert("비밀번호를 입력해 주세요!!")
				f.passwd.focus()
				return
			}
			document.f.submit()
		}
		  	
</script>
<section id="four" class="wrapper style1 special fade-up">
					<div class="container">
		<form name="f" method="post" action="member_input_ok.do" onsubmit="return check()" enctype="multipart/form-data">			
						<header class="major">
							<h2>회원가입</h2>
						</header>
			<table width="600" align="center">
			<%-- <input type="hidden" name="memberNum" value="${param.memberNum }"> --%>
 				<tr>
				<td width="150">프로필사진</td>
				<td><input type="file" name="profile_name">
				</td>
			</tr>	
				<tr>
					<td width="150">이름</td>
					<td>
						<input type="text" name="name">
					</td>
				</tr>
				<tr>
					<td width="150">성별</td>
					<td>
						<!--  <input type="radio" id="male" name="gender" value="남성">
						<input type="radio" id="female" name="gender" value="여성"> -->
						<select name="gender">
							<option value="male">남성</option>
							<option value="female">여성</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="150">아이디</td>
					<td>
						<input type="text" name="id">
					</td>
  				</tr>
  				<tr>
					<td width="150">비밀번호</td>
					<td>
						<input type="password" name="passwd">
					</td>
  				</tr>
  				<tr>
					<td width="150">이메일</td>
					<td>
						<input type="text" name="email" >
					</td>
  				</tr>
  				<tr>
					<td width="150">생년월일</td>
					<td>
						<input type="text" name="birth_y" 
													size="4" maxlength="4"> 년
						<input type="text" name="birth_m" class="box"
													size="2" maxlength="2"> 월
						<input type="text" name="birth_d" class="box"
													size="2" maxlength="2"> 일
					</td>
  				</tr>
  				<tr>
					<td width="150">연락처</td>
					<td>
						<input type="text" name="hp1"
													size="3" maxlength="3"> -
						<input type="text" name="hp2"
													size="4" maxlength="4"> -
						<input type="text" name="hp3"
													size="4" maxlength="4">
					</td>
  				</tr>
  				<tr>
					<td width="150">자기소개</td>
					<td>
						<textarea name="intro" rows="5" cols="60" class="box"></textarea>
					</td>
  				</tr>
  				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="조회" >
						<input type="reset" value="취소" >
					</td>
  				</tr>
  			</table>
		</form>
	</div>
</section>

<%@ include file="../index_bottom.jsp"%>