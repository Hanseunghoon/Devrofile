<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
@import
	url(https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);

* {
	margin: 0;
	box-sizing: border-box;
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
	animation: fadeIn 0.5s ease-in-out forwards;
	width: 100%;
	height: 100vh;
	margin: 0 auto;
	background-color: #1f2d3d;
}

html {
	background: #333333;
}

.insert {
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
	margin-top: 24px;
}

.js-pscroll {
	position: relative;
	overflow: hidden;
}

.table100 .ps__rail-y {
	width: 9px;
	background-color: transparent;
	opacity: 1 !important;
	right: 5px;
}

.table100 .ps__rail-y::before {
	content: "";
	display: block;
	position: absolute;
	background-color: #ebebeb;
	border-radius: 5px;
	width: 100%;
	height: calc(100% - 30px);
	left: 0;
	top: 15px;
}

.table100 .ps__rail-y .ps__thumb-y {
	width: 100%;
	right: 0;
	background-color: transparent;
	opacity: 1 !important;
}

.table100 .ps__rail-y .ps__thumb-y::before {
	content: "";
	display: block;
	position: absolute;
	background-color: #cccccc;
	border-radius: 5px;
	width: 100%;
	height: calc(100% - 30px);
	left: 0;
	top: 15px;
}

/*//////////////////////////////////////////////////////////////////
[ Table ]*/
.limiter {
	width: 1000px;
}

.container-table100 {
	width: 100%;
	border-radius: 12px;
	background: #fff;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: wrap;
	padding: 33px 30px;
}

.container-table100 h1 {
	margin-bottom: 16px;
}

.wrap-table100 {
	width: 1000px;
}

/*//////////////////////////////////////////////////////////////////
[ Table ]*/
.table100 {
	background-color: #fff;
}

table {
	width: 100%;
}

th, td {
	font-weight: unset;
	padding-right: 10px;
	text-align: center;
	font-size: 16px;
}

.column1 {
	width: 10%;
	padding-left: 20px;
}

.column2 {
	width: 50%;
	font-family: "SpoqaHanSans";
}

.column2 a {
	text-decoration: none;
	font-family: "SpoqaHanSans";
	font-size: 18px;
	line-height: 1.5;
	color: #666;
	letter-spacing: 0.01em;
}

.column2 a:active, a:hover, a:visited {
	text-decoration: none;
	background-color: linear-gradient(90deg, #9f32ff 0%, #fb07f3 100%);
}

.column3 {
	width: 20%;
}

.column4 {
	width: 20%;
}

.table100-head th {
	padding-top: 18px;
	padding-bottom: 18px;
}

.table100-body td {
	padding-top: 16px;
	padding-bottom: 16px;
}

/*==================================================================
[ Fix header ]*/
.table100 {
	position: relative;
	padding-top: 60px;
}

.table100-head {
	position: absolute;
	width: 100%;
	top: 0;
	left: 0;
}

.table100-body {
	max-height: 585px;
	overflow: auto;
}

/*==================================================================
[ Ver1 ]*/
.table100.ver1 th {
	font-family: Lato-Bold;
	font-size: 18px;
	color: #fff;
	line-height: 1.4;
	background-color: #9f32ff;
}

.table100.ver1 td {
	font-family: Lato-Regular;
	font-size: 15px;
	color: #808080;
	line-height: 1.4;
}

.table100.ver1 .table100-body tr:nth-child(even) {
	background-color: #f8f6ff;
}

/*---------------------------------------------*/
.table100.ver1 {
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-webkit-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-o-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
	-ms-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
}

.table100.ver1 .ps__rail-y {
	right: 5px;
}

.table100.ver1 .ps__rail-y::before {
	background-color: #ebebeb;
}

.table100.ver1 .ps__rail-y .ps__thumb-y::before {
	background-color: #cccccc;
}

/* Pagination */
.pagination {
	display: flex;
	justify-content: center;
	margin-top: 12px;
}

.pagination a {
	text-decoration: none;
	font0 font-family: "SpoqaHanSans";
	font-size: 24px;
	line-height: 1.5;
	color: #666;
	letter-spacing: 0.01em;
}
</style>
<title>목록 - 데브로필, 나만의 프로필을 만들다.</title>
</head>
<body>
	<div class="limiter">
		<div class="container-table100">
			<h1>Dev'rofile List</h1>
			<hr>
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead style="text-align: center;">
								<tr class="row100 head">
									<th class="cell100 column1">No</th>
									<th class="cell100 column2">Title</th>
									<th class="cell100 column3">Date</th>
									<th class="cell100 column4">Views</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach var="dto" items="${list}">
									<tr class="profile_list_body">
										<td class="cell100 column1">${dto.profile_no}</td>
										<td class="cell100 column2"><a
											href="detail?profile_no=${dto.profile_no}"><b>${dto.nickname}(${dto.username})님의
													데브로필</b></a></td>
										<td class="cell100 column3">${dto.regdate}</td>
										<td class="cell100 column4">${dto.read_count}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="pagination">
					<c:if test="${pageNum != 0 ? visible : hidden}" var="status">
						<a style="visibility: ${status}"
							href="list.jsp?page=${pageNum - 1}">[이전]</a>
					</c:if>

					<c:forEach begin="0" end="${endPage - 1}" step="1" var="page">
						<a class="pagination-page" href="list.jsp?page=${page}">${page + 1}</a>
					</c:forEach>

					<c:if test="${pageNum != endpage - 1 ? visible : hidden}"
						var="status">
						<a style="visibility: ${status}"
							href="list.jsp?page=${pageNum + 1}">[다음]</a>
					</c:if>
				</div>
				<a class="insert" href="insert">REGISTER</a>
			</div>
		</div>
	</div>
</body>
</html>