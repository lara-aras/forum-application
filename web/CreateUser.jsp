<%-- 
    Filename: CreateUser.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This jsp saves the form data from the sign up form to the 
                 database, sets the values for the session-scoped user bean,
                 and logs the user in
--%>

<!DOCTYPE html>
<html>
    <jsp:include page="Head.jsp"/>
    <%@page import="java.sql.*, java.util.regex.*" %>
    <jsp:useBean id="connect" class="beans.DatabaseConnectionBean" scope="session"/>
    <jsp:useBean id="user" class="beans.UserBean" scope="session"/>
    <%
        int userID = 0; // Variable used to store the auto-generated userID
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String displayName = request.getParameter("displayName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String securityQuestion = request.getParameter("securityQuestion");
        String securityAnswer = request.getParameter("securityAnswer");

        // Create connection object
        Connection conn = connect.getConnection();

        // Check if valid email entered
        Pattern emailPattern = Pattern.compile("^(.+)@(.+)$");
        Matcher matcher = emailPattern.matcher(email);

        // Check if email is not taken
        PreparedStatement emailStatement = conn.prepareStatement(
                "SELECT * FROM ForumUser WHERE email = ?");
        emailStatement.setString(1, email);
        ResultSet emailResult = emailStatement.executeQuery();

        // Check if display name is not taken
        PreparedStatement displayNameStatement = conn.prepareStatement(
                "SELECT * FROM ForumUser WHERE displayName = ?");
        displayNameStatement.setString(1, displayName);
        ResultSet displayNameResult = displayNameStatement.executeQuery();

        if (displayNameResult.next()) {
            // Display name is already taken
            response.sendRedirect("SignUp.jsp?error=displayNameTaken");
        } else if (emailResult.next()) {
            // Email address is already in use
            response.sendRedirect("SignUp.jsp?error=emailTaken");
        } else if (!password.equals(confirmPassword)) {
            // Password confirmation does not match
            response.sendRedirect("SignUp.jsp?error=passwordConfirm");
        } else if (!matcher.matches()) {
            // Email address is not valid
            response.sendRedirect("SignUp.jsp?error=emailInvalid");
        } else {
            try {
                // Create new user in database and return auto-generarated key
                PreparedStatement createUserStatement = conn.prepareStatement(
                        "INSERT INTO ForumUser(firstName, lastName, "
                        + "displayName, email, password) "
                        + "VALUES(?, ?, ?, ?, ?)",
                        new String[]{"userID"});
                createUserStatement.setString(1, firstName);
                createUserStatement.setString(2, lastName);
                createUserStatement.setString(3, displayName);
                createUserStatement.setString(4, email);
                createUserStatement.setString(5, password);

                createUserStatement.executeUpdate();
                ResultSet rs = createUserStatement.getGeneratedKeys();
                if (rs.next()) {
                    userID = rs.getInt(1);
                }

                // Create new security question in database for user
                PreparedStatement securityQStatement = conn.prepareStatement(
                        "INSERT INTO SecurityQuestion(userID, question,"
                        + "answer) VALUES(?, ?, ?)");
                securityQStatement.setInt(1, userID);
                securityQStatement.setString(2, securityQuestion);
                securityQStatement.setString(3, securityAnswer);
                securityQStatement.executeUpdate();

                // Set UserBean property values with new user values
                user.setUserID(userID);
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setDisplayName(displayName);
                user.setEmail(email);

                // Set user as logged in and redirect to main page
                user.setIsLoggedIn(true);
                response.sendRedirect("MainPage.jsp");
            } catch (SQLException sqle) {
                throw new Exception("SQLException " + sqle.getMessage());
            }
        }
    %>
</html>
