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

<title>글로벌 골프코스 - GOLF - PACIFICLINKS</title>
	
<link href="../_css/reset.css" rel="stylesheet" type="text/css">
<link href="../_css/style.css" rel="stylesheet" type="text/css">
	
<script>

	var m1 = 2;
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
		document.boardNttListForm.continent.value = "${continent }";
		document.boardNttListForm.country.value = "${country }";
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
	
	<div class="top-visual golf">
		
		<div class="container">
		
			<div class="wrap">
				<h2><em>PACIFICLINKS</em>golf</h2>

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
		
		<h3>글로벌 골프코스</h3>
		
		<div class="world-map-top">
			<h4>PACIFICLINKS NETWORKS</h4>

				<div class="search-wrap">
					<form name="boardNttListForm" id="boardNttListForm" method="get" action="/selectBoardList.do">
						<input type="hidden" id="boardNo" name="boardNo" value="${boardNo }"/>
						<input type="hidden" id="pageNo" name="pageNo" value="${pageNo }" />	
						<input type="hidden" id="continent" name="continent" value="" />
						<input type="hidden" id="country" name="country" value="" />					
						<select title="검색목록 선택" id="searchCondition" name="searchCondition">
							<option value="title" <c:if test="${boardNttVO.searchCondition eq 'title'}">selected="selected"</c:if>>클럽명</option>							
							<option value="field2" <c:if test="${boardNttVO.searchCondition eq 'field2'}">selected="selected"</c:if>>국가</option>							
							<option value="field3" <c:if test="${boardNttVO.searchCondition eq 'field3'}">selected="selected"</c:if>>지역</option>							
							<option value="field4" <c:if test="${boardNttVO.searchCondition eq 'field4'}">selected="selected"</c:if>>클럽명(영문)</option>							
						</select>
						<div class="input-wrap">
							<input type="text" name="searchKeyword" id="searchKeyword" title="검색어 입력" placeholder="검색어를 입력하세요" value="${boardNttVO.searchKeyword}">
							<button class="btn-search">검색</button>
						</div>
					</form>
				</div>

		</div>
		
		<div class="tab">
			<ul>
			<c:forEach var="globalCode" items="${globalCodeList}" varStatus="status">
				<li<c:if test="${globalCode.areaNm eq continent}"> class="on"</c:if>><a href="/selectBoardList.do?boardNo=golf&continent=${globalCode.areaNm}">${globalCode.areaNm}
				<c:forEach var="globalCodeCnt" items="${globalCodeCnt}" varStatus="status">
					<c:if test="${globalCode.areaNm eq globalCodeCnt.areaNm}">
					(${globalCodeCnt.areaTot})
					</c:if>
				</c:forEach>
				</a></li>
			</c:forEach>
			</ul>
		</div>
		<c:if test="${continent ne '' && continent ne null}">
		<div class="tab2">
			<ul>				
				<c:forEach var="globalCode2" items="${globalCodeList2}" varStatus="status">
					<c:forEach var="globalCodeCnt2" items="${globalCodeCnt}" varStatus="status">
					<fmt:parseNumber value="${globalCodeCnt2.areaTot}" var='areaTot'/>
					<c:if test="${globalCode2.areaNm eq globalCodeCnt2.areaNm && areaTot > 0}">
						<li<c:if test="${globalCode2.areaNm eq country}"> class="on"</c:if> style="word-wrap: break-word;"><a href="/selectBoardList.do?boardNo=golf&continent=${globalCode2.upperNm}&country=${globalCode2.areaNm}">${globalCode2.areaNm}</a></li>
					</c:if>
					</c:forEach>
				</c:forEach>
			</ul>
		</div>
		</c:if>
	
        <div class="world-map">
	        <c:forEach var="result" items="${resultList}" varStatus="status">
		            <div class="item">
		            	<c:if test="${!(empty result.storeFileNm)}">
		                <img src="${result.storePath}/thumb/t_${result.storeFileNm}" alt=""/>
		                </c:if>
		            	<c:if test="${empty result.storeFileNm}">
		                <img src="../_images/golf/dummy.jpg" alt=""/>
		                </c:if>
		                <div class="text-wrap">
		                    <p class="key">${result.field3}</p>
		                    <p class="title">${result.title}</p>
		                    <p class="text">${result.field4}</p>
		                </div>
		                <c:if test="${result.linkUrl1 ne '' && result.linkUrl1 ne null}">
		                	<a href="${result.linkUrl1}" target="_blank">골프 스토리</a>
		                </c:if>
		            </div>
		    </c:forEach>  
		    <c:if test="${empty resultList}">
				게시글이 없습니다.
			</c:if>	  		   		            
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

	</section>
	
	<!--   FOOTER 로드   -->
	<footer class="container-full"></footer>
	
</body>
</html>


