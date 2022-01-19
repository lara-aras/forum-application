
package forumclient;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the forumclient package. 
 * &lt;p&gt;An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _ChangePassword_QNAME = new QName("http://forumservice/", "changePassword");
    private final static QName _ChangePasswordResponse_QNAME = new QName("http://forumservice/", "changePasswordResponse");
    private final static QName _PostComment_QNAME = new QName("http://forumservice/", "postComment");
    private final static QName _PostCommentResponse_QNAME = new QName("http://forumservice/", "postCommentResponse");
    private final static QName _PostReply_QNAME = new QName("http://forumservice/", "postReply");
    private final static QName _PostReplyResponse_QNAME = new QName("http://forumservice/", "postReplyResponse");
    private final static QName _SayHello_QNAME = new QName("http://forumservice/", "sayHello");
    private final static QName _SayHelloResponse_QNAME = new QName("http://forumservice/", "sayHelloResponse");
    private final static QName _UpdateProfile_QNAME = new QName("http://forumservice/", "updateProfile");
    private final static QName _UpdateProfileResponse_QNAME = new QName("http://forumservice/", "updateProfileResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: forumclient
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link ChangePassword }
     * 
     */
    public ChangePassword createChangePassword() {
        return new ChangePassword();
    }

    /**
     * Create an instance of {@link ChangePasswordResponse }
     * 
     */
    public ChangePasswordResponse createChangePasswordResponse() {
        return new ChangePasswordResponse();
    }

    /**
     * Create an instance of {@link PostComment }
     * 
     */
    public PostComment createPostComment() {
        return new PostComment();
    }

    /**
     * Create an instance of {@link PostCommentResponse }
     * 
     */
    public PostCommentResponse createPostCommentResponse() {
        return new PostCommentResponse();
    }

    /**
     * Create an instance of {@link PostReply }
     * 
     */
    public PostReply createPostReply() {
        return new PostReply();
    }

    /**
     * Create an instance of {@link PostReplyResponse }
     * 
     */
    public PostReplyResponse createPostReplyResponse() {
        return new PostReplyResponse();
    }

    /**
     * Create an instance of {@link SayHello }
     * 
     */
    public SayHello createSayHello() {
        return new SayHello();
    }

    /**
     * Create an instance of {@link SayHelloResponse }
     * 
     */
    public SayHelloResponse createSayHelloResponse() {
        return new SayHelloResponse();
    }

    /**
     * Create an instance of {@link UpdateProfile }
     * 
     */
    public UpdateProfile createUpdateProfile() {
        return new UpdateProfile();
    }

    /**
     * Create an instance of {@link UpdateProfileResponse }
     * 
     */
    public UpdateProfileResponse createUpdateProfileResponse() {
        return new UpdateProfileResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ChangePassword }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ChangePassword }{@code >}
     */
    @XmlElementDecl(namespace = "http://forumservice/", name = "changePassword")
    public JAXBElement<ChangePassword> createChangePassword(ChangePassword value) {
        return new JAXBElement<ChangePassword>(_ChangePassword_QNAME, ChangePassword.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ChangePasswordResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ChangePasswordResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://forumservice/", name = "changePasswordResponse")
    public JAXBElement<ChangePasswordResponse> createChangePasswordResponse(ChangePasswordResponse value) {
        return new JAXBElement<ChangePasswordResponse>(_ChangePasswordResponse_QNAME, ChangePasswordResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link PostComment }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link PostComment }{@code >}
     */
    @XmlElementDecl(namespace = "http://forumservice/", name = "postComment")
    public JAXBElement<PostComment> createPostComment(PostComment value) {
        return new JAXBElement<PostComment>(_PostComment_QNAME, PostComment.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link PostCommentResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link PostCommentResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://forumservice/", name = "postCommentResponse")
    public JAXBElement<PostCommentResponse> createPostCommentResponse(PostCommentResponse value) {
        return new JAXBElement<PostCommentResponse>(_PostCommentResponse_QNAME, PostCommentResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link PostReply }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link PostReply }{@code >}
     */
    @XmlElementDecl(namespace = "http://forumservice/", name = "postReply")
    public JAXBElement<PostReply> createPostReply(PostReply value) {
        return new JAXBElement<PostReply>(_PostReply_QNAME, PostReply.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link PostReplyResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link PostReplyResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://forumservice/", name = "postReplyResponse")
    public JAXBElement<PostReplyResponse> createPostReplyResponse(PostReplyResponse value) {
        return new JAXBElement<PostReplyResponse>(_PostReplyResponse_QNAME, PostReplyResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SayHello }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link SayHello }{@code >}
     */
    @XmlElementDecl(namespace = "http://forumservice/", name = "sayHello")
    public JAXBElement<SayHello> createSayHello(SayHello value) {
        return new JAXBElement<SayHello>(_SayHello_QNAME, SayHello.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SayHelloResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link SayHelloResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://forumservice/", name = "sayHelloResponse")
    public JAXBElement<SayHelloResponse> createSayHelloResponse(SayHelloResponse value) {
        return new JAXBElement<SayHelloResponse>(_SayHelloResponse_QNAME, SayHelloResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdateProfile }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link UpdateProfile }{@code >}
     */
    @XmlElementDecl(namespace = "http://forumservice/", name = "updateProfile")
    public JAXBElement<UpdateProfile> createUpdateProfile(UpdateProfile value) {
        return new JAXBElement<UpdateProfile>(_UpdateProfile_QNAME, UpdateProfile.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link UpdateProfileResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link UpdateProfileResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://forumservice/", name = "updateProfileResponse")
    public JAXBElement<UpdateProfileResponse> createUpdateProfileResponse(UpdateProfileResponse value) {
        return new JAXBElement<UpdateProfileResponse>(_UpdateProfileResponse_QNAME, UpdateProfileResponse.class, null, value);
    }

}
