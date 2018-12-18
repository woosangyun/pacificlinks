<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<form id="headerForm" name="headerForm">
    <!-- Header -->
	<div class="navbar-brand">
		<font color="white"><strong>PACIFICLINKS</strong></font>
		<!-- <a href="index.html">
			<img src="assets/images/logo@2x.png" width="88" alt="" />
		</a> -->
	</div>
	
	<!-- main menu 
	<ul class="navbar-nav">
		<li class="has-sub">
			<a href="/pl/mngBoardList.do?boardNo=news">
				<i class="entypo-gauge"></i>
				<span class="title">게시판 관리</span>
			</a>
			<ul>
				<li>
					<a href="/pl/mngBoardList.do?boardNo=news">
						<span class="title">뉴스</span>
					</a>
				</li>
			</ul>
		</li>		
	</ul>
	-->
	<!-- notifications and other links -->
	<ul class="nav navbar-right pull-right">
		<!-- raw links -->
		<!-- <li class="dropdown">
								<li>
				<a href="#">Live Site</a>
			</li>
							</li>
		<li class="sep"></li> -->
		<li>
			<a href="#n" onclick="logoutBtn(); return false;">
				Log Out <i class="entypo-logout right"></i>
			</a>
		</li>
		
		<!-- mobile only -->
		<li class="visible-xs">	
		
			<!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
			<div class="horizontal-mobile-menu visible-xs">
				<a href="#" class="with-animation"><!-- add class "with-animation" to support animation -->
						<i class="entypo-menu"></i>
				</a>
			</div>
		</li>
	</ul>
</form>
		
<script type="text/javascript">			
	function logoutBtn() {
	   	var result = confirm('로그아웃하시겠습니까?'); 
	   	if(result) { 
	   		document.headerForm.action = "/actionLogout.do";
		   	document.headerForm.submit();	
	   	} else { 
	   		return false;
	   	}
	}
</script>