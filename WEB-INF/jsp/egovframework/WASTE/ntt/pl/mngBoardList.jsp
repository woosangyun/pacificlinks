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
		document.boardNttListForm.action = "<c:url value='/pl/mngBoardList.do'/>";
	   	document.boardNttListForm.submit();
	}
	function fn_addView() {
	   	document.boardNttListForm.action = "<c:url value='/pl/addBoardNttView.do'/>";
	   	document.boardNttListForm.boardNo.value = "${boardNo}";
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
			document.boardNttListForm.action = "<c:url value='/pl/mngBoardList.do'/>";
		   	document.boardNttListForm.submit();
	    });	
	});
</script>

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
	<li><i class="entypo-folder"></i>홈페이지 관리</li>
	<li>게시판 관리</li>
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
<form name="boardNttListForm" id="boardNttListForm" method="get" action="/pl/mngBoardList.do">
<input type="hidden" id="boardNo" name="boardNo" value="${boardNo }"/>
<input type="hidden" id="pageNo" name="pageNo" value="${pageNo }" />

<div align="right" style="margin-bottom: 10px">
  				<select title="검색목록 선택" id="searchCondition" name="searchCondition" style="height:31px; vertical-align:bottom;">
					<option value="title" <c:if test="${boardNttVO.searchCondition eq 'title'}">selected="selected"</c:if>>제목</option>
					<option value="content" <c:if test="${boardNttVO.searchCondition eq 'content'}">selected="selected"</c:if>>내용</option>
				</select>
					<input type="text" name="searchKeyword" id="searchKeyword" title="검색어 입력" placeholder="검색어를 입력하세요" style="height:31px;" value="${boardNttVO.searchKeyword}">
					<button  class="btn btn-green">검색</button>
	<button type="button" class="btn btn-blue" onclick="javascript:fn_addView();">글쓰기</button>
</div>

<div class="panel panel-primary" style="margin-bottom:0px">
	<div class="panel-heading">
		<div class="panel-title">
			<div id="gridTop">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>목록</td>
						<td width="5px"></td>
						<td>
							<select class="form-control" id="pageUnit" name="pageUnit">
								<option value="10" <c:if test="${'10' eq pageUnit }">selected="selected"</c:if>>10</option>
								<option value="20" <c:if test="${'20' eq pageUnit }">selected="selected"</c:if>>20</option>
								<option value="30" <c:if test="${'30' eq pageUnit }">selected="selected"</c:if>>30</option>
								<option value="50" <c:if test="${'50' eq pageUnit }">selected="selected"</c:if>>50</option>
							</select>
						</td>
						<td width="5px"></td>
						<td>개씩 보기</td>
					</tr>
				</table>
			</div>			
		</div>
		</form>	
		<div class="panel-title" style="float:right">
			<div id="gridTop">
				총 ${paginationInfo.totalRecordCount}건
			</div>			
		</div>
	</div>
	<table class="table table-bordered responsive">
		<thead>
			<tr height="40px">
				<th style="text-align:center; vertical-align:middle">번호</th>
				<th style="text-align:center; vertical-align:middle">제목</th>							
				<th style="text-align:center; vertical-align:middle">등록일</th>				
			</tr>
		</thead>
		<tbody>
			<c:set var="sum" value="0"/>
			<c:set value="${paginationInfo.totalRecordCount}" var="count"/>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td align="center"><c:out value="${count-pageIndex*paginationInfo.recordCountPerPage+paginationInfo.recordCountPerPage}"/></td>
					<td align="center"><a href="/pl/mngBoardView.do?boardNo=${result.boardNo}&contentNo=${result.contentNo}"><c:out value="${result.title}"/></a></td>
					<fmt:parseDate value="${fn:substring(result.frstRegisterPnttm,0,8) }" var="dateFmt" pattern="yyyyMMdd"/>
					<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd" var="frstPnttm"/>
					<td align="center"><c:out value="${frstPnttm}"/></td>					
				</tr>
				<c:set var="count" value="${count-1}"/>
			</c:forEach>
			<c:if test="${empty resultList}">
				<tr>
					<td align="center" colspan="3">검색된 내용이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>	
</div>
	
<div id="gridBottom" align="center" style="margin-top: 10px">
	<ul class="pagination">
		<c:choose>
			<c:when test="${i eq paginationInfo.currentPageNo}"></c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
		<li><a href="javascript:goPage(1)"><i class="entypo-left"></i>&nbsp;</a></li>
		<li><a href="javascript:goPage(${paginationInfo.currentPageNo-1})"><i class="entypo-left-open"></i> Previous</a></li>
		<c:forEach var="i" begin="${paginationInfo.firstPageNoOnPageList }" end="${paginationInfo.lastPageNoOnPageList }">
			<c:choose>
		        <c:when test="${i eq paginationInfo.currentPageNo}"><li class="active"><a href="javascript:goPage(${i})">${i}</a></li></c:when>
		        <c:otherwise><li><a href="javascript:goPage(${i})">${i}</a></li></c:otherwise>
		    </c:choose>
		</c:forEach>
		<li><a href="javascript:goPage(${paginationInfo.currentPageNo+1})">Next <i class="entypo-right-open"></i></a></li>
		<li><a href="javascript:goPage(${paginationInfo.totalPageCount})">&nbsp;<i class="entypo-right"></i></a></li>
	</ul>
</div>	



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
