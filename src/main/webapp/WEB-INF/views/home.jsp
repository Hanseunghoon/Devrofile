<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>데브로필, 나만의 프로필을 만들다.</title>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<style type="text/css">

@import url(https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);

* {
	margin: 0;
	box-sizing: border-box;
	font-family: "SpoqaHanSans";
}

@keyframes fadeIn {
  from {
    opacity: 0;
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

a {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	min-width: 320px;
	height: 65px;
	border-radius: 6px;
	color: #fff;
	font-size: 25px;
	font-weight: 500;
	letter-spacing: 0.01em;
	text-decoration: none;
	background: linear-gradient(90deg, #9f32ff 0%, #fb07f3 100%);
}

.insert{
	margin-bottom: 20px;
}

</style>
</head>
<body>
	<section class="modal">
		<div>
			<h1>데브로필 Dev'rofile</h1>
			<p>
				간단하게 정보를 입력하고 데브로필을 만들어보세요!<br /> 데브로필을 직장이나 친구에게 자랑해보세요!
			</p>
			<a class="insert" href="insert">데브로필 만들기</a> 
			<a class="list" href="list">다른 데브로필 보기</a>
		</div>
	</section>
</body>
</html>