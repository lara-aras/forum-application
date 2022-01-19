<%-- 
    Filename: PostComment.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This jsp takes a submitted comment and sends it to the 
                 web service to save the new comment
--%>

<!DOCTYPE html>
<html>
    <jsp:include page="Head.jsp"/>
    <jsp:useBean id="topic" class="beans.TopicBean" scope="page"/>
    <jsp:useBean id="user" class="beans.UserBean" scope="session"/>
    <body>
        <%
            int topicID = Integer.parseInt(request.getParameter("topicID"));
            String text = request.getParameter("text");
            int userID = user.getUserID();
            
            boolean postSuccess = topic.postComment(topicID, text, userID);

            if (postSuccess) {
                response.sendRedirect("ViewTopic.jsp?topicID=" + topicID);
            } else {
                throw new Exception();
            }
        %>
    </body>
</html>
