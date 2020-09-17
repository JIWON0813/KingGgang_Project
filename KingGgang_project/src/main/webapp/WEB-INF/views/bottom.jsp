<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    <!-- Start Footer -->
    <footer class="footer-box">
        <div class="container">
            <div class="row">
               <div class="col-md-12 white_fonts">
                    <div class="row">
                        <div class="col-sm-6 col-md-6 col-lg-3">
                            <div class="full">
                                <img class="img-responsive" src="${pageContext.request.contextPath}/resources/main/images/logo.png" alt="#" />
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-3">
                            <div class="full">
                                <!-- 날씨 api -->
							<h3>제주도 날씨 현황</h3>
						</div>

						<div align="center">
							<table>
								<tr align="center">
									<td colspan="2" class="cdate" style="font-size:20px"></td>
								</tr>
								<tr>
									<td class="cicon" rowspan="6"></td>
								</tr>
								<tr>
									<td class="ctemp">현재 온도 :</td>
								</tr>
								<tr>
									<td class="cfeels_like">체감 기온 :</td>
								</tr>
								<tr>
									<td>최고/최저 : <font class="chightemp"></font>/<font
										class="clowtemp"></font></td>
								</tr>
								<tr>
									<td class="chumidity">습도 :</td>
								</tr>
							</table>
						</div>
						</div>
                        <div class="col-sm-6 col-md-6 col-lg-3">
                            <div class="full">
                                <div class="footer_blog full white_fonts">
                             <h3><img src="${pageContext.request.contextPath}/resources/main/images/orange.png"/>낑.같.따<img src="${pageContext.request.contextPath}/resources/main/images/orange.png"/></h3>
                             <p>함께 여행 갈 인연을 찾아보아요!!</p>
                             <a class="join_bt" style="display: inline-block; margin-left:30px;" href="comm_checkMember.do?memberNum=${memberNum}">
                             	<b><font color="white">가 입 하 기</font></b>
                             </a>
                             <!-- <div class="newsletter_form">
                                <form action="index.html">
                                   <input type="email" placeholder="Your Email" name="#" required="">
                                   <button>Submit</button>
                                </form>
                             </div> -->
                         </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-3">
                            <div class="full">
                                <div class="footer_blog full white_fonts">
                             <h3>Contact us</h3>
                             <ul class="full">
                               <li><img src=""><span>London 145<br>United Kingdom</span></li>
                               <li><img src=""><span>demo@gmail.com</span></li>
                               <li><img src=""><span>+12586954775</span></li>
                             </ul>
                         </div>
                            </div>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- End Footer -->
<!-- test -->
    <div class="footer_bottom">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <p class="crp">Team B Project</p>
                </div>
            </div>
        </div>
    </div>


<a href="#" id="scroll-to-top" class="hvr-radial-out"><i
	class="fa fa-angle-up"></i></a>

<!-- ALL JS FILES -->
<script
	src="${pageContext.request.contextPath}/resources/main/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/main/js/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/main/js/bootstrap.min.js"></script>
<!-- ALL PLUGINS -->
<script
	src="${pageContext.request.contextPath}/resources/main/js/jquery.magnific-popup.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/main/js/jquery.pogo-slider.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/main/js/slider-index.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/main/js/smoothscroll.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/main/js/form-validator.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/main/js/contact-form-script.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/main/js/isotope.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/main/js/images-loded.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/main/js/custom.js"></script>
<script>
	/* counter js */

(function ($) {
	$.fn.countTo = function (options) {
		options = options || {};
		
		return $(this).each(function () {
			// set options for current element
			var settings = $.extend({}, $.fn.countTo.defaults, {
				from:            $(this).data('from'),
				to:              $(this).data('to'),
				speed:           $(this).data('speed'),
				refreshInterval: $(this).data('refresh-interval'),
				decimals:        $(this).data('decimals')
			}, options);
			
			// how many times to update the value, and how much to increment the value on each update
			var loops = Math.ceil(settings.speed / settings.refreshInterval),
				increment = (settings.to - settings.from) / loops;
			
			// references & variables that will change with each update
			var self = this,
				$self = $(this),
				loopCount = 0,
				value = settings.from,
				data = $self.data('countTo') || {};
			
			$self.data('countTo', data);
			
			// if an existing interval can be found, clear it first
			if (data.interval) {
				clearInterval(data.interval);
			}
			data.interval = setInterval(updateTimer, settings.refreshInterval);
			
			// initialize the element with the starting value
			render(value);
			
			function updateTimer() {
				value += increment;
				loopCount++;
				
				render(value);
				
				if (typeof(settings.onUpdate) == 'function') {
					settings.onUpdate.call(self, value);
				}
				
				if (loopCount >= loops) {
					// remove the interval
					$self.removeData('countTo');
					clearInterval(data.interval);
					value = settings.to;
					
					if (typeof(settings.onComplete) == 'function') {
						settings.onComplete.call(self, value);
					}
				}
			}
			
			function render(value) {
				var formattedValue = settings.formatter.call(self, value, settings);
				$self.html(formattedValue);
			}
		});
	};
	
	$.fn.countTo.defaults = {
		from: 0,               // the number the element should start at
		to: 0,                 // the number the element should end at
		speed: 1000,           // how long it should take to count between the target numbers
		refreshInterval: 100,  // how often the element should be updated
		decimals: 0,           // the number of decimal places to show
		formatter: formatter,  // handler for formatting the value before rendering
		onUpdate: null,        // callback method for every time the element is updated
		onComplete: null       // callback method for when the element finishes updating
	};
	
	function formatter(value, settings) {
		return value.toFixed(settings.decimals);
	}
}(jQuery));

jQuery(function ($) {
  // custom formatting example
  $('.count-number').data('countToOptions', {
	formatter: function (value, options) {
	  return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
	}
  });
  
  // start all the timers
  $('.timer').each(count);  
  
  function count(options) {
	var $this = $(this);
	options = $.extend({}, options || {}, $this.data('countToOptions') || {});
	$this.countTo(options);
  }
});

//날씨 api
$.getJSON('http://api.openweathermap.org/data/2.5/weather?q=jeju&units=metric&appid=70393e52400da4753a885b68792731f4',
		function(data) {
			var $maxTemp = data.main.temp_max;
			var $minTemp = data.main.temp_min;
			var $cTemp = data.main.temp;
			var $now = new Date($.now());
			var $cDate = $now.getFullYear() + '년 '
					+ ($now.getMonth() + 1) + '월 ' + $now.getDate()
					+ '일';
			var $wIcon = data.weather[0].icon;
			var $wSpeed = data.wind.speed;
			var $wDeg = data.wind.deg;
			var $cFeels_like = data.main.feels_like;
			var $cHumidity = data.main.humidity;
			var $cWeather = data.weather[0].main;

			$('.cweather').append($cWeather);
			$('.chumidity').append($cHumidity + "%");
			$('.clowtemp').append($minTemp + "ºC");
			$('.ctemp').append($cTemp + "ºC");
			$('.chightemp').append($maxTemp);
			$('.cfeels_like').append($cFeels_like + "ºC");
			$('.cdate').prepend($cDate);
			$('.cicon').append('<img src="http://openweathermap.org/img/w/'+$wIcon+'.png", width="100", height="100"/>');
			$('.wspeed').append($wSpeed);
			$('.wdeg').append($wDeg);

		});
		//
	</script>
</body>

</html>