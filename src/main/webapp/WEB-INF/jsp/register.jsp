<%-- 
    Document   : login
    Created on : Jul 24, 2020, 10:35:54 AM
    Author     : Laptop
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link href="css/register.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        
        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card">
                    <h2 style="color: #ffffff; margin-left: 50px;">Register</h2>
                    <div  class="card-body">
                        
                        <mvc:form action="addNewCustomer" method="post" modelAttribute="customer">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <mvc:input type="text" placeholder="Name" path="customerName" id="customerName" required="true"/>
                            </div>
                            
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user""></i></span>
                                </div>
                                <mvc:input type="text" placeholder="Address" path="customerAddress" id="customerAddress" required="true"/>
                            </div>
                            
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user""></i></span>
                                </div>
                                <mvc:input type="text" placeholder="Phone" path="customerPhone" id="customerPhone" required="true"/>
                            </div>
                            
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                 <mvc:input type="text" placeholder="Email" path="customerEmail" id="customerEmail" required="true"/>
                            </div>
                            
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <mvc:input type="date" placeholder="BirthDate" path="birthDate" id="birthDate" required="true"/>
                            </div>
                            
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <mvc:input type="text" placeholder="username" path="username" id="username" required="true"/>
                            </div>
                            
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <mvc:input type="password" placeholder="password" path="password" id="password" required="true"/>
                            </div>
                            
                            <div class="row align-items-center remember">
                                <input type="checkbox" name="rememberMe">Remember Me
                            </div>
                            
                            <div class="form-group">
                                <input type="submit" value="register" class="btn float-right login_btn">
                            </div>
                            
                    </mvc:form>
                    </div>
                    
                </div>
            </div>
        </div>
        
    </body>
</html>