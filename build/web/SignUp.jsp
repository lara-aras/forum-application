<%-- 
    Filename: SignUp.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This jsp provides the user with a form to enter their details
                 and sign up
--%>


<!DOCTYPE html>
<html>
    <jsp:include page="Head.jsp" flush="true"/>
    <body>
        <div class="topnavLoggedOut">
            <!-- Empty navigation bar when not logged in -->
        </div>
        <div id="signUp">
            <center>
                <h1>Enter Your Details</h1>
                <form action="CreateUser.jsp" method="POST">
                    <table class="formTable">
                        <tr>
                            <td><label>First name:</label></td>
                            <td>
                                <input type="text" name="firstName"/></td>
                        </tr>
                        <tr>
                            <td><label>Last name:</label></td>
                            <td>
                                <input type="text" name="lastName"/></td>
                        </tr>
                        <tr>
                            <td><label>Display name:</label></td>
                            <td>
                                <input type="text" name="displayName"/></td>
                        </tr>
                        <tr>
                            <td><label>Email:</label></td>
                            <td>
                                <input type="text" name="email"/></td>
                        </tr>
                        <tr>
                            <td><label>Password:</label></td>
                            <td>
                                <input type="password" name="password"/></td>
                        </tr>
                        <tr>
                            <td><label>Confirm password:</label></td>
                            <td>
                                <input type="password" name="confirmPassword"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Choose a security question:</label></td>
                            <td>
                                <select name="securityQuestion">
                                    <option 
                                        value="In what city were you born?">
                                        In what city were you born?</option>
                                    <option 
                                        value="What is the name of your first pet?">
                                        What is the name of your first pet?</option>
                                    <option 
                                        value="What is your mother's maiden name?">
                                        What is your mother's maiden name?
                                    </option>
                                    <option 
                                        value="What high school did you attend?">
                                        What high school did you attend?</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Enter your answer to the security 
                                    question:</label></td>
                            <td>
                                <input type="text" name="securityAnswer"/></td>
                        </tr>
                        <%
                            String errorParam = request.getParameter("error");
                            String errorMessage;

                            if (errorParam != null) {
                                switch (errorParam) {
                                    case "displayNameTaken":
                                        errorMessage = "This display name is "
                                                + "already taken.";
                                        break;
                                    case "passwordConfirm":
                                        errorMessage = "Passwords do not "
                                                + "match.";
                                        break;
                                    case "emailTaken":
                                        errorMessage = "This email address is "
                                                + "already in use.";
                                        break;
                                    case "emailInvalid":
                                        errorMessage = "Please submit a valid "
                                                + "email address";
                                        break;
                                    default:
                                        errorMessage = "";
                                }
                        %>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <em style="color:red"><%= errorMessage%>
                                </em>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <br/><input type="submit" value="Sign Up"></td>
                        </tr>
                    </table>  
                </form>
            </center>
        </div>
    </body>
</html>
