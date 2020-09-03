<%@ include file="../top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	
	window.onload = function(){
		if(getCookie("id")){
			document.f.id.value = getCookie("id");
			document.f.useCookie.checked=true;
		}
	}
	function setCookie(coo,value,expiredays){
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate()+expiredays);
		document.cookie = coo+"="+escape(value)+";path=/;expires="+todayDate.toGMTString()+";"
	}
	function getCookie(coo){
		var search = coo+"=";
		if(document.cookie.length>0){
			offset = document.cookie.indexOf(search);
			if(offset!=-1){
				offset+=search.length;
				end=document.cookie.indexOf(";",offset);
				if(end==-1)
					end=document.cookie.length;
				return unescape(document.cookie.substring(offset,end));
			}
		}
	}
	
	function searchMember(mode){
		location.href="member_search.log?mode="+mode;
	}
	
	function loginCheck(){
		if(f.id.value==""){
			alert("ID를 입력해주세요")
			f.id.focus();
			return false;
		}
		if(f.passwd.value==""){
			alert("비밀번호를 입력해주세요")
			f.passwd.focus();
			return false;
		}
		if(document.f.useCookie.checked == true){
			setCookie("id",document.f.id.value,7);
		}else{
			setCookie("id",document.f.id.value,0);
		}
		document.f.submit();	
	}
</script>
<section id="four" class="wrapper style1 special fade-up">
	<div class="container">
						<header class="major">
							<h2>로그인</h2>
						</header>
		<form name="f" action="loginOk.log" method="post">
			<table width="60%" align="center" height="120">
				<tr>
					<td align="right" width="30%">아이디</td>
					<td width="40%"><c:if test="${value == null}">
							<input type="text" name="id" placeholder="아이디를 입력하세요."><input type="checkbox" name="useCookie">아이디저장
						</c:if> <c:if test="${value != null }">
							<input type="text" name="id" tabindex="1" value="${value}">
						</c:if></td>
					<td rowspan="2" width="30%" valign="middle">
					<a href="javascript:loginCheck()">로그인 <%-- <img
							src="${pageContext.request.contextPath}/resources/img/login.jpg" width="50" height="50"
							border="0" alt="로그인" tabindex="3"> --%>&nbsp;&nbsp;<br>
					</a>
					</td>
				</tr>
				<tr>
					<td align="right">비밀번호</td>
					<td><input type="password" name="passwd" tabindex="2" placeholder='비밀번호를 입력하세요.'></td>
				</tr>
				<tr>
					<td colspan="3" align="center">
					<a href="insertMember.mem">회원가입
					</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:searchMember('search_id')">ID찾기  	
					</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:searchMember('pw')">PW찾기
					</a>
					</td>
				</tr>
			</table>
		</form>
</div>
</section>
<%@ include file="../bottom.jsp"%>
