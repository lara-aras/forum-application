<%-- 
    Filename: SaveNewPassword.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This jsp sends the user's resetted password to the web service
                 to be saved in the database
--%>

<!DOCTYPE html>
<html>
    <jsp:include page="Head.jsp"/>
    <jsp:useBean id="user" class="beans.UserBean" scope="session"/>
    <body>
        <div class="topnavLoggedOut">
            <!-- Empty navigation bar when not logged in -->
        </div>
        <div id="saveNewPassword">
            <center>
                <h1>Forgot Password</h1>

                <%
                    String password = request.getParameter("password");
                    String confirmPassword = request.getParameter("confirmPassword");
                    int userID = (int) session.getAttribute("userID");

                    if (password.equals(confirmPassword)) {
                        boolean passwordChangeSuccess = user.changePassword(
                                password, userID);

                        if (passwordChangeSuccess) {
                %>

                <h3>Your password has been changed. You can now 
                    <a href="MainPage.jsp?">log in</a>.</h3>
                <%
                        } else {
                            throw new Exception("Your password could not be "
                                    + "changed at this time.");
                        }

                        // Remove session attributes used in reset password process
                        session.removeAttribute("securityQuestion");
                        session.removeAttribute("securityAnswer");
                        session.removeAttribute("userID");
                    } else {
                        response.sendRedirect("ResetPassword.jsp"
                                + "?error=passwordConfirm");
                    }
                %>
            </center>
        </div>
    </body>
</html>
