<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<body>

<%@ include file="/WEB-INF/views/inc/menu.jsp" %>

<form method="get" name="frm" action="<c:url value='/booking/mypage.do' />">

<div class="notice-wrap">
	<div class="notice-box mypage">
		<h2>예약 확인</h2>

		<div class="table-hd">
			<div>
				<input type="text" name="searchKeyword" value="<c:out value='${SerachVO.searchKeyword }' />" />
				<button onclick="javascript:document.frm.submit();">검색</button>

			</div>
		</div>

		<div class="table-list mypage-list">
		

			<ul class="tb-hd">
				<li>
					<div class="no">번호</div>
					<div class="subject">장소</div>
					<div class="state">상태</div>
					<div class="name">예약자</div>
					<div class="booking_date">예약일</div>
					<div class="date">등록일</div>
					<c:if test="${session.auth == 'adm' }">
						<div class="manage">관리자 메뉴</div>
					</c:if>
				</li>
			</ul>
			
		<c:forEach var="bookingVO" items="${bookingVOList }" varStatus="status">
			<ul class="tb-bd">
				<li>
					<div class="no">${bookingVO.seq}</div>
					<div class="subject"><c:out value="${bookingVO.location}" /></div>
					
					<div class="state">
						<c:choose>
							<c:when test="${bookingVO.status == '1'}" >
								<span class="color01">승인</span>
							</c:when>
							<c:when test="${bookingVO.status == '2'}" >
								<span class="color02">대기</span>
							</c:when>
							<c:when test="${bookingVO.status == '3'}" >
								<span class="color03">취소</span>
							</c:when>
							<c:when test="${bookingVO.status == '4'}" >	
								<span class="color04">반려</span>
							</c:when>
						</c:choose>
						
					</div>
					<div class="name"><c:out value="${bookingVO.name}" /></div>
					<div class="booking_date"><c:out value="${bookingVO.booking_date}" /></div>
					<div class="date"><c:out value="${bookingVO.date}" /></div>
					
					<c:if test="${session.auth == 'adm' }">
						<div class="manage">
							<a href="javascript:manage(${bookingVO.seq }, '1');">[승인]</a>
							<a href="javascript:manage(${bookingVO.seq }, '2');">[대기]</a>
							<a href="javascript:manage(${bookingVO.seq }, '3');">[취소]</a>
							<a href="javascript:manage(${bookingVO.seq }, '4');">[반려]</a>
						</div>
					</c:if>
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

	</div>

</div>


</form>


<!-- 하단 정보 불러오기 -->

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

<script>
	function fn_requestList(pageNo) {
		console.log(pageNo);
		document.frm.pageIndex.value = pageNo;
		document.frm.submit();
	}
</script>



<script>
// 구조적으로 깔끔하게 처리
var statusText = new Map([
	['1','승인'],
	['2','대기'],
	['3','취소'],
	['4','반려']
	
]);

   function manage(seq, status){
	   
      if(confirm(statusText.get(status) + ' 상태로 바꾸시겠습니까?') == true){
         $.ajax({
            type:'POST',
            url:'<c:url value="/booking/modify_status.do"/>',
            dataType: 'JSON',
            data: {'seq' : seq, 'status': status},
            success : function(data){
               if(data.success == "true"){
                  location.reload();
               }else{
                  alert('상태변경을 실패했습니다.');
               }
            },
            error: function(jqXHR, textStatus, errorThrown){
               console.log(textStatus);
            }
         });
      }
      
   }
</script>



</body>

</html>

