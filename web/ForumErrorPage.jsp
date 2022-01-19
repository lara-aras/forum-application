<%-- 
    Filename: ForumErrorPage.jsp
    Author: Lara Aras
    Created: 15/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This page acts as the error page for all JSP pages in the 
                 application.
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forum Application</title>
        <link rel="stylesheet" type="text/css" href="WEB-INF/css/main.css"/>
    </head>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ page isErrorPage="true" %> 
    <body>
        <jsp:include page="NavBar.jsp" flush="true"/>
    <center>
        <h2>The following error has occurred:</h2>
        <h3><%= exception.getMessage()%></h3>
        <h4>
            Please contact the <a href="m5xkxpfg8@vossie.net">webmaster</a>
        </h4>
    </center>
</body>
</html>
