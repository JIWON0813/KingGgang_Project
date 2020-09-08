<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<script src="resources/jquery-3.1.1.min.js">
</script>
<script>




$('#btn1').on('click', function(){
    var form = {
            name: "jamong",
            age: 23
    }
    $.ajax({
        url: "/requestObject",
        type: "POST",
        data: form,
        success: function(data){
            $('#result').text(data);
        },
        error: function(){
            alert("simpleWithObject err");
        }
    });
});

	
</script>
<body>
 <button id="btn1">simpleAJAX</button>
    <div id="result"></div>
</body>
</html>



