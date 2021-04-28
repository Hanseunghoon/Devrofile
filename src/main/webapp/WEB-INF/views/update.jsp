<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="dto" value="${profileDTO}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/update.css">
<title>데브로필 수정 - 데브로필, 나만의 프로필을 만들다.</title>
</head>
<body>
	<div class="modal">
		<form class="input-group" action="updateAction" method="post">
			<table class="input-group-table">
				
				<tr>
					<td><input type="hidden" name="profile_no"
						value="${dto.profile_no}" /></td>
				</tr>
				<tr>
					<th>User Name</th>
					<td><input type="text" name="username" autofocus="autofocus"
						required="required" placeholder="10자 이내 (ex: 한승훈)" value="${dto.username}" /></td>
				</tr>
				<tr>
					<th>Nickname</th>
					<td><input type="text" name="nickname" required="required"
						placeholder="10자 이내 (ex: 무야호)" value="${dto.nickname}"/></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td><input type="email" name="email" required="required"
						placeholder="(ex: example@naver.com)" value="${dto.email}" /></td>
				</tr>
				<tr>
					<th>Github</th>
					<td><input type="text" name="github" placeholder="자신의 깃허브 URL" value="${dto.github}"/></td>
				</tr>
				<tr>
					<th>Blog</th>
					<td><input type="text" name="website"
						placeholder="자신의 개인 사이트 URL" value="${dto.website}"/></td>
				</tr>
				<tr>
					<th>Acmicpc Rank</th>
					<td><input type="text" name="acmicpc_rank" placeholder="백준 랭킹" value="${dto.acmicpc_rank}"/></td>
				</tr>

				<tr>
					<th>Acmicpc Solved</th>
					<td><input type="text" name="acmicpc_solved"
						placeholder="백준 문제 맞힌 수" value="${dto.acmicpc_solved}"/></td>
				</tr>

				<tr>
					<th>Acmicpc Rate</th>
					<td><input type="text" name="acmicpc_rate"
						placeholder="백준 정답률" value="${dto.acmicpc_rate}"/></td>
				</tr>
				<tr>
					<th>Tech Stack</th>
					<td><input type="text" name="tech_stacks"
						placeholder="(ex: JAVA, JSP, SPRING)" value="${dto.tech_stacks}"/></td>
				</tr>
				<tr>
					<th>Project Name</th>
					<td><input type="text" name="project_name"
						placeholder="20자 이내" value="${dto.project_name}"/></td>
				</tr>
				<tr>
					<th>Award Name</th>
					<td><input type="text" name="award_name" placeholder="20자 이내" value="${dto.award_name}"/></td>
				</tr>
				<tr>
					<th>University</th>
					<td><input type="text" name="university_name"
						placeholder="10자 이내" value="${dto.university_name}"/></td>
				</tr>
				<tr>
					<th>Major</th>
					<td><input type="text" name="major" placeholder="10자 이내" value="${dto.major}"/></td>
				</tr>
				<tr>
					<th>Company</th>
					<td><input type="text" name="company_name"
						placeholder="10자 이내" value="${dto.company_name}"/></td>
				</tr>
				<tr>
					<th>Job</th>
					<td><input type="text" name="job" placeholder="10자 이내" value="${dto.job}"/></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="password" required="required"
						placeholder="비밀번호를 정확하게 입력하세요" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="submit" type="submit">UPDATE</button>
					</td>
				</tr>
			</table>
		</form>
		<a class="submit" href="list?page=0">LIST</a>
	</div>
</body>
</html>