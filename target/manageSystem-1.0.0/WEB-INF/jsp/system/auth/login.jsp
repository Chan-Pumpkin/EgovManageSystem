<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"	 uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/WEB-INF/tiles/common/head.jsp"/>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Login</h3>
								</div>
								<div class="card-body">
									<div class="form-floating mb-3">
										<input class="form-control" id="email" type="email" placeholder="name@example.com" /> <label for="inputEmail">Email address</label>
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" id="password" type="password" autocomplete="off" placeholder="password" /> <label for="inputPassword">Password</label>
									</div>
									<div class="form-check mb-3">
										<input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" /> <label class="form-check-label" for="inputRememberPassword">Remember Password</label>
									</div>
									<div class="d-flex align-items-center justify-content-end mt-4 mb-0">
										<button class="btn btn-primary" onclick="fncLogin()">Login</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
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
				success: function(data) {
					console.log(data);
					if(data.result.type == 'success') {
						location.href = '<c:url value="/board/list.do"/>';
					} else if(response.result.type == 'fail') {
						alert(response.result.message);
					}
				}
			});
		}
	</script>
</body>
</html>