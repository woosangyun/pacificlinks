<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Smart Editor</title>

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico" />

<!-- jQuery -->
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script src="/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.

$(document).ready(function() {
	// Editor Setting
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors, // 전역변수 명과 동일해야 함.
		elPlaceHolder : "content", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
		sSkinURI : "/SE2/SmartEditor2Skin.html", // Editor HTML
		fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true, 
		}
	});

	// 전송버튼 클릭이벤트
	$("#updateBtn").click(function(){
		//if(confirm("저장하시겠습니까?")) {
			// id가 smarteditor인 textarea에 에디터에서 대입
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

			// 이부분에 에디터 validation 검증
			if(validation()) {
				$("#bbsNttUpdateForm").submit();
			}
		//}
	})
});

// 필수값 Check
function validation(){
	var contents = $.trim(oEditors[0].getContents());
	if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
		alert("내용을 입력하세요.");
		oEditors.getById['content'].exec('FOCUS');
		return false;
	}

	return true;
}

// 글쓰기 저장 & 수정
 function fWrite() {
 	if(validation()){
 		if(confirm("저장하시겠습니까?")) {
 			oEditors[0].exec("UPDATE_CONTENTS_FIELD", []); // Editor내용을 DB에 가져가기 위해 필수로 작성!
 														   // oEditors << 전역변수로 선언한 변수명과 동일해야 함.
 			$("#boardForm").attr('action','${pageContext.request.contextPath}/save').submit();
 		}
 	}
 }
</script>

<script type="text/javascript">
	
	function validateBoardRegist(event) {
		
		if( !$("#title").val() ) {
			alert("제목을 입력해 주세요.");
			$("#title").focus();
			return false;
		}	
		var contents = $.trim(oEditors[0].getContents());
		if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
			alert("내용을 입력하세요.");
			oEditors.getById['content'].exec('FOCUS');
			return false;
		}	
 		
		$('#updateBtn').attr('disabled', true);
		return true;
	}
	
	function deleteChk() {
		var result = confirm('삭제하시겠습니까?'); 
	   	if(result) { 	   		
	   		document.bbsNttUpdateForm.action = "/pl/deleteBoardNtt.do";
		   	document.bbsNttUpdateForm.submit();	
	   	} else { 
	   		return false;
	   	}
	}

</script>


</head>
<body>
<% 
	String content = "<img alt='' src='/upload/8f638a2f-cd5e-46aa-b9a8-bc32dec6d1d7.jpg'/>";
%>
<c:set var="boardKor" value="인재채용"/>

<c:if test="${boardNo eq 'hire'}">
	<c:set var="boardKor" value="인재채용"/>
</c:if>
<c:if test="${boardNo eq 'promPd'}">
	<c:set var="boardKor" value="프로모션 상품"/>
</c:if>
<c:if test="${boardNo eq 'news'}">
	<c:set var="boardKor" value="뉴스"/>
</c:if>
<c:if test="${boardNo eq 'prom'}">
	<c:set var="boardKor" value="프로모션(미디어)"/>
</c:if>
<c:if test="${boardNo eq 'spon'}">
	<c:set var="boardKor" value="스폰서십"/>
</c:if>
<c:if test="${boardNo eq 'cons'}">
	<c:set var="boardKor" value="상담/문의"/>
</c:if>
<c:if test="${boardNo eq 'noti'}">
	<c:set var="boardKor" value="공지사항"/>
</c:if>
<ol class="breadcrumb bc-3" >
	<li class="active"><a href="/pl/mngBoardList.do?boardNo=${boardNo }"><strong>${boardKor} 게시판 관리</strong></a></li>
</ol>
<h2><strong>${boardKor} 수정</strong></h2>
<br />

<form action="/pl/updateBoardNtt.do" method="post" name="bbsNttUpdateForm" id="bbsNttUpdateForm" onsubmit="return validateBoardRegist(this)"  enctype="multipart/form-data">
<input type="hidden" id="boardNo" name="boardNo" value="${boardNo}" />
<input type="hidden" id="contentNo" name="contentNo" value="${boardNttResult.contentNo}" />
	<div class="panel panel-info" data-collapsed="0">
		<div class="panel-heading">
			<!-- <div class="panel-title">
				<i class="entypo-bag"></i> <strong>정보</strong>
			</div> -->
			<div class="panel-options">
				<a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
			</div>
		</div>
		<div class="panel-body">
			<%-- <form role="form" class="form-horizontal form-groups-bordered"> --%>
			<div class="form-horizontal form-groups-bordered">
			    	
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> 문의유형</label>
					<div class="col-sm-5">
						<div class="input-group" style="margin:5px 0px 5px 0px">
								
							${boardNttResult.title}
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> 성명</label>
					<div class="col-sm-5">
						<div class="input-group" style="margin:5px 0px 5px 0px">
								
							${boardNttResult.writer}
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> 연락처</label>
					<div class="col-sm-5" style="margin:5px 0px 5px 0px">
						<div class="input-group">								
							${boardNttResult.field1}
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> E-mail</label>
					<div class="col-sm-5" style="margin:5px 0px 5px 0px">
						<div class="input-group">								
							${boardNttResult.field2}
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left">문의 내용</label>
					<div class="col-sm-5" style="margin:5px 0px 5px 0px">
						<div class="input-group">						
							${boardNttResult.content }
						</div>
					</div>
				</div>					
	
			</div>
		</div>		
	</div>
	
	<div style="padding-top:50px; padding-bottom:10px; text-align:right">		
		<a href="#n" onclick="deleteChk(); return false;"><button type="button" class="btn btn-red" style="width:80px">삭제</button></a>
		<a href="/pl/mngConsList.do?boardNo=${boardNo}"><button type="button" class="btn btn-default" style="width:80px">목록</button></a>
	</div>
	
</form>
</body>
</html>