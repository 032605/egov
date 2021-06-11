<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<body>

<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
<%@ include file="/WEB-INF/views/bbs/gallery_submenu.jsp" %>

<form method="get" name="frm" action="<c:url value='/bbs/gallery_list.do'/>">
	
	
	<div class="table-hd">
		<div>
			<input type="text">
			<button>검색</button>

		</div>
	</div>
	
	<div class="gallery">
		<ul>
			<c:forEach var = "galleryVO" items ="${galleryVOList }" varStatus="status">
				<li>
					<div>
						<div class="thum">
							<c:if test="${not empty galleryVO.oriFilename }">
								<a href="<c:url value='/bbs/gallery_view.do'/>?seq=${galleryVO.seq}"><img src="<c:url value='/bbs/gallery_image.do' />?seq=${galleryVO.seq }"></a>
							</c:if>
							<c:if test="${empty galleryVO.oriFilename }">
								<a href="<c:url value='/bbs/gallery_view.do'/>?seq=${galleryVO.seq}"><img src="https://missioninfra.net/img/noimg/noimg_4x3.gif"></a>
							</c:if>
						</div>

						<div class="info">
							<h3><a href="<c:url value='/bbs/gallery_view.do'/>?seq=${galleryVO.seq}"><c:out value='${galleryVO.subject }' /></a></h3>
							<p><c:out value='${galleryVO.contents }' /> </p>
							<i><c:out value='${galleryVO.date }' /></i>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	
	
	<div class="table-btn">
		<div>
			<a href="<c:url value='/bbs/gallery_writeView.do' /> ">글쓰기</a>
		</div>
	</div>



</form>


<!-- 하단 푸터 불러오기 -->

<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

