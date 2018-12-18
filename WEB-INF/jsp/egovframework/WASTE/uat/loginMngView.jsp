<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="description" content="" />
	<meta name="author" content="" />

	<link rel="icon" href="<%=request.getContextPath() %>/assets/images/favicon.ico">
	<title>Pacific Links</title>

	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/font-icons/entypo/css/entypo.css">
	<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/bootstrap.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/neon-core.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/neon-theme.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/neon-forms.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/custom.css">

	<script src="<%=request.getContextPath() %>/assets/js/jquery-1.11.3.min.js"></script>

	<!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<!-- <body class="page-body login-page login-form-fall"> -->
<body class="page-body login-page login-form-fall">
<div class="login-container">
	<div class="login-header login-caret">
		<div class="login-content">
			<a href="" onclick="/"><font color="white" style="font-size:35px"><strong>Pacific Links</strong></font></a>
			<p class="description" style="color:#949494">Pacific Links 처리 관리 서비스를 이용하기 위해<br />로그인 하시기 바랍니다.</p>
		</div>
	</div>
	<div class="login-progressbar">
		<div></div>
	</div>
	<div class="login-form">
		<div class="login-content">
			<!-- <form method="post" role="form" id="form_login"> -->
			<form name="loginMngForm" id="loginMngForm" method="post" action="<%=request.getContextPath() %>/actionLogin.do" onsubmit="return validateLogin(this)">
				<div class="form-group">
					<div>
						<div class="input-group-addon">
							<i class="entypo-user"></i>
						</div>
						<input type="text" class="form-control" name="managerId" id="managerId" placeholder="ID" autocomplete="off" />
					</div>
				</div>
				<div>
					<div class="input-group">
						<div class="input-group-addon">
							<i class="entypo-key"></i>
						</div>
						<input type="password" class="form-control" name="password" id="password" placeholder="PASSWORD" autocomplete="off" />
					</div>
				</div>
				<div class="form-group">
					<button type="submit" id="loginButton" class="btn btn-primary btn-block btn-login" style="text-align:center">
						<i class="entypo-login"></i>
						로그인
					</button>
				</div>
			</form>
			
			<div class="login-bottom-links" style="padding-top:20px; color:#949494">
				Copyright ⓒ by <strong>PACIFIC LINKS</strong> Company All right reserved.
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var baseurl = '';
	
	function validateLogin(event) {
		if( !$("#managerId").val() ) {
			$("#managerId").focus();
			return false;
		}		
		if( !$("#password").val() ) {
			$("#password").focus();
			return false;
		}
		$('#loginButton').attr('disabled', true);
		return true;
	}
</script>

<!-- Bottom scripts (common) -->
<script src="<%=request.getContextPath() %>/assets/js/gsap/TweenMax.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/bootstrap.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/joinable.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/resizeable.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/neon-api.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/jquery.validate.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/neon-login.js"></script>

<!-- JavaScripts initializations and stuff -->
<script src="<%=request.getContextPath() %>/assets/js/neon-custom.js"></script>

<!-- Demo Settings -->
<script src="<%=request.getContextPath() %>/assets/js/neon-demo.js"></script>


</body>
</html>