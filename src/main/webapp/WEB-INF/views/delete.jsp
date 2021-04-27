<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dto" value="${profileDTO}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="deleteAction" method="get">
		<table align="center" border="1">
			<caption>
				프로필 업데이트<br> *처음 글 입력시 입력했던 비밀번호를 입력해주세요
			</caption>
			<tr align="center" bgcolor="lightgreen">
				<th>비밀번호 입력</th>
				<td><input type="password" name="password" required="required" /><input
					type="hidden" name="profile_no" value="${dto.profile_no}" /></td>
			</tr>
		</table>
		<br /> <input type="submit" value="확인" />
	</form>
</body>
</html>