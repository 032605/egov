<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>ID</td>
			<td>name</td>
			<td>content</td>
			<td>date</td>
		</tr>
		
		<c:forEach var="result" items="${resultList }" varStatus="status">
		<tr>
			<td>${status.index }</td>
			<td>${result.te_name }</td>
			<td>${result.te_content }</td>
			<td>${result.insert_date }</td>
		</tr>
		</c:forEach>
		
	</table>
</body>
</html>