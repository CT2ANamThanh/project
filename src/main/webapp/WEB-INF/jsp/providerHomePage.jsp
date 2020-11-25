<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
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
                        <a class="nav-link" href="http://localhost:8080/Project/#">Home
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
                   

                </ul>
            </div>
        </nav>

        <div class="container">
            <div class="row">
                




                <div class="col-lg-9">
                   
                    <div class="row">
                        <c:forEach var="product" items="${productList}">
                            <div style="margin-bottom: 2px ; margin-top: 32px" class="col-lg-3 ">
                                <div class="card h-100">
                                    <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/images/dienthoai/${product.image}" alt=""></a>
                                    <div class="card-body">
                                        <h4 class="card-title">
                                            <a href="#">${product.name}</a>
                                        </h4>
                                        <h5>${product.price}</h5>
                                        <p class="card-text"></p>
                                    </div>
                                    <div class="card-footer">
                                        <input    onclick="location.href = '${pageContext.request.contextPath}/details/${product.id}'"  style="background: #ffcc00;margin-left: 30px;color: red ;width: 80px; height: 40px;" type="button" value="Mua" />
                                    </div>
                                    
                                </div>
                            </div>
                        </c:forEach>
                    </div>



                </div>

            </div>
        </div>



                   <footer class="section footer-classic context-dark bg-image" style="background: #006666">
            <div class="container">
                <div class="row row-30">
                    <div class="col-md-4 col-xl-5">
                        <div class="pr-xl-4"><a class="brand" href="index.html"><img class="brand-logo-light" src="${pageContext.request.contextPath}/images/logo1.jpg" alt="" width="100" height="70" ></a>
                            

                           
                        </div>
                    </div>
                    <div style="margin-left: -100px;" class="col-md-4">
                        <h5>Contacts</h5>
                        <dl class="contact-list">
                            <dt>Địa Chỉ:</dt>
                            <dd>Số 1,Đường Nguyễn Tất Thành,Quận Hải Châu,TP Đà Nẵng</dd>
                        </dl>
                        <dl class="contact-list">
                            <dt>Email:</dt>
                            <dd><a href="mailto:#">buitrungnam120816@gmail.com</a></dd>
                        </dl>
                        <dl class="contact-list">
                            <dt>Hotline:</dt>
                            <dd><a href="tel:#">0311 113 114</a> <span>or</span> <a href="tel:#">0311 115 116</a>
                            </dd>
                        </dl>
                    </div>
                    <div class="col-md-4 col-xl-3">
                        <h5>Đánh Giá</h5>
                        <ul class="nav-list">
                            <li><a href="#">Rất Không Hài Lòng</a></li>
                            <li><a href="#">Không Hài Lòng</a></li>
                            <li><a href="#">Hài Lòng</a></li>
                            <li><a href="#">Rất Hài Lòng</a></li>
                            <li><a href="#">Rất Rất Hài Lòng</a></li>
                        </ul>
                    </div>
                </div>
            </div>       
            <div class="row no-gutters social-container">
                <div class="col"><a class="social-inner" href="https://www.facebook.com/buitrungnam113"><span class="icon mdi mdi-facebook"></span><img src="${pageContext.request.contextPath}/images/icon/facebook.png" style="width: 50px; height: 50px;"><span>Facebook</span></a></div>
                <div class="col"><a class="social-inner" href="https://www.facebook.com/buitrungnam113"><span class="icon mdi mdi-instagram"></span><img src="${pageContext.request.contextPath}/images/icon/instagram.png" style="width: 50px; height: 50px;"><span>Instagram</span></a></div>
                <div class="col"><a class="social-inner" href="https://www.facebook.com/buitrungnam113"><span class="icon mdi mdi-twitter"></span><img src="${pageContext.request.contextPath}/images/icon/zalo.png" style="width: 50px; height: 50px;"><span>Zalo</span></a></div>
                <div class="col"><a class="social-inner" href="https://www.facebook.com/buitrungnam113"><span class="icon mdi mdi-youtube-play"></span><img src="${pageContext.request.contextPath}/images/icon/gg.png" style="width: 50px; height: 50px;"><span>Google</span></a></div>
            </div>
        </footer>

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>

</html>

