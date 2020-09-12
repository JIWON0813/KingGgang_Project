<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- 
	이	   름 : wishins.jsp
	개  발   자 : 원세호
	설	   명 : 관심리스트 등록 테스트 페이지
 -->


<P> 관심리스트 틍록 테스트 페이지 </P>
<html>
<head>
</head>
<body> 

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>


<form action="insert.wish" method="post">
	
	<p><input type = "hidden" name= "m_no" value="${m_no}"></p><br>

	<p><input type = "hidden" name= "type" value="${type}"></p><br>
	
	<p><input type = "hidden" name= "f_no" value="${f_no}"></p><br>
	
	<c:forEach var="dto" items="${noCheck}">
	 
	 <script>
	 
    var obj = {"m_no": "${dto.m_no}", "type": "${dto.type}", "f_no": "${dto.f_no}"}; 
    function test() { 
    	$.ajax({ url: "<c:url value="/test" />", 
    		type: "POST", 
    		data: JSON.stringify(obj), 
    		dataType: "json", 
    		
    		contentType: "application/json", 
    		success: function(data) { alert("성공"); 
    				var result1 = data
    				alert(result1);
    				if(result1.wstatus == 2){
                        $('img#like_img').attr('src', './resources/img/empty_heart.jpg');
                    } else {
                        $('img#like_img').attr('src', './resources/img/heart.jpg');
                    }
    				$('#result').text(result1)
    		}, 
    		error: function(errorThrown) { alert(errorThrown.statusText); } }); } 
    </script>
    
    
	<button type="button" id="btnLike" onclick="test()">
       <img src="${ param.check1 == 1 ? './resources/img/empty_heart.jpg' : './resources/img/heart.jpg' }" id="like_img" height="50px" width="50px">
    </button>
    
	</c:forEach>
	
	<div id="result"></div>
</form>

<a href="main.my">마이페이지로 가기</a>
</body>
</html>
 

