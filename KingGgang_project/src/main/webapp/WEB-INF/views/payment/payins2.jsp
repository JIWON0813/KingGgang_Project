<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  
	이	   름 : payins2.jsp
	개  발   자 : 원세호
	설	   명 : 결제 진행 페이지2

-->
<%
    //String name = (String)request.getAttribute("name");
    //String email = (String)request.getAttribute("email");
    //String phone = (String)request.getAttribute("phone");
    //String address = (String)request.getAttribute("address");
    //String totalPrice =  (String)request.getAttribute("totalPrice");
   	//String paynum = (String)request.getAttribute("paynum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    
    function nextpage(){
    	document.n.submit()
    }
    
    
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp91317422'); // "가맹점 식별코드"
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            // pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '제주여행사 낑깡 렌트카,호텔 결제',
            amount : "${totalPrice}",
            buyer_email : "${mrdto.email}",
            buyer_name : "${mrdto.name}",
            buyer_tel : "${mrdto.hp1} - ${mrdto.hp2} - ${mrdto.hp3}",
            buyer_addr : "aa",
            buyer_postcode : '000-000',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                
                jQuery.ajax({
                   
                    
                }).done(function(data) {
                    
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                nextpage();
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                alert(msg);
                failpage();
            }
        });
        
    });
    
    
    </script>
    
 	<form name="n" action="complete.pay" method="post">
 	<input type="hidden" name="totalPrice" value="${totalPrice}">
 	<input type="hidden" name="type" value="${type}">
 	<input type="hidden" name="m_no" value="${m_no}">
 	<input type="hidden" name="buyer_name" value="${mrdto.name}">
 	<c:if test = "${type==1}">
 	<input type="hidden" name="id" value="${id}">
 	</c:if>
 	<c:if test = "${type==2}">
 	<input type="hidden" name="res_id" value="${res_id}">
 	</c:if>
 	</form>
 	
</body>
</html>





