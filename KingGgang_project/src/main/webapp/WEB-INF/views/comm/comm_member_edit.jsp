<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section id="four" class="wrapper style1 special fade-up">
	<div class="container">		
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminmember.css">
<form name="join" method="post" action="comm_member_edit_ok.do" onsubmit="return check()" enctype="multipart/form-data">			
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
                            <input type="hidden" name="memberNum" value="${getMember.memberNum}"/>
                               
                                <tr>
                                    <th><span>이메일</span></th>
                                    <td><input type="text" name="email" value="${getMember.email}"></td>
                                </tr>
                           
					<th><span>연락처</span></th>
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
				<th><span>프로필사진</span></th>
				<td><input type="file" name="profile_name" value="${getMember.profile_name}">
				</td>
			</tr>
  				<tr>
					<th><span>자기소개</span></th>
					<td>
						<textarea name="intro" rows="5" cols="60">${getMember.intro}</textarea>
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