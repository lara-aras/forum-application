<%-- 
    Filename: NavBar.jsp
    Author: Lara Aras
    Created: 16/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This file will be included in all other jsp's where the user
                 will be logged in to provide a navigation bar
--%>

<div class="topnav">
    <a class="<%= request.getParameter("activePage").equals("main") ? "active" : ""%>" 
       href="MainPage.jsp">Forum</a>
    <a class="<%= request.getParameter("activePage").equals("profile") ? "active" : ""%>"
       href="ViewProfile.jsp">Profile</a>
    <a href="LogOut.jsp">Log Out</a>
</div>
