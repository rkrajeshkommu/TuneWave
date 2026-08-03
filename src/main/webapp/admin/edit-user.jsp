<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ page import="model.User"%>

<%
	User loggedInUser = (User) session.getAttribute("user");
	
	if (loggedInUser == null || !"ADMIN".equalsIgnoreCase(loggedInUser.getRole())) {
	    response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
	    return;
	}
	
	User user = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Edit User | TuneWave</title>
<jsp:include page="components/head.jsp" />
</head>

<body>

	<div class="admin-wrapper">
		<jsp:include page="components/sidebar.jsp" />

		<div class="main-content">
			<jsp:include page="components/header.jsp" />

			<div class="container-fluid mt-4">
				<div class="card">
					<div class="page-header">
						<h2>Edit User</h2>
					</div>

					<div class="card-body">
						<form action="${pageContext.request.contextPath}/EditUserController" method="post">

							<!-- Hidden ID -->
							<input type="hidden" name="id" value="<%= user.getId() %>">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label>First Name</label> 
									<input type="text" class="form-control" name="firstname" value="<%= user.getFirstname() %>" required>
								</div>

								<div class="form-group col-md-6">
									<label>Last Name</label> 
									<input type="text" class="form-control" name="lastname" value="<%= user.getLastname() %>" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Username</label> 
									<input type="text" class="form-control" name="username" value="<%= user.getUsername() %>" required>
								</div>

								<div class="form-group col-md-6">
									<label>Email</label> 
									<input type="email" class="form-control" name="email" value="<%= user.getEmail() %>" required>
								</div>
							</div>

							<div class="form-group">
								<label>Role</label> 
								<select class="form-control" name="role">
									<option value="ADMIN" <%= "ADMIN".equalsIgnoreCase(user.getRole()) ? "selected" : "" %>> ADMIN </option>
									<option value="USER" <%= "USER".equalsIgnoreCase(user.getRole()) ? "selected" : "" %>> USER </option>
								</select>
							</div>

							<div class="mt-4">
								<button type="submit" class="btn btn-primary">
									<i class="fas fa-save mr-2"></i> Update User
								</button>
								<a href="${pageContext.request.contextPath}/admin/users.jsp" class="btn btn-secondary"> Cancel </a>
							</div>
						</form>
					</div>
				</div>
			</div>

			<jsp:include page="components/footer.jsp" />
		</div>
	</div>
</body>
</html>