<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | TuneWave</title>
    
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
	
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"	rel="stylesheet">
	
	<!-- Admin CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin.css">
</head>
<body>

	<div class="admin-wrapper">

		<%@ include file="components/sidebar.jsp"%>

		<div class="main-content">

			<%@ include file="components/header.jsp"%>

			
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