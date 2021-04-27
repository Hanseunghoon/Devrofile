<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데브로필 작성 - 데브로필, 나만의 프로필을 만들다.</title>
<style type="text/css">
@import
	url(https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);

* {
	margin: 0;
	box-sizing: border-box;
	font-family: "SpoqaHanSans";
}

@keyframes fadeIn {from { opacity:0;
	
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
	animation: fadeIn 0.5s ease-in-out forwards;
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

.submit {
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	min-width: 350px;
	height: 45px;
	border-radius: 6px;
	color: #fff;
	font-size: 18px;
	font-weight: 500;
	letter-spacing: 0.01em;
	text-decoration: none;
	background: linear-gradient(90deg, #9f32ff 0%, #fb07f3 100%);
	margin-top: 24px;
}

.input-group {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

.input-group input {
	width: 240px;
	height: 36px;
	padding: 0 12px;
	border: none;
	border-radius: 4px;
	margin-right: 4px;
	font-size: 14px;
	font-family: "Nunito Sans", sans-serif;
	background-color: #f6f8fa;
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
		<form class="input-group" action="insertAction" method="post">
			<table class="input-group-table">
				<h1>데브로필 작성</h1>
				<tr>
					<th>User Name</th>
					<td><input type="text" name="username" autofocus="autofocus"
						required="required" placeholder="10자 이내 (ex: 한승훈)" /></td>
				</tr>
				<tr>
					<th>Nickname</th>
					<td><input type="text" name="nickname" required="required"
						placeholder="10자 이내 (ex: 무야호)" /></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td><input type="email" name="email" required="required"
						placeholder="(ex: example@naver.com)" /></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="password" required="required"
						placeholder="8~12자 이내" /></td>
				</tr>
				<tr>
					<th>Github</th>
					<td><input type="text" name="github" placeholder="자신의 깃허브 URL" /></td>
				</tr>
				<tr>
					<th>Blog</th>
					<td><input type="text" name="website"
						placeholder="자신의 개인 사이트 URL" /></td>
				</tr>

				<tr>
					<th>Acmicpc Rank</th>
					<td><input type="text" name="acmicpc_rank" placeholder="백준 랭킹" /></td>
				</tr>

				<tr>
					<th>Acmicpc Solved</th>
					<td><input type="text" name="acmicpc_solved"
						placeholder="백준 문제 맞힌 수" /></td>
				</tr>

				<tr>
					<th>Acmicpc Rate</th>
					<td><input type="text" name="acmicpc_rate"
						placeholder="백준 정답률" /></td>
				</tr>

				<tr>
					<th>Tech Stack</th>
					<td><input type="text" name="tech_stacks"
						placeholder="(ex: JAVA, JSP, SPRING)" /></td>
				</tr>
				<tr>
					<th>Project Name</th>
					<td><input type="text" name="project_name"
						placeholder="20자 이내" /></td>
				</tr>
				<tr>
					<th>Award Name</th>
					<td><input type="text" name="award_name" placeholder="20자 이내" /></td>
				</tr>
				<tr>
					<th>University</th>
					<td><input type="text" name="university_name"
						placeholder="10자 이내" /></td>
				</tr>
				<tr>
					<th>Major</th>
					<td><input type="text" name="major" placeholder="10자 이내" /></td>
				</tr>
				<tr>
					<th>Company</th>
					<td><input type="text" name="company_name"
						placeholder="10자 이내" /></td>
				</tr>
				<tr>
					<th>Job</th>
					<td><input type="text" name="job" placeholder="10자 이내" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="submit" type="submit">REGISTER</button>
					</td>
				</tr>
			</table>
		</form>

		<a class="submit" href="list">LIST</a>
	</div>
</body>
</html>