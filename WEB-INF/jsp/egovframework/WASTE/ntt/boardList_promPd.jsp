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

<title>목록 - 프로모션 상품  - TRAVEL - PACIFICLINKS</title>
	
<link href="../_css/reset.css" rel="stylesheet" type="text/css">
<link href="../_css/style.css" rel="stylesheet" type="text/css">
	
<script>

	var m1 = 3;
	var m2 = 0;
	var m3 = null;
	
</script>

<script type="text/javascript" src="../_js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="../_js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../_js/jquery.backgroundpos.js"></script>
<script type="text/javascript" src="../_js/jquery.js"></script>


<script type="text/javaScript" defer="defer">

	function goPage(pageNo) {
		document.boardNttListForm.pageNo.value = pageNo;
		document.boardNttListForm.action = "<c:url value='/selectBoardList.do'/>";
	   	document.boardNttListForm.submit();
	}

	$(function() {
		$("#pageUnit").change( function() {
			document.boardNttListForm.pageUnit.value = this.value;
			document.boardNttListForm.action = "<c:url value='/selectBoardList.do'/>";
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
	
	<div class="top-visual travel">
		
		<div class="container">
		
			<div class="wrap">
				<h2><em>PACIFICLINKS</em>TRAVEL</h2>

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
		
		<h3>프로모션 상품</h3>		
		<div class="thumb-list">
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<div class="item">
                <a href="/selectBoardView.do?boardNo=${result.boardNo}&contentNo=${result.contentNo}">                	
                    <img src="${result.storePath}/${result.storeFileNm}" width="100%"alt=""/>                                      
                    <div class="text-wrap">
                    
                    	<jsp:useBean id="now" class="java.util.Date" />
                        <fmt:parseDate value="${fn:replace(result.sdate,'-','')}" pattern="yyyyMMdd" var="sDate"/>
                        <fmt:formatDate value="${sDate}" pattern="yyyyMMdd" var="sDate" />
                        <fmt:parseDate value="${fn:replace(result.edate,'-','')}" pattern="yyyyMMdd" var="eDate"/>      
                        <fmt:formatDate value="${eDate}" pattern="yyyyMMdd" var="eDate" />                  
						<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />													
												
						<c:if test="${sDate <= nowDate && eDate >= nowDate}">
							<c:set value="진행중" var="status"/>
						</c:if>						
						<c:if test="${sDate > nowDate && eDate > nowDate}">
							<c:set value="예정" var="status"/>
						</c:if>						
						<c:if test="${sDate < nowDate && eDate < nowDate}">
							<c:set value="마감" var="status"/>
						</c:if>
                    
                        <p class="key">${result.field2}</p>
                        <p class="title">${result.title}</p>
                        
                        <c:set var="syear" value="${fn:substring(result.sdate,0,4)}"/>
                        <c:set var="smonth" value="${fn:substring(result.sdate,5,7)}"/>
                        <c:set var="sday" value="${fn:substring(result.sdate,8,10)}"/>
                        <c:set var="eyear" value="${fn:substring(result.edate,0,4)}"/>
                        <c:set var="yearChar" value="년 "/>
                        <c:if test="${syear eq eyear}">
                        	<c:set var="eyear" value=""/>
                        	<c:set var="yearChar" value=" "/>
                        </c:if>
                        <c:set var="emonth" value="${fn:substring(result.edate,5,7)}"/>
                        <c:set var="eday" value="${fn:substring(result.edate,8,10)}"/>
                        <p class="date">[${status}]  ${syear}년 ${smonth}월${sday}일 ~ ${eyear}${yearChar}${emonth}월${eday}일</p>
                        <c:if test="${!(empty result.field1)}">
                        <p class="text">인원 : ${result.field1}</p>    
                        </c:if>                  
                    </div>
                </a>
            </div>
        </c:forEach>   
		</div>

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
		</div>

		<div class="board-search">
			<form name="boardNttListForm" id="boardNttListForm" method="get" action="/selectBoardList.do">
				<input type="hidden" id="boardNo" name="boardNo" value="${boardNo }"/>
				<input type="hidden" id="pageNo" name="pageNo" value="${pageNo }" />
				<select title="검색목록 선택" id="searchCondition" name="searchCondition">
					<option value="title" <c:if test="${boardNttVO.searchCondition eq 'title'}">selected="selected"</c:if>>제목</option>
					<option value="content" <c:if test="${boardNttVO.searchCondition eq 'content'}">selected="selected"</c:if>>내용</option>
				</select>
				<div class="input-wrap">
					<input type="text" name="searchKeyword" id="searchKeyword" title="검색어 입력" placeholder="검색어를 입력하세요" value="${boardNttVO.searchKeyword}">
					<button class="btn-search">검색</button>
				</div>
			</form>
		</div>
		
	</section>
	
	<!--   FOOTER 로드   -->
	<footer class="container-full"></footer>
	
</body>
</html>

