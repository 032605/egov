<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<body>

<%@ include file="/WEB-INF/views/inc/menu.jsp" %>

<%@ include file="/WEB-INF/views/bbs/gallery_submenu.jsp" %>

<div class="notice-wrap">
	<div class="notice-box">
	
		<div class="bbs-view">
			<div class="view-hd">
				<span><c:out value='${galleryVO.date }' /></span>
				<h2><c:out value='${galleryVO.subject }' /></h2>
				<p>작성자 : <b><c:out value='${galleryVO.writer }' /></b></p>
			</div>

			<div class="view-cont">
				<div class="view-thum">
					<c:if test="${not empty galleryVO.oriFilename }">
					<img src="<c:url value='/bbs/gallery_image.do' />?seq=${galleryVO.seq }">
					</c:if>
				</div>
					<c:out value='${galleryVO.contents }' />
			</div>

			<div class="view-file">
				<a href="#none"><i class="fa fa-download" aria-hidden="true"></i><c:out value='${galleryVO.oriFilename }' /></a>
			</div>
		</div>

		<div class="table-btn">
			<div>
				<a href="<c:url value='/bbs/gallery_modify.do' />?seq=${galleryVO.seq}">수정</a>
				<a href="#none" onclick ="javascript:confirmDelete(); return false;">삭제</a>
				<a href="<c:url value='/bbs/gallery_list.do' />">목록으로</a>
			</div>
		</div>

	</div>

</div>


<!-- 하단 푸터 불러오기 -->

<%@ include file="/WEB-INF/views/inc/footer.jsp" %>


<script>
	function confirmDelete(){
		if(confirm('삭제하시겠습니까?') == true) {
			location.href = '<c:url value="/bbs/gallery_delete.do"/>?seq=${galleryVO.seq}';
		}
	}
</script>

