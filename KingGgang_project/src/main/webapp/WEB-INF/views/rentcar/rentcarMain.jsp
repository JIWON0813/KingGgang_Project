<%@ include file="/WEB-INF/views/top.jsp"%><br><br><br>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!--  
	이	   름 : rentcarMain.jsp
	개  발   자 : 정 우 철
	설	   명 : 렌트카 메인 페이지
	-->
	
	<script src="${pageContext.request.contextPath}/resources/jquery-3.5.1.min.js"></script> <!-- 값 제어를 위해 jquery -->
    <link href="${pageContext.request.contextPath}/resources/datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- Air datepicker css -->
    <script src="${pageContext.request.contextPath}/resources/datepicker/js/datepicker.js"></script> <!-- Air datepicker js -->
    <script src="${pageContext.request.contextPath}/resources/datepicker/js/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->

	<script type="text/javascript">
	var newJquery = $.noConflict(true);
	</script>
    <script type="text/javascript">
    	var date = new Date();
    	var minRcd = new Date();
    	var minRtd = new Date();
    	minRcd.setDate(minRcd.getDate()+1);
    	minRtd.setDate(minRtd.getDate()+2);
    	
        newJquery(document).ready(function () {
        var dp = newJquery('	#datepicker1').datepicker({
            	startDate: new Date(date.getFullYear(), date.getMonth(), date.getDate()),
            	language: 'ko',
            	minDate : minRcd,
            	autoClose: true,
            	onSelect: function (date) {
            	   var endNum = date;
            	   var endDate = new Date(endNum);
            	   endDate.setDate(endDate.getDate()+1);
            	   newJquery('#datepicker2').datepicker({
            	       minDate: endDate
            	   });
            	}
            }).data('datepicker');

            newJquery('#datepicker2').datepicker({
            	
            	
            	startDate: new Date(date.getFullYear(), date.getMonth(), date.getDate()),
            	language: 'ko',
            	minDate : minRtd, 
            	autoClose: true,
            	onSelect: function (date) {
          	      var startNum = date;
          	      var startDate = new Date(startNum);
          	      startDate.setDate(startDate.getDate()-1);
          	      newJquery('#datepicker1').datepicker({
          	          maxDate: startDate
          	      });
          	  }
          	}).data('datepicker');
            
            
        });           
        
       	function check(){
			if (f.receiptday.value==""){
				alert("차량 수령일을 입력 해 주세요!!")
				f.receiptday.focus()
				return
			}
			if (f.returnday.value==""){
				alert("반납 예정일을 입력 해 주세요!!")
				f.returnday.focus()
				return
			}
			if (f.pickuptime.value==0){
				alert("픽업 시간을 선택 해 주세요!!")
				f.pickuptime.focus()
				return
			}
			document.f.submit()
		}
    </script>
<div align="center">
 
<div class="logo_section">
<a class="navbar-brand" href="home.do">
<img src="${pageContext.request.contextPath}/resources/main/images/logo.png" alt="image"></a>
</div>
<br><br><br>

<form name="f" method="post" action="main.rentcar?mode=date">
	
	<input type="text" name="receiptday" id="datepicker1" value="${dpreceiptday}">
	<select name="pickuptime">
   					<option value="0" <c:if test="${dppickuptime eq null}">selected</c:if>>
  					픽업 시간 선택
  					</option>
  					<option value="/09:00" <c:if test="${dppickuptime eq '/09:00'}">selected</c:if>>
  					오전 09시
  					</option>
  					<option value="/10:00" <c:if test="${dppickuptime eq '/10:00'}">selected</c:if>>
  					오전 10시
  					</option>
  					<option value="/11:00" <c:if test="${dppickuptime eq '/11:00'}">selected</c:if>>
  					오전 11시
  					</option>
  					<option value="/12:00" <c:if test="${dppickuptime eq '/12:00'}">selected</c:if>>
  					오전 12시
  					</option>
  					<option value="/13:00" <c:if test="${dppickuptime eq '/13:00'}">selected</c:if>>
  					오후 1시
  					</option>
  					<option value="/14:00" <c:if test="${dppickuptime eq '/14:00'}">selected</c:if>>
  					오후 2시
  					</option>
  					<option value="/15:00" <c:if test="${dppickuptime eq '/15:00'}">selected</c:if>>
  					오후 3시
  					</option>
  					<option value="/16:00" <c:if test="${dppickuptime eq '/16:00'}">selected</c:if>>
  					오후 4시
  					</option>
  					<option value="/17:00" <c:if test="${dppickuptime eq '/17:00'}">selected</c:if>>
  					오후 5시
  					</option>
  					<option value="/18:00" <c:if test="${dppickuptime eq '/18:00'}">selected</c:if>>
  					오후 6시
  					</option>
  					<option value="/19:00" <c:if test="${dppickuptime eq '/19:00'}">selected</c:if>>
  					오후 7시
  					</option>
  	</select>
	<input type="text" name="returnday" id="datepicker2" value="${dpreturnday}"> 
	<input type="button" value="조회" onclick="javascript:check()">
	<br>
	<a	href="main.rentcar?mode=all">
	전체보기|
	</a>
	<a href="main.rentcar?mode=type&obj=경차">
	경차|
	</a>
	<a href="main.rentcar?mode=type&obj=세단">
	세단|
	</a>
	<a href="main.rentcar?mode=type&obj=SUV">
	SUV|
	</a>
	<a href="main.rentcar?mode=fuel&obj=휘발유">
	휘발유|
	</a>
	<a href="main.rentcar?mode=fuel&obj=경유">6
	경유|
	</a>
	<a href="main.rentcar?mode=fuel&obj=LPG">
	LPG|
	</a>
	<a href="main.rentcar?mode=fuel&obj=하이브리드">
	하이브리드|
	</a>
	<a href="main.rentcar?mode=lowPrice">낮은가격순</a>
<br>
<br>
<table>
<tr>
		<c:forEach var="dto" items="${rentcar}">
		<td>
			<a href="content.rentcar?id=${dto.id}">
			<img src="http://localhost:8080/img/${dto.filename}" width="100px" height="100px">
			</a>
			<br>
			${dto.name}
			<br>
			${dto.price}원
		</td>
		<td> &nbsp;&nbsp;&nbsp;&nbsp; </td>
		</c:forEach>
<tr>
</table>
</form>
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>