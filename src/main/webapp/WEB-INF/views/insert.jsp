<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertAction" method="post">
		<table>
			<caption>프로필 작성하기</caption>
			<tr>
				<th>이름</th>
				<td><input type="text" name="username" autofocus="autofocus"
					required="required" /></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickname" required="required" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" required="required" /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" required="required" /></td>
			</tr>
			<tr>
				<th>깃허브 주소</th>
				<td><input type="text" name="github" /></td>
			</tr>
			<tr>
				<th>개인 사이트 주소</th>
				<td><input type="text" name="website" /></td>
			</tr>
			<tr>
				<th>acmicpc 정보 입력</th>
				<td>
					랭킹<input type="text" name="acmicpc_rank" /> 
					맞힌 문제 수<input type="text" name="acmicpc_solved" /> 
					정답률<input type="text" name="acmicpc_rate" />
				</td>
			</tr>
			<tr>
				<th>사용하는 기술(,로 나열하세요)</th>
				<td>
					<input type="text" name="tech_stacks" /> 
				</td>
			</tr>
			<tr>
				<th>대표 프로젝트</th>
				<td><input type="text" name="project_name" /> </td>
				<th>대표 수상</th>
				<td><input type="text" name="award_name" /> </td>
			</tr>
			<tr>
				<th>학력</th>
				<td><input type="text" name="university_name" /> </td>
				<th>전공</th>
				<td><input type="text" name="major" /> </td>
			</tr>
			<tr>
				<th>경력</th>
				<td><input type="text" name="company_name" /> </td>
				<th>직무</th>
				<td><input type="text" name="job" /> </td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="완료" /></td>
			</tr>
		</table>
	</form>
</body>
</html>