<%-- 
    Filename: AnswerSecurityQuestion.jsp
    Author: Lara Aras
    Created: 16/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This jsp provides the user with a form to fill answer their
                 security question when resetting their password
--%>

<!DOCTYPE html>
<html>
    <jsp:include page="Head.jsp"/>
    <%@page import="java.sql.*" %>
    <jsp:useBean id="connect" class="beans.DatabaseConnectionBean" scope="session"/>
    <body>
        <div class="topnavLoggedOut">
            <!-- Empty navigation bar when not logged in -->
        </div>
        <div id="answerSecurityQuestion">
            <center>
                <%
                    String securityQuestion = "";
                    String securityAnswer = "";

                    /* If this page is being accessed for the first time, the
                       security question and userID will not have been saved as
                       session attributes yet.
                       If it is being accessed a second time, the wrong answer 
                       was submitted, and the data saved in the session 
                       variable will be used to avoid another database call. */
                    if (session.getAttribute("securityQuestion") == null
                            || (int) session.getAttribute("userID") == 0) {
                        Connection conn = connect.getConnection();
                        String email = request.getParameter("email");
                        int userID = 0;

                        /* Use the submitted email address to retrieve the 
                           user's security question and answer. */
                        PreparedStatement emailStatement = conn.prepareStatement(
                                "SELECT userID FROM ForumUser WHERE email = ?");
                        emailStatement.setString(1, email);
                        ResultSet emailResult = emailStatement.executeQuery();

                        if (emailResult.next()) {
                            userID = emailResult.getInt("userID");
                        } else {
                            response.sendRedirect("ForgotPassword.jsp"
                                    + "?error=invalidEmail");
                        }

                        PreparedStatement securityQStatement = conn.prepareStatement(
                                "SELECT question, answer FROM SecurityQuestion "
                                + "WHERE userID = ?");
                        securityQStatement.setInt(1, userID);
                        ResultSet securityQResult = securityQStatement.executeQuery();

                        if (securityQResult.next()) {
                            securityQuestion = securityQResult.getString("question");
                            securityAnswer = securityQResult.getString("answer");
                        }

                        // Add security question, answer, and userID to session variable
                        session.setAttribute("securityQuestion", securityQuestion);
                        session.setAttribute("securityAnswer", securityAnswer);
                        session.setAttribute("userID", userID);
                    } else {
                        securityQuestion = (String) session.getAttribute("securityQuestion");
                        securityAnswer = (String) session.getAttribute("securityAnswer");
                    }
                %>

                <h1>Forgot Password</h1>
                <h4>Please provide the answer to your security question in order 
                    to reset your password.</h3>
                <form action="ResetPassword.jsp" method="POST">
                    <table class="formTable">
                        <tr>
                            <td><label><%= securityQuestion%></label></td>
                            <td class="rightCell">
                                <input type="text" name="answer"/></td>
                        </tr>
                        <%
                            /* Redirect back to this page from 
                               ResetPassword.jsp with error parameter to 
                               display error message if the incorrect answer
                               was provided. */
                            String errorParam = request.getParameter("error");

                            if (errorParam != null
                                    && errorParam.equals("incorrectAnswer")) {
                        %>
                        <tr>
                            <td class="centerCell" colspan="2">
                                <em class="errorMessage">
                                    The answer you provided was incorrect.
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
            </center>
        </div>
    </body>
</html>
