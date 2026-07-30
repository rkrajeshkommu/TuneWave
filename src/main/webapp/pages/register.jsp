<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>User Registration</title>
	</head>
	<body>
		<%
			String error = (String) request.getAttribute("error");
		
			if (error != null) {
		%>
	
			<p style="color: red; font-weight: bold;">
				<%=error%>
			</p>
	
		<%
			}
		%>
	<form name="registration" action="../RegisterController" method="post">
			<label>First Name</label> 
			<input type="text"  name="firstname" id="firstname" placeholder="Enter First Name" required>
			<br>
			<label>Last Name</label> 
			<input type="text" name="lastname" id="lastname" placeholder="Enter Last Name" required>
			<br>
			<label>Username</label> 
			<input type="text" name="username" id="username" placeholder="Enter Username" required>
			<br>
			<label>Email</label> 
			<input type="email" name="email" id="email" placeholder="Enter Email" required>
			<br>
			<label>Password</label> 
			<input type="password" name="password" id="password" placeholder="Enter Password" required>
			<br>
			<label>Confirm Password</label> 
			<input type="password" name="confirmPassword" id="confirmPassword" placeholder="Enter Password" required>
			<br>
			<button type="submit">Register</button>
			
			<p>Already have an account?
			    <a href="login.jsp">Login</a>
			</p>
		</form>
	</body>
</html> 