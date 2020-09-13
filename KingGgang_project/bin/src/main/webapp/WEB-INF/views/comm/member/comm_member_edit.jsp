<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section id="four" class="wrapper style1 special fade-up">
	<div class="container">		
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminmember.css">
<form name="join" method="post" action="comm_member_edit_ok.do?comm_memberNum=${comm_getMember.comm_memberNum }" 
							onsubmit="return check()" enctype="multipart/form-data">			
<div class="wrap wd668">
   <div class="container">
       <div class="form_txtInput">
         <h2 class="sub_tit_txt">회원수정</h2>
             <div class="join_form">
              <table>
                <colgroup>
                  <col width="30%"/>
                  <col width="auto"/>
               </colgroup>                           
               <tbody>
                 <input type="hidden" name="comm_memberNum" value="${comm_getMember.comm_memberNum}"/>
                 	<tr>
						<th><span>이름</span></th>
						<td><input type="text" name="comm_name" value="${comm_getMember.comm_name}" readOnly></td>
					</tr>
                 	<tr>
                 	
                      <th><span>닉네임</span></th>
                      <td><input type="text" name="comm_nickname" value="${comm_getMember.comm_nickname}"></td>
                 	</tr>  
                 	<tr>
                      <th><span>생년월일</span></th>
                      <td><input type="text" name="comm_birth" value="${comm_getMember.comm_birth}"></td>
                 	</tr>
                    <tr>      
  					<tr>
						<th><span>프로필사진</span></th>
						<td>
							<input type="file" name="filename">
							<%-- <input type="hidden" name="comm_profile_size" value="${comm_getMember.comm_profilesize}"> --%>
							<img src="http://localhost:8090/img/${comm_getMember.comm_profilename}" width="100" height="100">
						</td>
					</tr>
  					<tr>
						<th><span>자기소개</span></th>
						<td>
							<textarea name="comm_intro" rows="5" cols="60">${comm_getMember.comm_intro}</textarea>
						</td>
  					</tr>
                </tbody>
            </table>                 
         </div>                   
        </div>
<div class="btn_wrap">
                 		<input type="submit" value="조회" >
						<input type="button" value="취소" onclick="window.location='commhome.comm'" >
</div>
</div> 
</div>
</form>
<%@ include file="/WEB-INF/views/bottom.jsp"%>