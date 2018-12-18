<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=1, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">

<title>상담/문의 - C/S - PACIFICLINKS</title>
	
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

<script type="text/javascript">
	$(document).ready(function() {
       
        var t5Text = '여행 목적 :      ex) 골프여행\n';
				t5Text += '여행 출발지역:	ex) 부산출발\n';
				t5Text += '여행인원수:	ex) 4인(성인 2명+ 2001년생 2명)\n';
				t5Text += '희망 여행지 :	ex) 하이난\n';
				t5Text += '여행일 :         ex) 12월 중순\n';
				t5Text += '선호 항공사 :	ex) 국적기\n';
				t5Text += '호텔 :		ex) 성급 (4성, 5성 특급), 룸타입 선택클릭 (트윈, 더블, 싱글)\n';
				t5Text += '희망 여행형태 :	ex) 골프+휴양\n';
				t5Text += '기타요청사항 :	ex) 여행동반자: 가족(아이와 함께)\n';
				t5Text += '		ex) 취향이 로컬적인 분위기 선호';
        
        
		$('#t1').change(function() {
			if($(this).val() == '골프여행 상담') {		
				$('#t5').val(t5Text);
			} else {
				$('#t5').val('');
			}
		});
        
        $('#t5').val(t5Text);
        
	});
	
	function validateBoardRegist(event) {
		
/* 		//동의여부 체크여부
		if(document.getElementById("rds").checked){
		alert("동의여부를 체크해주십시오.");
		document.getElementById("rds").focus();
		return;
		}
		 */
		
		if( !$('#rds').is(':checked') ) {
			alert("동의여부를 체크해주십시오.");
			$("#rds").focus();
			return false;
		}
		
		if( !$("#t1").val() ) {
			alert("문의유형을 입력해 주세요.");
			$("#t1").focus();
			return false;
		}
		
		if( !$("#t2").val() ) {
			alert("성명을 입력해 주세요.");
			$("#t2").focus();
			return false;
		}
		
		if( !$("#t3_0").val() ) {
			alert("연락처를 입력해 주세요.");
			$("#t3_0").focus();
			return false;
		}
		
		if( !$("#t3_1").val() ) {
			alert("연락처를 입력해 주세요.");
			$("#t3_1").focus();
			return false;
		}
		
		if( !$("#t3_2").val() ) {
			alert("연락처를 입력해 주세요.");
			$("#t3_2").focus();
			return false;
		}
		
		if( !$("#t4_0").val() ) {
			alert("이메일을 입력해 주세요.");
			$("#t4_0").focus();
			return false;
		}
		
		if( !$("#t4_1").val() ) {
			alert("이메일을 입력해 주세요.");
			$("#t4_1").focus();
			return false;
		}
		
		if( !$("#t5").val() ) {
			alert("문의 내용을 입력해주세요");
			$("#t5").focus();
			return false;
		}

			
 		
		$('#registBtn').attr('disabled', true);
		
	   	document.getElementById('consRegistForm').submit();
	}

</script>

</head>
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
		
		<h3>상담/문의</h3>
		
		<h4>개인정보수집 동의</h4>
		
		<div class="agree">
			<textarea>개인정보의 수집및이용동의

1. 수집범위 및 이용목적
- 수집범위: 이름, 생년월일, 성별, 연락처, 이메일 등의 개인식별정보
- 이용목적: 민원, 제안, 각종 신고, 칭찬 등의 접수 및 처리를 위한 본인 확인

2, 보유 및 이용기간
- 원칙적으로 개인정보 제공의 목적이 달성 시 폐기함
- 신고 내용 및 처리 결과 확인 등을 위해 접수일로부터 5년간 보유하여 이후 해당 정보를 지체 없이 파기 합니다. 다만, 관계법령의 규정에
의하여 보존할 필요가 있는 경우 관계법령에서 정한 일정한 기간 동안 보관합니다</textarea>
			<p class="checks"><input type="radio" id="rds"><label for="rds">동의합니다</label></p>
			<p class="checks">※ 아래의 사항을 작성하시면 빠른 시간 내에 회신을 드립니다.</p>
		</div>
<form action="/addCons.do" method="post" name="consRegistForm" id="consRegistForm" onsubmit="return validateBoardRegist(this)" enctype="multipart/form-data">		
		
		<input type="hidden" id="boardNo" name="boardNo" value="${boardNo}" />
		<div class="board">
			<ul class="write">
				<li><label for="t1">문의유형</label></li>
				<li>
					<select id="t1" name="t1">
                        <option value="골프여행 상담">골프여행 상담</option>
                        <option value="멤버십 상담">멤버십 상담</option>
						<option value="제휴 문의">제휴 문의</option>
						<option value="기타">기타</option>
					</select>
				</li>
			</ul>
			<ul class="write">
				<li><label for="t2">성명</label></li>
				<li><input type="text" id="t2" name="t2"></li>
			</ul>
			<ul class="write">
				<li><label for="t3">연락처</label></li>
				<li>
					<input type="tel" id="t3_0" name="t3_0">
					<em>-</em>
					<input type="tel" id="t3_1" name="t3_1">
					<em>-</em>
					<input type="tel" id="t3_2" name="t3_2">
				</li>
			</ul>
			<ul class="write">
				<li><label for="t4">E-mail</label></li>
				<li>
					<input type="email" id="t4_0" name="t4_0">
					<em>@</em>
					<input type="email" id="t4_1" name="t4_1">
					<!--  
					<select>
						<option>직접입력</option>
					</select>
					-->
				</li>
			</ul>
			<ul class="write">
				<li><label for="t2">문의 내용</label></li>
				<li><textarea id="t5" name="t5"></textarea></li>
			</ul>
			<div class="btn-wrap">			
				<a href="#" onclick="validateBoardRegist(this); return false;" class="btn-solid">확인</a>
				<a href="/addConsForm.do?boardNo=cons" class="btn-stroke">취소</a>
			</div>
		</div>
</form>		
	</section>
	
	<!--   FOOTER 로드   -->
	<footer class="container-full"></footer>
	
</body>
</html>