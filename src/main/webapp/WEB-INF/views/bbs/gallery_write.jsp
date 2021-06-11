<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<body>

<%@ include file="/WEB-INF/views/inc/menu.jsp" %>

<%@ include file="/WEB-INF/views/bbs/gallery_submenu.jsp" %>

<form method="post" name="frm" action="<c:url value='/bbs/gallery_write_action.do'/>" enctype="multipart/form-data">
<c:if test="${mode == 'modify'}">
	<input type="hidden" name="seq" value="${galleryVO.seq}" /> 
</c:if>
<input type="hidden" name="mode" value="${mode}" />

<div class="notice-wrap">
	<div class="notice-box">
	
		<div class="bbs-write">
				<ul>
					<li>
						<label for="">제목</label>
						<input type="text" name="subject" placeholder="제목을 입력해 주세요." value="<c:out value='${galleryVO.subject }' />">
					</li>
					<li>
						<label for="">내용</label>
						<textarea name="contents" id="" placeholder="내용을 입력 하는 부분 입니다."> <c:out value='${galleryVO.contents }' /> </textarea>
					</li>
					<c:if test="${empty galleryVO.oriFilename }">
						<li>
							<label for="">첨부파일 #01</label>
							<input type="file" name="uploadFile">
						</li>
					</c:if>
					
					<c:if test="${not empty galleryVO.oriFilename }">
						<li>
							<lable for="">${galleryVO.oriFilename } <a href="#" onclick="javascript:confirmDelete(); return false;"> [삭제] </a> </lable>
						</li>
					</c:if>
					<li class="checkbox-wrap">
						<label for="">공지선택</label>
						<input type="checkbox" id="chk-notice"><label for="chk-notice">선택시 공지사항</label>
					</li>
				</ul>
		</div>


		<div class="table-btn">
			<div>
				<a href="<c:url value='/bbs/gallery_list.do' />"> 목록 </a>
				<a href="#" onclick="javascript:document.frm.submit();"> 완료 </a>
			</div>
		</div>

	</div>

</div>
</form>

<!-- 하단 푸터 불러오기 -->

<%@ include file="/WEB-INF/views/inc/footer.jsp" %>

<script type="text/javascript">

function confirmDelete() {
	if(confirm('삭제하시겠습니까?') == true ) {
		$.ajax({
			type : 'POST',
			url : '<c:url value="/bbs/gallery_deledteFile.do" />',
			dataType : 'JSON',
			data : {"seq" : ${galleryVO.seq}},
			success : function(data) {
				if(data.success == "true") {
					location.reload();
				} else {
					alert ('파일 삭제가 실패하였습니다.');
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus);
			}
		});
	}
}

</script>
