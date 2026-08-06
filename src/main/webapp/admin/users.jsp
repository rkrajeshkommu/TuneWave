<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ page import="model.User, java.util.List, dao.UserDao, dao.UserDaoInterface"%>

<%
User loggedInUser = (User) session.getAttribute("user");

if (loggedInUser == null || !"ADMIN".equalsIgnoreCase(loggedInUser.getRole())) {
	response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
	return;
}

UserDaoInterface dao = new UserDao();

List<User> users = dao.getAllUsers();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Users | TuneWave</title>
    <jsp:include page="components/head.jsp"/>
</head>

<body>
	<div class="admin-wrapper">
		<jsp:include page="components/sidebar.jsp" />
	
		<div class="main-content">
			<jsp:include page="components/header.jsp" />
			
			<div class="container-fluid mt-4">
				<div class="card">
					<div class="page-header">
						<div>
							<h2>Manage Users</h2>
							<p class="text-muted mb-0">View and manage registered users.</p>
						</div>
	
						<div class="search-box">
							<input type="text" class="form-control" placeholder="Search users...">
						</div>
						<%
						String success = (String) session.getAttribute("success");

						if (success != null) {
						%>

							<div class="alert alert-success alert-dismissible fade show">
								<%=success%>
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							</div>

						<%
							session.removeAttribute("success");
						}
						%>
					</div>
	
					<div class="card-body">
						<table class="table table-bordered table-hover">
							<thead class="thead-dark">
								<tr>
									<th>#</th>
									<th>ID</th>
									<th>Name</th>
									<th>Username</th>
									<th>Email</th>
									<th>Role</th>
									<th>Created At</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									int count = 1;
									for(User u : users) {
								%>
	
								<tr>
									<td><%=count++%></td>
									<td><%=u.getId()%></td>
									<td><%=u.getFirstname()%> <%=u.getLastname()%></td>
									<td><%=u.getUsername()%></td>
									<td><%=u.getEmail()%></td>
									<td>
										<%
											if("ADMIN".equalsIgnoreCase(u.getRole())) {
										%>
										<span class="badge badge-danger">ADMIN</span>
										<%
										 	} else {
										%>
										<span class="badge badge-success"> USER</span>
										<%
											}
										%>
									</td>
									<td><%=u.getCreatedAt()%></td>
									<td>
										<a href="${pageContext.request.contextPath}/EditUserController?id=<%=u.getId()%>" 
											class="btn btn-warning btn-sm" title="Edit User">
											
											<i class="fas fa-edit"></i>
										</a> 
										
										<a href="${pageContext.request.contextPath}/DeleteUserController?id=<%=u.getId()%>"
											class="btn btn-danger btn-sm" title="Delete User"
											onclick="return confirm('Are you sure you want to delete this user?');">

											<i class="fas fa-trash"></i>
										</a>
									</td>
								</tr>
	
								<%
									}
								%>
								
								<%
									if(users.isEmpty()){
								%>
								<tr>
									<td colspan="8" class="text-center">No users found.</td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
	
			<jsp:include page="components/footer.jsp" />
		</div>
	</div>
</body>
</html>