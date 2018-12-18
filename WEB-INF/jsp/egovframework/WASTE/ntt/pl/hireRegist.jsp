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
			alert("제목을 입력해 주세요.");
			$("#title").focus();
			return false;
		}

		$('#registBtn').attr('disabled', true);
		return true;
	}


</script>
<script type="text/javascript">

    function add_item1(){
        // pre_set 에 있는 내용을 읽어와서 처리..
        var div = document.createElement('div');
        div.innerHTML = document.getElementById('pre_set1').innerHTML;
        document.getElementById('f1').appendChild(div);
    }
 
    function remove_item1(obj){
        // obj.parentNode 를 이용하여 삭제
        document.getElementById('f1').removeChild(obj.parentNode);
    }

    function add_item2(){
        // pre_set 에 있는 내용을 읽어와서 처리..
        var div = document.createElement('div');
        div.innerHTML = document.getElementById('pre_set2').innerHTML;
        document.getElementById('f2').appendChild(div);
    }
 
    function remove_item2(obj){
        // obj.parentNode 를 이용하여 삭제
        document.getElementById('f2').removeChild(obj.parentNode);
    }

    function add_item3(){
        // pre_set 에 있는 내용을 읽어와서 처리..
        var div = document.createElement('div');
        div.innerHTML = document.getElementById('pre_set3').innerHTML;
        document.getElementById('f3').appendChild(div);
    }
 
    function remove_item3(obj){
        // obj.parentNode 를 이용하여 삭제
        document.getElementById('f3').removeChild(obj.parentNode);
    }

    function add_item4(){
        // pre_set 에 있는 내용을 읽어와서 처리..
        var div = document.createElement('div');
        div.innerHTML = document.getElementById('pre_set4').innerHTML;
        document.getElementById('f4').appendChild(div);
    }
 
    function remove_item4(obj){
        // obj.parentNode 를 이용하여 삭제
        document.getElementById('f4').removeChild(obj.parentNode);
    }

    function add_item5(){
        // pre_set 에 있는 내용을 읽어와서 처리..
        var div = document.createElement('div');
        div.innerHTML = document.getElementById('pre_set5').innerHTML;
        document.getElementById('f5').appendChild(div);
    }
 
    function remove_item5(obj){
        // obj.parentNode 를 이용하여 삭제
        document.getElementById('f5').removeChild(obj.parentNode);
    }

    function add_item6(){
        // pre_set 에 있는 내용을 읽어와서 처리..
        var div = document.createElement('div');
        div.innerHTML = document.getElementById('pre_set6').innerHTML;
        document.getElementById('f6').appendChild(div);
    }
 
    function remove_item6(obj){
        // obj.parentNode 를 이용하여 삭제
        document.getElementById('f6').removeChild(obj.parentNode);
    }

    function add_item7(){
        // pre_set 에 있는 내용을 읽어와서 처리..
        var div = document.createElement('div');
        div.innerHTML = document.getElementById('pre_set7').innerHTML;
        document.getElementById('f7').appendChild(div);
    }
 
    function remove_item7(obj){
        // obj.parentNode 를 이용하여 삭제
        document.getElementById('f7').removeChild(obj.parentNode);
    }

    function add_item8(){
        // pre_set 에 있는 내용을 읽어와서 처리..
        var div = document.createElement('div');
        div.innerHTML = document.getElementById('pre_set8').innerHTML;
        document.getElementById('f8').appendChild(div);
    }
 
    function remove_item8(obj){
        // obj.parentNode 를 이용하여 삭제
        document.getElementById('f8').removeChild(obj.parentNode);
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
<c:if test="${boardNo eq 'qna'}">
	<c:set var="boardKor" value="자주하는 질문"/>
</c:if>
<ol class="breadcrumb bc-3" >
	<li class="active"><a href="/pl/mngHireList.do?boardNo=${boardNo}"><strong>${boardKor} 게시판 관리</strong></a></li>
</ol>
<h2><strong>${boardKor} 등록</strong></h2>
<br />

<form action="/pl/addHire.do" method="post" name="bbsNttRegistForm" id="bbsNttRegistForm" onsubmit="return validateBoardRegist(this)" enctype="multipart/form-data">
<input type="hidden" id="boardNo" name="boardNo" value="${boardNo}" />
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
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 제목</label>
					<div class="col-sm-5">
						<div class="input-group">
								
							<input type="text" class="form-control" data-mask="" placeholder="" id="title" name="title" style="width:1000px;"/>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 모집분야</label>
					<div class="col-sm-5" id="f1">
						
						<input type="button" value=" 추가 " onclick="add_item1()" style="margin:5px;"><br>						
					</div>
					
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 담당업무</label>
					<div class="col-sm-5" id="f2">
						<input type="button" value=" 추가 " onclick="add_item2()" style="margin:5px;"><br>	
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 지원자격</label>
					<div class="col-sm-5" id="f3">
						<div class="input-group">
								
							<input type="button" value=" 추가 " onclick="add_item3()" style="margin:5px;"><br>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 우대사항</label>
					<div class="col-sm-5" id="f4">
						<div class="input-group">
								
							<input type="button" value=" 추가 " onclick="add_item4()" style="margin:5px;"><br>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 인원</label>
					<div class="col-sm-5" id="f5">
						<div class="input-group">
								
							<input type="button" value=" 추가 " onclick="add_item5()" style="margin:5px;"><br>							
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 모집분야</label>
					<div class="col-sm-5" id="f6">
						<div class="input-group">
								
							<input type="button" value=" 추가 " onclick="add_item6()" style="margin:5px;"><br>							
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 제출방법</label>
					<div class="col-sm-5" id="f7">
						<div class="input-group">
								
							<input type="button" value=" 추가 " onclick="add_item7()" style="margin:5px;"><br>							
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 기타사항</label>
					<div class="col-sm-5" id="f8">
						<div class="input-group">
								
							<input type="button" value=" 추가 " onclick="add_item8()" style="margin:5px;"><br>							
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> 첨부파일</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<input type="file" name="atchmnfl" id="atchmnfl_0" size="60"/>
						</div>
						<div class="input-group">						
							<input type="file" name="atchmnfl" id="atchmnfl_1" size="60"/>
						</div>
						<div class="input-group">						
							<input type="file" name="atchmnfl" id="atchmnfl_2" size="60"/>
						</div>
						<div class="input-group">						
							<input type="file" name="atchmnfl" id="atchmnfl_3" size="60"/>
						</div>
						<div class="input-group">						
							<input type="file" name="atchmnfl" id="atchmnfl_4" size="60"/>
						</div>
					</div>					
				</div>
				
				<table id="ds_conclass" style="display: none; background-color: #FFF; border: 1px solid #CCCCCC; position: absolute; z-index: 32767;" border="1"><tr><td id="ds_calclass"></td></tr></table>
				<script type="text/javascript" src="/js/calendar.js"></script>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"> 등록일</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<a href="#" onClick="ds_sh(document.getElementById('regDate'),2,3); return false;" style="vertical-align:sub"><img src="/images/calendar/btn_calendar.gif" alt="달력" style="height:15px; margin:0px 0px 0px 10px;"/></a>							
							<input type="text" readonly class="form-control" data-mask="" placeholder="" name="regDate" id="regDate" onClick="ds_sh(this,2,3);" size="8" style="width:100px;"/>							
													
						</div><br/><span style="color:red">* </span><span>등록일을 지정하지 않으면 현재 날짜로 등록됩니다.</span>													
					</div>						
				</div>	
		
			</div>
		</div>		
	</div>
	
	 

	<div style="padding-top:50px; padding-bottom:10px; text-align:center">
		<button type="submit" id="registBtn" name="registBtn" class="btn btn-blue" style="width:80px">등록</button>
		<a href="/pl/mngHireList.do?boardNo=${boardNo}" ><button type="button" class="btn btn-default" style="width:80px">취소</button></a>
	</div>
	
</form>

<div class="input-group" id="pre_set1" style="display:none">							
	<input type="text" class="form-control" data-mask="" placeholder="" id="a1_0" name="a1" style="width:1000px;"/>	
	<input type="button" value="삭제" onclick="remove_item1(this)">												
</div>

<div class="input-group" id="pre_set2" style="display:none">					
	<input type="text" class="form-control" data-mask="" placeholder="" id="a2_0" name="a2" style="width:1000px;"/>
	<input type="button" value="삭제" onclick="remove_item2(this)">
</div>

<div class="input-group" id="pre_set3" style="display:none">					
	<input type="text" class="form-control" data-mask="" placeholder="" id="a3_0" name="a3" style="width:1000px;"/>
	<input type="button" value="삭제" onclick="remove_item3(this)">
</div>

<div class="input-group" id="pre_set4" style="display:none">					
	<input type="text" class="form-control" data-mask="" placeholder="" id="a4_0" name="a4" style="width:1000px;"/>
	<input type="button" value="삭제" onclick="remove_item4(this)">
</div>

<div class="input-group" id="pre_set5" style="display:none">					
	<input type="text" class="form-control" data-mask="" placeholder="" id="a5_0" name="a5" style="width:1000px;"/>
	<input type="button" value="삭제" onclick="remove_item5(this)">
</div>

<div class="input-group" id="pre_set6" style="display:none">					
	<input type="text" class="form-control" data-mask="" placeholder="" id="b1_0" name="b1" style="width:1000px;"/>
	<input type="button" value="삭제" onclick="remove_item6(this)">
</div>

<div class="input-group" id="pre_set7" style="display:none">					
	<input type="text" class="form-control" data-mask="" placeholder="" id="b2_0" name="b2" style="width:1000px;"/>
	<input type="button" value="삭제" onclick="remove_item7(this)">
</div>

<div class="input-group" id="pre_set8" style="display:none">					
	<input type="text" class="form-control" data-mask="" placeholder="" id="b3_0" name="b3" style="width:1000px;"/>
	<input type="button" value="삭제" onclick="remove_item8(this)">
</div>

</body>
</html>