<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Song"%>
<%
Song song = (Song) request.getAttribute("song");
if (song == null) {
	response.sendRedirect(request.getContextPath() + "/admin/songs.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Song | TuneWave</title>
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
						<h2>Edit Song</h2>
					</div>

					<div class="card-body">
						<form action="${pageContext.request.contextPath}/EditSongController" method="post" enctype="multipart/form-data">

							<input type="hidden" name="id" value="<%=song.getId()%>">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Song Title</label> 
									<input type="text" name="title" value="<%=song.getTitle()%>" class="form-control" required>
								</div>
	
								<div class="form-group col-md-6">
									<label>Artist</label> 
									<input type="text" name="artist" value="<%=song.getArtist()%>" class="form-control" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Album</label> 
									<input type="text" name="album" value="<%=song.getAlbum()%>" class="form-control">
								</div>

								<div class="form-group col-md-6">
									<label>Genre</label> 
									<input type="text" name="genre" value="<%=song.getGenre()%>" class="form-control">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Current Cover</label><br> 
									<img src="${pageContext.request.contextPath}/assets/images/songs/<%= song.getCoverImage() %>" width="120" class="mb-2"> 
									<input type="hidden" name="oldCoverImage" value="<%=song.getCoverImage()%>">
									<input type="file" name="coverImage" class="form-control">
								</div>
	
								<div class="form-group col-md-6">
									<label>Current Audio</label><br>
									<audio controls style="width: 250px;margin-top: 33px;margin-bottom: 33px;">
										<source src="${pageContext.request.contextPath}/assets/audio/songs/<%= song.getAudioFile() %>" type="audio/mpeg">
									</audio>
									<input type="hidden" name="oldAudioFile" value="<%=song.getAudioFile()%>"> 
									<input type="file" name="audioFile" class="form-control">
								</div>
							</div>

							<div class="mt-4">
								<button type="submit" class="btn btn-primary">
									<i class="fas fa-save mr-2"></i>Update Song
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