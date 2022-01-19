<%-- 
    Filename: ViewProfile.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This jsp displays the user's profile information and provides
                 a link to edit their profile
--%>

<!DOCTYPE html>
<html>
    <jsp:include page="Head.jsp" flush="true"/>
    <jsp:useBean id="user" class="beans.UserBean" scope="session"/>
    <body>
        <jsp:include page="NavBar.jsp" flush="true">
            <jsp:param name="activePage" value="profile"/>
        </jsp:include>
        <div id="profile">
            <center>
                <h1>Your Profile</h1>
                <table>
                    <tr>
                        <td><b>First name:</b></td>
                        <td><%= user.getFirstName()%></td>
                    </tr>
                    <tr>
                        <td><b>Last name:</b></td>
                        <td><%= user.getLastName()%></td>
                    </tr>
                    <tr>
                        <td><b>Display name:</b></td>
                        <td><%= user.getDisplayName()%></td>
                    </tr>
                    <tr>
                        <td><b>Email address:</b></td>
                        <td><%= user.getEmail()%></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <button><a href="EditProfile.jsp">Edit Profile</a></button>
                        </td>
                    </tr>
                </table>
            </center>
        </div>

    </body>
</html>
