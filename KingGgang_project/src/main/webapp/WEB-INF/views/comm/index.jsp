  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/top.jsp"%>
<%-- <%@ include file="index_top.jsp" %>  --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<html>
<head>
<title>낑깡</title>
<meta charset="utf-8" />
</head>

<body>
	<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div class="col-sm-6 col-md-6 col-lg-3">
							<div class="full">
								<h3>돌하르방</h3>
							</div>
							<div class="full">
								<ul class="menu_footer">
									<c:if test="${comm_login != null }">
										<li><a href="ex">> test</a></li>
										<li><a href="comm_writeForm.do">> Write</a></li>
										<li><a href="comm_myPage.do">> Mypage</a></li>
										<li><a href="comm_bookMark.do">> BookMark</a></li>
										<li><a href="commadmin.comm">> 관리자모드</a></li>
										<li>
											<a
												href="comm_member_delete.do?comm_memberNum=${comm_memberNum }">>
												회원탈퇴</a>
											<a
												href="comm_member_edit.do?comm_memberNum=${comm_memberNum }">>
												수정</a>
											<a href="comm_memberList.do">> 목록</a>
										</li>
											<li><a
												href="comm_friendAll.do?comm_memberNum=${comm_memberNum }">>
													Friends 목록</a></li>
											<li><a href="#"
												onclick="window.open('roomList', '_blank', 'width=600 height=600')">>
													채팅 목록</a></li>
									</c:if>
									<c:if test="${comm_login == null }">
										<li><a href="comm_login.do?memberNum=${memberNum }">> 로그인</a>
											<a href="comm_checkMember.do?memberNum=${memberNum}">>가입하기</a>
									</c:if> 
										<li style="margin-top: 20px;">
											<img style = "opacity: 0.3;" src="${pageContext.request.contextPath}/resources/main/images/search_icon.png" alt="#" />
											<input type="text" id="word" placeholder="search" onkeyup="search(this);" style="opacity: 0.3;">
								<ul id="searchList"></ul>
									<li>
							</ul>
						</div>
					</div>
					<div class="section layout_padding"
							style="width: 60% !important; margin-left: 100px;">
							<div class="full">
								<h3 style="font-size: 20px !important">
									<font size=7>낑</font><font size=3>깡</font><font size=7>같</font><font
										size=3>이</font><font size=7>따</font><font size=3>러갈래?</font> <img
										alt="#"
										src="${pageContext.request.contextPath}/resources/main/images/orange.png">
									<a href="comm_togetherList.do"
										style="font-size: 10px; color: #FFFFFF; float: right;"> >>
										더 알아보기</a>
								</h3>
								<div style="width: 100%; height: 200px;">
									<iframe
										src="${pageContext.request.contextPath}/comm_mainTogetherList"
										style="width: 100%; height: 100%; border: none;"></iframe>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</footer>
		<div class="section layout_padding">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="full">
						<div class="heading_main text_align_center">
							<h2>
								<span class="theme_color"></span>뉴스피드
							</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div id="more_list">
		<div class="row">
			<c:if test="${empty boardList}">
				<h4>등록된 페이지가 없습니다.</h4>
			</c:if>
			<c:forEach var="dto" items="${boardList}" varStatus="status">

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="full services_blog">
						<a href="comm_otherContent.do?boardNum=${dto.boardNum}"> <img
							class="img-responsive"
							src="http://localhost:8080/img/${dto.file_name}" alt="#" />
						</a>
					</div>
				</div>
			</c:forEach>
			</div>
			<div class="row" id="moreList">
			</div>
		</div>
		
			<div class="row margin-top_30">
				<div class="col-sm-12">
					<div class="full">
						<br>
						<div class="center">
							<a class="main_bt" id="more_btn_a"
								href="javascript:loadNextPage();">See More ></a>
						</div>
					</div>
				</div>
			</div>
</body>
<!-- End Footer -->
<%@ include file="/WEB-INF/views/bottom.jsp"%>
<script>
/* 더보기기능 */
	function loadNextPage() {
		var list_length = $("#more_list img").length+1;
		
		var callLength = list_length;
		var cnt = 3;
		
		var startRow = list_length;
		var endRow = startRow+cnt;
		var obj = {"startRow":startRow,
				   "endRow":endRow};
	
	$.ajax({
		type:'post', 
		url:"<c:url value="/ajaxList.do" />",
		data:JSON.stringify(obj),
		dataType: 'json', 
		contentType: "application/json;", 
		success : function(data){
	    	 for(var i=0; i<data.length; i++){
                 $('#moreList').append("<div class='col-md-3 col-sm-6 col-xs-12'><div class='full services_blog'><a href='comm_otherContent.do?boardNum="+data[i].num+"'><img class='img-responsive' src='http://localhost:8080/img/"+data[i].file+"' alt='#' /></a></div></div>");
             
			}
	         
	      },
		error: function(errorThrown) { alert(errorThrown.statusText); }
	});
	              
	
}
	$(function() {
	    $(document).on('click', function(e) {
	        if (e.target.id === 'word') {
	        	$('#searchList').show();
	        } else {
	            $('#searchList').hide();
	        }
	    })
	});
</script>


<script> 
/* 검색기능 */
function search(target){
	var word = target.value; 
	
	var obj = {"word": word}; 
	$.ajax({ url: "<c:url value="/commSearch" />", 
		type: "POST", 
		data: JSON.stringify(obj), 
		dataType: 'json', 
		contentType: "application/json;", 
		success: function(data) {
			
			 $("#searchList").empty(); 
			 
			 var checkWord = $("#word").val(); 
			 if(checkWord.length > 0 && data.length > 0){
			 for(var i=0; i<data.length; i++){
                 $('#searchList').append("<li><a href='comm_otherPage.do?comm_memberNum="+data[i].num+"'><img src='http://localhost:8080/img/"+data[i].profile+"' width='50' height='50'/> "+data[i].nick+"</a></li>");
             }
			}
		}, 
		error: function(errorThrown) { alert(errorThrown.statusText); 
		} 
	}); 
} 
</script>