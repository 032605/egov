<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<body>

<%@ include file="/WEB-INF/views/inc/menu.jsp" %>

<div class="join-wrap">
	<div class="join-box">
		
		<h2>회원가입</h2>

		<form method="post" name="frm" action="<c:url value='/member/joinInsert.do'/>">
		<div class="join">
			<ul>
				<li><input type="text" name="id" placeholder="아이디"><a href="javascript:checkId();">중복확인</a></li>
				<li><input type="password" name="password" placeholder="비밀번호"></li>
				<li><input type="password" name="password2" placeholder="비밀번호 확인"></li>
				<li><input type="text" name="name" placeholder="이름"></li>
				<li><input type="text" name="phone" placeholder="연락처"></li>
				<li class="join-btn"><a href="#none">이전으로</a><button type="button" onclick="submitForm();">가입완료</button><a href="#" onclick="submitForm();">가입완료2</a></li>
			</ul>
		</div>
		</form>

	</div>
</div>




<%@ include file="/WEB-INF/views/inc/footer.jsp" %>


<!-- 콘텐츠 끝 -->

<script>
  AOS.init();
</script>

<script>
var msg = '<c:out value="${msg}"/>';
if (msg != '') {
	alert(msg);
}

// <li><input type="text" name="id" placeholder="아이디"><a href="javascript:checkId();">중복확인</a></li>
function checkId() {
	var id = document.frm.id.value;
	
	$.ajax({
		type : 'POST',
		url : '<c:url value="/member/checkId.do"/>',
		dataType : 'JSON',
		data : {"id" : id},
		success : function(data) {
			console.log(data);
			// 위 log가 문자열 형태로 나오는 경우 아래 수행
			//var jsonData = JSON.parse(data);
			//console.log(jsonData);
			if(data.duplicate == "true") {
				alert('이미 가입된 ID입니다.');
			} else {
				alert('가입 가능한 ID입니다.');
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus);
		}
	});
}

// <button type="button" onclick="submitForm();">가입완료</button><a href="#" onclick="submitForm();">가입완료2</a></li>
function submitForm() {
	if (document.frm.id.value == "") {
		alert('ID를 입력해주세요.');
		document.frm.id.focus();
	} else if (document.frm.password.value == "") {
		alert('비밀번호를 입력해주세요.');
		document.frm.password.focus();
	} else if (document.frm.password2.value == "") {
		alert('비밀번호 확인를 입력해주세요.');
		document.frm.password2.focus();
	} else if (document.frm.password.value != document.frm.password2.value) {
		alert('비밀번호 확인이 일치하지 않습니다.');
		document.frm.password2.focus();
	} else if (document.frm.name.value == "") {
		alert('이름를 입력해주세요.');
		document.frm.name.focus();
	} else {
		document.frm.submit();
	}
}
</script>

</body>

</html>

