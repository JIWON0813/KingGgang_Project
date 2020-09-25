<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	이	   름 : hashSearchForm
	개  발   자 : 이 여 진
	설	   명 : 해시태그 검색 페이지
 -->
<%@ include file="/WEB-INF/views/top.jsp"%>

<footer class="footer-box">
		<div class="container">
			<div class="row">
				<div class="col-md-12 white_fonts">
					<div class="row">
						<div>
							<div class="full">
								<h3>#${tag} 검색 결과</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
<div class="section layout_padding" align="center">
      <div class="row">
         <c:if test="${empty hashtagList}">
            <h4>검색 결과가 없습니다.</h4>
         </c:if>
         <c:forEach var="dto" items="${hashtagList}" varStatus="status">

            <div class="col-md-3 col-sm-6 col-xs-12">
               <div class="full services_blog">
                  <a href="comm_otherContent.do?boardNum=${dto.boardNum}"> <img
                     class="img-responsive"
                     src="http://192.168.0.184:8080/img/${dto.file_name}" alt="#" />
                  </a>
               </div>
            </div>
         </c:forEach>
         </div>
</div>
<%@ include file="/WEB-INF/views/bottom.jsp"%>