<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ include file="../top.jsp" %>
<script type="text/javascript">
		function dele(num){
			if (d.passwd.value==""){
				alert("비밀번호를 입력해 주세요!!")
				d.passwd.focus()
				return
			}
			document.d.action = "Q_deletepassok.board?num="+num;
			document.d.submit()
		}
		function upda(num){
			if (d.passwd.value==""){
				alert("비밀번호를 입력해 주세요!!")
				d.passwd.focus()
				return
			}
			document.d.action = "Q_updatepassok.board?num="+num;
			document.d.submit()
		}
		function cont(num){
			if (d.passwd.value==""){
				alert("비밀번호를 입력해 주세요!!")
				d.passwd.focus()
				return
			}
			document.d.action = "Q_contentpassok.board?num="+num;
			document.d.submit()
		}
	</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminmember.css">
<form name="d" method="post" enctype="multipart/form-data">
	    <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt"> <br>비밀번호를 입력하세요.</h2>
                    <div class="join_form">
                        <table>
                            <colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            </colgroup>
                            <tbody>                            
                               	<tr>
                                    <th><span>비밀번호</span></th>
                                    <td><input type="password" name="passwd" placeholder="비밀번호를 입력해주세요."></td>
                                </tr>
                         </tbody>
                        </table>
                    <div class="btn_wrap">
                    	<c:if test="${param.type==1 }">
                        <a href="javascript:cont('${num }')">확인</a>
                        </c:if>
                    	<c:if test="${param.type==2 }">
                        <a href="javascript:upda('${num }')">확인</a>
                        </c:if>
                    	<c:if test="${param.type==3 }">
                        <a href="javascript:dele('${num }')">확인</a>
                        </c:if>
                    </div>
                 </div>
            </div>
        </div>
    </div>
</form>
<%@ include file="../bottom.jsp" %>