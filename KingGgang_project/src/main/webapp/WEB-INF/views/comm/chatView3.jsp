<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>

<meta charset="UTF-8">
	<title>Chating</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h3{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 10px;
		}
		.chating{
			border: 1px solid #FFBB00;
			background-color: #FFFFFF;
			width: 500px;
			height: 500px;
			overflow: auto;
			padding: 5px 5px 5px 5px;
		}
		.chating .me{
			color: #3a1e02;
			text-align: right;
		
		}
		.chating .others{
			color: #FFE400;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
			display: none;
		}
		#back{
		float: right;
		width: 100px;
		color: #FFBB00;
		border: 1px solid #FFBB00;
		background: #FFFFFF;
		margin-bottom: 20px;
		 
		}
		
	</style>
</head>

<script type="text/javascript">
	wsOpen();

	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new SockJS("<c:url value="/echo"/>"+"?/${chatroom_id}");
		
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			console.log('소켓 열림');
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			console.log('메세지 수신');
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>나 :" + d.msgContent + "</p>");	
					}else{
						$("#chating").append("<p class='others'>" + d.userName + " :" + d.msgContent + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function chatName(){
		var userName = "${msgSender}";
			$("#yourMsg").show();
	}

	
	function send() {
		var option = {
			type: "message",
			chatroom_id : "${chatroom_id}",
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msgContent : $("#chatting").val(),
			msgSender : "${msgSender}",
			msgReceiver : "${msgReceiver}"
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
</script>
<body>
	<div id="container" class="container">
		<h3>${roomName}의 채팅방</h3>
		<input type="button" id ="back" value="돌아가기" onclick="history.back()">
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="userName" value="${msgReceiver}">
		<input type="hidden" id="chatroom_id" value="${chatroom_id}">
		<c:out value="${msgSender}"/>
		<div id="chating" class="chating">
		<c:forEach var="dto" items="${msgList}">
			<c:if test="${dto.msgSender eq msgSender}">
					<p id = "chat" align="right">${dto.msgContent}</p>
			</c:if>
		<c:if test="${dto.msgSender ne msgSender}">
				<p id = "chat" align="left">${dto.msgContent}</p>
		</c:if>
		
		</c:forEach>
		</div>
		
		<!-- <div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input type="text" name="userName" id="userName"></th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div> -->
		
		<div id="yourMsg">
			<table class="inputTable">
			<script type="text/javascript">
			chatName();
			</script>
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>