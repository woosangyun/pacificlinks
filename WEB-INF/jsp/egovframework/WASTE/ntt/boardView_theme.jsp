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

<title>상세 - 프로모션 상품 - TRAVEL - PACIFICLINKS</title>
	
<link href="../_css/reset.css" rel="stylesheet" type="text/css">
<link href="../_css/style.css" rel="stylesheet" type="text/css">
	
<script>

	var m1 = 3;
	var m2 = 1;
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
		
		<h3>테마골프 상품</h3>
		
		<jsp:useBean id="now" class="java.util.Date" />
        <fmt:parseDate value="${fn:replace(boardNttResult.sdate,'-','')}" pattern="yyyyMMdd" var="sDate"/>
        <fmt:formatDate value="${sDate}" pattern="yyyyMMdd" var="sDate" />
        <fmt:parseDate value="${fn:replace(boardNttResult.edate,'-','')}" pattern="yyyyMMdd" var="eDate"/>      
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
		
		
		<div class="board">
			<div class="board-view-top">
				<p class="title">[ ${boardNttResult.field2} ] ${boardNttResult.title}</p>
			</div>
            <div class="period">
                <p class="key">여행기간</p>
                <c:set var="syear" value="${fn:substring(boardNttResult.sdate,0,4)}"/>
                <c:set var="smonth" value="${fn:substring(boardNttResult.sdate,5,7)}"/>
                <c:set var="sday" value="${fn:substring(boardNttResult.sdate,8,10)}"/>
                <c:set var="eyear" value="${fn:substring(boardNttResult.edate,0,4)}"/>
                <c:set var="yearChar" value="년 "/>
                <c:if test="${syear eq eyear}">
                	<c:set var="eyear" value=""/>
                	<c:set var="yearChar" value=" "/>
                </c:if>
                <c:set var="emonth" value="${fn:substring(boardNttResult.edate,5,7)}"/>
                <c:set var="eday" value="${fn:substring(boardNttResult.edate,8,10)}"/>
                <p class="text">[${status}] ${syear}년 ${smonth}월${sday}일 ~ ${eyear}${yearChar}${emonth}월${eday}일</p>
            </div>
            <c:if test="${!(empty boardNttResult.field1)}">
            <div class="person">
                <p class="key">인원</p>
                <p class="text">${boardNttResult.field1}</p>
            </div>
            </c:if>

            <c:if test="${(boardNttResult.linkUrl1 ne '' && boardNttResult.linkUrl1 ne null) || (boardNttResult.linkUrl2 ne '' && boardNttResult.linkUrl2 ne null) || (boardNttResult.linkUrl3 ne '' && boardNttResult.linkUrl3 ne null) || (boardNttResult.linkUrl4 ne '' && boardNttResult.linkUrl4 ne null) || (boardNttResult.linkUrl5 ne '' && boardNttResult.linkUrl5 ne null)}">
            <div class="movie">
                <p class="key">관련 동영상</p>
                <div class="wrap">
                    
                    <c:if test="${boardNttResult.linkUrl1 ne '' && boardNttResult.linkUrl1 ne null}">
	                    <div>
		                       
		                        <div>
		                           <object type="text/html" width="560" height="315" data="${fn:replace(boardNttResult.linkUrl1,'youtu.be','youtube.com/embed')}"></object>
								</div>
		                           <!-- 
		                           <p>제주 테디밸리 전경</p>
		                            -->
		                       
		                </div><br/>                      
                    </c:if>                      
                    <c:if test="${boardNttResult.linkUrl2 ne '' && boardNttResult.linkUrl2 ne null}">
	                    <div>
		                       
		                        <div>
		                           <object type="text/html" width="560" height="315" data="${fn:replace(boardNttResult.linkUrl2,'youtu.be','youtube.com/embed')}"></object>
								</div>
		                           <!-- 
		                           <p>제주 테디밸리 전경</p>
		                            -->
		                       
		                </div><br/>                      
                    </c:if>                      
                    <c:if test="${boardNttResult.linkUrl3 ne '' && boardNttResult.linkUrl3 ne null}">
	                    <div>
		                       
		                        <div>
		                           <object type="text/html" width="560" height="315" data="${fn:replace(boardNttResult.linkUrl3,'youtu.be','youtube.com/embed')}"></object>
								</div>
		                           <!-- 
		                           <p>제주 테디밸리 전경</p>
		                            -->
		                       
		                </div><br/>                      
                    </c:if>                      
                    <c:if test="${boardNttResult.linkUrl4 ne '' && boardNttResult.linkUrl4 ne null}">
	                    <div>
		                       
		                        <div>
		                           <object type="text/html" width="560" height="315" data="${fn:replace(boardNttResult.linkUrl4,'youtu.be','youtube.com/embed')}"></object>
								</div>
		                           <!-- 
		                           <p>제주 테디밸리 전경</p>
		                            -->
		                       
		                </div><br/>                      
                    </c:if>                      
                    <c:if test="${boardNttResult.linkUrl5 ne '' && boardNttResult.linkUrl5 ne null}">
	                    <div>
		                       
		                        <div>
		                           <object type="text/html" width="560" height="315" data="${fn:replace(boardNttResult.linkUrl5,'youtu.be','youtube.com/embed')}"></object>
								</div>
		                           <!-- 
		                           <p>제주 테디밸리 전경</p>
		                            -->
		                       
		                </div><br/>                      
                    </c:if>                          
                </div>
            </div>
            </c:if>
            
            
            <!-- 
            <div class="photo">
                <p class="key">관련 포토</p>
                <div class="wrap">
                    <ul>
                        <li>
                            <a href="#">
                                <div class="image"><img src="../_images/_board/movie.jpg" width="100%"  alt=""/></div>
                                <p>제주 테디밸리 전경</p>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="image"><img src="../_images/_board/movie.jpg" width="100%"  alt=""/></div>
                                <p>제주 테디밸리 전경</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
             -->
			<div class="board-view-con">
                
                <div class="promotion-top-image">
                	<c:forEach var="boardAtchmnflImg" items="${boardAtchmnflImgList}" varStatus="idx">		
						<c:if test="${empty boardAtchmnflImg.fileType}">						
						<img src="${boardAtchmnflImg.storePath}/${boardAtchmnflImg.storeFileNm}" width="100%" alt="">
						</c:if>
					</c:forEach>
                </div>
                
                <div class="ui">
                    <a href="/addConsForm.do?boardNo=cons" class="btn-counsel">상담하기</a>
                    <div class="promotion-tab">
                        <ul>
                        	<c:if test="${not empty boardNttResult.field6}">
                            <li><a href="#"><c:out value="${boardNttResult.field6}" /></a></li>
                            </c:if>
                            <c:if test="${not empty boardNttResult.field7}">
                            <li><a href="#"><c:out value="${boardNttResult.field7}" /></a></li>
                            </c:if>
                            <c:if test="${not empty boardNttResult.field8}">
                            <li><a href="#"><c:out value="${boardNttResult.field8}" /></a></li>
                            </c:if>
                            <c:if test="${not empty boardNttResult.field9}">
                            <li><a href="#"><c:out value="${boardNttResult.field9}" /></a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                
                <div class="promotion-detail">
                	<c:if test="${not empty boardNttResult.field6}">
                    <div class="item">
	                   	<c:forEach var="boardAtchmnflImg" items="${boardAtchmnflImgList}">		
							<c:if test="${boardAtchmnflImg.fileType eq 'tab1'}">
							<img src="${boardAtchmnflImg.storePath}/${boardAtchmnflImg.storeFileNm}" alt=""/>
                        	<a href="${boardAtchmnflImg.storePath}/${boardAtchmnflImg.storeFileNm}" class="mobile-zoom" target="_blank">이미지 확대보기</a>
							</c:if>
						</c:forEach>
                    </div>
                    </c:if>
                    <c:if test="${not empty boardNttResult.field7}">
                    <div class="item">
	                   	<c:forEach var="boardAtchmnflImg" items="${boardAtchmnflImgList}">		
							<c:if test="${boardAtchmnflImg.fileType eq 'tab2'}">
							<img src="${boardAtchmnflImg.storePath}/${boardAtchmnflImg.storeFileNm}" alt=""/>
                        	<a href="${boardAtchmnflImg.storePath}/${boardAtchmnflImg.storeFileNm}" class="mobile-zoom" target="_blank">이미지 확대보기</a>
							</c:if>
						</c:forEach>
                    </div>
                    </c:if>
                    <c:if test="${not empty boardNttResult.field8}">
                    <div class="item">
	                   	<c:forEach var="boardAtchmnflImg" items="${boardAtchmnflImgList}">		
							<c:if test="${boardAtchmnflImg.fileType eq 'tab3'}">
							<img src="${boardAtchmnflImg.storePath}/${boardAtchmnflImg.storeFileNm}" alt=""/>
                        	<a href="${boardAtchmnflImg.storePath}/${boardAtchmnflImg.storeFileNm}" class="mobile-zoom" target="_blank">이미지 확대보기</a>
							</c:if>
						</c:forEach>
                    </div>
                    </c:if>
                    <c:if test="${not empty boardNttResult.field9}">
                    <div class="item">
	                   	<c:forEach var="boardAtchmnflImg" items="${boardAtchmnflImgList}">		
							<c:if test="${boardAtchmnflImg.fileType eq 'tab4'}">
							<img src="${boardAtchmnflImg.storePath}/${boardAtchmnflImg.storeFileNm}" alt=""/>
                        	<a href="${boardAtchmnflImg.storePath}/${boardAtchmnflImg.storeFileNm}" class="mobile-zoom" target="_blank">이미지 확대보기</a>
							</c:if>
						</c:forEach>
                    </div>
                    </c:if>
                </div>
			</div>
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
	
	<script type="text/javascript">
	$(document).ready(function() {
		$('.promotion-tab li:first').addClass('on');
		
		$(".promotion-tab li a").click(function(e){
            var idx = $(this).parent("li").index();
            $(".promotion-tab li").removeClass("on");
            $(this).parent("li").addClass("on");
            
            $(".promotion-detail .item").hide();
            $(".promotion-detail .item").eq(idx).show();
            
            return false;
        })
	});
	</script>
	
</body>
</html>

