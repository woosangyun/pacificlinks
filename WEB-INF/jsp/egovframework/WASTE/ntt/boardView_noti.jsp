<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=1, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">

<title>상세 - 공지사항 - COMMUNITY - PACIFICLINKS</title>
	
<link href="../_css/reset.css" rel="stylesheet" type="text/css">
<link href="../_css/style.css" rel="stylesheet" type="text/css">
	
<script>

	var m1 = 6;
	var m2 = 0;
	var m3 = null;
	
</script>

<script type="text/javascript" src="../_js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="../_js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../_js/jquery.backgroundpos.js"></script>
<script type="text/javascript" src="../_js/jquery.js"></script>
<!--[if lt IE 9]>
	<script type="text/javascript" src="../_js/respond.js"></script>
	<script type="text/javascript" src="../_js/selectivizr-min.js"></script>
	<script src="../_js/html5shiv.js"></script>
<![endif]-->
</head>
<body>
	
	<!--   SKIP NAV   -->
	<nav id="skip-nav"></nav>
	
	<!--   HEADER 로드   -->
	<header class="container-full on"></header>
	
	<div class="top-visual community">
		
		<div class="container">
		
			<div class="wrap">
				<h2><em>PACIFICLINKS</em>community</h2>

				<nav id="lnb">
					<ul class="main-lnb">
						<li class="home"><a href="../00_main/index.html">퍼시픽링스</a></li>
					</ul>
				</nav>
			</div>
			
		</div>
		
	</div>
	
	<!--   CONTENTS   -->
	<section id="contents" class="container" tabindex="-1">
		
		<h3>공지사항</h3>
		
		<div class="board">
			<div class="board-view-top">
				<p class="title">${boardNttResult.title}</p>
				<fmt:parseDate value="${fn:substring(result.frstRegisterPnttm,0,8) }" var="dateFmt" pattern="yyyyMMdd"/>
				<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd" var="frstPnttm"/>
				<p class="date">${frstPnttm}</p>
			</div>
			<div class="board-view-con">			
				<p class="mt40">					
					${boardNttResult.content}
				</p>
			</div>
 			
			<c:if test="${!(empty boardAtchmnflList)}">
			<div class="file-wrap">
				<c:forEach var="bbsAtchmnfl" items="${boardAtchmnflList}" varStatus="idx">
				<ul>									
					<li class="key">첨부파일${idx.count}</li>
					<li class="value"><a href="/downloadBbsFile.do?atchmnflNo=${bbsAtchmnfl.atchmnflNo}" class="file">${bbsAtchmnfl.fileNm}</a></li>					
				</ul>
				</c:forEach>
			</div>
			</c:if>
<!--
			<div class="bottom">
				<ul class="prev">
					<li class="key">이전글</li>
					<li class="link"><a href="#">2018 창업 아카데미 참가 신청(안내)</a></li>
				</ul>
				<ul class="next">
					<li class="key">다음글</li>
					<li class="link"><a href="#">2018 창업 아카데미 참가 신청(안내)</a></li>
				</ul>
			</div>
-->
			<div class="btn-wrap">
				<a href="#" class="btn-stroke" onClick="history.back();">목록</a>
			</div>

		</div>
		
	</section>
	
	<!--   FOOTER 로드   -->
	<footer class="container-full"></footer>
	
</body>
</html>

