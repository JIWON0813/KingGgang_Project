<%@ include file="../top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
<script>
 function cont(num){
	 var con = document.getElementById("content"+num);
	 var reviewdown = document.getElementById("reviewdown"+num);
	 var reviewup = document.getElementById("reviewup"+num);
	 if(con.style.display == 'none'){
		 reviewdown.style.display = 'none';
		 reviewup.style.display = '';
		 con.style.display = '';
	 }else{
		 reviewdown.style.display = '';
		 con.style.display = 'none';
	 }
 } 
 function deleRe(num){
		var dele = confirm("리뷰를 삭제하시겠습니까?")	
		if(dele){
			window.location.href="deleteReview.re?num="+num
		}else{
			window.location.href="memberList.mem"
		}
}
</script>
<div class="section layout_padding"></div>
<div class="container" align="center">
	<h3 align="center">Review</h3>
	<br>
	<table class="table table-striped">
		<thead>
		<tr bgcolor="#ff880e">
			<th width="3%">no</th>
			<th>이미지</th>
			<th width="50%" colspan="2">제목</th>
			<th width="20%">작성일</th>
			<th width="10%">ID</th>
		</tr> 
		</thead>
		<tbody>
		<tr>
		</tr>
	<c:if test="${empty listReview}">		
		<tr>
			<td colspan="5">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${listReview}">		
		<tr>
			<td>
				<c:out value="${startNum}"/>
			</td>
			<c:set var="startNum" value="${startNum-1}" />
			<td>
				<img src="http://192.168.0.184:8080/img/${dto.filename}" width="150" height="150">
			</td>
			<td>	
				<b>&nbsp;&nbsp;&nbsp;&nbsp;${dto.subject }</b>
				<br>
				<c:if test="${dto.type==1 }">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>▶호텔◀</b><br>
				</c:if>
				<c:if test="${dto.type==2 }">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>▶렌트카◀</b><br>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${dto.name }</b><br>				
				<br>
				<a href="javascript:cont('${dto.num }')" id="reviewdown${dto.num}" style="display:'';font-size:15px;color:gray;text-valign:bottom;">더 보기.. </a>	
			</td>
			<td width="5%">
				<c:choose>
				<c:when test="${dto.star==1 }">
				<div style="text-align:right;color:#ff880e;">★☆☆☆☆</div>
				<div style="text-align:right;color:gray;font-size:10px;">별로에요</div>	
				</c:when>
				<c:when test="${dto.star==2 }">
				<div style="text-align:right;color:#ff880e;">★★☆☆☆</div>
				<div style="text-align:right;color:gray;font-size:10px;">그냥 그래요</div>
				</c:when>
				<c:when test="${dto.star==3 }">
				<div style="text-align:right;color:#ff880e;">★★★☆☆</div>
				<div style="text-align:right;color:gray;font-size:10px;">보통이에요</div>
				</c:when>
				<c:when test="${dto.star==4 }">
				<div style="text-align:right;color:#ff880e;">★★★★☆</div>
				<div style="text-align:right;color:gray;font-size:10px;">좋아요</div>
				</c:when>
				<c:otherwise>
				<div style="text-align:right;color:#ff880e;">★★★★★</div>
				<div style="text-align:right;color:gray;font-size:10px;">아주 좋아요</div>
				</c:otherwise>
				</c:choose>
			</td>
			<td>${dto.regdate }</td>
			<td>
			${dto.m_id}
			<br>
			<c:if test="${mbId == dto.m_id || mbId == 'admin'}">
			<a href="javascript:deleRe('${dto.num }')">삭제</a>/
			<a href="updateReview.re?num=${dto.num }">수정</a>
			</c:if>
			</td>
		</tr>		
		<tr id="content${dto.num}" style="display:none;" align="center" height="150">
			<td colspan="2" bgcolor="white"></td>
			<td colspan="2" align="left" style="position:relative;">&nbsp;&nbsp;&nbsp;&nbsp;${dto.content }
			<a href="javascript:cont('${dto.num }')" id="reviewup${dto.num}" style="display:none;font-size:15px;color:gray;position:absolute;left:30px;bottom:10px;">접기▲</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	<hr>
	<c:if test="${mbId=='admin'}">
				<!-- <a class="btn btn-default pull-right" href="insertReview.re">글쓰기</a> -->
	</c:if>
		<c:if test="${count>0}">
		<ul>
			<c:if test="${startPage > pageBlock}">
				<li><a href="list.notice?pageNum=${startPage-1}">이전</a></li>	
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li><a href="list.notice?pageNum=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${endPage<pageCount}">
				<li><a href="list.notice?pageNum=${endPage+1}">다음</a></li>
			</c:if>
		</ul>
		</c:if>
	</div>
	<div class="section layout_padding"></div>
<%@ include file="../bottom.jsp" %>













