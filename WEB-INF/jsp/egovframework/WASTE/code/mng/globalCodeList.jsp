<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/font-icons/entypo/css/entypo.css">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/neon-core.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/neon-theme.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/neon-forms.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/custom.css">

<style>
	.short {
	width:150px;
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
	/* border:1px solid red; */
	}
</style>
<script type="text/javaScript" language="javascript" defer="defer">

	function goPage(pageNo) {
		document.boardNttListForm.pageNo.value = pageNo;
		document.boardNttListForm.action = "<c:url value='/pl/mngConsList.do'/>";
	   	document.boardNttListForm.submit();
	}
	function fn_addView() {
	   	document.boardNttListForm.action = "<c:url value='/pl/addBoardNttView.do'/>";
	   	
	   	document.boardNttListForm.submit();		
	}
	function fn_egov_select(id, oid) {
		document.boardNttListForm.applyNo.value = id;
		document.boardNttListForm.oid.value = oid;
	   	document.boardNttListForm.action = "<c:url value='/pl/updateWasteApplyView.do'/>";
	   	document.boardNttListForm.submit();		
	}
	$(function() {
		$("#pageUnit").change( function() {
			document.boardNttListForm.pageUnit.value = this.value;
			document.boardNttListForm.action = "<c:url value='/pl/mngConsList.do'/>";
		   	document.boardNttListForm.submit();
	    });	
	});
</script>

<c:set var="boardKor" value="국가 관리"/>


			
<ol class="breadcrumb bc-3" >
	<li><i class="entypo-folder"></i>홈페이지 관리</li>
	<li>글로벌 골프코스</li>
	<li class="active"><a href="/pl/mngBoardList.do?boardNo=${boardNo }"><strong>${boardKor }</strong></a></li>
</ol>
<h2><strong>${boardKor }</strong></h2>
<br />
<script type="text/javascript">
	jQuery( document ).ready( function( $ ) {
		var d = new Date();
		var month = d.getMonth()+1;
		var day = d.getDate();
		var today = d.getFullYear() + '-' +
		    (month<10 ? '0' : '') + month + '-' +
		    (day<10 ? '0' : '') + day;
		if($("#cDateF").val() == "") {
			$("#cDateF").val(today);	
		}
		if($("#cDateT").val() == "") {
			$("#cDateT").val(today);	
		}
	} );		
</script>

<div style="margin:10px;">
	<c:forEach var="result" items="${globalCodeCate}" varStatus="status">				
		<a href="/pl/globalCodeList.do?upperNm=${result.areaNm}"><button type="button" class="btn<c:if test="${result.areaNm eq upperNm}"> btn-green</c:if>" style="width:80px"><c:out value="${result.areaNm}"/></button></a>																							
	</c:forEach>			
</div>	

<div align="right" style="margin-bottom: 10px">
  									
	<a href="/pl/addGlobalCodeForm.do"><button type="button" class="btn btn-blue">등록</button></a>
</div>		
	
	<table class="table table-bordered responsive">
		<thead>
			<tr height="40px">				
				<th style="text-align:center; vertical-align:middle">국가명</th>										
				<th style="text-align:center; vertical-align:middle" width="20%">수정/삭제</th>																		
			</tr>
		</thead>
		<tbody>
			<c:forEach var="result" items="${globalCodeList}" varStatus="status">
				<tr>					
					<td align="center"><c:out value="${result.areaNm}"/></td>									
					<td align="center">
						<a href="/pl/updateGlobalCodeForm.do?areaNm=${result.areaNm}"><button type="button" class="btn btn-blue" style="width:80px">수정</button></a>
						<a href="/pl/deleteGlobalCode.do?areaNm=${result.areaNm}&upperNm=${result.upperNm}"><button type="button" class="btn btn-red" style="width:80px">삭제</button></a>
					</td>											
				</tr>
				<c:set var="count" value="${count-1}"/>
			</c:forEach>
			<c:if test="${empty globalCodeList}">
				<tr>
					<td align="center" colspan="3">내용이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>


<!-- Imported styles on this page -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/select2/select2-bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/select2/select2.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/daterangepicker/daterangepicker-bs3.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/icheck/skins/minimal/_all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/icheck/skins/square/_all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/icheck/skins/flat/_all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/icheck/skins/futurico/futurico.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/icheck/skins/polaris/polaris.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/zurb-responsive-tables/responsive-tables.css">

<script src="<%=request.getContextPath() %>/assets/js/jquery-1.11.3.min.js"></script>

<!-- Imported scripts on this page -->
<script src="<%=request.getContextPath() %>/assets/js/select2/select2.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/bootstrap-tagsinput.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/typeahead.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/bootstrap-datepicker.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/bootstrap-timepicker.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/bootstrap-colorpicker.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/moment.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/daterangepicker/daterangepicker.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/jquery.multi-select.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/icheck/icheck.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/zurb-responsive-tables/responsive-tables.js"></script>
