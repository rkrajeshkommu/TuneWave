<%@ page import="model.User" %>

<%
User loggedInUser = (User) session.getAttribute("user");
%>

<nav class="topbar">

    <h3>Dashboard</h3>

    <div class="admin-info">
        Welcome,
        <strong><%= (loggedInUser != null) ? loggedInUser.getFirstname() : "Admin" %></strong>
    </div>

</nav>