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
							
							<form id="userForm" name="userForm" method="POST" action="<c:url value="/auth/insert.do"/>">
								<div class="form-group">
								<input type="text" class="form-control" id="name" name="name" placeholder="Name" value="${user.name}">
								</div>
								<div class="form-group">
								<input type="email" class="form-control" id="email" name="email" placeholder="Email Address" value="${user.email}">
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control" id="password" name="password" placeholder="Password" value="${user.password}">
									</div>
									<!-- 
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">
									</div>
									 -->
								</div>
							</form>
							<div class="d-grid">
							<button type="submit" onclick="fncInsertRegister()" class="btn btn-primary"> Register Account </button>
							</div>
							<div class="text-center">
								<br>
								<a class="medium" href="login.do">Already have an account? Login!</a>
							</div>
							<br><br><br>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<c:import url="/WEB-INF/tiles/common/script.jsp"/>
	<script>
		/* 등록  */
		function fncInsertRegister(){
			let data = $("#userForm").serialize(); 
			/* 
			let data = {
				'name': $('#name').val(),
				'email': $('#email').val(),
				'password': $('#password').val()
			};
			 */
			$.ajax({
				url: '<c:url value="/auth/insert.do"/>',
				method: "post",
				data : data,
				success : function(response){
					if(response.result == 'success'){
						alert("등록되었습니다.");
						location.href = '<c:url value="/auth/login.do"/>';
					}else{
						alert(response.result);
					}
				},
			});
		}
	</script>
</body>
</html>