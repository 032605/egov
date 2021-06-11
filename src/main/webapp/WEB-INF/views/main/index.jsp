<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<body>

<%@ include file="/WEB-INF/views/inc/menu.jsp" %>

<div class="contents">
	<div class="main-visual">
		<h2 data-aos="fade-down" data-aos-delay="100">늘 준비되어 있는 서원 송풍기</h2>
		<p data-aos="fade-up">
			<!-- br은 줄바꿈 태그 -->
			<span data-aos="fade-up" data-aos-delay="300"> 최고의 품질과 기술력으로 최선을 다합니다.</span>
			<span data-aos="fade-up" data-aos-delay="500">국내 제품만을 고집하는 믿을 수 있는 서원 송풍기 제품 입니다.</span>
		</p>
	</div>

	<div class="numbers-wrap">
		<div class="numbers">
			<h2>전국 설치 현황</h2>
			<p>서원송풍기에서 설치한 제품 현황 입니다.</p>
			<div class="num-data">
				<ul>
					<li data-aos="fade-up" data-aos-delay="100">
						<p>209,435<i>개</i></p>
						<span>일반 송풍기</span>
					</li>
					<li data-aos="fade-up" data-aos-delay="200">
						<p>250<i>개</i></p>
						<span>특수 송풍기</span>
					</li>
					<li data-aos="fade-up" data-aos-delay="300">
						<p>1,523<i>개</i></p>
						<span>환풍기</span>
					</li>
					<li data-aos="fade-up" data-aos-delay="400">
						<p>85<i>개</i></p>
						<span>덕트</span>
					</li>
				</ul>
			</div>


		</div>
	</div>


	<div class="slide-banner">
		<!-- Swiper -->
		  <div class="swiper-container">
			<div class="swiper-wrapper">
			  <div class="swiper-slide"><img src="./img/bt_01.jpg"></div>
			  <div class="swiper-slide"><img src="./img/bt_01.jpg"></div>
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

	<div class="main-gallery-wrap">
		<div class="m-g-box">
			<h2>PRODUCT</h2>

			<div class="main-gallery">
				<ul>
					<li data-aos="fade-up" data-aos-delay="100">
						<div>
							<div class="thum">
								<a href="#none">
									<img src="http://samhwafan.co.kr/wp-content/uploads/2013/06/siricco-fan-600x600.png">
								</a>
							</div>
							<div class="info">
								<a href="#none">
									<h3>다익송풍기 (SIROCCO FAN) 밸트형</h3>
									<p>
										저정압, 대풍량용으로 공기조절, <br/>환기 등 광범위 하게 사용 가능.
									</p>
									<span>
										<i class="fa fa-eye" aria-hidden="true"></i>
										<u>Link</u>
									</span>
								</a>
							</div>
						</div>
					</li>
					<li data-aos="fade-up" data-aos-delay="100">
						<div>
							<div class="thum">
								<a href="#none">
									<img src="http://samhwafan.co.kr/wp-content/uploads/2013/06/siricco-fan-600x600.png">
								</a>
							</div>
							<div class="info">
								<a href="#none">
									<h3>다익송풍기 (SIROCCO FAN) 밸트형</h3>
									<p>
										저정압, 대풍량용으로 공기조절, <br/>환기 등 광범위 하게 사용 가능.
									</p>
									<span>
										<i class="fa fa-eye" aria-hidden="true"></i>
										<u>Link</u>
									</span>
								</a>
							</div>
						</div>
					</li>
					<li data-aos="fade-up" data-aos-delay="100">
						<div>
							<div class="thum">
								<a href="#none">
									<img src="http://samhwafan.co.kr/wp-content/uploads/2013/06/siricco-fan-600x600.png">
								</a>
							</div>
							<div class="info">
								<a href="#none">
									<h3>다익송풍기 (SIROCCO FAN) 밸트형</h3>
									<p>
										저정압, 대풍량용으로 공기조절, <br/>환기 등 광범위 하게 사용 가능.
									</p>
									<span>
										<i class="fa fa-eye" aria-hidden="true"></i>
										<u>Link</u>
									</span>
								</a>
							</div>
						</div>
					</li>
					<li data-aos="fade-up" data-aos-delay="100">
						<div>
							<div class="thum">
								<a href="#none">
									<img src="http://samhwafan.co.kr/wp-content/uploads/2013/06/siricco-fan-600x600.png">
								</a>
							</div>
							<div class="info">
								<a href="#none">
									<h3>다익송풍기 (SIROCCO FAN) 밸트형</h3>
									<p>
										저정압, 대풍량용으로 공기조절, <br/>환기 등 광범위 하게 사용 가능.
									</p>
									<span>
										<i class="fa fa-eye" aria-hidden="true"></i>
										<u>Link</u>
									</span>
								</a>
							</div>
						</div>
					</li>
					<li data-aos="fade-up" data-aos-delay="100">
						<div>
							<div class="thum">
								<a href="#none">
									<img src="http://samhwafan.co.kr/wp-content/uploads/2013/06/siricco-fan-600x600.png">
								</a>
							</div>
							<div class="info">
								<a href="#none">
									<h3>다익송풍기 (SIROCCO FAN) 밸트형</h3>
									<p>
										저정압, 대풍량용으로 공기조절, <br/>환기 등 광범위 하게 사용 가능.
									</p>
									<span>
										<i class="fa fa-eye" aria-hidden="true"></i>
										<u>Link</u>
									</span>
								</a>
							</div>
						</div>
					</li>
					<li data-aos="fade-up" data-aos-delay="100">
						<div>
							<div class="thum">
								<a href="#none">
									<img src="http://samhwafan.co.kr/wp-content/uploads/2013/06/siricco-fan-600x600.png">
								</a>
							</div>
							<div class="info">
								<a href="#none">
									<h3>다익송풍기 (SIROCCO FAN) 밸트형</h3>
									<p>
										저정압, 대풍량용으로 공기조절, <br/>환기 등 광범위 하게 사용 가능.
									</p>
									<span>
										<i class="fa fa-eye" aria-hidden="true"></i>
										<u>Link</u>
									</span>
								</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/inc/footer.jsp" %>


<!-- 콘텐츠 끝 -->

<script>
  AOS.init();
</script>

</body>

</html>

