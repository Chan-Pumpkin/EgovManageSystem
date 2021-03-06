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
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
									</div>
									<!-- <form class="user"> -->
										<div class="form-group">
											<input type="email" class="form-control form-control-user" name="email" id="email" aria-describedby="emailHelp" placeholder="name@example.com">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user" name="password" id="password" autocomplete="off" placeholder="Password">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"id="customCheck"> 
												<label class="custom-control-label" for="customCheck">Remember Me</label>
											</div>
										</div>
										<button class="btn btn-primary btn-user btn-block" type="button" onclick="fncLogin()"> Login </button>
									<!-- </form> -->
									<div class="text-center">
										<br><br>
										<a class="medium" href="/manageSystem/auth/register.do">Create an Account!</a>
									</div>
									<br><br><br>
								</div>
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