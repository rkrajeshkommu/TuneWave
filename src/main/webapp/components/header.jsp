<%@ page import="model.User"%>

<%
User user = (User) session.getAttribute("user");
%>
<nav class="navbar navbar-expand-lg fixed-top custom-navbar">
    <div class="container">

        <!-- Logo -->
        <a class="navbar-brand logo" href="index.jsp">
            <i class="fas fa-music"></i> Tune<span>Wave</span>
        </a>

        <!-- Toggle Button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>

        <!-- Menu -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#hero">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#trending">Browse</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#artists">Artists</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#albums">Albums</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#contact">Contact</a>
                </li>
            </ul>

			<div class="nav-buttons">

				<%
				if(user == null) {
				%>

				<a href="${pageContext.request.contextPath}/pages/login.jsp" class="btn btn-login"> Login </a> 
				<a href="${pageContext.request.contextPath}/pages/register.jsp" class="btn btn-register"> Register </a>

				<%
				} else {
				%>

				<span class="text-white mr-3"> 
					<a class="btn btn-login"><i class="fas fa-user-circle"></i>
					<%= user.getFirstname() %></a>	
				</span> 
				<a href="${pageContext.request.contextPath}/LogoutController" class="btn btn-register"> Logout </a>

				<%
				}
				%>

			</div>
		</div>
    </div>
</nav>