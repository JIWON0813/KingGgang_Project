<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	window.onload = function(){
		if(getCookie("id")){
			document.login.id.value = getCookie("id");
			document.login.useCookie.checked=true;
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
	function check(){
		if(login.id.value==""){
			alert("ID를 입력해주세요")
			login.id.focus();
			return false;
		}
		if(login.passwd.value==""){
			alert("비밀번호를 입력해주세요")
			login.passwd.focus();
			return false;
		}
		if(document.login.useCookie.checked == true){
			setCookie("id",document.login.id.value,7);
		}else{
			setCookie("id",document.login.id.value,0);
		}
		document.login.submit();	
	}
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<form name = "login" action = "loginOk.log">
 <div  align="center" class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">로그인</h2>         
                    <div class="join_form">
                        <table>
                            <colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>아이디</th>
                                    <td><input type="text" name="id" placeholder="ID 를 입력하세요."><input type="checkbox" name="useCookie">아이디저장</td>
                                </tr>
                                <tr>
                                    <th>비밀번호</th>
                                    <td><input type="password" name="passwd" placeholder="비밀번호를 입력해주세요."></td>
                                </tr>
                            </tbody>                 
                        </table>           
                    </div>
                    <div class="btn_wrap">
                        <input type="button" value="로그인!!!" onclick="check()">
                    </div>
                </div> 
            </div>
        </div> 
        </form>
<%@ include file="/WEB-INF/views/bottom.jsp"%>

