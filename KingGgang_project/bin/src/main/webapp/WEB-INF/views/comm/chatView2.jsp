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

<body>
<textarea rows="5" cols="30" id="chatMessageArea"></textarea>
<br> 메세지 : <input type="text" id = "message">
<br> 상대아이디 : ${msgReceiver} <input type="text" id = "targetUser">
<br> 보내는사람 : ${msgSender}
<br> <input type="button" id = "sendBtn" value="전송">

<script type="text/javascript">
	
 function connect() {
	 sock = new SockJS("<c:url value="/echo"/>");
	    sock.onopen = function() {
	        console.log('open');
	    };
	    sock.onmessage = function(evt) {
	    	console.log('메세지받음');
    	 var data = e.date;
    	   console.log(data)
  		  
    	   addMsg(data);
	    };
	    sock.onclose = function() {
	        console.log('close');
	    };
	}

	function addMsg(msg){
		var chat = $('#chatMessageArea').val();
		chat = chat + "\n상대방 : " + msg;
		$('#chatMessageArea').val(chat);
	}

	function register(){
		var msg = {
				type : "register",
				userid : "${msgSender}"
				
		};
		sock.send(JSON.stringify(msg));
	}
 function sendMsg() {
  var msg = {
	  type : "chat",
	  target : $("#targetUser").val(),
	  message : $("#message").val()
  };
  sock.send(JSON.stringify(msg))
 };
 

$(function (){
	connect();
	$('#sendBtn').on('click',function(){
		var chat = $("#chatMessageArea").val();
		chat = chat + "\n나 : " + $("#message").val();
		$("#chatMessageArea").val(chat);
		sendMsg();
		$("#message").val("");
	})
	
});

 
</script>
</body>
</html>
