<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="index_top.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Newsfeed</title>
</head>
<body>
	<div class="container">
		<form method="post" action="#" class="cta">
			<div class="row gtr-uniform gtr-50">
				<div class="col-8 col-12-xsmall">
					<input type="text" name="hashcode" id="email"
						placeholder="검색어를 입력하세요.">
				</div>
				<div>
					<input type="submit" value="검색" />
				</div>
			</div>
		</form>
	</div>
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-4 col-12-medium">
					<header>
					<h2>Big Event</h2>
					<p>현재 진행중인 이벤트입니다.</p>
					</header>
				</div>
				<div class="col-4 col-12-medium">
					<p></p>
				</div>
				<div class="col-4 col-12-medium">
					<p></p>
				</div>
			</div>
		</div>
	</div>
	<div>
	</div>
		<div class="row gtr-uniform">
			<h2>뉴스피드</h2>
			<div class="box alt">
			<div class="row gtr-uniform">
			<c:if test="${empty boardList}">
				<h2>등록된 페이지가 없습니다.</h2>
			</c:if>
			<c:forEach var="dto" items="${boardList}">		
				<section class="col-4 col-6-medium col-12-xsmall">
			<a href=""><img src="http://localhost:8080/img/${dto.file_name}" width="300" height="300"></a>
			</section>
			</c:forEach>
		</div>
	</div>
</div>
</body>
</html>

<%@ include file="index_bottom.jsp"%>