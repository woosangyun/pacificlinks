<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/font-icons/entypo/css/entypo.css">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/neon-core.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/neon-theme.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/neon-forms.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/custom.css">
<%@ page import="java.util.*" %>

<style>
	.short {
	width:150px;
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
	/* border:1px solid red; */
	}
</style>
<script src="<%=request.getContextPath() %>/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
<script type="text/javascript" src="/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
	function cancelBtn() {
		document.bbsNttRegistForm.action = "<c:url value='/mngBoardList.do?boardNo=news'/>";
	   	document.bbsNttRegistForm.submit();	

	function validateBoardRegist(event) {
/* 		if( !$("#requestNm").val() ) {
			alert("이름을 입력해 주세요.");
			$("#requestNm").focus();
			return false;
		}		
		if( ("#reqMobile2").val() != "" && $("#reqMobile3").val() != "") {
			alert("핸드폰 번호를 입력해 주세요.");
			$("#reqMobile2").focus();
			return false;
		}
		if( !$("#reqPost1").val() ) {
			alert("우편번호를 입력해 주세요.");
			$("#reqPost1").focus();
			return false;
		}
		if( !$("#accPost1").val() ) {
			alert("우편번호를 입력해 주세요.");
			$("#accPost1").focus();
			return false;
		}	
		if( !$("#accAddr").val() ) {
			alert("주소를 입력해 주세요.");
			$("#accAddr").focus();
			return false;
		}	
		if($("#price").val() == "" || $("#price").val() == 0) {
			alert("배출할 폐기물을 선택해 주세요.");
			return false;
		}
		if( !$("#date").val() ) {
			alert("배출 예정일을 입력해 주세요.");
			$("#date").focus();
			return false;
		}	 */
		$('#registBtn').attr('disabled', true);
		return true;
	}


</script>

<ol class="breadcrumb bc-3" >
	<li><i class="entypo-folder"></i> 대형폐기물 처리</li>
	<li>수거신청 관리</li>
	<li class="active"><a href="<%=request.getContextPath() %>/mngBoardList.do?boardNo=news"><strong>수거신청 관리</strong></a></li>
</ol>
<h2><strong>방문 수거신청 등록</strong></h2>
<br />

<form name="bbsNttRegistForm" id="bbsNttRegistForm" method="post" action="<%=request.getContextPath() %>/addBoardNtt.do" onsubmit="return validateBoardRegist(this)">
<input type="hidden" id="boardNo" name="boardNo" value="${boardNo}" />
<div class="panel panel-info" data-collapsed="0">
	<div class="panel-heading">
		<div class="panel-title">
			<i class="entypo-bag"></i> <strong>신청인 정보</strong>
		</div>
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
							
						<input type="text" class="form-control" data-mask="" placeholder="" id="title" name="title"/>
					</div>
				</div>
			</div>


		<%-- </form> --%>
		</div>
	</div>
</div>

<div style="padding-top:50px; padding-bottom:10px; text-align:center">
	<button type="submit" id="registBtn" name="registBtn" class="btn btn-blue" style="width:80px">등록</button>
	<a href="#n" onclick="cancelBtn(); return false;"><button type="submit" class="btn btn-default" style="width:80px">취소</button></a>
</div>
</form>

<!-- Imported styles on this page -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/select2/select2-bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/select2/select2.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/daterangepicker/daterangepicker-bs3.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/icheck/skins/minimal/_all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/icheck/skins/square/_all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/icheck/skins/flat/_all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/icheck/skins/futurico/futurico.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/icheck/skins/polaris/polaris.css">

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
