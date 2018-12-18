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
<!-- <script type="text/javascript" src="/js/jquery-ui.min.js"></script> -->
<script src="/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.

$(document).ready(function() {
	<c:if test="${boardNo ne 'promPd' and boardNo ne 'theme'}">
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
	</c:if>

	// 전송버튼 클릭이벤트
	$("#updateBtn").click(function(){
		<c:if test="${boardNo ne 'promPd' and boardNo ne 'theme'}">
		//if(confirm("저장하시겠습니까?")) {
			// id가 smarteditor인 textarea에 에디터에서 대입
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

			// 이부분에 에디터 validation 검증
			if(validation()) {
				$("#bbsNttUpdateForm").submit();
			}
		//}
		</c:if>
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
		
		<c:if test="${boardNo ne 'promPd' and boardNo ne 'theme'}">
		var contents = $.trim(oEditors[0].getContents());
		if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
			alert("내용을 입력하세요.");
			oEditors.getById['content'].exec('FOCUS');
			return false;
		}
		</c:if>
 		
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
<c:if test="${boardNo eq 'theme'}">
	<c:set var="boardKor" value="테마여행 상품"/>
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
<c:if test="${boardNo eq 'qna'}">
	<c:set var="boardKor" value="자주하는 질문"/>
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
<c:choose>								
	<c:when test="${boardNo eq 'qna'}">			    	
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 질문</label>
					<div class="col-sm-5">
						<div class="input-group">
								
							<input type="text" class="form-control" data-mask="" placeholder="" id="title" name="title" value="${boardNttResult.title}"/>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 답변</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<textarea name="content" id="content" rows="10" cols="100" style="width:766px; height:412px;">
								 ${boardNttResult.content }
							</textarea>
						</div>
					</div>
				</div>
	</c:when>
	<c:otherwise>			    	
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 제목</label>
					<div class="col-sm-5">
						<div class="input-group">
								
							<input type="text" class="form-control" data-mask="" placeholder="" id="title" name="title" value="${boardNttResult.title}" style="width:1000px;"/>
						</div>
					</div>
				</div>
				
				<c:if test="${boardNo eq 'theme'}">
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 계절</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<input type="text" class="form-control" data-mask="" placeholder="" id="field3" name="field3" style="width:300px;" value="${boardNttResult.field3}"/>
						</div>				
					</div>						
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 서브 텍스트</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<input type="text" class="form-control" data-mask="" placeholder="" id="field4" name="field4" style="width:1000px;" value="${boardNttResult.field4}"/>
						</div>				
					</div>						
				</div>
				</c:if>
				
				<c:if test="${boardNo ne 'promPd' and boardNo ne 'theme'}">
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 내용</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<textarea name="content" id="content" rows="10" cols="100" style="width:766px; height:412px;">
								 ${boardNttResult.content }
							</textarea>
						</div>
					</div>
				</div>
				</c:if>
</c:otherwise>
</c:choose>

<c:if test="${boardNo eq 'promPd' or boardNo eq 'theme'}"><!-- 프로모션 상품 게시판 기능추가 -->
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> 상단 이미지</label>
					<div class="col-sm-5">
						<c:set var="fileCnt" value="0" />
						<c:forEach var="boardAtchmnflImg" items="${boardAtchmnflImgList}" varStatus="idx">		
							<c:if test="${empty boardAtchmnflImg.fileType}">
							<div class="input-group">
								<input type="radio" name="fileProcTyImg${idx.index}" id="fileProcTyImg_${idx.index}_U" value="U" checked="checked"/><label for="fileProcTyImg_${idx.index}_U">유지</label>
								<input type="radio" name="fileProcTyImg${idx.index}" id="fileProcTyImg_${idx.index}_D" value="${boardAtchmnflImg.atchmnflNo}"/><label for="fileProcTyImg_${idx.index}_D">삭제</label>
								<a href="/downloadBbsFile.do?atchmnflNo=${boardAtchmnflImg.atchmnflNo}"><img src="/images/board/file/ico_${boardAtchmnflImg.fileExtsn}.gif"/> ${boardAtchmnflImg.fileNm}</a><br/>
							</div>
							<c:set var="fileCnt" value="${fileCnt + 1}" />
							</c:if>
						</c:forEach>
						<c:forEach var="i" begin="${fileCnt+1}" end="1" step="1" varStatus="idx">
						<div class="input-group">						
							<input type="file" name="atchmnfl_img" class="promPd" size="60"/>
						</div>
						</c:forEach>
					</div>					
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> Tab1</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<input type="text" class="form-control" id="field6" name="field6" value="${boardNttResult.field6}" style="width:300px;"/>
						</div>	
						<br>
						<br> 
						<c:set var="fileCnt" value="0" />
						<c:forEach var="boardAtchmnflImg" items="${boardAtchmnflImgList}" varStatus="idx">		
							<c:if test="${boardAtchmnflImg.fileType eq 'tab1'}">
							<div class="input-group">
								<input type="radio" name="fileProcTyImg${idx.index}" id="fileProcTyImg_${idx.index}_U" value="U" checked="checked"/><label for="fileProcTyImg_${idx.index}_U">유지</label>
								<input type="radio" name="fileProcTyImg${idx.index}" id="fileProcTyImg_${idx.index}_D" value="${boardAtchmnflImg.atchmnflNo}"/><label for="fileProcTyImg_${idx.index}_D">삭제</label>
								<a href="/downloadBbsFile.do?atchmnflNo=${boardAtchmnflImg.atchmnflNo}"><img src="/images/board/file/ico_${boardAtchmnflImg.fileExtsn}.gif"/> ${boardAtchmnflImg.fileNm}</a><br/>
							</div>
							<c:set var="fileCnt" value="${fileCnt + 1}" />
							</c:if>
						</c:forEach>
						<c:forEach var="i" begin="${fileCnt+1}" end="3" step="1" varStatus="idx">
						<div class="input-group">						
							<input type="file" name="atchmnfl_tab1" class="promPd" size="60"/>
						</div>
						</c:forEach>
					</div>					
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> Tab2</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<input type="text" class="form-control" id="field7" name="field7" value="${boardNttResult.field7}" style="width:300px;"/>
						</div>	
						<br>
						<br> 
						<c:set var="fileCnt" value="0" />
						<c:forEach var="boardAtchmnflImg" items="${boardAtchmnflImgList}" varStatus="idx">		
							<c:if test="${boardAtchmnflImg.fileType eq 'tab2'}">
							<div class="input-group">
								<input type="radio" name="fileProcTyImg${idx.index}" id="fileProcTyImg_${idx.index}_U" value="U" checked="checked"/><label for="fileProcTyImg_${idx.index}_U">유지</label>
								<input type="radio" name="fileProcTyImg${idx.index}" id="fileProcTyImg_${idx.index}_D" value="${boardAtchmnflImg.atchmnflNo}"/><label for="fileProcTyImg_${idx.index}_D">삭제</label>
								<a href="/downloadBbsFile.do?atchmnflNo=${boardAtchmnflImg.atchmnflNo}"><img src="/images/board/file/ico_${boardAtchmnflImg.fileExtsn}.gif"/> ${boardAtchmnflImg.fileNm}</a><br/>
							</div>
							<c:set var="fileCnt" value="${fileCnt + 1}" />
							</c:if>
						</c:forEach>
						<c:forEach var="i" begin="${fileCnt+1}" end="3" step="1" varStatus="idx">
						<div class="input-group">						
							<input type="file" name="atchmnfl_tab2" class="promPd" size="60"/>
						</div>
						</c:forEach>
					</div>					
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> Tab3</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<input type="text" class="form-control" id="field8" name="field8" value="${boardNttResult.field8}" style="width:300px;"/>
						</div>	
						<br>
						<br> 
						<c:set var="fileCnt" value="0" />
						<c:forEach var="boardAtchmnflImg" items="${boardAtchmnflImgList}" varStatus="idx">		
							<c:if test="${boardAtchmnflImg.fileType eq 'tab3'}">
							<div class="input-group">
								<input type="radio" name="fileProcTyImg${idx.index}" id="fileProcTyImg_${idx.index}_U" value="U" checked="checked"/><label for="fileProcTyImg_${idx.index}_U">유지</label>
								<input type="radio" name="fileProcTyImg${idx.index}" id="fileProcTyImg_${idx.index}_D" value="${boardAtchmnflImg.atchmnflNo}"/><label for="fileProcTyImg_${idx.index}_D">삭제</label>
								<a href="/downloadBbsFile.do?atchmnflNo=${boardAtchmnflImg.atchmnflNo}"><img src="/images/board/file/ico_${boardAtchmnflImg.fileExtsn}.gif"/> ${boardAtchmnflImg.fileNm}</a><br/>
							</div>
							<c:set var="fileCnt" value="${fileCnt + 1}" />
							</c:if>
						</c:forEach>
						<c:forEach var="i" begin="${fileCnt+1}" end="3" step="1" varStatus="idx">
						<div class="input-group">						
							<input type="file" name="atchmnfl_tab3" class="promPd" size="60"/>
						</div>
						</c:forEach>
					</div>					
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> Tab4</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<input type="text" class="form-control" id="field9" name="field9" value="${boardNttResult.field9}" style="width:300px;"/>
						</div>	
						<br>
						<br> 
						<c:set var="fileCnt" value="0" />
						<c:forEach var="boardAtchmnflImg" items="${boardAtchmnflImgList}" varStatus="idx">		
							<c:if test="${boardAtchmnflImg.fileType eq 'tab4'}">
							<div class="input-group">
								<input type="radio" name="fileProcTyImg${idx.index}" id="fileProcTyImg_${idx.index}_U" value="U" checked="checked"/><label for="fileProcTyImg_${idx.index}_U">유지</label>
								<input type="radio" name="fileProcTyImg${idx.index}" id="fileProcTyImg_${idx.index}_D" value="${boardAtchmnflImg.atchmnflNo}"/><label for="fileProcTyImg_${idx.index}_D">삭제</label>
								<a href="/downloadBbsFile.do?atchmnflNo=${boardAtchmnflImg.atchmnflNo}"><img src="/images/board/file/ico_${boardAtchmnflImg.fileExtsn}.gif"/> ${boardAtchmnflImg.fileNm}</a><br/>
							</div>
							<c:set var="fileCnt" value="${fileCnt + 1}" />
							</c:if>
						</c:forEach>
						<c:forEach var="i" begin="${fileCnt+1}" end="3" step="1" varStatus="idx">
						<div class="input-group">						
							<input type="file" name="atchmnfl_tab4" class="promPd" size="60"/>
						</div>
						</c:forEach>
					</div>					
				</div>
</c:if>

<table id="ds_conclass" style="display: none; background-color: #FFF; border: 1px solid #CCCCCC; position: absolute; z-index: 32767;" border="1"><tr><td id="ds_calclass"></td></tr></table>
<script type="text/javascript" src="/js/calendar.js"></script>

<c:choose>								
	<c:when test="${boardNo eq 'prom' || boardNo eq 'promPd' || boardNo eq 'theme'}">
				
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 지역</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<input type="text" class="form-control" data-mask="" placeholder="" id="field2" name="field2" style="width:300px;" value="${boardNttResult.field2}"/>
						</div>				
					</div>						
				</div>
				
				<table id="ds_conclass" style="display: none; background-color: #FFF; border: 1px solid #CCCCCC; position: absolute; z-index: 32767;" border="1"><tr><td id="ds_calclass"></td></tr></table>
				<script type="text/javascript" src="/js/calendar.js"></script>
	
				
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 기간</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<a href="#" onClick="ds_sh(document.getElementById('sdate'),2,3); return false;" style="vertical-align:sub"><img src="/images/calendar/btn_calendar.gif" alt="달력" style="height:15px; margin:0px 0px 0px 10px;"/></a>							
							<input type="text"  class="form-control" data-mask="" placeholder="" name="sdate" id="sdate" onClick="ds_sh(this,2,3);" size="8" style="width:100px;" value="${boardNttResult.sdate}"/>							
						</div><br/><br/>			
						<div class="input-group">													
							<a href="#" onClick="ds_sh(document.getElementById('edate'),2,3); return false;" style="vertical-align:sub"><img src="/images/calendar/btn_calendar.gif" alt="달력" style="height:15px; margin:0px 0px 0px 10px;"/></a>
							<input type="text"  class="form-control" data-mask="" placeholder="" name="edate" id="edate" onClick="ds_sh(this,2,3);" size="8" style="width:100px;" value="${boardNttResult.edate}"/>
														
						</div>				
					</div>						
				</div>
				
				<c:if test="${boardNo eq 'promPd' or boardNo eq 'theme'}">
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 인원</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<input type="text" class="form-control" data-mask="" placeholder="" id="field1" name="field1" style="width:300px;" value="${boardNttResult.field1}"/>
						</div>				
					</div>						
				</div>
				</c:if>
	
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> 동영상 링크</label>
					<div class="col-sm-5">
						<div class="input-group">	
							<input type="text" class="form-control" data-mask="" placeholder="" id="linkUrl1" name="linkUrl1" style="margin: 15px 0px 15px 0px; width:1000px;" value="${boardNttResult.linkUrl1}"/>																
						</div>
						<div class="input-group">	
							<input type="text" class="form-control" data-mask="" placeholder="" id="linkUrl2" name="linkUrl2" style="margin: 15px 0px 15px 0px; width:1000px;" value="${boardNttResult.linkUrl2}"/>																
						</div>
						<div class="input-group">	
							<input type="text" class="form-control" data-mask="" placeholder="" id="linkUrl3" name="linkUrl3" style="margin: 15px 0px 15px 0px; width:1000px;" value="${boardNttResult.linkUrl3}"/>																
						</div>
						<div class="input-group">	
							<input type="text" class="form-control" data-mask="" placeholder="" id="linkUrl4" name="linkUrl4" style="margin: 15px 0px 15px 0px; width:1000px;" value="${boardNttResult.linkUrl4}"/>																
						</div>
						<div class="input-group">	
							<input type="text" class="form-control" data-mask="" placeholder="" id="linkUrl5" name="linkUrl5" style="margin: 15px 0px 15px 0px; width:1000px;" value="${boardNttResult.linkUrl5}"/>																
						</div>
					</div>
				</div>													
				
				<div class="form-group">
						<label class="col-sm-3 control-label" style="text-align:left"> 썸네일 이미지</label>
						<div class="col-sm-5">
							
							<c:set var="fileCnt" value="0" />						
							<c:forEach var="boardAtchmnfl" items="${boardAtchmnflList}" varStatus="idx">		
							<div class="input-group">	
								<input type="radio" name="fileProcTy${idx.index}" id="fileProcTy_${idx.index}_U" value="U" checked="checked"/><label for="fileProcTy_${idx.index}_U">유지</label>
								<input type="radio" name="fileProcTy${idx.index}" id="fileProcTy_${idx.index}_D" value="${boardAtchmnfl.atchmnflNo}"/><label for="fileProcTy_${idx.index}_D">삭제</label>
								<a href="/downloadBbsFile.do?atchmnflNo=${boardAtchmnfl.atchmnflNo}"><img src="/images/board/file/ico_${boardAtchmnfl.fileExtsn}.gif"/> ${boardAtchmnfl.fileNm}</a><br/>
								<c:set var="fileCnt" value="${fileCnt + 1}" />
							</div>
							</c:forEach>	
							<c:forEach var="i" begin="${fileCnt+1}" end="1" step="1" varStatus="idx">
								<div class="input-group">
									<input type="file" name="atchmnfl" id="atchmnfl_${idx.index-fileCnt-1}" size="60"/>					
								</div>
							</c:forEach>
						</div>
					</div>

					<c:if test="${boardNo ne 'promPd' and boardNo ne 'theme'}">
					<div class="form-group">
						<label class="col-sm-3 control-label" style="text-align:left"> 이미지 첨부파일</label>
						<div class="col-sm-5">
							
							<c:set var="fileCnt" value="0" />						
							<c:forEach var="boardAtchmnflImg" items="${boardAtchmnflImgList}" varStatus="idx">		
							<div class="input-group">
								<input type="radio" name="fileProcTyImg${idx.index}" id="fileProcTyImg_${idx.index}_U" value="U" checked="checked"/><label for="fileProcTyImg_${idx.index}_U">유지</label>
								<input type="radio" name="fileProcTyImg${idx.index}" id="fileProcTyImg_${idx.index}_D" value="${boardAtchmnflImg.atchmnflNo}"/><label for="fileProcTyImg_${idx.index}_D">삭제</label>
								<a href="/downloadBbsFile.do?atchmnflNo=${boardAtchmnflImg.atchmnflNo}"><img src="/images/board/file/ico_${boardAtchmnflImg.fileExtsn}.gif"/> ${boardAtchmnflImg.fileNm}</a><br/>
								<c:set var="fileCnt" value="${fileCnt + 1}" />
							</div>
							</c:forEach>	
							<c:forEach var="i" begin="${fileCnt+1}" end="5" step="1" varStatus="idx">
								<div class="input-group">
									<input type="file" name="atchmnfl_img" id="atchmnfl_img_${idx.index-fileCnt-1}" size="60"/>
									이미지 설명: <input type="text" name=replcText_img id="replcText_img_${idx.index-fileCnt-1}" size="60"/>					
								</div>
							</c:forEach>
						</div>
					</div>
					</c:if>
	</c:when>	
	<c:otherwise>
	
		<c:if test="${boardNo ne 'qna'}">				
					<div class="form-group">
						<label class="col-sm-3 control-label" style="text-align:left"> 첨부파일</label>
						<div class="col-sm-5">
							
							<c:set var="fileCnt" value="0" />						
							<c:forEach var="boardAtchmnfl" items="${boardAtchmnflList}" varStatus="idx">		
							<div class="input-group">	
								<input type="radio" name="fileProcTy${idx.index}" id="fileProcTy_${idx.index}_U" value="U" checked="checked"/><label for="fileProcTy_${idx.index}_U">유지</label>
								<input type="radio" name="fileProcTy${idx.index}" id="fileProcTy_${idx.index}_D" value="${boardAtchmnfl.atchmnflNo}"/><label for="fileProcTy_${idx.index}_D">삭제</label>
								<a href="/downloadBbsFile.do?atchmnflNo=${boardAtchmnfl.atchmnflNo}"><img src="/images/board/file/ico_${boardAtchmnfl.fileExtsn}.gif"/> ${boardAtchmnfl.fileNm}</a><br/>
								<c:set var="fileCnt" value="${fileCnt + 1}" />
							</div>
							</c:forEach>	
							<c:forEach var="i" begin="${fileCnt+1}" end="5" step="1" varStatus="idx">
								<div class="input-group">
									<input type="file" name="atchmnfl" id="atchmnfl_${idx.index-fileCnt-1}" size="60"/>					
								</div>
							</c:forEach>
						</div>
					</div>	
		</c:if>		
	</c:otherwise>
</c:choose>		

				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> 등록일</label>
					<div class="col-sm-5">
						<div class="input-group">	
							<fmt:parseDate value="${fn:substring(boardNttResult.frstRegisterPnttm,0,8) }" var="dateFmt" pattern="yyyyMMdd"/>
							<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd" var="frstPnttm"/>					
							<a href="#" onClick="ds_sh(document.getElementById('regDate'),2,3); return false;" style="vertical-align:sub"><img src="/images/calendar/btn_calendar.gif" alt="달력" style="height:15px; margin:0px 0px 0px 10px;"/></a>							
							<input type="text" readonly class="form-control" data-mask="" placeholder="" name="regDate" id="regDate" onClick="ds_sh(this,2,3);" size="8" style="width:100px;" value="${frstPnttm}"/>																			
						</div>													
					</div>						
				</div>		
				
			</div>
		</div>		
	</div>
	
	<div style="padding-top:50px; padding-bottom:10px; text-align:right">
		<button type="submit" id="updateBtn" name="updateBtn" class="btn btn-blue" style="width:80px">수정</button>
		<a href="#n" onclick="deleteChk(); return false;"><button type="button" class="btn btn-red" style="width:80px">삭제</button></a>
		<a href="/pl/mngBoardList.do?boardNo=${boardNo}"><button type="button" class="btn btn-default" style="width:80px">목록</button></a>
	</div>
	
</form>
</body>
</html>