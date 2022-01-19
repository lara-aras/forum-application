<%-- 
    Filename: ResetPassword.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This jsp provides the user with a form to reset their password
--%>


<!DOCTYPE html>
<html>
    <jsp:include page="Head.jsp"/>
    <jsp:useBean id="connect" class="beans.DatabaseConnectionBean" scope="session"/>
    <body>
        <div class="topnavLoggedOut">
            <!-- Empty navigation bar when not logged in -->
        </div>
        <div>
            <center>
                <%
                    String submittedAnswer;

                    if (request.getParameter("answer") != null) {
                        submittedAnswer = request.getParameter("answer");

                        /* Save submitted answer in session in case of password 
                           confirmation error */
                        session.setAttribute("submittedSecurityAnswer",
                                submittedAnswer);
                    } else {
                        submittedAnswer = (String) session.getAttribute(
                                "submittedSecurityAnswer");
                    }

                    // Check if answer to security question was correct
                    if (submittedAnswer.equals(
                            (String) session.getAttribute("securityAnswer"))) {
                %>

                <h1>Forgot Password</h1>
                <form action="SaveNewPassword.jsp" method="POST">
                    <table class="formTable">
                        <tr>
                            <td><label>New Password:</label></td>
                            <td>
                                <input type="password" name="password"/></td>
                        </tr>
                        <tr>
                            <td><label>Confirm Password:</label></td>
                            <td>
                                <input type="password" name="confirmPassword"/></td>
                        </tr>
                        <%
                            /* Redirect back to this page from 
                               SaveNewPassword.jsp with error parameter to 
                               display error message if the provided passwords
                               do not match. */
                            String errorParam = request.getParameter("error");

                            if (errorParam != null
                                    && errorParam.equals("passwordConfirm")) {
                        %>
                        <tr>
                            <td class="centerCell" colspan="2">
                                <em class="errorMessage">
                                    Passwords do not match.
                                </em>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td class="centerCell" colspan="2">
                                <br/><input type="submit" value="Submit"></td>
                        </tr>
                    </table>  
                </form>
                <%
                    } else {
                        response.sendRedirect("AnswerSecurityQuestion.jsp"
                                + "?error=incorrectAnswer");
                    }
                %>
            </center>
        </div>
    </body>
</html>
