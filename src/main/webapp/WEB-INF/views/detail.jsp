<%@page import="mvc.models.ProfileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.*" %>
<c:set var="dto" value="${profileDTO}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.nickname}(${dto.username})님의 데브로필 - 데브로필, 나만의 프로필을 만들다.</title>
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
	background: #333333;
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

.linkBtn {
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
	min-width: 150px;
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

.footer{
	display: flex;
	align-items: center;
	justify-content: space-between;
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

.user-profile {
	display: flex;
	flex-direction: row-reverse;
	justify-content: space-between;
	width: 100%;
	max-width: 720px;
	padding: 20px 16px;
	background-color: #fff;
}

.user-profile:first-child{
	border-top-left-radius: 6px;
	border-top-right-radius: 6px;
}

.user-profile:last-child{
	border-bottom-left-radius: 6px;
	border-bottom-right-radius: 6px;
}

.user-profile-photo {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	width: 300px;
	margin-right: 30px;
}

.user-profile-photo img {
	width: 150px;
	height: auto;
	border-radius: 150px;
	border: 1px solid #eaeaea;
}

.user-profile-data {
	flex-grow: 2;
	padding: 4px 0;
}

.user-profile-data h1 {
	font-size: 28px;
	font-weight: bold;
	line-height: 32px;
	margin: -5px 0 20px;
}

.user-profile-data dl {
	display: flex;
	justify-content: flex-start;
	align-items: center;
	margin-bottom: 10px;
}

.user-profile-data dl div {
	display: flex;
	flex-direction: row-reverse;
	margin-right: 40px;
	font-size: 16px;
	white-space: nowrap;
}

.user-profile-data dl dt {
	font-weight: 400;
	text-transform: lowercase;
	margin-left: 4px;
}

.user-profile-data dl dd {
	font-weight: 700;
}

.user-profile-data h2, .user-profile-data p, .user-profile-data a {
	font-size: 16px;
	line-height: 24px;
}

.user-profile-data h2 {
	font-weight: 600;
}

.user-profile-data p {
	margin-bottom: 10px;
}

.user-profile-data a {
	color: #003569;
	text-decoration: none;
	font-weight: 600;
}

.tech_stack {
	background-color: #3f3f3f;
	border-radius: 6px;
	margin-right: 10px;
	font-size: 14px;
	line-height: 1.5;
	color: #ffffff;
	padding: 1px 6px;
	font-weight: 300;
}
</style>
</head>
<body>
	<header class="user-profile">
		<div class="user-profile-data">
			<h1>Devrofile No.${dto.profile_no}</h1>
			<dl>
				<div>
					<dd>${dto.nickname}</dd>
				</div>
				<div>
					<dd style="color: gray; font-weight: 200">(${dto.username})</dd>
				</div>
			</dl>
			<p>🚩 ${dto.email}</p>
			<a href="${dto.github}" target="_blank">${dto.github}</a><br> <a
				href="${dto.website}" target="_blank">${dto.website}</a>
		</div>
		<div class="user-profile-photo">
			<img src="" alt="" />
		</div>
	</header>

	<section class="user-profile">
		<div class="user-profile-data">
			<h1>Acmicpc Infomation</h1>
			<dl>
				<div>
					<dt>Rank</dt>
					<dd>${dto.acmicpc_rank}</dd>
				</div>
				<div>
					<dt>Solved</dt>
					<dd>${dto.acmicpc_solved}</dd>
				</div>
				<div>
					<dt>% rate</dt>
					<dd>${dto.acmicpc_rate}</dd>
				</div>
			</dl>
			<hr>
		</div>
	</section>
	
	<section class="user-profile">
		<div class="user-profile-data">
			<h1>Tech Stack</h1>
			<p>📚 <b>Stack → </b> 
				<c:forTokens items="${dto.tech_stacks}" delims=", " var="item">
					<strong class="tech_stack">
				    	#${item}
				    </strong>
				</c:forTokens>
			</p>
			<hr>
		</div>
	</section>
	
	<section class="user-profile">
		<div class="user-profile-data">
			<h1>Project &amp; Prize</h1>
			<p>🌎 <b>Project → </b> ${dto.project_name}</p>
			<p>🏆 <b>Prize → </b> ${dto.award_name}</p><hr>
		</div>
	</section>
	
	<section class="user-profile">
		<div class="user-profile-data">
			<h1>Major &amp; Job</h1>
			<p>📝 <b>Major → ${dto.university_name} </b>(${dto.major})</p>
			<p>👨‍💻 <b>Job → ${dto.company_name} </b>(${dto.job})</p><hr>		
		</div>
	</section>
	
	<section class="user-profile footer">
		<a class="linkBtn" href="update?profile_no=${dto.profile_no}">UPDATE</a>
		<a class="linkBtn" href="delete?profile_no=${dto.profile_no}">DELETE</a>
		<a class="linkBtn" href="insert">REGISTER</a> 
		<a class="linkBtn" href="list">LIST</a>
	</section>
</body>
</html>