<%-- 
    Filename: SaveProfile.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This jsp sends the user's updatedprofile information to the 
                 web service to be saved in the database
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="Head.jsp"/>
    <jsp:useBean id="user" class="beans.UserBean" scope="session"/>
    <%
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String displayName = request.getParameter("displayName");
        String email = request.getParameter("email");

        boolean updateSuccess = user.updateProfile(firstName, lastName,
                displayName, email);

        if (updateSuccess) {
            response.sendRedirect("ViewProfile.jsp");
        } else {
            throw new Exception("Your password could not be "
                    + "changed at this time.");
        }
    %>
</html>
