<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Register | TuneWave</title>
	
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
	
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/register.css">
</head>

<body>

	<div class="register-page">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 col-md-10">
					<div class="register-card">

						<!-- Logo -->
						<div class="text-center mb-4">
							<a href="${pageContext.request.contextPath}/index.jsp" class="logo"> 
								<i class="fas fa-music"></i> Tune<span>Wave</span>
							</a>
							<h2>Create Your Account</h2>
							<p>Join millions of music lovers today.</p>
						</div>

						<!-- Error Message -->
						<%
						String error = (String) request.getAttribute("error");
						if (error != null) {
						%>

						<div class="alert alert-danger">
							<%=error%>
						</div>

						<%
						}
						%>

						<form action="${pageContext.request.contextPath}/RegisterController" method="post">
						
							<!-- First Row -->
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>First Name</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> 
												<i class="fas fa-user"></i>
											</span>
										</div>
										<input type="text" class="form-control" name="firstname" placeholder="Enter First Name" required>
									</div>
								</div>

								<div class="form-group col-md-6">
									<label>Last Name</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> 
												<i class="fas fa-user"></i>
											</span>
										</div>
										<input type="text" class="form-control" name="lastname" placeholder="Enter Last Name" required>
									</div>
								</div>
							</div>

							<!-- Second Row -->
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Username</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> 
												<i class="fas fa-at"></i>
											</span>
										</div>
										<input type="text" class="form-control" name="username" placeholder="Choose Username" required>
									</div>
								</div>

								<div class="form-group col-md-6">
									<label>Email</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> 
												<i class="fas fa-envelope"></i>
											</span>

										</div>
										<input type="email" class="form-control" name="email" placeholder="Enter Email" required>
									</div>
								</div>
							</div>
							
							<!-- Third Row -->
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Password</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> 
												<i class="fas fa-lock"></i>
											</span>
										</div>
										<input type="password" class="form-control" name="password" placeholder="Enter Password" required>
									</div>
								</div>
								
								<div class="form-group col-md-6">
									<label>Confirm Password</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> 
												<i class="fas fa-lock"></i>
											</span>
										</div>
										<input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" required>
									</div>
								</div>
							</div>

							<button type="submit" class="btn register-btn btn-block">
								<i class="fas fa-user-plus mr-2"></i> Create Account
							</button>

							<div class="text-center mt-4">
								<p class="mb-0 text-light">Already have an account?
									 <a href="${pageContext.request.contextPath}/pages/login.jsp" class="login-link">Login </a>
								</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>