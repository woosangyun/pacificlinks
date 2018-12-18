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
	
	function validateBoardRegist(event) {
		
		if( !$("#upperNm").val() ) {
			alert("대륙을 선택해 주세요.");
			$("#upperNm").focus();
			return false;
		}
		
		if( !$("#areaNm").val() ) {
			alert("국가를 입력해 주세요.");
			$("#areaNm").focus();
			return false;
		}
			
 		
		$('#registBtn').attr('disabled', true);
		return true;
	}


</script>


</head>
<body>
<% 
	String content = "<img alt='' src='/upload/8f638a2f-cd5e-46aa-b9a8-bc32dec6d1d7.jpg'/>";
%>
<c:set var="boardKor" value="국가 등록"/>

<ol class="breadcrumb bc-3" >
	<li class="active"><a href="/pl/mngBoardList.do?boardNo=${boardNo}"><strong>${boardKor}</strong></a></li>
</ol>
<h2><strong>${boardKor}</strong></h2>
<br />

<form action="/pl/addGlobalCode.do" method="post" name="bbsNttRegistForm" id="bbsNttRegistForm" onsubmit="return validateBoardRegist(this)">
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
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 대륙</label>
					<div class="col-sm-5">
						<div class="input-group">						
							<select id="upperNm" name="upperNm" onchange="countrySelect(this.value)">
								<option value="">대륙선택</option>
							<c:forEach var="globalCode" items="${globalCodeList}" varStatus="status">
								<option value="${globalCode.areaNm}">${globalCode.areaNm}</option>
							</c:forEach>
							</select>
						</div>				
					</div>						
				</div>
			    	
				<div class="form-group">
					<label class="col-sm-3 control-label" style="text-align:left"><span style="color:red">*</span> 국가명</label>
					<div class="col-sm-5">
						<div class="input-group">
								
							<input type="text" class="form-control" data-mask="" placeholder="" id="areaNm" name="areaNm"/>
						</div>
					</div>
				</div>
				

			</div>
		</div>		
	</div>
	
	 

	<div style="padding-top:50px; padding-bottom:10px; text-align:center">
		<button type="submit" id="registBtn" name="registBtn" class="btn btn-blue" style="width:80px">등록</button>
		<a href="/pl/globalCodeList.do" ><button type="button" class="btn btn-default" style="width:80px">취소</button></a>
	</div>
	
</form>
</body>
</html>