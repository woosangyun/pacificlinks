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

<title>상세 - 뉴스 - Media - PACIFICLINKS</title>
	
<link href="../_css/reset.css" rel="stylesheet" type="text/css">
<link href="../_css/style.css" rel="stylesheet" type="text/css">
	
<script>

	var m1 = 0;
	var m2 = 3;
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
	<section id="contents" class="container" tabindex="-1">
		
		<h3>인재채용</h3>
		
		<div class="board">
			<div class="board-view-top">
				<p class="title">${boardNttResult.title}</p>
				<fmt:parseDate value="${fn:substring(result.frstRegisterPnttm,0,8) }" var="dateFmt" pattern="yyyyMMdd"/>
				<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd" var="frstPnttm"/>
				<p class="date">${frstPnttm}</p>
			</div>			
			<div class="board-view-con">
				<div class="custom">
                    <p class="title">모집부문</p>
                    <table>
                        <colgroup>
                            <col width="20%"><col width="*">
                        </colgroup>
                        <c:forEach var="hireVOList" items="${hireVOList}" varStatus="status">
                        	<c:set var="a1Chk" value="N"/>
                        	<c:set var="a2Chk" value="N"/>
                        	<c:set var="a3Chk" value="N"/>
                        	<c:set var="a4Chk" value="N"/>
                        	<c:set var="a5Chk" value="N"/>
                        	<c:set var="b1Chk" value="N"/>
                        	<c:set var="b2Chk" value="N"/>
                        	<c:set var="b3Chk" value="N"/>
                        	
                        	<c:if test="${hireVOList.hireType eq 'a1'}">
                        		<c:set var="a1Chk" value="Y"/>
                        	</c:if>
                        	<c:if test="${hireVOList.hireType eq 'a2'}">
                        		<c:set var="a2Chk" value="Y"/>
                        	</c:if>
                        	<c:if test="${hireVOList.hireType eq 'a3'}">
                        		<c:set var="a3Chk" value="Y"/>
                        	</c:if>
                        	<c:if test="${hireVOList.hireType eq 'a4'}">
                        		<c:set var="a4Chk" value="Y"/>
                        	</c:if>
                        	<c:if test="${hireVOList.hireType eq 'a5'}">
                        		<c:set var="a5Chk" value="Y"/>
                        	</c:if>
                        	<c:if test="${hireVOList.hireType eq 'b1'}">
                        		<c:set var="b1Chk" value="Y"/>
                        	</c:if>
                        	<c:if test="${hireVOList.hireType eq 'b2'}">
                        		<c:set var="b2Chk" value="Y"/>
                        	</c:if>
                        	<c:if test="${hireVOList.hireType eq 'b3'}">
                        		<c:set var="b3Chk" value="Y"/>
                        	</c:if>
                        </c:forEach>
                        <tbody>
                        <c:if test="${a1Chk eq 'Y'}">
                            <tr>                            
                                <th>모집분야</th>
                                <td>
	                                <c:forEach var="hireVOList" items="${hireVOList}" varStatus="status">
										<c:if test="${hireVOList.hireType eq 'a1'}">
	                                <strong>${hireVOList.hireData}</strong>
	                                	</c:if>
	                                </c:forEach>
                                </td>
                            </tr>
                         </c:if> 
                         <c:if test="${a2Chk eq 'Y'}">  
                            <tr>
                                <th>담당업무</th>
                                <td>
                                    <ul class="list-style02">
                                    	<c:forEach var="hireVOList" items="${hireVOList}" varStatus="status">
										<c:if test="${hireVOList.hireType eq 'a2'}">
                                        <li>${hireVOList.hireData}</li>
                                        </c:if>
                                        </c:forEach>
                                    </ul>
                                </td>
                            </tr>
                            </c:if> 
                         	<c:if test="${a3Chk eq 'Y'}"> 
                            <tr>
                                <th>지원자격</th>
                                <td>
                                    <ul class="list-style02">
                                        <c:forEach var="hireVOList" items="${hireVOList}" varStatus="status">
										<c:if test="${hireVOList.hireType eq 'a3'}">
                                        <li>${hireVOList.hireData}</li>
                                        </c:if>
                                        </c:forEach>
                                    </ul>
                                </td>
                            </tr>
                            </c:if> 
                         	<c:if test="${a4Chk eq 'Y'}"> 
                            <tr>
                                <th>우대사항</th>
                                <td>
                                    <ul class="list-style02">
                                        <c:forEach var="hireVOList" items="${hireVOList}" varStatus="status">
										<c:if test="${hireVOList.hireType eq 'a4'}">
                                        <li>${hireVOList.hireData}</li>
                                        </c:if>
                                        </c:forEach>
                                    </ul>
                                </td>
                            </tr>
                            </c:if> 
                         	<c:if test="${a5Chk eq 'Y'}"> 
                            <tr>
                                <th>인원</th>
                                <td>
                                <c:forEach var="hireVOList" items="${hireVOList}" varStatus="status">
								<c:if test="${hireVOList.hireType eq 'a5'}">
                                   <span>${hireVOList.hireData}</span><br/>
                                </c:if>
                                </c:forEach>
                                </td>
                            </tr>
                            </c:if>
                        </tbody>
                    </table>
                    <p class="ju">공통 자격요건 : 해외여행에 결격 사유가 없는 지원자, 남자는 병역필 또는 면제인 지원자</p>
                </div>
                <div class="custom">
                    <p class="title">지원절차</p>
                    <table>
                        <colgroup>
                            <col width="20%"><col width="*">
                        </colgroup>
                        <tbody>                        
                         	<c:if test="${b1Chk eq 'Y'}">
                            <tr>
                                <th>모집분야</th>
                                <td>
                                    <ul class="list-style02">
                                        <c:forEach var="hireVOList" items="${hireVOList}" varStatus="status">
										<c:if test="${hireVOList.hireType eq 'b1'}">
                                        <li>${hireVOList.hireData}</li>
                                        </c:if>
                                        </c:forEach>
                                    </ul>
                                </td>
                            </tr>
                            </c:if> 
                         	<c:if test="${b2Chk eq 'Y'}">
                            <tr>
                                <th>제출방법</th>
                                <td>
                                    <ul class="list-style02">
                                        <c:forEach var="hireVOList" items="${hireVOList}" varStatus="status">
										<c:if test="${hireVOList.hireType eq 'b2'}">
                                        <li>${hireVOList.hireData}</li>
                                        </c:if>
                                        </c:forEach>
                                    </ul>
                                </td>
                            </tr>
                            </c:if> 
                         	<c:if test="${b3Chk eq 'Y'}">
                            <tr>
                                <th>기타사항</th>
                                <td>
                                    <ul class="list-style02">
                                        <c:forEach var="hireVOList" items="${hireVOList}" varStatus="status">
										<c:if test="${hireVOList.hireType eq 'b3'}">
                                        <li>${hireVOList.hireData}</li>
                                        </c:if>
                                        </c:forEach>
                                    </ul>
                                </td>
                            </tr>
                            </c:if>                          	
                        </tbody>
                    </table>
                </div>
				<div class="location">
					<p>찾아오시는 길</p>
					<div class="wrap">
						<a href="https://map.naver.com/?searchCoord=43ba79ba497c428f3ea930e719ea53b1b9cab5c6232cec9ec13d48aa96dee541&query=7Jet7IK866GcIDIzNQ%3D%3D&menu=location&tab=1&lng=7564efc11353e5a3d39edca5e366b3c1&mapMode=0&mpx=d59c456c9bd02abebcdc0f5ec8d08927acbf4b3f4296e0f0016da5fe26cba2c407c43ca688c3ed19e28d1c4c5593ad947b0c6a86e5f2a26bb98aef18b3d304b1&lat=49f7121596464cfb27ee78bb0655a9e8&dlevel=12&enc=b64" target="_blank" class="korea">퍼시픽링스 코리아 본사</a>
						<a href="https://map.naver.com/?searchCoord=e39f7e639a8789f769b03155749a39f55a65f63fb0ea9471a46fc3a4d7c335ba&query=7Y287Iuc7ZS966eB7Iqk&tab=1&lng=1e612fe66443ce1b1029a5d6879c7b39&mapMode=0&mpx=d59c456c9bd02abebcdc0f5ec8d089276859c88d387eab66b527ee1846ac8d6747ea260005b20bdcd327e03f04d3042471437174ff018df58b36aabb525c7d98&lat=c85733b7b324c5e7e8db1515bee0514c&dlevel=12&enc=b64&menu=location" target="_blank" class="chung">퍼시픽링스 코리아 청담라운지</a>
					</div>
				</div>
				<img src="../_images/_board/recruit2.jpg" width="100%" alt="">
				<a href="../_images/_board/recruit2.jpg" class="mobile-zoom" target="_blank">이미지 확대보기</a>
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

