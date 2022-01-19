<%-- 
    Filename: EditProfile.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This jsp provides the user with a form to update their profile
                 details
--%>


<!DOCTYPE html>
<html>
    <jsp:include page="Head.jsp" flush="true"/>
    <jsp:useBean id="user" class="beans.UserBean" scope="session"/>
    <body>
        <jsp:include page="NavBar.jsp" flush="true">
            <jsp:param name="activePage" value="profile"/>
        </jsp:include>
        <div id="editProfile">
            <center>
                <h1>Edit Your Profile</h1>
                <form action="SaveProfile.jsp" method="POST">
                    <table class="formTable">
                        <tr>
                            <td><label>First name:</label></td>
                            <td style="text-align: right">
                                <input type="text" name="firstName"
                                       value="<%= user.getFirstName()%>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Last name:</label></td>
                            <td style="text-align: right">
                                <input type="text" name="lastName"
                                       value="<%= user.getLastName()%>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Display name:</label></td>
                            <td style="text-align: right">
                                <input type="text" name="displayName"
                                       value="<%= user.getDisplayName()%>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Email:</label></td>
                            <td style="text-align: right">
                                <input type="text" name="email"
                                       value="<%= user.getEmail()%>"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <br/><input type="submit" value="Save Changes">
                            </td>
                        </tr>
                    </table>  
                </form>
            </center>
        </div>
    </body>
</html>
