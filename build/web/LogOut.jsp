<%-- 
    Filename: LogOut.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This jsp clears the user's session and logs them out
--%>

<!DOCTYPE html>
<html>
    <jsp:include page="Head.jsp" flush="true"/>
    <jsp:useBean id="user" class="beans.UserBean" scope="session"/>
    <body>
        <div class="topnavLoggedOut">
            <!-- Empty navigation bar when not logged in -->
        </div>
        <%
            // Delete session of logged out user
            session.invalidate();
        %>
        <div id="logOut">
            <center>
                <h1>See you next time!</h1>
                <a href="MainPage.jsp">Log in again</a>
            </center>
        </div>
    </body>
</html>
