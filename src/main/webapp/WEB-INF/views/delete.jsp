<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dto" value="${profileDTO}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데브로필 삭제 - 데브로필, 나만의 프로필을 만들다.</title>
<style type="text/css">
@import
	url(https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);

* {
	margin: 0;
	box-sizing: border-box;
	font-family: "SpoqaHanSans";
}

@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
html {
	font-family: "SpoqaHanSans";
	font-size: 16px;
	line-height: 1.5;
	color: #1f2d3d;
}

body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	animation: fadeIn 1.5s ease-in-out forwards;
	width: 100%;
	height: 100vh;
	margin: 0 auto;
	background-color: #1f2d3d;
}

html {
	background: #333333;
}

.modal {
	position: relative;
	flex-grow: 0;
	flex-shrink: 0;
	padding: 40px 36px 36px;
	border-radius: 12px;
	background-color: #fff;
	transition: box-shadow 250ms ease-in, transform 250ms ease-in;
}

h1 {
	margin-bottom: 20px;
	font-size: 40px;
	line-height: 1.35;
	font-weight: 600;
	letter-spacing: -0.025em;
	color: #474747;
}

p {
	margin-bottom: 28px;
	font-size: 24px;
	line-height: 1.5;
	color: #666;
	letter-spacing: 0.01em;
}

button {
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	min-width: 280px;
	height: 45px;
	border-radius: 6px;
	color: #fff;
	font-size: 25px;
	font-weight: 500;
	letter-spacing: 0.01em;
	text-decoration: none;
	background: linear-gradient(90deg, #9f32ff 0%, #fb07f3 100%);
	margin-top: 14px;
}

a {
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	min-width: 280px;
	height: 45px;
	border-radius: 6px;
	color: #fff;
	font-size: 25px;
	font-weight: 500;
	letter-spacing: 0.01em;
	text-decoration: none;
	background: linear-gradient(90deg, #9f32ff 0%, #fb07f3 100%);
	margin-top: 14px;
}

.input-group {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

.input-group input {
	width: 300px;
	height: 36px;
	padding: 0 12px;
	border: none;
	border-radius: 4px;
	margin-right: 4px;
	font-size: 14px;
	font-family: "Nunito Sans", sans-serif;
	background-color: gray;
	color: #333e47;
}

.input-group input:focus, .input-group button:focus {
	box-shadow: none;
	outline: none;
}

.input-group input::placeholder {
	color: #b6bec8;
}

.input-group-table .tr {
	margin-bottom: 10px;
}
</style>
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