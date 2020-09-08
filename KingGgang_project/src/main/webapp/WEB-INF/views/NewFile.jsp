<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body> 

<button onclick="test()" type="button">Ajax</button>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script> 
	
var obj = {"name": "kim", "age": 30}; 
function test() { 
	$.ajax({ url: "<c:url value="/test" />", 
		type: "POST", data: JSON.stringify(obj), 
		dataType: "text", 
		contentType: "application/json", 
		success: function(data) { alert("성공"); 
		
				$('#result').text(data);
		}, 
		error: function(errorThrown) { alert(errorThrown.statusText); } }); } 
</script>
<div id="result"></div>


</body>
</html>



