<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<caption>프로필 리스트</caption>
		<tr>
			<th>번호</th>
			<th>프로필</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.profile_no}</td>
				<td><a href="detail?no=${dto.profile_no}">${dto.nickname}(${dto.username})님의
						데브로필</a></td>
				<td>${dto.regdate}</td>
				<td>${dto.read_count}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="enroll">프로필 등록하기</a>
</body>
</html>