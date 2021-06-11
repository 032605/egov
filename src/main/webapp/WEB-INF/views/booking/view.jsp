<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<body>

<%@ include file="/WEB-INF/views/inc/menu.jsp" %>

<form method="post" name="frm" action="<c:url value='/booking/booking.do' />">
<input type="hidden" name="location" value="<c:out value='${location }' />" />
<div class="booking-view">
	<div class="booking-box">

		<h2><c:out value='${location }' /> 상세보기</h2>

		<div class="calendar-wrap">
			<div class="view-photo">
				<!-- 배너 Swiper -->
				  <div class="swiper-container">
					<div class="swiper-wrapper">
					  <div class="swiper-slide"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMjBfMTI5%2FMDAxNjE2MjAyNTc4OTIy.fCXBPXEK1XXcqPpHH4TdqJmbuWybaKUOQOJouaFdALQg.Ffw6ijgWFV3741SbuyyEpelKPaSbN-yo17j2FDd2k5gg.PNG.kbgkbghi%2F13.png&type=sc960_832"></div>
					  <div class="swiper-slide"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxODA1MzFfMTc3%2FMDAxNTI3NzM1MzM1OTI0.P_ViXyHQ8l2R10otYoBOd1vo4TsiPQR8maK35EX_NxAg.109MKe9licYm6qZlp7xQOws5QbbJ8peyr2oPo-GKY5gg.JPEG.zuckcorp%2F2.jpg&type=sc960_832"></div>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
					<!-- Add Arrows -->
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				  </div>

				  <!-- Initialize Swiper -->
				  <script>
					var swiper = new Swiper('.swiper-container', {
					  autoHeight: true,
					  navigation: {
						nextEl: '.swiper-button-next',
						prevEl: '.swiper-button-prev',
					  },
					  pagination: {
						el: '.swiper-pagination',
					  },
					  autoplay: {
						delay: 2500,
						disableOnInteraction: false,
					  },
					});
				  </script>
			</div>

<style>
	.cal-hd {text-align: center;margin-bottom: 10px;}
	.cal-hd > a{display: inline-block; padding: 5px 15px; background: #000; color: #fff; font-size:17px;}

	.cal-hd > h4{display: inline-block; margin: 0 20px;}

</style>

			<div class="calendar-box">
				<!-- 달력 -->
				<div class="cal-hd">
					<a href="#none"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
					<h4>2021.05</h4>
					<a href="#none"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
				</div>

				<div class="cal-bd">
					<ul class="style01">
						<li class="on"><a href="#none"><span>일</span></a></li>
						<li class="on"><a href="#none"><span>월</span></a></li>
						<li class="on"><a href="#none"><span>화</span></a></li>
						<li class="on"><a href="#none"><span>수</span></a></li>
						<li class="on"><a href="#none"><span>목</span></a></li>
						<li class="on"><a href="#none"><span>금</span></a></li>
						<li class="on"><a href="#none"><span>토</span></a></li>
					</ul>
					<ul>
						<li class="off"><a href="#none"><span>25</span></a></li>
						<li class="off"><a href="#none"><span>26</span></a></li>
						<li class="off"><a href="#none"><span>27</span></a></li>
						<li class="off"><a href="#none"><span>28</span></a></li>
						<li class="off"><a href="#none"><span>29</span></a></li>
						<li class="off"><a href="#none"><span>30</span></a></li>
						<li class="on"><a href="#none"><span>1</span></a></li>
					</ul>
					<ul>
						<li class="today"><a href="#none"><span>2</span></a></li>
						<li class="on"><a href="#none"><span>3</span></a></li>
						<li class="on"><a href="#none"><span>4</span></a></li>
						<li class="on"><a href="#none"><span>5</span></a></li>
						<li class="on"><a href="#none"><span>6</span></a></li>
						<li class="on"><a href="#none"><span>7</span></a></li>
						<li class="on"><a href="#none"><span>8</span></a></li>
					</ul>
					<ul>
						<li class="on"><a href="#none"><span>9</span></a></li>
						<li class="on"><a href="#none"><span>10</span></a></li>
						<li class="on"><a href="#none"><span>11</span></a></li>
						<li class="on"><a href="#none"><span>12</span></a></li>
						<li class="on"><a href="#none"><span>13</span></a></li>
						<li class="on"><a href="#none"><span>14</span></a></li>
						<li class="on"><a href="#none"><span>15</span></a></li>
					</ul>
					<ul>
						<li class="on"><a href="#none"><span>16</span></a></li>
						<li class="on"><a href="#none"><span>17</span></a></li>
						<li class="on"><a href="#none"><span>18</span></a></li>
						<li class="on"><a href="#none"><span>19</span></a></li>
						<li class="on"><a href="#none"><span>20</span></a></li>
						<li class="on"><a href="#none"><span>21</span></a></li>
						<li class="on"><a href="#none"><span>22</span></a></li>
					</ul>
					<ul>
						<li class="on"><a href="#none"><span>23</span></a></li>
						<li class="on"><a href="#none"><span>24</span></a></li>
						<li class="on"><a href="#none"><span>25</span></a></li>
						<li class="on"><a href="#none"><span>26</span></a></li>
						<li class="on"><a href="#none"><span>27</span></a></li>
						<li class="on"><a href="#none"><span>28</span></a></li>
						<li class="on"><a href="#none"><span>29</span></a></li>
					</ul>
					<ul>
						<li class="on"><a href="#none"><span>30</span></a></li>
						<li class="on"><a href="#none"><span>31</span></a></li>
						<li class="off"><a href="#none"><span>1</span></a></li>
						<li class="off"><a href="#none"><span>2</span></a></li>
						<li class="off"><a href="#none"><span>3</span></a></li>
						<li class="off"><a href="#none"><span>4</span></a></li>
						<li class="off"><a href="#none"><span>5</span></a></li>
					</ul>

				</div>
			</div>
		</div>

		<div class="view-btn">
			<input type="text" name="booking_date" size="8" id="bookingDate"> <a href="#none">이전으로</a>
			<a href="#none" onclick ="document.frm.submit();">예약하기</a>
		</div>
		<div class="detail">
			상세페이지

		</div>

	<!-- // 1200 end-->
	</div>
</div>

</form>

<!-- 하단 푸터 불러오기 -->

<div class="footer">
<!-- 하단 정보 -->	
	<div>
		<div class="f-logo">
			<h1><a href="../index.html"><img src="https://blogpfthumb-phinf.pstatic.net/MjAyMDEyMDlfNzgg/MDAxNjA3NDkxNzgyOTI0.LGU9rEeeaT_50jiRTDjAkuuuXSVn75DkbQRc3FFGlVAg.mp16R7RcIyOz-eyAE6ynOCmiazqXcw_GutwxTg36InUg.JPEG.seowonfan/profile.jpg?type=w161" alt=""><span>SEOWON</span></a></h1>
		</div>
		<div class="f-copy">
			<p>copyright(c) SEOWON. All Rights Reserved</p>

		</div>
	</div>
</div>


<!-- 콘텐츠 끝 -->

<script>
	$(".calendar-box .on").click(function() {
		//console.log("select = " + $(this).text());
		
		$(".calendar-box .on").removeClass("selected");	
		$(this).addClass("selected");
		
		var year ="2021";
		var month = "05";
		var day = $(this).text() < 10 ? "0" + $(this).text() : $(this).text();
		console.log("2021-05-" + $(this.text));
		
		$("#bookingDate").val(year + "-" + month + "-" + day);
	});
</script>

<script>
  AOS.init();
</script>

</body>

</html>

