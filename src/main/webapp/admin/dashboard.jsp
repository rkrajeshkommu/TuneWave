<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ page import="model.User" %>

<%
	User user = (User) session.getAttribute("user");

	if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
		response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Dashboard | TuneWave</title>
    <jsp:include page="components/head.jsp"/>
</head>
<body>

	<div class="admin-wrapper">
		<%@ include file="components/sidebar.jsp"%>

		<div class="main-content">
			<jsp:include page="components/header.jsp" />

			<div class="container-fluid mt-4">
				<div class="row">
					<div class="col-md-3">
						<div class="dashboard-card">
							<i class="fas fa-music"></i>
							<h4>Total Songs</h4>
							<h2>0</h2>
						</div>
					</div>

					<div class="col-md-3">
						<div class="dashboard-card">
							<i class="fas fa-user"></i>
							<h4>Artists</h4>
							<h2>0</h2>
						</div>
					</div>

					<div class="col-md-3">
						<div class="dashboard-card">
							<i class="fas fa-compact-disc"></i>
							<h4>Albums</h4>
							<h2>0</h2>
						</div>
					</div>

					<div class="col-md-3">
						<div class="dashboard-card">
							<i class="fas fa-users"></i>
							<h4>Users</h4>
							<h2>0</h2>
						</div>
					</div>
				</div>
			</div>
			
			<%@ include file="components/footer.jsp"%>
		</div>
	</div>
</body>
</html>