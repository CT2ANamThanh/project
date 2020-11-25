<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script src="../../js/details.js" type="text/javascript"></script>
<link href="../../css/chitiet.css" rel="stylesheet" type="text/css"/>
<%-- 
    Document   : index
    Created on : Sep 22, 2020, 9:24:24 AM
    Author     : Administrator
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Thương Mại Điện Tử</title>

        <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="logo"> 
                <img src="${pageContext.request.contextPath}/images/logo1.jpg" alt=""/>
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
                        <a   class="nav-link" href="http://localhost:8080/Project/#"><h4>Home</h4><span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <c:forEach var="categories" items="${categoriesList}">
                        <li class="nav-item">
                            <a  class="nav-link" href="shopping/${categories.id}">${categories.categoryName}</a>
                        </li>
                    </c:forEach>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp"><h4>Login</h4></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register"><h4>Register</h4></a>
                    </li>
                    

                </ul>
            </div>
        </nav>


        <div class="container">
            <c:catch var="product" >
                <div class="row">

                    <div style="margin-bottom: 2px ; margin-top: 32px" class="col-xs-4 item-photo">
                        <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/images/dienthoai/${product.image}" alt=""></a>
                    </div>
                    <div style="margin-bottom: 2px ; margin-top: 32px" class="col-xs-5" style="border:0px solid gray">
                        <table class="table table-hover">

                            <h2>${product.name}</h2>
                                
                            <h5 style="color: blue">Giá:   ${product.priceFormatted} VND</h5>   
                            <h5 style="color: blue">Màn Hình:   ${product.screenType}</h5>    

                            <h5 style="color: blue">Ram:   ${product.ram}</h5> 
                            <h5 style="color: blue">System:   ${product.system}</h5> 

                            <h5 style="color: blue">Pin:   ${product.battery}</h5>
                            <h5 style="color: blue">Khối Lượng:   ${product.weight}</h5>
                        </table>    
                        <div class="section">
                            <h6 class="title-attr" style="margin-top:15px;" ><small>COLOR</small></h6>                    
                            <div>
                                <div class="attr" style="width:25px;background: #ffffff;"></div>
                                <div class="attr" style="width:25px;background: #000;"></div>
                            </div>
                        </div>




                        <div class="section" style=" padding-bottom:20px;">
                            <input  s onclick="location.href = '${pageContext.request.contextPath}/cart/${product.id}'" 
                                    style=" background: #ffcc00;margin-left: 30px; color: red ;width: 80px; height: 40px;" type="button" value="AddToCart" />

                        </div> 

                    </div> 




                </div>
            </c:catch>
        </div>


      

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>

</html>





