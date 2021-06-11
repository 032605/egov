<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<body>

<%@ include file="/WEB-INF/views/inc/menu.jsp" %>

<%@ include file="/WEB-INF/views/bbs/submenu.jsp" %>

<form method="post" name="frm" action="<c:url value='/bbs/notice_write_action.do'/>" enctype="multipart/form-data">
<c:if test="${mode == 'modify'}">
<input type="hidden" name="seq" value="${noticeVO.seq}">
</c:if>
<input type="hidden" name="mode" value="${mode}">

<div class="notice-wrap">
	<div class="notice-box">
	
		<div class="bbs-write">
			<div>
				<ul>
					<li>
						<label for="">제목</label>
						<input type="text" name="subject" value="<c:out value='${noticeVO.subject}'/>" placeholder="제목을 입력해 주세요.">
					</li>
					<li>
						<label for="">내용</label>
						<textarea name="contents" id="" placeholder="내용을 입력 하는 부분 입니다."><c:out value='${noticeVO.contents}'/></textarea>
					</li>
					<c:if test="${empty noticeVO.filename}">
						<li>
							<label for="">첨부파일 #01</label>
							<input type="file" name="uploadFile">
						</li>
					</c:if>
					<c:if test="${not empty noticeVO.filename}">
						<li>
							<label for="">${noticeVO.oriFilename} <a href="#" onclick="javascript:confirmDeleteFile();">[삭제]</a></label>
						</li>
					</c:if>
					<!-- <li>
						<label for="">첨부파일 #02</label>
						<input type="file">
					</li> -->
					<li class="checkbox-wrap">
						<label for="">공지선택</label>
						<input type="checkbox" id="chk-notice"><label for="chk-notice">선택시 공지사항</label>
					</li>
				</ul>

			</div>

		</div>


		<div class="table-btn">
			<div>
				<a href="./notice_list.html">이전</a>
				<a href="#" onclick="javscript:document.frm.submit();">완료</a>
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
	function confirmDeleteFile() {
		if(confirm('삭제하시겠습니까?') == true) {
			$.ajax({
				type : 'POST',
				url : '<c:url value="/bbs/notice_deleteFile.do"/>',
				dataType : 'JSON',
				data : {"seq" : ${noticeVO.seq}},
				success : function(data) {
					if(data.success == "true") {
						location.reload();
					} else {
						alert('파일 삭제가 실패하였습니다.');
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(textStatus);
				}
			});
		}
	}
</script>

</body>

</html>

