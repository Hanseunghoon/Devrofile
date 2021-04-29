<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/list.css" />
<link rel="shortcut icon" href="../resources/assets/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="../resources/assets/favicon.ico"
	type="image/x-icon">
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
									<th class="cell100 column4">Likes</th>
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
											href="detail?profile_no=${dto.profile_no}"><b>${dto.username}(${dto.nickname})님의
													데브로필</b></a></td>
										<td class="cell100 column3">${dto.regdate}</td>
										<td class="cell100 column4">${dto.likes}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="pagination">
					<c:if test="${page != 0}">
						<a href="list?page=${page - 1}">◀</a>
					</c:if>
					<c:if test="${page == 0}">
						<a style="visibility: hidden;" href="list?page=${page - 1}">◀</a>
					</c:if>
					<ol>
						<c:forEach begin="0" end="${endPage - 1}" step="1" var="page">
							<li><a href="list?page=${page}">${page + 1}</a></li>
						</c:forEach>
					</ol>
					<c:if test="${page != endPage - 1}">
						<a href="list?page=${page + 1}">▶</a>
					</c:if>
					<c:if test="${page == endPage - 1}">
						<a style="visibility: hidden;" href="list?page=${page + 1}">▶</a>
					</c:if>
				</div>
				<a class="insert" href="insert">REGISTER</a>
			</div>
		</div>
	</div>
</body>
</html>