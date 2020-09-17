<%@ include file="/WEB-INF/views/top.jsp"%><br><br><br><br>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!--  
	이	   름 : rentcarMain.jsp
	개  발   자 : 정 우 철
	설	   명 : 렌트카 첫 페이지
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
    	var minRd = new Date();
    	minRd.setDate(minRd.getDate()+1);
    	
        newJquery(document).ready(function () {
        var dp = newJquery('	#datepicker1').datepicker({
            	startDate: new Date(date.getFullYear(), date.getMonth(), date.getDate()),
            	language: 'ko',
            	minDate : new Date(),
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
            	minDate : minRd, 
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
<form name="f" method="post" action="main.rentcar">
	<h3>여행 날짜 선택</h3>
	<hr width="500">
	<input type="text" name="receiptday" id="datepicker1" placeholder="예약일">
			<select name="pickuptime">
  					<option selected value="0">
  					픽업 시간 선택
  					</option>
  					<option value="/09:00">오전 09시</option>
  					<option value="/10:00">오전 10시</option>
  					<option value="/11:00">오전 11시</option>
  					<option value="/12:00">오전 12시</option>
  					<option value="/13:00">오후 1시</option>
  					<option value="/14:00">오후 2시</option>
  					<option value="/15:00">오후 3시</option>
  					<option value="/16:00">오후 4시</option>
  					<option value="/17:00">오후 5시</option>
  					<option value="/18:00">오후 6시</option>
  					<option value="/19:00">오후 7시</option>
  			</select>
	<input type="text" name="returnday" id="datepicker2" placeholder="반납일"> 
	<input type="button" value="조회" onclick="javascript:check()">
	<hr width="500">
	<br><br><br>
</form>
	</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>