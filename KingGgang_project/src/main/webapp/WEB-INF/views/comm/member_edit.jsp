<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="index_top.jsp"%>
	<script type="text/javascript">

		function check(){
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
		<form name="f" method="post" action="member_edit_ok.do" onsubmit="return check()" enctype="multipart/form-data">			
		<input type="hidden" name="memberNum" value="${getMember.memberNum}"/>
						<header class="major">
							<h2>게시물 수정</h2>
						</header>
			<table width="600" align="center">
 				<tr>
				<td width="150">프로필사진</td>
				<td><input type="file" name="profile_name" value="${getMember.profile_name}">
				<input type="hidden" name="profile_size" value="${getMember.profile_size}">
				</td>
			</tr>
				<tr>
					<td width="150">이름</td>
					<td>
						<input type="text" name="name" value="${getMember.name}" readOnly>
					</td>	
  				<tr>
  				<tr>
					<td width="150">성별</td>
					<td>
						
						<select name="gender" value="${getMember.gender}" readOnly>
							<option value="male">남성</option>
							<option value="female">여성</option>
						</select>
					</td>
				</tr>
				<tr>
				<tr>
					<td width="150">아이디</td>
					<td>
						<input type="text" name="id" value="${getMember.id}" readOnly>
					</td>
  				</tr>
  				<tr>
					<td width="150">비밀번호</td>
					<td>
						<input type="password" name="passwd" value="${getMember.passwd}">
					</td>
  				</tr>
  				<tr>
					<td width="150">이메일</td>
					<td>
						<input type="text" name="email" value="${getMember.email}">
					</td>
  				</tr>
  				<tr>
					<td width="150">생년월일</td>
					<td>
						<input type="text" name="birth_y" 
													size="4" maxlength="4" value="${getMember.birth_y}"> 년
						<input type="text" name="birth_m" class="box"
													size="2" maxlength="2" value="${getMember.birth_m}"> 월
						<input type="text" name="birth_d" class="box"
													size="2" maxlength="2" value="${getMember.birth_d}"> 일
					</td>
  				</tr>
  				<tr>
					<td width="150">연락처</td>
					<td>
						<input type="text" name="hp1"
													size="3" maxlength="3" value="${getMember.hp1}"> -
						<input type="text" name="hp2"
													size="4" maxlength="4" value="${getMember.hp2}"> -
						<input type="text" name="hp3"
													size="4" maxlength="4" value="${getMember.hp3}">
					</td>
  				</tr>
  				<tr>
					<td width="150">자기소개</td>
					<td>
						<textarea name="intro" rows="5" cols="60" value="${getMember.intro}"></textarea>
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
<%@ include file="index_bottom.jsp"%>