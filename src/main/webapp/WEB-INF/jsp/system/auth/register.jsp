<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"	 uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:import url="/WEB-INF/tiles/common/head.jsp"/>
<meta charset="utf-8">
<title>로그인</title>
</head>

<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>
							<form class="user">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="First Name">
									</div>
									<div class="col-sm-6">
										<input type="text" class="form-control form-control-user" id="exampleLastName" placeholder="Last Name">
									</div>
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address">
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">
									</div>
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">
									</div>
								</div>
								<a href="login.html" class="btn btn-primary btn-user btn-block"> Register Account </a>
								<hr>
								<a href="index.html" class="btn btn-google btn-user btn-block"> <i class="fab fa-google fa-fw"></i> Register with Google </a> 
								<a href="index.html" class="btn btn-facebook btn-user btn-block"> <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook </a>
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="forgot-password.html">Forgot Password?</a>
							</div>
							<div class="text-center">
								<a class="small" href="login.html">Already have an account? Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<c:import url="/WEB-INF/tiles/common/script.jsp"/>
	<script>
		function fncLogin() {
			let data = {
				'email': $('#email').val(),
				'password': $('#password').val()
			};
			
			$.ajax({
				url: '<c:url value="/auth/login.do"/>',
				type: 'post',
				data: data,
				success: function(response) {
					console.log(response);
					if(response.result.type == 'success') {
						location.href = '<c:url value="/board/list.do"/>';
					} else if(response.result.type == 'fail') {
						alert(response.result.message);
					}
				},
				error: function (xhr, status, error) {
					alert("실패");
					} 
			});
		}
	</script>
</body>
</html>