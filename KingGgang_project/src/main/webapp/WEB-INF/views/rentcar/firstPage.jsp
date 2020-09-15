<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!--  
	이	   름 : rentcarMain.jsp
	개  발   자 : 정 우 철
	설	   명 : 렌트카 첫 페이지
	-->
	
	<!-- jquery -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
	
	<!-- bootstrap -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- moment -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js" integrity="sha256-ABVkpwb9K9PxubvRrHMkk6wmWcIHUE9eBxNZLXYQ84k=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment-with-locales.min.js" integrity="sha256-XWrGUqSiENmD8bL+BVeLl7iCfhs+pkPyIqrZQcS2Te8=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/locale/ko.js" integrity="sha256-52Xn0wi4kPGcROqCAA5EoontBDks09MLjv7fd5WAj3U=" crossorigin="anonymous"></script>

	<!-- bootstrap datetimepicker -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.4/css/bootstrap-datetimepicker.min.css" integrity="sha256-Fl1s8EQCc9mKf/njo8mWr0MPJR8TnOQb0h0rmVKRoP8=" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.4/js/bootstrap-datetimepicker.min.js" integrity="sha256-sU6nRhzXDAC31Wdrirz7X2A2rSRWj10WnP9CA3vpYKw=" crossorigin="anonymous"></script>

    <script>
        $(function () {
            $('#datepicker1').datetimepicker({
                format: 'YYYY-MM-DD',
                language: 'ko',
                autoclose: true,
                todayBtn: true,
                minView: '2',
            });

            $('#datepicker2').datetimepicker({
                format: 'YYYY-MM-DD',
                language: 'ko',
                autoclose: true,
                todayBtn: true,
                minView: '2',
            });

        })
        
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
	<h3>날짜 선택</h3>
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
</form>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<!--  
	이	   름 : rentcarMain.jsp
	개  발   자 : 정 우 철
	설	   명 : 렌트카 첫 페이지
	-->
	
	<!-- jquery -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
	
	<!-- bootstrap -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- moment -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js" integrity="sha256-ABVkpwb9K9PxubvRrHMkk6wmWcIHUE9eBxNZLXYQ84k=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment-with-locales.min.js" integrity="sha256-XWrGUqSiENmD8bL+BVeLl7iCfhs+pkPyIqrZQcS2Te8=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/locale/ko.js" integrity="sha256-52Xn0wi4kPGcROqCAA5EoontBDks09MLjv7fd5WAj3U=" crossorigin="anonymous"></script>

	<!-- bootstrap datetimepicker -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.4/css/bootstrap-datetimepicker.min.css" integrity="sha256-Fl1s8EQCc9mKf/njo8mWr0MPJR8TnOQb0h0rmVKRoP8=" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.4/js/bootstrap-datetimepicker.min.js" integrity="sha256-sU6nRhzXDAC31Wdrirz7X2A2rSRWj10WnP9CA3vpYKw=" crossorigin="anonymous"></script>

    <script>
        $(function () {
            $('#datepicker1').datetimepicker({
                format: 'YYYY-MM-DD',
                language: 'ko',
                autoclose: true,
                todayBtn: true,
                minView: '2',
            });

            $('#datepicker2').datetimepicker({
                format: 'YYYY-MM-DD',
                language: 'ko',
                autoclose: true,
                todayBtn: true,
                minView: '2',
            });

        })
        
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
	<h3>날짜 선택</h3>
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
</form>
>>>>>>> branch 'ina2' of https://github.com/JIWON0813/KingGgang_Project.git
	</div>