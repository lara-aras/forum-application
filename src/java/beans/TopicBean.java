/*
 * Filename: TopicBean.java
 * Author: Lara Aras
 * Created: 15/11/2021
 * Operating System: Windows 10 Enterprise
 * Version: Project 1
 * Description: This file contains the bean that stores information about a 
 *              topic being viewed, fetches all topics from the database
 *              for the home page, and connects to the web service to save
 *              comments and replies to the database
 */
package beans;

import java.io.*;
import java.util.*;
import java.sql.*;

/**
 * Stores page-scoped information about a topic being viewed, returns all topics
 * for the home page, and connects to the web service to save comments and
 * replies to the database
 *
 * @author Lara Aras
 */
public class TopicBean implements Serializable {

    private String title;
    private String description;
    private HashMap<String, HashMap> commentsReplies;
    private forumclient.ForumService webServicePort;

    /**
     * Version: Project 1
     * <p>
     * Date: 17/11/2021
     * <p>
     * Bean's constructor
     * 
     * @author Lara Aras
     */
    public TopicBean() {
        getWebServicePort();
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 17/11/2021
     * <p>
     * Fetches the port for the web service to be used by other methods
     *
     * @author Lara Aras
     */
    private void getWebServicePort() {
        forumclient.ForumService_Service service = new forumclient.ForumService_Service();
        webServicePort = service.getForumServicePort();
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 17/11/2021
     * <p>
     * Fetches all topics from the database for the home page
     *
     * @return HashMap<String, HashMap>
     * @author Lara Aras
     */
    public HashMap<String, HashMap> getAllTopics() {
        DatabaseConnectionBean connect = new DatabaseConnectionBean();
        HashMap<String, HashMap> topics = new HashMap<>();

        try {
            PreparedStatement topicsStatement = connect.getConnection()
                    .prepareStatement("SELECT * FROM Topic");
            ResultSet rs = topicsStatement.executeQuery();

            while (rs.next()) {
                HashMap<String, String> topicDetails = new HashMap<>();
                topicDetails.put("title", rs.getString("title"));
                topicDetails.put("description", rs.getString("description"));
                topics.put(rs.getString("topicID"), topicDetails);
            }
        } catch (SQLException e) {
        }

        return topics;
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 18/11/2021
     * <p>
     * Fetches information about a topic being viewed along with all comments
     * and replies made on the topic, and sets the bean values for the topic
     *
     * @param topicID
     */
    public void viewTopic(String topicID) {
        DatabaseConnectionBean connect = new DatabaseConnectionBean();
        commentsReplies = new HashMap<>();

        try {
            // Get topic information
            PreparedStatement topicStatement = connect.getConnection()
                    .prepareStatement("SELECT * FROM Topic WHERE topicID = ?");
            topicStatement.setString(1, topicID);
            ResultSet topicSet = topicStatement.executeQuery();

            while (topicSet.next()) {
                title = topicSet.getString("title");
                description = topicSet.getString("description");
            }

            // Get comments and replies
            PreparedStatement commentsStatement = connect.getConnection()
                    .prepareStatement("SELECT commentID, text, displayName "
                            + "FROM Comment JOIN ForumUser ON "
                            + "ForumUser.userID = Comment.userID "
                            + "WHERE Comment.topicID = ?");

            PreparedStatement repliesStatement = connect.getConnection()
                    .prepareStatement("SELECT replyID, text, displayName "
                            + "FROM Reply JOIN ForumUser "
                            + "ON ForumUser.userID = Reply.userID "
                            + "WHERE Reply.commentID = ?");

            commentsStatement.setString(1, topicID);
            ResultSet commentsSet = commentsStatement.executeQuery();

            while (commentsSet.next()) {
                String commentID = commentsSet.getString("commentID");

                HashMap commentDetails = new HashMap();
                commentDetails.put("text", commentsSet.getString("text"));
                commentDetails.put("displayName",
                        commentsSet.getString("displayName"));

                // Get replies for comment
                HashMap<String, HashMap> replies = new HashMap<>();
                repliesStatement.setString(1, commentID);
                ResultSet repliesSet = repliesStatement.executeQuery();

                while (repliesSet.next()) {
                    HashMap<String, String> replyDetails = new HashMap<>();
                    replyDetails.put("text", repliesSet.getString("text"));
                    replyDetails.put("displayName",
                            repliesSet.getString("displayName"));

                    replies.put(repliesSet.getString("replyID"), replyDetails);
                }

                commentDetails.put("replies", replies);

                commentsReplies.put(commentID, commentDetails);
            }
        } catch (SQLException e) {
        }
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 18/11/2021
     * <p>
     * Connects to the web service to save a new comment to the database
     *
     * @param topicID
     * @param text
     * @param userID
     * @return boolean
     * @author Lara Aras
     */
    public boolean postComment(int topicID, String text, int userID) {
        return webServicePort.postComment(topicID, text, userID);
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 18/11/2021
     * <p>
     * Connects to the web service to save a new reply to the database
     *
     * @param commentID
     * @param text
     * @param userID
     * @return boolean
     * @author Lara Aras
     */
    public boolean postReply(int commentID, String text, int userID) {
        return webServicePort.postReply(commentID, text, userID);
    }

    /*====== Attribute getters ======*/
    /**
     * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Get the topic's title
     *
     * @return String
     * @author Lara Aras
     */
    public String getTitle() {
        return this.title;
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Get the topic's description
     *
     * @return String
     * @author Lara Aras
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Get the topic's comments and replies
     *
     * @return HashMap
     * @author Lara Aras
     */
    public HashMap getCommentsAndReplies() {
        return this.commentsReplies;
    }
}
