<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${profileDTO}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<caption>게시물 상세보기</caption>
<tr>
	<th>작성자 이름</th>
	<td>${dto.username}</td>
</tr>
<tr>
	<th>작성자 닉네임</th>
	<td>${dto.nickname}</td>
</tr>

</table><br/>
<a href="update?profile_no=${dto.profile_no}">수정</a> |
<a href="delete?profile_no=${dto.profile_no}">삭제</a> |
<a href="list">리스트</a>
</body>
</html>