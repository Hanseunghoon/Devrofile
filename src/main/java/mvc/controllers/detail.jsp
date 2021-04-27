<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${articleDTO}" />
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
	<th>글번호</th>
	<td>${dto.no}</td>
</tr>
<tr>
	<th>제목</th>
	<td>${dto.title}</td>
</tr>
<tr>
	<th>이름</th>
	<td>${dto.name}</td>
</tr>
<tr>
	<th>내용</th>
	<td>${dto.content}</td>
</tr>
<tr>
	<th>작성일</th>
	<td>${dto.regdate}</td>
</tr>
<tr>
	<th>조회수</th>
	<td>${dto.readcount}</td>
</tr>
</table><br/>
<a href="update?no=${dto.no}">수정</a> |
<a href="delete?no=${dto.no}">삭제</a> |
<a href="list">리스트</a>
</body>
</html>