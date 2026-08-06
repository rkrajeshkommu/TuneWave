<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Song | TuneWave</title>
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
						<h2>Add Song</h2>
					</div>

					<div class="card-body">
						<form action="${pageContext.request.contextPath}/AddSongController" method="post" enctype="multipart/form-data">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Song Title</label> 
									<input type="text" class="form-control" name="title" required>
								</div>
						
								<div class="form-group col-md-6">
									<label>Artist</label> 
									<input type="text" class="form-control" name="artist" required>
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Album</label> 
									<input type="text" class="form-control" name="album">
								</div>
						
								<div class="form-group col-md-6">
									<label>Genre</label> 
									<input type="text" class="form-control" name="genre">
								</div>
							</div>
						
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Cover Image</label> 
									<input type="file" class="form-control" name="coverImage" accept=".jpg,.jpeg,.png,.webp" required>
								</div>
								
								<div class="form-group col-md-6">
									<label>Audio File</label> 
									<input type="file" class="form-control" name="audioFile" accept=".mp3" required>
								</div>
							</div>
							
							<div class="mt-4">
								<button type="submit" class="btn btn-primary">
									<i class="fas fa-save mr-2"></i>Upload Song
								</button>
								<a href="${pageContext.request.contextPath}/admin/songs.jsp" class="btn btn-secondary"> Cancel </a>
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