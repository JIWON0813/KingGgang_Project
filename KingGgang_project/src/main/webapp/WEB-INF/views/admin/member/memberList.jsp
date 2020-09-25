<%@ include file="../admintop.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

 #member_button input{

	 border:1px solid skyblue;

      background-color:rgba(0,0,0,0);

      color:skyblue;

      padding:5px;

      

      border-radius:5px;

 }

 

	#member_button input:hover{

  	color:white;

    background-color:skyblue;

 

 }

 

</style>

<script type="text/javascript">
	function deleMem(memberNum){
		var dele = confirm("회원을 삭제하시겠습니까?")	
		if(dele){
			window.location.href="deletePro.mem?memberNum="+memberNum
		}else{
			window.location.href="memberList.mem"
		}
	}
	function search(){
		if(f.searchString.value==""){
			alert("검색어를 입력하세요")
			f.searchString.focus();
			return;
		}
		var blank = /^\s+|\s+$/g;
		if(f.searchString.value.replace( blank, '' ) == "" ){
		    alert("검색어를 입력하세요");
		    return;
		}
		document.f.submit();
	}
	
</script>

	<div class="wrap wd668" align="center">

            <div class="container">

                <div class="form_txtInput">

                    <h2 class="sub_tit_txt">회원목록</h2>

		<table width="900">

		<tr bgcolor="skyblue" align="center">

			<th width="70">회원번호</th>

			<th>아이디</th>

			<th>이름</th>

			<th>성별</th>

			<th>생년월일</th>

			<th>이메일</th>

			<th>연락처</th>

			<th>가입일</th>

			<th>상세보기</th>
			
			<th>수정 | 삭제</th>

		</tr>

		<c:if test="${empty memberList}">

			<tr>

					<td colspan="11">등록된 회원이 없습니다.</td>

			</tr>

		</c:if>

		

		<c:forEach var="dto" items="${memberList }">

			<tr align="center">

				<td>${dto.memberNum }</td>

				<td>${dto.id }</td>

				<td>${dto.name}</td>

				<td>${dto.gender}</td>

				<td>${dto.getAllBirth() }</td>

				<td>${dto.email }</td>

				<td>${dto.getAllHp() }</td>

				<td>${dto.regdate }</td>

				<td><a href="memberContent.mem?memberNum=${dto.memberNum }">상세보기</a></td> 
				
				<td><a href="updateForm.mem?memberNum=${dto.memberNum}">수정</a>|<a href="javascript:deleMem('${dto.memberNum}')">삭제</a>

			</tr>

		</c:forEach>

		</table>
		<c:if test="${count>0}">
			<c:if test="${startPage > pageBlock}">
				[<a href="memberList.mem?pageNum=${startPage-1}">이전</a>]
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				[<a href="memberList.mem?pageNum=${i}">${i}</a>]
			</c:forEach>
			<c:if test="${endPage<pageCount}">
				[<a href="memberList.mem?pageNum=${endPage+1}">다음</a>]
			</c:if>
		</c:if>
		<br><br>
		<form name="f" action="memberSearch.mem" method="post">
		<input type="hidden" name="mode" value="find"/>
		<select name="search">
			<option value="id">아이디</option>
			<option value="name">이름</option>
		</select>
		<input type="text" name="searchString">
		<a href="javascript:search()" id="member_button">
		<input type="button" value="찾기">
		</a>
		</form>
			<a id="member_button" href="insertMember.mem">
				<input type="button" value="회원등록">
			</a>
			<a id="member_button" href="memberList.mem">
				<input type="button" value="전체보기">
			</a>

		<br><br>

			<a href="main.admin">관리자 홈으로 돌아가기</a>

	</div>

	</div>

	</div>

<%@ include file="../adminbottom.jsp"%>