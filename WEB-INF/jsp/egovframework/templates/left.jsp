<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<ul id="main-menu" class="main-menu">
				<!-- add class "multiple-expanded" to allow multiple submenus to open -->
				<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
				<c:choose>
				    <c:when test="${menu eq 'mngBoardList' || menu eq 'mngBoardView' || menu eq 'mngConsList' || menu ne ''}">
				        <li class="opened active has-sub">	
				    </c:when>
				    <c:otherwise>
				        <li class="has-sub">
				    </c:otherwise>
				</c:choose>
					<a href="#">
						<i class="entypo-gauge"></i>
						<span class="title">게시판 관리</span>
					</a>
					<c:choose>
					    <c:when test="${menu eq 'mngBoardList' || menu eq 'mngBoardView'}">
					        <ul class="visible">
					    </c:when>
					    <c:otherwise>
					        <ul>
					    </c:otherwise>
					</c:choose>
						<c:choose>
						    <c:when test="${boardNo eq 'hire'}">
						        <li class="active">
						    </c:when>
						    <c:otherwise>
						        <li>
						    </c:otherwise>
						</c:choose>
							<a href="/pl/mngHireList.do?boardNo=hire">
								<span class="title">인재채용</span>
							</a>
						</li>						
						<c:choose>
						    <c:when test="${boardNo eq 'golf'}">
						        <li class="active">
						    </c:when>
						    <c:otherwise>
						        <li>
						    </c:otherwise>
						</c:choose>
							<a href="/pl/mngGolfClubList.do?boardNo=golf">
								<span class="title">글로벌 골프코스</span>
							</a>
						</li>						
						<c:choose>
						    <c:when test="${(menu eq 'mngBoardList' || menu eq 'mngBoardView') && boardNo eq 'promPd'}">
						        <li class="active">
						    </c:when>
						    <c:otherwise>
						        <li>
						    </c:otherwise>
						</c:choose>
							<a href="/pl/mngBoardList.do?boardNo=promPd">
								<span class="title">프로모션 상품</span>
							</a>
						</li>
						
						<!-- 테마여행 상품 추가(2018.10.29) -->
						<c:choose>
						    <c:when test="${(menu eq 'mngBoardList' || menu eq 'mngBoardView') && boardNo eq 'theme'}">
						        <li class="active">
						    </c:when>
						    <c:otherwise>
						        <li>
						    </c:otherwise>
						</c:choose>
							<a href="/pl/mngBoardList.do?boardNo=theme">
								<span class="title">테마여행 상품</span>
							</a>
						</li>
						
						<c:choose>
						    <c:when test="${(menu eq 'mngBoardList' || menu eq 'mngBoardView') && boardNo eq 'news'}">
						        <li class="active">
						    </c:when>
						    <c:otherwise>
						        <li>
						    </c:otherwise>
						</c:choose>
							<a href="/pl/mngBoardList.do?boardNo=news">
								<span class="title">뉴스</span>
							</a>
						</li>
						<c:choose>
						    <c:when test="${(menu eq 'mngBoardList' || menu eq 'mngBoardView') && boardNo eq 'prom'}">
						        <li class="active">
						    </c:when>
						    <c:otherwise>
						        <li>
						    </c:otherwise>
						</c:choose>
							<a href="/pl/mngBoardList.do?boardNo=prom">
								<span class="title">프로모션(미디어)</span>
							</a>
						</li>
						<%-- <c:choose>
						    <c:when test="${(menu eq 'mngBoardList' || menu eq 'mngBoardView') && boardNo eq 'spon'}">
						        <li class="active">
						    </c:when>
						    <c:otherwise>
						        <li>
						    </c:otherwise>
						</c:choose>
							<a href="/pl/mngBoardList.do?boardNo=spon">
								<span class="title">스폰서십</span>
							</a>
						</li> --%>
						<c:choose>
						    <c:when test="${boardNo eq 'cons'}">
						        <li class="active">
						    </c:when>
						    <c:otherwise>
						        <li>
						    </c:otherwise>
						</c:choose>
							<a href="/pl/mngConsList.do?boardNo=cons">
								<span class="title">상담/문의</span>
							</a>
						</li>
						<c:choose>
						    <c:when test="${(menu eq 'mngBoardList' || menu eq 'mngBoardView') && boardNo eq 'noti'}">
						        <li class="active">
						    </c:when>
						    <c:otherwise>
						        <li>
						    </c:otherwise>
						</c:choose>
							<a href="/pl/mngBoardList.do?boardNo=noti">
								<span class="title">공지사항</span>
							</a>
						</li>
						<c:choose>
						    <c:when test="${(menu eq 'mngBoardList' || menu eq 'mngBoardView') && boardNo eq 'qna'}">
						        <li class="active">
						    </c:when>
						    <c:otherwise>
						        <li>
						    </c:otherwise>
						</c:choose>
							<a href="/pl/mngBoardList.do?boardNo=qna">
								<span class="title">자주하는 질문</span>
							</a>
						</li>
					</ul>
				</li>				
			</ul>    
			