<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<body>

<%@ include file="/WEB-INF/views/inc/menu.jsp" %>

<%@ include file="/WEB-INF/views/bbs/submenu.jsp" %>

<form method="get" name="frm" action="<c:url value='/bbs/notice_list.do'/>">

<div class="notice-wrap">
	<div class="notice-box">

		<div class="table-hd">
			<div>
				<input type="text" name="searchKeyword" value="${searchVO.searchKeyword}">
				<button onclick="javascript:fn_requestList(1);">검색</button>

			</div>
		</div>

		<div class="table-list">
			<ul class="tb-hd">
				<li>
					<div class="no">번호</div>
					<div class="subject">제목</div>
					<div class="name">글쓴이</div>
					<div class="date">등록일</div>
				</li>
			</ul>
			<c:forEach var="noticeVO" items="${noticeVOList}" varStatus="status">
				<ul class="tb-bd">
					<li>
						<div class="no"><c:out value="${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index)}"/></div>
						<div class="subject"><a href="<c:url value='/bbs/notice_view.do'/>?seq=${noticeVO.seq}"><c:out value="${noticeVO.subject}"/></a></div>
						<div class="name"><c:out value="${noticeVO.writer}"/></div>
						<div class="date"><c:out value="${noticeVO.date}"/></div>
					</li>
				</ul>
			</c:forEach>
		</div>
		<div class="paging">
			<div>
				<ul>
					<ui:pagination paginationInfo="${paginationInfo}" type="myImage" jsFunction="fn_requestList"/>
					<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
				</ul>
			</div>
		</div>
		<div class="table-btn">
			<div>
				<a href="<c:url value='/bbs/notice_write.do'/>">글쓰기</a>
			</div>
		</div>

	</div>

</div>

</form>



<%@ include file="/WEB-INF/views/inc/footer.jsp" %>


<!-- 콘텐츠 끝 -->

<script>
  AOS.init();
</script>

<script>
	function fn_requestList(pageNo) {
		console.log(pageNo);
		document.frm.pageIndex.value = pageNo;
		document.frm.submit();
	}
</script>

</body>

</html>

