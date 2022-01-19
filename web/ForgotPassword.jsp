<%-- 
    Filename: ForgotPassword.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This jsp provides the user with a form to enter their email
                 address so that they can reset their password
--%>

<!DOCTYPE html>
<html>
    <jsp:include page="Head.jsp"/>
    <body>
        <div class="topnavLoggedOut">
            <!-- Empty navigation bar when not logged in -->
        </div>
        <div id="forgotPassword">
            <center>
                <h1>Forgot Password</h1>
                <form action="AnswerSecurityQuestion.jsp" method="POST">
                    <table  class="formTable">
                        <tr>
                            <td><label>Enter your email address:</label></td>
                            <td>
                                <input type="text" name="email"/></td>
                        </tr>
                        <%
                            /* Redirect back to this page from 
                               AnswerSecurityQuestion.jsp with error parameter
                               to display error message if email is not found
                               in the database. */
                            String errorParam = request.getParameter("error");

                            if (errorParam != null
                                    && errorParam.equals("invalidEmail")) {
                        %>
                        <tr>
                            <td class="centerCell" colspan="2">
                                <em class="errorMessage">
                                    Could not find an account associated with 
                                    the submitted email address.
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
