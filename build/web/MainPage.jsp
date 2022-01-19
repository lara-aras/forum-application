<%-- 
    Filename: MainPage.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This is the main page of the application where users will be
                 redirected to after logging in, and where all forum topics are
                 displayed.
--%>

<!DOCTYPE html>
<html>
    <%@page import="java.util.*" %>
    <jsp:include page="Head.jsp" flush="true"/>
    <jsp:useBean id="user" class="beans.UserBean" scope="session"/>
    <jsp:useBean id="topics" class="beans.TopicBean" scope="page"/>
    <body>

        <%
            boolean isLoggedIn = user.isLoggedIn();
            String loginSuccess = request.getParameter("loginSuccess");

            if (!isLoggedIn) {
        %>
        <div class="topnavLoggedOut">
            <!-- Empty navigation bar when not logged in -->
        </div>
        <div id="mainPage">
            <center>
                <h1>Log In</h1>
                <form action="LogIn.jsp" method="POST">
                    <table class="formTable">
                        <tr>
                            <td><label>Email:</label></td>
                            <td><input type="text" name="email"/></td>
                        </tr>
                        <tr>
                            <td><label>Password:</label></td>
                            <td><input type="password" name="password"/></td>
                        </tr>
                        <%
                            if (loginSuccess != null
                                    && loginSuccess.equals("false")) {
                        %>
                        <tr>
                            <td class="centerCell" colspan="2">
                                <em class="errorMessage">Invalid login credentials.
                                </em>   
                            </td>
                        </tr>
                        <tr>
                            <td class="centerCell" colspan="2">
                                <a href="ForgotPassword.jsp">Forgot password?</a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td class="centerCell" colspan="2">
                                <input type="submit" value="Log In"></td>
                        </tr>
                        <tr>
                            <td class="centerCell" colspan="2">
                                <a href="SignUp.jsp">Or sign up!</a>
                            </td>
                        </tr>
                    </table>  
                </form>
            </center>
        </div>

        <%
        } else {
        %>

        <jsp:include page="NavBar.jsp" flush="true">
            <jsp:param name="activePage" value="main"/>
        </jsp:include>
        <div id="mainPage">
            <center>
                <h1> <%= user.sayHello()%>!</h1>
                <table class="topicsTable">
                    <%
                        HashMap allTopics = topics.getAllTopics();

                        for (Object entry : allTopics.entrySet()) {
                            Map.Entry<String, HashMap> entryMap
                                    = (Map.Entry<String, HashMap>) entry;
                            String topicID = (String) entryMap.getKey();
                            HashMap topicDetails
                                    = (HashMap<String, String>) entryMap.getValue();

                            String topicLink = "ViewTopic.jsp?topicID=" + topicID;
                    %>
                    <tr>
                        <td>
                            <h3><a href="<%= topicLink%>">
                                    <%= topicDetails.get("title")%>
                                </a></h3>
                            <p><%= topicDetails.get("description")%></p>    
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </center>
        </div>

        <%
            }
        %>

    </body>
</html>
