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
<script type="text/javascript">
	function printWasteBtn(wasteApplyNo, oid) {
		url = "<%=request.getContextPath() %>/selectWastePrintUsrList.do?pWasteApplyNo="+wasteApplyNo
				+"&pOid="+oid;
	    window.open(url,"doc","width=630,height=730,scrollbars=yes,resizable=yes,menubar=no,toolbar=no,location=no,top=10,left=10");
	}
	function wasteDeleteBtn() {
	   	var result = confirm('정말 삭제하시겠습니까?'); 
	   	if(result) { 
	   		document.wasteUpdateForm.action = "<c:url value='/deleteWasteApply.do'/>";
		   	document.wasteUpdateForm.submit();	
	   	} else { 
	   		return false;
	   	}
	}
	function listBtn(collectDate,payStatus,reqHjdong,cDateF,cDateT,requestNm) {
		document.wasteUpdateForm.action = "./selectWasteList.do?collectDate="+collectDate+"&payStatus="+payStatus+"&reqHjdong="+reqHjdong+"&cDateF="+cDateF+"&cDateT="+cDateT+"&requestNm="+requestNm;
	   	document.wasteUpdateForm.submit();	
	}
	function findJuso(gubun, transaction) {
		window.open("<%=request.getContextPath() %>/common/juso/road.jsp?gubun=" + gubun + "&transaction=" + transaction,"_juso","width=520,height=800,scrollbars=yes");
	}
	function popSpec(rNum) {
		window.open("<%=request.getContextPath() %>/selectPopSpecList.do?rNum=" + rNum, "_blank", "width=600,height=600,scrollbars=yes");
	}
	function deleteBtn(rNum) {
		var item = "#item"+rNum;
		var spec = "#spec"+rNum;
		var price = "#price"+rNum;
		var amount = "#amount"+rNum;
		$(item).val("");
		$(spec).val("");
		$(price).val("");
		$(amount).val("");
		
		setTotalMoney(rNum)
	}
	
	function cancelPrice(rNum) {
		
		alert(rNum);
		
		if ( rNum.checked == true ) {
			 alert("1111");
		} else {
			
		}
		
		var item = "#item"+rNum;
		var spec = "#spec"+rNum;
		var price = "#price"+rNum;
		var amount = "#amount"+rNum;
		
		setCancelMoney(rNum);
		
		$(item).val("");
		$(spec).val("");
		$(price).val("");
		$(amount).val("");
		
		
	}
	
	function copyCheck(chkbox) {
		if ( chkbox.checked == true ) {
			$("#accPost1").val($("#reqPost1").val());
// 			$("#accPost2").val($("#reqPost2").val());
			$("#accAddr").val($("#reqAddr").val());
			$("#accNewAddr").val($("#reqNewAddr").val());
			$("#accNewAddr").val($("#reqNewAddr").val());
			$("#accBunji1").val($("#reqBunji1").val());
			$("#accBunji2").val($("#reqBunji2").val());
			$("#accBjdong").val($("#reqBjdong").val());
		} else {
			$("#accPost1").val("");
// 			$("#accPost2").val("");
			$("#accAddr").val("");
			$("#accNewAddr").val("");
			$("#accNewAddr").val("");
			$("#accBunji1").val("");
			$("#accBunji2").val("");
			$("#accBjdong").val("");
		}
	}
	function validateWasteUpdate(event) {
		if( !$("#requestNm").val() ) {
			alert("이름을 입력해 주세요.");
			$("#requestNm").focus();
			return false;
		}		
		if( !$("#reqMobile2").val() && !$("#reqMobile3").val()) {
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
		}	
		$('#listBtn').attr('disabled', true);
		$('#updateBtn').attr('disabled', true);
		$('#deleteBtn').attr('disabled', true);
		
		return true;
	}
	function sumPrice() {
		alert("sum");
	}
	function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	function uncomma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	function setTotalMoney(rNum) {
		var totalSum = 0;
		var tempSum = 0;
		var price = 0;
		var amount = 0;
		for(var i=1; i<=10; i++) {
			price = uncomma($("#price"+i).val());
			amount = $("#amount"+i).val();
			price = price * 1;
			amount = amount * 1;
			tempSum = parseInt(price) * parseInt(amount);
			totalSum = totalSum + tempSum;
		}
		$("#price").val(comma(totalSum));
	}
	
	$(document).ready(function(){
		 
		  $("#checkall1").click(function(){ if($("#checkall1").prop("checked")){  setCancelMoney(1);  }else{  setMinusMoney(1)  } })
		  $("#checkall2").click(function(){ if($("#checkall2").prop("checked")){  setCancelMoney(2);  }else{  setMinusMoney(2)  } })
		  $("#checkall3").click(function(){ if($("#checkall3").prop("checked")){  setCancelMoney(3);  }else{  setMinusMoney(3)  } })
		  $("#checkall4").click(function(){ if($("#checkall4").prop("checked")){  setCancelMoney(4);  }else{  setMinusMoney(4)  } })
		  $("#checkall5").click(function(){ if($("#checkall5").prop("checked")){  setCancelMoney(5);  }else{  setMinusMoney(5)  } })
		  $("#checkall6").click(function(){ if($("#checkall6").prop("checked")){  setCancelMoney(6);  }else{  setMinusMoney(6)  } })
		  $("#checkall7").click(function(){ if($("#checkall7").prop("checked")){  setCancelMoney(7);  }else{  setMinusMoney(7)  } })
		  $("#checkall8").click(function(){ if($("#checkall8").prop("checked")){  setCancelMoney(8);  }else{  setMinusMoney(8)  } })
		  $("#checkall9").click(function(){ if($("#checkall9").prop("checked")){  setCancelMoney(9);  }else{  setMinusMoney(9)  } })
		  $("#checkall10").click(function(){ if($("#checkall10").prop("checked")){  setCancelMoney(10);  }else{  setMinusMoney(10)  } })
		})
	
		
	
	
	function setCancelMoney(rNum) {
		
		var totalSum = 0;
		var tempSum = 0;
		var price = 0;
		var amount = 0;
		var sum = 0;
		
		price = uncomma($("#price"+rNum).val());
		amount = $("#amount"+rNum).val();
		price = price * 1;
		amount = amount * 1;
		totalSum = uncomma($("#canceldPrice").val());
		tempSum = parseInt(price) * parseInt(amount);
		if(totalSum == ""){
			sum = tempSum;
		} else {
			sum = parseInt(totalSum) + tempSum;
		}
		
		
		$("#canceldPrice").val(comma(sum));
	}
	
	function setMinusMoney(rNum) {
		
		var totalSum = 0;
		var tempSum = 0;
		var price = 0;
		var amount = 0;
		var sum = 0;
		
		price = uncomma($("#price"+rNum).val());
		amount = $("#amount"+rNum).val();
		price = price * 1;
		amount = amount * 1;
		totalSum = uncomma($("#canceldPrice").val());
		tempSum = parseInt(price) * parseInt(amount);
		if(totalSum == ""){
			sum = parseInt(totalSum);
		} else {
			sum = parseInt(totalSum) - tempSum;
		}
		
		
		$("#canceldPrice").val(comma(sum));
	}
	
</script>

<div id="print">
<ol class="breadcrumb bc-3" >
	<li><i class="entypo-folder"></i> 대형폐기물 처리</li>
	<li>수거신청 관리</li>
	<li class="active"><a href="<%=request.getContextPath() %>/selectWasteList.do"><strong>수거신청 관리</strong></a></li>
</ol>
<h2><strong>신청결과 조회</strong></h2>
<br />

<input type="hidden" id="boardNo" name="boardNo" value="${boardNttResult.boardNo }" />
<input type="hidden" id="contentNo" name="contentNo" value="${boardNttResult.contentNo }" />

<div class="panel panel-info" data-collapsed="0">
	<div class="panel-heading">
		<div class="panel-title">
			<strong></strong>
		</div>
		<div class="panel-options">
			<a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<%-- <form role="form" class="form-horizontal form-groups-bordered"> --%>
		<div class="form-horizontal form-groups-bordered">
			<div class="form-group">
				<label class="col-sm-3 control-label" style="text-align:left"> 제목</label>
				<div class="col-sm-5">
					<div class="input-group">
						<input type="text" class="form-control" data-mask="" placeholder="" id="title" name="title" value="${boardNttResult.title }"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



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

