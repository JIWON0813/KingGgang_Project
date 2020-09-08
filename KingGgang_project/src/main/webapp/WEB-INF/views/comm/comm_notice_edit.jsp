<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이	   름 : comm_notice_edit.jsp
	개  발   자 : 황 지 은
	설	   명 : 공지사항 페이지
 -->
<%@ include file="/WEB-INF/views/top.jsp"%>
<script type="text/javascript">
	function comm_ncheck(){
		if (join.comm_ntitle.value==""){
			alert("제목을 입력하세요!!")
			join.comm_ntitle.focus()
			return
		}
		if (join.comm_ncontent.value==""){
			alert("내용을 입력하세요!!")
			join.comm_ncontent.focus()
			return
		}
		document.join.submit()
	}
	
</script>

<form name="join" action="comm_notice_edit_ok.do" enctype="multipart/form-data" method="post">
	 <div class="section layout_padding">
		<div class="container">
			<div class="form_txtInput">
				<h2 class="sub_tit_txt">공지사항수정</h2>
				<input type="hidden" name="comm_noticeNum" value="${comm_getNotice.comm_noticeNum}"/>
				<div class="join_form">
					<table>
						<colgroup>
							<col width="30%" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<!-- <input type="hidden" name="comm_memberNum"> -->
							<tr>
								<th><span>제목</span></th>
								<td><input type="text" name="comm_ntitle" value="${comm_getNotice.comm_ntitle}"></td>
							</tr>
							<tr>
							<tr>
								<th><span>글쓴이</span></th>
								<td><input type="text" name="comm_nnickname" value="${comm_nickname }" readOnly></td>
							</tr>
							<tr>
								<th><span>공개범위</span></th>
								<td><select name="comm_mode" value="${comm_getNotice.comm_mode}">
   									<option value="all" selected>전체공개</option>
    								<option value="member">회원공개</option>
    								<option value="alone">비공개</option>
									</select>	
								</td>
							</tr>
							<tr>
								<th><span>내용</span></th>
								<td>
									<textarea name="comm_ncontent" rows="5" cols="60">${comm_getNotice.comm_ncontent}</textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btn_wrap">
				<input type="button" value="조회" onclick="javascript:comm_ncheck()">
				<input type="button" value="취소" onclick="window.location='commadmin.comm'" >
			</div>
		</div>
	</div>
</form>
		<%@ include file="/WEB-INF/views/bottom.jsp"%>