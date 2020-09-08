<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Start Banner -->
    <div class="section inner_page_banner">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="banner_title">
                        <h3>친구목록</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <!--  End Banner -->


    <!-- section -->
    <div class="section layout_padding">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="full">
                        <div class="heading_main text_align_center">
                           <h2><span class="theme_color"></span>친구목록</h2>    
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
             <c:forEach var="dto" items="${friendList }">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="full services_blog">
                      <img src="http://localhost:8080/img/${dto.f_comm_profilename}" width="50" height="50">
											<h4>${dto.f_name }</h4>
											<p>${dto.comm_memberNum }</p>
											<p>${dto.friendNum }</p>
											<p><a
												href="comm_friendContent.do?comm_memberNum=${dto.comm_memberNum}">상세보기</a></p>
											<p><a
												href="comm_deleteFriend.do?friendNum=${dto.friendNum}">친구삭제</a></p>
                    </div>
                </div>
                </c:forEach>
                <!-- <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="full services_blog">
                        <img class="img-responsive" src="images/s2.png" alt="#" />
                        <h4>Mobile Apps</h4>
                    </div>
                </div> -->
            </div>
            <div class="row margin-top_30">
                <div class="col-sm-12">
                    <div class="full">
                        <div class="center">
                            <a class="main_bt" href="#">See More ></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end section -->
<%@ include file="/WEB-INF/views/bottom.jsp"%>
