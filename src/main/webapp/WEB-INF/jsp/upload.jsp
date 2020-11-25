<%-- 
    Document   : upload
    Created on : Oct 25, 2020, 10:14:39 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        <h2>Upload a file...</h2>
        <mvc:form action="uploadFile" method="POST" enctype="multipart/form-data"
                  modelAttribute="image" >
             
            <label>Select file to upload: </label>
            <input name="file" type="file" /> </br>
                    
            <input type="submit" name="upload" value="Upload">
        </mvc:form>
        <h2 style="color:red">${errorMessage}</h>
    </body>
</html>
