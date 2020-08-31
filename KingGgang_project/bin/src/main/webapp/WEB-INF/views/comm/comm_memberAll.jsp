<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- memberAll.jsp -->
<%@ include file="index_top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="four" class="wrapper style1 special fade-up">
					<div class="container">
						<header class="major">
							<h2></h2>
						</header>
						<div class="box alt">
							<div class="row gtr-uniform">
							<c:if test="${empty memberList}">
							<h2>등록된 친구가 없습니다.</h2>>
							</c:if>
							<c:forEach var="dto" items="${memberList}">		
								<section class="col-4 col-6-medium col-12-xsmall">
									<img src="http://localhost:8080/img/${dto.profile_name}" width="50" height="50">
									<h3>${dto.name}</h3>
									<p>${dto.allHp}</p>
									<p><a href="member_delete.do?memberNum=${memberNum }" >삭제</a></p>
									<%-- <p>${dto.allBirth}</p>
									<p>${dto.id}</p>
									<p>${dto.passwd}</p>
									<p>${dto.email}</p>	 --%>
								</section>
								</c:forEach>
							</div>
						</div>
						<!-- <footer class="major">
							<ul class="actions special">
								<li><a href="#" class="button">Magna sed feugiat</a></li>
							</ul>
						</footer> -->
					</div>
				</section>
<%@ include file="index_bottom.jsp"%>













