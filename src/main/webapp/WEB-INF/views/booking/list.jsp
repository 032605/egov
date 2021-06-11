<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<body>

<%@ include file="/WEB-INF/views/inc/menu.jsp" %>

<form method="post" name="frm" action="<c:url value='/booking/booking.do' />">

<div class="booking-all">
	<div class="booking-box">
		<h2>장소 예약</h2>

		<div class="booking-wrap">
			<ul>
				<!-- if -->
				<li>
					<div class="booking-box">
						<div class="thum">
							<a href="<c:url value='/booking/view.do'/>?location=CGV한일"><img src="/cho/img/r01.jpg" alt=""></a>
						</div>
						<div class="info">
							<h3><a href="<c:url value='/booking/view.do'/>?location=CGV한일"><img src="/cho/img/r01.jpg" alt="">CGV한일</a></h3>
							<p></p>
							<i>2021-05-03</i>
						</div>
					</div>
				</li>
				<li>
			
					<div class="booking-box">
						<div class="thum">
							<a href="<c:url value='/booking/view.do'/>?location=CGV월성"><img src="/cho/img/r01.jpg" alt=""></a>
						</div>

						<div class="info">
							<h3><a href="<c:url value='/booking/view.do'/>?location=CGV월성">CGV월성</a></h3>
							<p>장소 설명 부분</p>
							<i>2021-05-03</i>
						</div>
					</div>

				</li>
				<li>
			
					<div class="booking-box">
						<div class="thum">
							<a href="<c:url value='/booking/view.do'/>?location=CGV김천"><img src="/cho/img/r01.jpg" alt=""></a>
						</div>

						<div class="info">
							<h3><a href="<c:url value='/booking/view.do'/>?location=CGV김천">CGV김천</a></h3>
							<p>장소 설명 부분</p>
							<i>2021-05-03</i>
						</div>
					</div>

				</li>
				<!-- if end -->

			</ul>


		</div>

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
  AOS.init();
</script>

</body>

</html>

