/*
 * Filename: UserBean.java
 * Author: Lara Aras
 * Created: 15/11/2021
 * Operating System: Windows 10 Enterprise
 * Version: Project 1
 * Description: This file contains the bean that stores user information for 
 *              the duration of the user's session, and connects to the web 
 *              service to greet the user, change the user's password, and 
 *              update the user's password
 */
package beans;

import java.io.*;

/**
 *
 * Stores session-scoped user information for the logged in user, and connects
 * to the web service to greet the user, change the user's password, and update
 * the user's password
 *
 * @author Lara Aras
 */
public class UserBean implements Serializable {

    private boolean isLoggedIn = false; // default value for start of application
    private int userID;
    private String firstName;
    private String lastName;
    private String displayName;
    private String email;
    private forumclient.ForumService webServicePort;

    /**
     * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Bean's constructor
     *
     * @author Lara Aras
     */
    public UserBean() {
        getWebServicePort();
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>Fetches the port for the web service to be used by other methods
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
     * Date: 15/11/2021
     * <p>
     * Fetches a string from the web service to greet the user on the home page
     *
     * @return String
     */
    public String sayHello() {
        return webServicePort.sayHello(firstName);
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 16/11/2021
     * <p>
     * Connects to the web service to change a user's password
     *
     * @param newPassword
     * @param userID
     * @return boolean
     * @author Lara Aras
     */
    public boolean changePassword(String newPassword, int userID) {
        return webServicePort.changePassword(newPassword, userID);
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 16/11/2021
     * <p>
     * Connects to the web service to update a user's password, and saves the
     * new values to the bean values
     *
     * @param firstName
     * @param lastName
     * @param displayName
     * @param email
     * @return boolean
     * @author Lara Aras
     */
    public boolean updateProfile(String firstName, String lastName,
            String displayName, String email) {
        boolean updateSuccess = webServicePort.updateProfile(firstName,
                lastName, displayName, email, userID);

        if (updateSuccess) {
            this.firstName = firstName;
            this.lastName = lastName;
            this.displayName = displayName;
            this.email = email;
        }

        return updateSuccess;
    }

    /*====== Attribute setters and getters ======*/
    /**
     * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Sets a variable to determine if the user is logged in or not
     *
     * @param isLoggedIn
     * @author Lara Aras
     */
    public void setIsLoggedIn(boolean isLoggedIn) {
        this.isLoggedIn = isLoggedIn;
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Sets the user's ID
     *
     * @param userID
     * @author Lara Aras
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Sets the user's first name
     *
     * @param firstName
     * @author Lara Aras
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Sets the user's last name
     *
     * @param lastName
     * @author Lara Aras
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Sets the user's display name
     *
     * @param displayName
     * @author Lara Aras
     */
    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Sets the user's email
     *
     * @param email
     * @author Lara Aras
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Gets the variable that determines if the user is logged in
     *
     * @return boolean
     * @author Lara Aras
     */
    public boolean isLoggedIn() {
        return isLoggedIn;
    }

    /**
     * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Gets the user's ID
     *
     * @return int
     * @author Lara Aras
     */
    public int getUserID() {
        return userID;
    }

     /**
      * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Gets the user's first name
     *
     * @return String
     * @author Lara Aras
     */
    public String getFirstName() {
        return firstName;
    }

     /**
      * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Gets the user's last name
     *
     * @return String
     * @author Lara Aras
     */
    public String getLastName() {
        return lastName;
    }

     /**
      * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Gets the user's display name
     *
     * @return String
     * @author Lara Aras
     */
    public String getDisplayName() {
        return displayName;
    }

     /**
      * Version: Project 1
     * <p>
     * Date: 15/11/2021
     * <p>
     * Gets the user's email
     *
     * @return String
     * @author Lara Aras
     */
    public String getEmail() {
        return email;
    }
}
