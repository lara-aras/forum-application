<%-- 
    Filename: ViewTopic.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This jsp displays a topic with its description and all comments
                 and replies, with input fields to post new comments and replies
--%> 

<!DOCTYPE html>
<html>
    <%@page import="java.util.*" %>
    <jsp:include page="Head.jsp" flush="true"/>
    <jsp:useBean id="user" class="beans.UserBean" scope="session"/>
    <jsp:useBean id="topic" class="beans.TopicBean" scope="page"/>
    <body>
        <jsp:include page="NavBar.jsp" flush="true">
            <jsp:param name="activePage" value="main"/>
        </jsp:include>

        <%
            // Send ID of topic to page scoped TopicBean to set values
            String topicID = request.getParameter("topicID");
            topic.viewTopic(topicID);
        %>

        <div id="viewTopic">
            <center>
                <h1><%= topic.getTitle()%></h1>
                <h4><%= topic.getDescription()%></h4>

                <table class="topicTable">
                    <tr>
                        <td class="newCommentForm" colspan="3">
                            <form action="PostComment.jsp" method="POST">
                                <input type="text" name="text"/>
                                <input type="hidden" name="topicID" value="<%= topicID%>"/>
                                <input type="submit" value="Comment">
                            </form>
                        </td>
                    </tr>
                    <%
                        for (Object comment : topic.getCommentsAndReplies().entrySet()) {
                            Map.Entry<String, HashMap> commentMap
                                    = (Map.Entry<String, HashMap>) comment;
                            String commentID = (String) commentMap.getKey();
                            HashMap commentDetails
                                    = (HashMap) commentMap.getValue();
                    %>
                    <tr class="commentRow">
                        <td class="commentDisplayNameCell">
                            <em><%= commentDetails.get("displayName")%></em>
                        </td>
                        <td class="textCell" colspan="2">
                            <%= commentDetails.get("text")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp; <!-- empty cell to indent input field  -->
                        </td>
                        <td class="newReplyForm" colspan="2">
                            <form action="PostReply.jsp" method="POST">
                                <input type="text" name="text"/>
                                <input type="hidden" name="topicID" value="<%= topicID%>"/>
                                <input type="hidden" name="commentID" value="<%= commentID%>"/>
                                <input type="submit" value="Comment">
                            </form>
                        </td>
                    </tr>
                    <%
                        HashMap commentReplies = (HashMap) commentDetails.get("replies");

                        for (Object reply : commentReplies.entrySet()) {
                            Map.Entry<String, HashMap> replyMap
                                    = (Map.Entry<String, HashMap>) reply;
                            HashMap replyDetails
                                    = (HashMap) replyMap.getValue();
                    %>
                    <tr class="replyRow">
                        <td>
                            &nbsp; <!-- empty cell to indent replies  -->
                        </td>
                        <td class="replyDisplayNameCell">
                            &rarr;&nbsp;&nbsp;
                            <em><%= replyDetails.get("displayName")%></em>
                        </td>
                        <td class="textCell">
                            <%= replyDetails.get("text")%>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </table>
            </center>
        </div>
    </body>
</html>
