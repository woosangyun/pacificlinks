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

<title>목록 - Recruit - COMPANY - PACIFICLINKS</title>
	
<link href="../_css/reset.css" rel="stylesheet" type="text/css">
<link href="../_css/style.css" rel="stylesheet" type="text/css">
	
<script>

	var m1 = 0;
	var m2 = 3;
	var m3 = null;
	
</script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-126622113-1"></script>
<script type="text/javascript" src="../_js/googleAnalytics.js"></script>

<script type="text/javascript" src="../_js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="../_js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../_js/jquery.backgroundpos.js"></script>
<script type="text/javascript" src="../_js/jquery.js"></script>


<script type="text/javaScript" defer="defer">

	function goPage(pageNo) {
		document.boardNttListForm.pageNo.value = pageNo;
		document.boardNttListForm.action = "<c:url value='/selectHireList.do'/>";
	   	document.boardNttListForm.submit();
	}
	function fn_addView() {
	   	document.boardNttListForm.action = "<c:url value='/pl/addBoardNttView.do'/>";
	   	document.boardNttListForm.boardNo.value = "hire";
	   	document.boardNttListForm.submit();		
	}
	function fn_egov_select(id, oid) {
		document.boardNttListForm.applyNo.value = id;
		document.boardNttListForm.oid.value = oid;
	   	document.boardNttListForm.action = "<c:url value='/pl/updateWasteApplyView.do'/>";
	   	document.boardNttListForm.submit();		
	}
	$(function() {
		$("#pageUnit").change( function() {
			document.boardNttListForm.pageUnit.value = this.value;
			document.boardNttListForm.action = "<c:url value='/selectHireList.do'/>";
		   	document.boardNttListForm.submit();
	    });	
	});
</script>


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
	
	<div class="top-visual company">
		
		<div class="container">
		
			<div class="wrap">
				<h2><em>PACIFICLINKS</em>company</h2>

				<nav id="lnb">
					<ul class="main-lnb">
						<li class="home"><a href="../00_main/index.html">퍼시픽링스</a></li>
					</ul>
				</nav>
			</div>
			
		</div>
		
	</div>
	
	<!--   CONTENTS   -->
	<section id="contents" class="container">
		
		<h3>인재채용</h3>
		
		<div class="board">
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<ul class="list">
				<li class="subject"><a href="/selectHireView.do?boardNo=${result.boardNo}&contentNo=${result.contentNo}">${result.title}</a></li>
				<fmt:parseDate value="${fn:substring(result.frstRegisterPnttm,0,8) }" var="dateFmt" pattern="yyyyMMdd"/>
				<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd" var="frstPnttm"/>

				<li class="date">${frstPnttm}</li>
			</ul>
		</c:forEach>
		<c:if test="${empty resultList}">
				<ul class="list">
					<li class="subject">게시글이 없습니다.</li>
				</ul>
			</c:if>		
		</div>

<form name="boardNttListForm" id="boardNttListForm" method="get" action="/selectHireList.do">
	<input type="hidden" id="boardNo" name="boardNo" value="${boardNo }"/>
	<input type="hidden" id="pageNo" name="pageNo" value="${pageNo }" />
</form>

		<div id="paging">
			<a href="javascript:goPage(1)" class="ll">첫번째 목록</a>
			<a href="javascript:goPage(${paginationInfo.currentPageNo-1})" class="l">이전 목록</a>
			<div class="wrap">
				<c:forEach var="i" begin="${paginationInfo.firstPageNoOnPageList }" end="${paginationInfo.lastPageNoOnPageList }">
					<c:choose>
						<c:when test="${i eq paginationInfo.currentPageNo}">
							<a href="javascript:goPage(${i})" class="on">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:goPage(${i})">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<a href="javascript:goPage(${paginationInfo.currentPageNo+1})" class="r">다음 목록</a>
			<a href="javascript:goPage(${paginationInfo.totalPageCount})" class="rr">마지막 목록</a>
		</div>

		<div class="board-search">
			<select title="검색목록 선택">
				<option>제목</option>
			</select>
			<div class="input-wrap">
				<input type="text" title="검색어 입력" placeholder="검색어를 입력하세요">
				<button class="btn-search">검색</button>
			</div>
		</div>
		
	</section>
	
	<!--   FOOTER 로드   -->
	<footer class="container-full"></footer>
	
</body>
</html>

