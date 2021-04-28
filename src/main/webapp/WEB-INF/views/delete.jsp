<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dto" value="${profileDTO}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/delete.css"/>
<title>데브로필 삭제 - 데브로필, 나만의 프로필을 만들다.</title>
</head>
<body>
	<div class="modal">
		<form class="input-group" action="deleteAction" method="get">
			<table class="input-group-table">
				<tr>
					<th><strong>비밀번호를 올바르게 입력해주세요.</strong></th>
				</tr>
				<tr>
					<td><input type="hidden" name="profile_no"
						value="${dto.profile_no}" /> <input type="password"
						name="password" required="required" /></td>
				</tr>
				<tr>
					<td><button type="submit">DELETE</button></td>
				</tr>
			</table>
		</form>
		<a class="submit" href="home">HOME</a>
	</div>
</body>
</html>