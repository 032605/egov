<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="session" value="${sessionScope.login}" scope="application"/>

<!-- 콘텐츠 시작 -->
<div class="header">
	<!-- 로고, 메뉴 -->
	<div class="header-box">
		<h1><a href="<c:url value='/index.do'/>"><img src="https://blogpfthumb-phinf.pstatic.net/MjAyMDEyMDlfNzgg/MDAxNjA3NDkxNzgyOTI0.LGU9rEeeaT_50jiRTDjAkuuuXSVn75DkbQRc3FFGlVAg.mp16R7RcIyOz-eyAE6ynOCmiazqXcw_GutwxTg36InUg.JPEG.seowonfan/profile.jpg?type=w161" alt=""><span>SEOWON</span></a></h1>

		<div class="tnb">
			<ul>
				<c:if test="${not empty session}">
					<li><a href="<c:url value='/member/actionLogout.do'/>"><c:out value="${session.name}"/> 로그아웃<c:out value='${session.auth == "adm" ? "(관리자)" : ""}' /></a></li>
				</c:if>
				<c:if test="${empty session}">
					<li><a href="<c:url value='/member/login.do'/>">로그인</a></li>
				</c:if>
				<li><a href="<c:url value='/member/join.do'/>">회원가입</a></li>
				<!--
				<li><a href="#none">로그아웃</a></li>
				<li><a href="#none">정보수정</a></li>
				-->
			</ul>
		</div>

		<div class="gnb">
			<ul>
				<li>
					<a href="<c:url value='/page/intro.do'/>">회사소개</a>
				</li>
				<li><a href="<c:url value='/bbs/notice_list.do'/>">고객센터</a></li>
				<li><a href="<c:url value='/booking/list.do'/>">예약하기</a></li>
				<li><a href="<c:url value='/booking/mypage.do'/>">예약확인</a></li>
			</ul>
		</div>



	</div>
</div>


<!-- autofix 스크롤시 fixed 클래스 추가-->
<script>
  $(document).ready( function() {
	 $(".header").autofix_anything();
  });
</script>
