<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
	이	   름 : index.jsp
	개  발   자 : 이 여 진
	설	   명 : 커뮤니티 메인, 뉴스피드 페이지
 -->
<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<html>
<head>
<title>낑깡</title>
<meta charset="utf-8">
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
									<li><img src="${pageContext.request.contextPath}/resources/img/flower.png" width="30" height="30"><a href="comm_writeForm.do"> Write</a></li>
									<li><img src="${pageContext.request.contextPath}/resources/img/하르방.png" width="30" height="30"><a href="comm_myPage.do"> Mypage</a></li>
									<li><img src="${pageContext.request.contextPath}/resources/img/mountain.PNG" width="30" height="30"><a href="comm_bookMark.do"> BookMark</a></li>
									<li><img src="${pageContext.request.contextPath}/resources/img/유채꽃.PNG" width="30" height="30">
											<a href="comm_member_delete.do?comm_memberNum=${comm_memberNum }">회원탈퇴</a>
											<a href="comm_member_edit.do?comm_memberNum=${comm_memberNum }">>수정</a>
									</li>
									<li><img src="${pageContext.request.contextPath}/resources/img/해녀.PNG" width="30" height="30">			
											<a href="comm_memberList.do"> 회원목록</a>
										</li>
											<li><img src="${pageContext.request.contextPath}/resources/img/수국.PNG" width="30" height="30">
											<a href="comm_friendAll.do?comm_memberNum=${comm_memberNum }">
													Friends 목록</a></li>
											<li><img src="${pageContext.request.contextPath}/resources/img/스쿠버.PNG" width="30" height="30">
											<a href="#"
												onclick="window.open('roomList', '_blank', 'width=600 height=600')">
													채팅 목록</a></li>
										</c:if>
										<c:if test="${comm_login == null }">
										<li><img src="${pageContext.request.contextPath}/resources/img/palmtree.PNG" width="30" height="30">
												<a href="comm_login.do?memberNum=${memberNum }"> 로그인</a>
										</li>
										<li><img src="${pageContext.request.contextPath}/resources/img/palmtree.PNG" width="30" height="30">
												<a href="comm_checkMember.do?memberNum=${memberNum}">가입하기</a>
										</li>
										</c:if> 
								<li style="margin-top:20px;">
                    			
                    			
                    			<input type="text" id="word" placeholder="search" onkeyup="search(this);" style="opacity: 0.3;">
                        		<a><img src="${pageContext.request.contextPath}/resources/main/images/search_icon.png" alt="#" /></a>
								
              					<ul id="memberSearch"></ul>
              					
              					<ul id="tagSearch"></ul>
              					
								</li>
								</ul>
								
              					
							</div>
						</div>
						 <div class="section layout_padding" style="width:60% !important; margin-left:100px;">
                            <div class="full">
                                <h3 style="font-size: 20px !important"><font size=7>낑</font><font size=3>깡</font><font size=7>같</font><font size=3>이</font><font size=7>따</font><font size=3>러갈래?</font> 
                                	<img alt="#" src="${pageContext.request.contextPath}/resources/main/images/orange.png">
                               		<c:if test="${comm_login != null }"> 
                               			<a href="comm_togetherList.do" style="font-size:10px;color:#FFFFFF;float: right;"> >> 더 알아보기</a>
                               		</c:if>
                               </h3>
                            <div style="width:100%; height: 200px; " >
           					 <iframe src="${pageContext.request.contextPath}/comm_mainTogetherList" style="width: 100%; 
            				  height: 100%; border: none;" ></iframe>    
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
         <div class="section layout_padding"></div>
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
      url: "<c:url value="/newsfeedList" />", 
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

</script>


<script type="text/javascript">
$(function() {
    $(document).on('click', function(e) {
        if (e.target.id === 'word') {
           $('#memberSearch').show();
        } else {
            $('#memberSearch').hide();
        }
    })
});
</script>

<script> 
/* 검색기능 */
function search(target){
   var word = target.value; 
   
   var obj = {"word": word}; 
   $.ajax({ url: "<c:url value="/commMemberSearch" />", 
      type: "POST", 
      data: JSON.stringify(obj), 
      dataType: 'json', 
      contentType: "application/json;", 
      success: function(data) {
          $("#memberSearch").empty(); 
          
          var checkWord = $("#word").val(); 
          if(checkWord.length > 0 && data.length > 0){
          for(var i=0; i<data.length; i++){
                 $('#memberSearch').append("<li><a href='comm_otherPage.do?comm_memberNum="+data[i].num+"'><img src='http://localhost:8080/img/"+data[i].profile+"' width='50' height='50'/> "+data[i].nick+"</a></li>");
             }
         }
      }, 
      error: function(errorThrown) { alert(errorThrown.statusText); 
      } 
   }); 
   //해시태그 검색
   var obj = {"word": word}; 
   $.ajax({ url: "<c:url value="/commHashSearch" />", 
      type: "POST", 
      data: JSON.stringify(obj), 
      dataType: 'json', 
      contentType: "application/json;", 
      success: function(data) {
         
          $("#tagSearch").empty(); 
          
          var checkWord = $("#word").val(); 
          if(checkWord.length > 0 && data.length > 0){
          for(var i=0; i<data.length; i++){
                 $('#tagSearch').append("<li><a href='searchTag?tagId="+data[i].tagId+"&tagName="+data[i].tagName+"'>#"+data[i].tagName+"</a></li>");
             }
         }
      }, 
      error: function(errorThrown) { alert(errorThrown.statusText); 
      } 
   }); 
   
   
} 
</script>