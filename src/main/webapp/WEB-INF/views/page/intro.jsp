<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<body>

<%@ include file="/WEB-INF/views/inc/menu.jsp" %>

<div id="fullpage">

	<div class="section " id="section0">
		<div class="section01-box">

			<h2>어서오세요 환영 합니다.</h2>
			<p>우리 서원을 소개하는 페이지 블라블라</p>

			<div class="small-gal">
				<ul>
					<li>
						<div>
							<img src="https://ssl.pstatic.net/tveta/libs/1336/1336078/6627065abd040231b455_20210325145141519.jpg" alt="">
						</div>
					</li>
					<li>
						<div>
							<img src="https://ssl.pstatic.net/tveta/libs/1336/1336078/6627065abd040231b455_20210325145141519.jpg" alt="">
						</div>
					</li>
					<li>
						<div>
							<img src="https://ssl.pstatic.net/tveta/libs/1336/1336078/6627065abd040231b455_20210325145141519.jpg" alt="">
						</div>
					</li>
				</ul>

			</div>

		</div>
	</div>

	<div class="section" id="section1">
		
	</div>
	
	<div class="section" id="section2">
		
	</div>

	<div class="section" id="section3">
		
	</div>
</div>

<script type="text/javascript">
    var myFullpage = new fullpage('#fullpage', {
        anchors: ['page01', 'page02', 'page03', 'page04'],
        //sectionsColor: ['#C63D0F', '#1BBC9B', '#7E8F7C'],
        scrollBar: true
    });
</script>



<%@ include file="/WEB-INF/views/inc/footer.jsp" %>


<!-- 콘텐츠 끝 -->

<script>
  AOS.init();
</script>

</body>

</html>

