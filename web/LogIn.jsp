<%-- 
    Filename: LogIn.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This jsp uses the submitted log in form values to log the user 
                 in or generate an error message if incorrect details were
                 provided
--%>

<!DOCTYPE html>
<html>
    <jsp:include page="Head.jsp"/>
    <jsp:useBean id="connect" class="beans.DatabaseConnectionBean" scope="session"/>
    <jsp:useBean id="user" class="beans.UserBean" scope="session"/>
    <%@page import="java.sql.*" %>
    <body>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Check submitted details against users in database
            PreparedStatement loginStatement = connect.getConnection().prepareStatement(
                    "SELECT * FROM ForumUser WHERE email = ? AND password = ?");
            loginStatement.setString(1, email);
            loginStatement.setString(2, password);
            ResultSet rs = loginStatement.executeQuery();

            if (rs.next()) {
                /* If login is successfull, set UserBean property values with
                   data retrieved from database */
                user.setUserID(rs.getInt("userID"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setDisplayName(rs.getString("displayName"));
                user.setEmail(rs.getString("email"));

                // Set user as logged in and redirect to main page
                user.setIsLoggedIn(true);
                response.sendRedirect("MainPage.jsp");
            } else {
                // Redirect to show login failure message
                response.sendRedirect("MainPage.jsp?loginSuccess=false");
            }
        %>
    </body>
</html>
