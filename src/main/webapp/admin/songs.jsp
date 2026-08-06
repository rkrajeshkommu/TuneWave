<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ page import="model.User, model.Song, java.util.List, dao.SongDao, dao.SongDaoInterface"%>

<%
User loggedInUser = (User) session.getAttribute("user");

if (loggedInUser == null || !"ADMIN".equalsIgnoreCase(loggedInUser.getRole())) {
	response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
	return;
}

SongDaoInterface dao = new SongDao();

List<Song> songs = dao.getAllSongs();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Songs | TuneWave</title>
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
							<h2>Manage Songs</h2>
							<p class="text-muted mb-0">View and manage uploaded songs.</p>
						</div>
	
						<div class="search-box">
							<input type="text" class="form-control" placeholder="Search users...">
						</div>
						<a href="${pageContext.request.contextPath}/admin/add-song.jsp" class="btn btn-primary"> 
							<i class="fas fa-plus"></i> Add Song
						</a>
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
									<th>Cover</th>
									<th>Title</th>
									<th>Artist</th>
									<th>Album</th>
									<th>Genre</th>
									<th>Uploaded On</th>
									<th>Audio</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<%
									int count = 1;
									for(Song song : songs) {
								%>
	
								<tr>
									<td><%=count++%></td>
									<td>
										<img src="${pageContext.request.contextPath}/assets/images/songs/<%=song.getCoverImage()%>"
											width="60" height="60" style="border-radius: 8px; object-fit: cover;">
									</td>
									<td><%=song.getTitle()%></td>
									<td><%=song.getArtist()%></td>
									<td><%=song.getAlbum()%></td>
									<td><%=song.getGenre()%></td>
									<td><%=song.getCreatedAt()%></td>
									<td>
										<audio controls style="width: 180px;">
											<source src="${pageContext.request.contextPath}/assets/audio/songs/<%=song.getAudioFile()%>" type="audio/mpeg">
										</audio>
									</td>
									<td>
										<a href="${pageContext.request.contextPath}/EditSongController?id=<%=song.getId()%>" class="btn btn-warning btn-sm"> 
											<i class="fas fa-edit"></i>
										</a> 
										<a href="${pageContext.request.contextPath}/DeleteSongController?id=<%=song.getId()%>" class="btn btn-danger btn-sm"
											onclick="return confirm('Are you sure you want to delete this song?')">
											<i class="fas fa-trash"></i>
										</a> 
									</td>
								</tr>
	
								<%
									}
								%>
								
								<%
									if(songs.isEmpty()){
								%>
								<tr>
									<td colspan="8" class="text-center">No songs found.</td>
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