<%-- 
    Document   : camon
    Created on : Oct 30, 2020, 7:13:59 PM
    Author     : Trung Nam
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
            <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="logo"> 
                <img  src="${pageContext.request.contextPath}/images/logo1.jpg" alt=""/>
            </div>
            <div class="search col-xs-12 col-sm-8 col-md-6 col-lg-6">

                <form class="example" action="${pageContext.request.contextPath}/search" method="get" style="margin:auto;">
                    <input style="width: 500px; height: 50px" type="text" name="searchText" id="searchText" value="${model.productList}" placeholder="Search...">
                    <button style= "color: red ;width: 100px; height: 50px" type="submit">Tìm kiếm<i class="fa fa-search"></i></button>

                </form>

            </div>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-">
                    <li class="nav-item active">
                        <a class="nav-link" href="<c:url value="/"/>">Home
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <c:forEach var="categories" items="${categoriesList}">
                        <li class="nav-item">
                            <a  class="nav-link" href="shopping/${categories.id}">${categories.categoryName}</a>
                        </li>
                    </c:forEach>

                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register">Register</a>
                    </li>
                    <li> 
                        <a href="card">
                            <svg width="25px" height="25px" viewBox="0 0 16 16" class="bi bi-cart3" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                            </svg>

                        </a>
                    </li>

                </ul>
            </div>
        </nav>
                        <h1 style="margin-top: 40px;">Quý Khách Đã Đặt Hàng Thành Công </h1>
        
    </body>
   
</html>
