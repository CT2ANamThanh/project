<%-- 
    Document   : login
    Created on : Jul 24, 2020, 10:35:54 AM
    Author     : Laptop
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link href="css/login.css" rel="stylesheet" type="text/css"/>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>

        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card">
                    <div class="card-header">
                        <h3>Sign In</h3>

                    </div>
                    <div class="card-body">
                        <form action="j_spring_security_check" method="post">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                            </div>
                            <input type="text" class="form-control" name="username" placeholder="username" required="true">    

                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                            </div>
                            <input type="password" class="form-control" name="password" placeholder="password" required="true">

                            
                            <div class="form-group">
                                <input type="submit" value="Login" class="btn float-right login_btn">                             
                            </div>

                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-center links">
                            Don't have an account?<a href="register">Sign Up</a>
                        </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>     
        <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
            <p style="color:red;">Error:
                <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></p>
        </c:if>  
</body>
</html>