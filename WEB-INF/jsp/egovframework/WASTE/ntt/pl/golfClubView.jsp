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
<script type="text/javascript" src="/js/prototype.js"></script>
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
	$("#registBtn").click(function(){
		//if(confirm("저장하시겠습니까?")) {
			// id가 smarteditor인 textarea에 에디터에서 대입
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

			// 이부분에 에디터 validation 검증
			if(validation()) {
				$("#bbsNttRegistForm").submit();
			}
		//}
	})
});

// 필수값 Check
/* function validation(){
	var contents = $.trim(oEditors[0].getContents());
	if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
		alert("내용을 입력하세요.");
		oEditors.getById['content'].exec('FOCUS');
		return false;
	}

	return true;
} */

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
			alert("클럽명(한글)을 입력해 주세요.");
			$("#title").focus();
			return false;
		}
		
		if( !$("#field1").val() ) {
			alert("대륙을 입력해 주세요.");
			$("#field1").focus();
			return false;
		}
		
		if( !$("#field2").val() ) {
			alert("국가를 입력해 주세요.");
			$("#field2").focus();
			return false;
		}
		
		if( !$("#field3").val() ) {
			alert("지역명을 입력해 주세요.");
			$("#field3").focus();
			return false;
		}
		
		if( !$("#field4").val() ) {
			alert("클럽명(해당국가언어)를 입력해 주세요.");
			$("#field4").focus();
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


<script type="text/javascript">

	function countrySelect( val ) {

		var Url = "/pl/globalCode.do";
		var pars = "upperNm=" + val;

		var myAjax = new Ajax.Updater (
			"globalSelect",
			Url,
			{
				method: "post",
				parameters: pars
			}
		);

	}
</script>
</head>
<body>
<% 
	String content = "<img alt='' src='/upload/8f638a2f-cd5e-46aa-b9a8-bc32dec6d1d7.jpg'/>";
%>
<c:set var="boardKor" value="글로벌 골프코스"/>

<ol class="breadcrumb bc-3" >
	<li class="active"><a href="/pl/mngGolfClubList.do?boardNo=${boardNo}"><strong>${boardKor} 게시판 관리</strong></a></li>
</ol>
<h2><strong>${boardKor} 수정</strong></h2>
<br />

<form action="/pl/updateGolfClub.do" method="post" name="bbsNttUpdateForm" id="bbsNttUpdateForm" onsubmit="return validateBoardRegist(this)"  enctype="multipart/form-data">
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
			<div class="form-horizontal form-groups-bordered">
								
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 대륙</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<select id="field1" name="field1" onchange="countrySelect(this.value)">
								<option value="">대륙선택</option>
							<c:forEach var="globalCode" items="${globalCodeList}" varStatus="status">
								<option value="${globalCode.areaNm}"<c:if test="${globalCode.areaNm eq boardNttResult.field1}"> selected="selected"</c:if>>${globalCode.areaNm}</option>
							</c:forEach>
							</select>
						</div>				
					</div>						
				</div>				
						
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 국가</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<span id="globalSelect"><select name="field2" id="field2">
								<c:forEach var="globalCode2" items="${globalCodeList2}" varStatus="status">
								<option value="${globalCode2.areaNm}"<c:if test="${globalCode2.areaNm eq boardNttResult.field2}"> selected="selected"</c:if>>${globalCode2.areaNm}</option>
							</c:forEach>
							</select></span>
						</div>				
					</div>						
				</div>						
								
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 지역명</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<input type="text" class="form-control" data-mask="" placeholder="" id="field3" name="field3" value="${boardNttResult.field3}"/>
						</div>				
					</div>						
				</div>						
								
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 클럽명(한글)</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<input type="text" class="form-control" data-mask="" placeholder="" id="title" name="title" value="${boardNttResult.title}"/>
						</div>				
					</div>						
				</div>						
								
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 클럽명(해당국가언어)</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<input type="text" class="form-control" data-mask="" placeholder="" id="field4" name="field4" value="${boardNttResult.field4}"/>
						</div>				
					</div>						
				</div>						
	
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> 골프스토리 링크</label>
					<div class="col-sm-5">
						<div class="input-group">	
							<input type="text" class="form-control" data-mask="" placeholder="" id="linkUrl1" name="linkUrl1" value="${boardNttResult.linkUrl1}"/>																
						</div>						
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 썸네일 이미지</label>
					<div class="col-sm-5">
						
						<c:set var="fileCnt" value="0" />						
						<c:forEach var="boardAtchmnfl" items="${boardAtchmnflList}" varStatus="idx">		
						<div class="input-group">	
							<input type="radio" name="fileProcTy${idx.index}" id="fileProcTy_${idx.index}_U" value="U" checked="checked"/><label for="fileProcTy_${idx.index}_U">유지</label>
							<input type="radio" name="fileProcTy${idx.index}" id="fileProcTy_${idx.index}_D" value="${boardAtchmnfl.atchmnflNo}"/><label for="fileProcTy_${idx.index}_D">삭제</label>
							<a href="/downloadBbsFile.do?atchmnflNo=${boardAtchmnfl.atchmnflNo}"><img src="/images/board/file/ico_${boardAtchmnfl.fileExtsn}.gif"/> ${boardAtchmnfl.fileNm}</a><br/>
							<c:set var="fileCnt" value="${idx.index}" />
						</div>
						</c:forEach>	
							<div class="input-group">
								<input type="file" name="atchmnfl" id="atchmnfl_${fileCnt}" size="60"/>					
							</div>
					</div>
				</div>

	
			</div>
		</div>		
	</div>
	
	 

	<div style="padding-top:50px; padding-bottom:10px; text-align:right">
		<button type="submit" id="updateBtn" name="updateBtn" class="btn btn-blue" style="width:80px">수정</button>
		<a href="#n" onclick="deleteChk(); return false;"><button type="button" class="btn btn-red" style="width:80px">삭제</button></a>
		<a href="/pl/mngGolfClubList.do?boardNo=golf"><button type="button" class="btn btn-default" style="width:80px">목록</button></a>
	</div>
	
</form>
</body>
</html>