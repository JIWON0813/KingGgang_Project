<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 
	이	   름 : comm_content.jsp
	개  발   자 : 최 인 아
	설	   명 : 상세보기
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<<<<<<< HEAD
<style>
      #btnLike,#btnMark{
         border:0;
         background-color:white;
      }
   </style>
=======
>>>>>>> branch 'ina2' of https://github.com/JIWON0813/KingGgang_Project.git
<script>
//좋아요
function LikeAction() {
	
    	var obj = {"boardNum" : $('#btnLike').attr('name')}
     
    	$.ajax({ url: "<c:url value="/insDelLike" />", 
    		type: "POST", 
    		data: JSON.stringify(obj), 
    		dataType: "json", 
    		contentType: "application/json", 
    		
    		success: function(data) { alert("통신성공"); 
    		
    				var result1 = data
    				alert(result1);
    				
    				if(result1.wstatus == 2){
                       $('img#likeImg').attr('src', './resources/img/empty_heart.PNG');
                    } else {
                       $('img#likeImg').attr('src', './resources/img/heart.png');
                    	}
    				$('#likeCount').text(result1.likeCount)
    				}, 
    		error: function(errorThrown) { alert(errorThrown.statusText); } 
    		}); 
    	} 
    	
   </script>
   
   <script>
	//북마크
	function marklist() {
	
    	var obj = {"boardNum" : $('#btnMark').attr('name')}
     
    	$.ajax({ url: "<c:url value="/bookmark" />", 
    		type: "POST", 
    		data: JSON.stringify(obj), 
    		dataType: "json", 
    		contentType: "application/json", 
    		
    		success: function(data) { alert("통신성공");
    		
    				var result1 = data
    				alert(result1);
    				if(result1.wstatus == 2){
                       $('img#mark_img').attr('src', './resources/img/box.png');
                    } else {
                       $('img#mark_img').attr('src', './resources/img/heartbox.png');
                    	}
    				}, 
    				
    		error: function(errorThrown) { alert(errorThrown.statusText); } 
    		}); 
    	} 
	</script>
	
	<style>
		#btnLike,#btnMark{
			border:0;
			background-color:white;
		}
	</style>
   
<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3><img src="${pageContext.request.contextPath}/resources/img/낑깡logo.png" width="100" height="100">글</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>

<div align="center">
	<table width="400">
	<tr>
		<td align="right" colspan="4">
			<p onclick="confirm('신고하시겠습니까? 버튼을 눌러주세요')">신고
				<a href="comm_warnPro.do?boardNum=${getBoard.boardNum}&comm_memberNum=${comm_memberNum}"><img src="${pageContext.request.contextPath}/resources/img/warn.png" width="21" height="21"></a></p>
		</td>
	</tr>
	<tr>
		<td align="left" colspan="4">
		 	<a href="comm_otherPage.do?comm_memberNum=${memberNum}"><img src="http://localhost:8080/img/${comm_profilename}" width="50" height="50">&nbsp;&nbsp;[   ${comm_nickname}   ]</a>
		</td>
	</tr>
	<br>
	<br>
	<c:if test="${getBoard.file_size != 0}">
		<tr align="center">
			 <td align="center" colspan="4">
			 	<img src="http://localhost:8080/img/${getBoard.file_name}" width="400" height="400">
			 </td>
		</tr>
	</c:if>
	
		<tr height="80">
			<td colspan="4">${getBoard.content}</td>
		</tr>
	
		<tr height="30">
			<th align="center" width="40">태그</th>
			<td colspan="2">
			<c:forEach var="tag" items="${tag}">
                  <a href="searchTag?tagId=${tag.tagId}&tagName=${tag.tagName}" style="color : blue;">#${tag.tagName} </a>
         	</c:forEach>
         	</td>
			<th align="right" width="10">
<<<<<<< HEAD
				<button type="button" id="btnLike" name="${getBoard.boardNum}" onclick="LikeAction()" >
       			<img src="${ check1 == 1 ? './resources/img/empty_heart.PNG' : './resources/img/heart.png' }" id="likeImg" height="50px" width="50px">
=======
				<button type="button" id="btnLike" name="${getBoard.boardNum}" onclick="LikeAction()">
       				<img src="${ check1 == 1 ? './resources/img/empty_heart.PNG' : './resources/img/heart.png' }" id="likeImg" width="30" height="30">
>>>>>>> branch 'ina2' of https://github.com/JIWON0813/KingGgang_Project.git
   				</button>
   				<span id="likeCount">${likeCount}</span>			
   			</th>
		</tr>
		<tr>
			<th align="center" width="40">공개범위</th>
			<td colspan="2">${getBoard.look}</td>
			<td  align="right" width="10">
				<button type="button" id="btnMark" name="${getBoard.boardNum}" onclick="marklist()">
					<img src="${ check2 == 1 ? './resources/img/box.png' : './resources/img/heartbox.png' }"  id="mark_img" width="30" height="30">
				</button>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="4">
			 <c:if test="${loginNum == memberNum}">
				<input type="button" value="글수정"
				onclick="window.location='comm_updateForm.do?boardNum=${getBoard.boardNum}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제"
				onclick="window.location='comm_deletePro.do?boardNum=${getBoard.boardNum}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록" onclick="window.location='comm_myPage.do'">
			 </c:if>
			 <c:if test="${loginNum != memberNum}">
			 	<input type="button" value="뒤로가기" onclick="history.back()">
			 </c:if>
			</td>
		</tr>
	</table>
<!-- 	</form> -->
</div>
<br>
<hr color="pink">
<div align="center">
<form name="replyForm" action="comm_writeReplyPro.do" method="post">
  <input type="hidden" id="boardNum" name="boardNum" value="${param.boardNum}">
  <table>
    <tr>
    	<th width="85">댓글 작성자</th>
    	<td><input type="text" id="rwriter" name="rwriter"></td>
    	
    	<th width="85">비 밀 번 호</th>
    	<td><input type="password" id="rpasswd" name="rpasswd"></td>
    </tr>
    
    <tr>
   		 <th width="85">댓글 내용</th>
   		 <td><input type="text" id="rcontent" name="rcontent"></td>
   		 <td colspan=2 align="center"><input type="submit" value="작성"></td>
    </tr>
  </table>
</form>
</div>
<hr color="pink">
<br>

<!-- 댓글 -->
<div align="center">
<form name="f" method="post" onsubmit="return check()">
 <input type="hidden" id="replyNum" name="replyNum" value="${param.replyNum}"/>
 <table>
  <tr>
   <c:if test="${empty replyList}">
	      <p>등록된 댓글이 없습니다.</p>
	</c:if>   
    <c:forEach items="${replyList}" var="replyList">
      <tr>
      	<td>
        	 작성자 : ${replyList.rwriter}<%-- ${replyList.rwriter} --%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일 : <fmt:formatDate value="${replyList.rregdate}" pattern="yyyy-MM-dd"/>
        </td>
       </tr>
       <tr>
        <td>	 
        	 내 용 : ${replyList.rcontent}
      	</td>
        <td> 
      		<input type="button" value="댓글 삭제" onclick="window.location='reply_deletePro.do?replyNum=${replyList.replyNum}&boardNum=${getBoard.boardNum}'">
      	</td>
      	<tr>
      		<td>
      			<img src="${pageContext.request.contextPath}/resources/img/line.PNG">
      		</td>
      	</tr>
    </c:forEach>   
  </tr>
  </table>
 </form>		
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>
