<%@page import="mvc.models.ProfileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.io.*"%>
<c:set var="dto" value="${profileDTO}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="../resources/css/detail.css">
<link rel="shortcut icon" href="../resources/assets/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="../resources/assets/favicon.ico"
	type="image/x-icon">
<title>${dto.nickname}(${dto.username})님의 데브로필</title>
<script type="text/javascript"
	src="/Devrofile/webjars/jquery/3.6.0/jquery.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script type="text/javascript" src="../resouces/js/captureProfile.js"></script>
<script type="text/javascript">
$(function(){
	$("#save").on("click", function(){
		html2canvas(document.querySelector(".canvas")).then(canvas => {
			saveAs(canvas.toDataURL('image/png'),"my-profile.png");
		});
	});
	function saveAs(uri, filename) {
		var link = document.createElement('a');
		if (typeof link.download === 'string') {
			link.href = uri;
			link.download = filename;
			document.body.appendChild(link);
			link.click();
			document.body.removeChild(link);
		} else {
			window.open(uri);
		}
	}
});
</script>
</head>
<body>
	<div class="canvas" style="width: 630px;">
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
				<img
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAMAAACahl6sAAAAIVBMVEXY2Njz8/Pq6urv7+/h4eHb29vo6Oje3t7j4+Pt7e3p6ekmc3lwAAADMElEQVR4nO2bC3KDMAxEMeab+x+4JZQBEkhBlq2NZt8JvGOtPkZUFSGEEEIIIYQQQgghhBBCCCEEnXbo6hjDLzHW3dBan0dEO9ThjfrrxDQHKv60NNZnu0ETz2Q8w+xbpPQfZTyl9NZnvEB7GlS7AIP3SnNFxgR4fHVXdYTQWZ/1A+14XUcII2x4tf+6fE8EVXJXB6qS+zpAldzyx8Jofep3buSrLXC563L9eAWsnrRSHSFg2eRSX3JMbX32Lb1cRwhIHaQg865E69OviJ0+g+P3pAsBupLEC8G5koSUNQOSuBJqyAJGLRnShQzWGp4kRxZKbKXrCMFaw4SCRTBMomARDJMIB5E9CGOJgtcx3J7Yn8wgdCluhGjogMi/FEIhmXBjdjdC3BRENy2Km6bRTRvvZrDyM+q6eXxw8xzk5oHOz5Opm0dsP58V3Hzo8fPpzc3HUD+fp90sDPhZ4fCzVONnzcnN4pmfVUA/y5mVm3XZys8Cs5+V8srNkv+Ek98uJpz8CDPh5NekGRc/ixFCCCHky2mb4TGO8cLkHuM4PoYGsGfph1r0Ih/rAWc2Oexz74DRE59PHre0GE8pvcoiykxnF2O96Ln3nNFGSqMs4ymlfIT9/1Qio/ADS6vojVe6gilMZUXrnFKbKfeeqiWUed5OXti4QgHTZ3THltxv9fnDaiFveOVKukfkTMRJmxr3yaakiM23ZLJ8cR2ZlBjoyKKksD8W1H1ipENdiWQ/QwflrYJidfAd1b2bQn3JMYrdiknCWlFLXSo/VqSgZRNDg8wo2STzPHgFlZnRPLAmNILLNGMtKGQus5K+J73Am5X0PckL9MYlZCW1mJin3oXEFAzikIk0l8BcSOKVAF1I2pVA1JCFlFpiffY9ch0wuXdGnoFVvnPqIf6JCaJd3CJtHQH69z3Sbh4ssuSxZX3ud2Q6oKrhjKwmwllEahI4i0hNAjJSbZGNV9anPkKiA64cTkhKIlijNSNptwCTlixtPawPfcRDIARoyl2RzLtuhACWEVkhcSPE+szHUAgaFIIGhaBBIWhQCBoUggaFoEEhaFAIGhSCBoWgQSFoUAgap8f9Ac1KQOtCVp1TAAAAAElFTkSuQmCC" />
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
				<p>
					📚 <b>Stack → </b>
					<c:forTokens items="${dto.tech_stacks}" delims=", " var="item">
						<strong class="tech_stack"> #${item} </strong>
					</c:forTokens>
				</p>
				<hr>
			</div>
		</section>

		<section class="user-profile">
			<div class="user-profile-data">
				<h1>Project &amp; Prize</h1>
				<p>
					🌎 <b>Project → </b> ${dto.project_name}
				</p>
				<p>
					🏆 <b>Prize → </b> ${dto.award_name}
				</p>
				<hr>
			</div>
		</section>

		<section class="user-profile">
			<div class="user-profile-data">
				<h1>Major &amp; Job</h1>
				<p>
					📝 <b>Major → ${dto.university_name} </b>(${dto.major})
				</p>
				<p>
					👦 <b> Job → ${dto.company_name} </b>(${dto.job})
				</p>
				<hr>
			</div>
		</section>
	</div>
	<section class="user-profile footer" style="width: 630px;">
		<a class="linkBtn" href="update?profile_no=${dto.profile_no}">UPDATE</a>
		<a class="linkBtn" href="delete?profile_no=${dto.profile_no}">DELETE</a>
		<a class="linkBtn" href="list?page=0">LIST</a>
		<form action="likesAction" method="post" id="like_form">
			<input type="hidden" name="profile_no" value="${dto.profile_no}">
			<table id="list">
				<tr>
					<td class="stats"><input class="stats-likes" type="submit"
						value=""> <strong class="stats-likes-result">${dto.likes}</strong>
					</td>
				</tr>
			</table>
		</form>
		<button style="cursor: pointer;" id="save">
			<img alt="img save" height="50" width="50"
				src="data:image/png;base64,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" />
		</button>
	</section>
</body>
</html>