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
<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3>글</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>

<%-- <div align="center">
<form action="insert.mark" method="post">
	<input type = "hidden" name= "comm_memberNum" value="${comm_memberNum}">
	<input type = "hidden" name= "type" value="${type}">
	<input type = "hidden" name= "boardNum" value="${boardNum}">
	
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
			<th align="center">태그</th>
			<td>
			<c:forEach var="tag" items="${tag}">
                  <a href="searchTag?tagId=${tag.tagId}&tagName=${tag.tagName}" style="color : blue;">#${tag.tagName} </a>
         	</c:forEach>
         	</td>
			<th align="right" width="10">
					<img src="${pageContext.request.contextPath}/resources/img/해녀.PNG" width="30" height="30">
			</th>
			<td width="10">
				<button type="button" id="btnMark" name="${dto.num}" onclick="marklist()">
				<a href="comm_bookMarkPro.do?boardNum=${getBoard.boardNum}&comm_memberNum=${comm_memberNum}">
					<img src="${ param.check1 == 1 ? './resources/img/orange.png' : './resources/img/한라산.png' }"  id="mark_img" width="30" height="30">
				<!-- </a> -->
				</button>
			</td>
		</tr>
		<tr>
			<th align="center">공개범위</th>
			<td colspan="4">${getBoard.look}</td>
		</tr>
	</table>
	</form>
</div>
<br> --%>

<!-- 댓글 -->
<div align="center">
<form name="f" action="reply_updatePro.do" method="post" onsubmit="return check()">
 <input type="hidden" id="replyNum" name="replyNum" value="${param.replyNum}"/>
 <table>
  <tr>
      <tr>
      	<td>
        	 작성자 : ${replyList.rwriter}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일 : <fmt:formatDate value="${replyList.rregdate}" pattern="yyyy-MM-dd"/>
        </td>
       </tr>
       <tr>
        <td>	 
        	 내 용 : ${getReply.rcontent}
      	</td>
        <td>
        	<input type="submit" value="댓글 수정" onclick="window.location='reply_updatePro.do?replyNum=${getReply.replyNum}'">
      		<input type="button" value="글목록" onclick="window.location='comm_content.do'">
      	</td>
  </tr>
  </table>
 </form>		
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>
<script>

function marklist() {
	
    	var obj = {"num" : $('#btnMark').attr('name')}
     
    	$.ajax({ url: "<c:url value="/bookmark" />", 
    		type: "POST", 
    		data: JSON.stringify(obj), 
    		dataType: "json", 
    		contentType: "application/json", 
    		
    		success: function(data) { alert("통신성공"); 
    		
    				var result1 = data
    				alert(result1);
    				if(result1.wstatus == 2){
                       $('img#mark_img').attr('src', './resources/img/orange.png');
                    } else {
                       $('img#mark_img').attr('src', './resources/img/한라산.png');
                    	}
    				}, 
    		error: function(errorThrown) { alert(errorThrown.statusText); } 
    		}); 
    	} 
</script>