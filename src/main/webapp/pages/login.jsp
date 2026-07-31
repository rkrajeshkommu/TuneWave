<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Login | TuneWave</title>
	
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
							<h2>Welcome Back</h2>
							<p>Login to continue your music journey.</p>
						</div>
						<!-- Error Message -->
						<%
						String success = (String) session.getAttribute("success");
						
						if(success != null){
						%>
						
						<div class="alert alert-success">
						    <%= success %>
						</div>
						
						<%
						session.removeAttribute("success");
						}
						%>

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

						<form action="${pageContext.request.contextPath}/LoginController" method="post">
							
							<!-- First Row -->
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Username</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> 
												<i class="fas fa-at"></i>
											</span>
										</div>
										<input type="text" class="form-control" name="username" placeholder="Enter Username" required>
									</div>
								</div>

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
							</div>
							
							<div class="text-right mb-3">
							    <a href="#" class="login-link">
							        Forgot Password?
							    </a>
							</div>

							<button type="submit" class="btn register-btn btn-block">
								<i class="fas fa-sign-in-alt mr-2"></i> Login
							</button>

							<div class="text-center mt-4">
								<p class="mb-0 text-light">Don't have an account? 
									 <a href="${pageContext.request.contextPath}/pages/register.jsp" class="login-link">Register </a>
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