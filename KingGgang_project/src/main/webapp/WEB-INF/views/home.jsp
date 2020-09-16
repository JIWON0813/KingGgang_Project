<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<!-- 
	이	   름 : home.jsp
	개  발   자 : 
	설	   명 : 메인 페이지
 -->
<%@ include file="/WEB-INF/views/top.jsp"%>

    <div class="ulockd-home-slider">
        <div class="container-fluid">
            <div class="row">
                <div class="pogoSlider" id="js-main-slider">
                    <div class="pogoSlider-slide" style="background-image:url(${pageContext.request.contextPath}/resources/main/images/banner2.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="slide_text white_fonts">
                                         <h3>우리만의 제주정보<br><strong>돌하르방</strong></h3>
                                        <br>
                                        <a class="start_exchange_bt" href="commhome.comm">돌하르방 가기 ></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  		<div class="pogoSlider-slide" style="background-image:url(${pageContext.request.contextPath}/resources/main/images/banner1.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="slide_text white_fonts">
                                  	  <h3>호텔 & 렌트카<br><strong>낑깡</strong></h3>
                                        <br>
                                        <a class="start_exchange_bt" href="#">예약하러 가기 ></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .pogoSlider -->
            </div>
        </div>
    </div>
    <!-- End Banner -->
    
	<!-- section -->
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="full text_align_right_img">
                        <img src="${pageContext.request.contextPath}/resources/main/images/pic1.jpg" alt="#" />
                    </div>
                </div>
                <div class="col-md-6 layout_padding">
                    <div class="full paddding_left_15">
                        <div class="heading_main text_align_left">
						   <h2><span class="theme_color">Welcome</span>  KingGgang</h2>	
                        </div>
                    </div>
                    <div class="full paddding_left_15">
                        <p>제주하면 귤 귤하면 낑깡 낑깡하면 GGAng<br>
                        	낑깡 통해서 호텔 & 렌트  예약해서 <br>
                        	다양한 제주 여행정보도 얻고<br>
                        	 낑깡만의 커뮤니티와 함께 제주여행을 즐겨보세요! 
                        	</p>
                    </div>
                    <div class="full paddding_left_15">
                        <a class="main_bt" href="#">About more ></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- end section -->
<<<<<<< HEAD

    
=======
>>>>>>> branch 'ina2' of https://github.com/JIWON0813/KingGgang_Project.git
  <%@ include file="/WEB-INF/views/bottom.jsp"%>
 