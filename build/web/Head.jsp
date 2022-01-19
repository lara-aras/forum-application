<%-- 
    Filename: Head.jsp
    Author: Lara Aras
    Created: 16/11/2021
    Operating System: Windows 10 Enterprise
    Version: Project 1
    Description: This file will be included in all other jsp's to provide the 
                 head section of the html document, set the content type,
                 set the error page, and import the stylesheet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ForumErrorPage.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Forum Application</title>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>