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

        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <link href="css/shop-homepage.css" rel="stylesheet">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="logo"> 
                <img src="images/logo1.jpg" alt=""/>
            </div>
            <div style="margin-left: 50px;"class="search col-xs-12 col-sm-8 col-md-6 col-lg-6">

                <form class="example" action="${pageContext.request.contextPath}/search" method="get" style="margin:auto;">
                    <input style=" mwidth: 500px; height: 50px" type="text" name="searchText" id="searchText" value="${model.productList}" placeholder="Search...">
                    <button style= "color: red ;width: 100px; height: 50px" type="submit">Tìm kiếm<i class="fa fa-search"></i></button>

                </form>

            </div>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home
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

                            <a href="${pageContext.request.contextPath}/cart>
                                <svg width="25px" height="25px" viewBox="0 0 16 16" class="bi bi-cart3" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                </svg>

                            </a>
                        </li>
                    
            </ul>
        </div>
    </nav>

    <div  class="container">
        <div class="row">
            <div style="margin-left: px;" class="col-lg-3">
                <button style= " background-color: #009999; margin-top: 40px; color: black ;width: 255px; height: 50px" type="submit"><h4>Nhà Cung Cấp</h4><i class="fa fa-search"></i></button>
                <div class="list-group">
                    <c:forEach var="provider" items="${providerList}">
                        <a href="provider/${provider.id}" class="list-group-item">${provider.providerName}</a>
                    </c:forEach>
                </div>

            </div>




            <div style="margin-top: 20px; " class="col-lg-9">
                <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img class="d-block img-fluid" src="images/banner/banner1.jpg" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid" src="images/banner/banner2.jpg" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid" src="images/banner/banner3.jpg" alt="Third slide">
                        </div>                       
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>

                </div>


                <h3>Sản Phẩm Bán Mới Nhất</h3>
                <div class="row">
                    <c:forEach var="newProduct" items="${newProduct}">
                        <div class="col-lg-3 col-md-12 mb-4">
                            <div class="card h-100">
                                <a><img class="card-img-top" src="images/dienthoai/${newProduct.image}" alt=""></a>
                                <div class="card-body">

                                    <h4>${newProduct.name}</h4>

                                    <h5 style="color: red;">${newProduct.priceFormatted} VND</h5>
                                    <p class="card-text"></p>
                                </div>
                                <div class="card-footer">
                                    <input   onclick="location.href = 'details/${newProduct.id}'" 
                                             style="background: #ffcc00; margin-left: 30px; color: red ;width: 80px; height: 40px;" type="button" value="Mua" />
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <h3>Sản Phẩm Bán Chạy </h3>
                <div class="row">
                    <c:forEach var="sellingProduct" items="${sellingProduct}">
                        <div class="col-lg-3 col-md-12 mb-4">
                            <div class="card h-100">
                                <a href="#"><img class="card-img-top" src="images/dienthoai/${sellingProduct.image}" alt=""></a>
                                <div class="card-body">
                                    <h4>${sellingProduct.name}</h4>
                                    <h5 style="color: red;">${sellingProduct.priceFormatted} VND</h5>
                                    <p class="card-text"></p>
                                </div>
                                <div class="card-footer">
                                    <input   onclick="location.href = 'details/${sellingProduct.id}'" style="background: #ffcc00;margin-left: 30px; color: red ;width: 80px; height: 40px;" type="button" value="Mua" />
                                </div>
                            </div>
                        </div>
                    </c:forEach>                      
                </div>
                <h3>Tất Cả Sản Phẩm</h3>
                <div class="row">
                    <c:forEach var="productList" items="${productList}">
                        <div class="col-lg-3 col-md-12 mb-4">
                            <div class="card h-100">
                                <a href="#"><img class="card-img-top" src="images/dienthoai/${productList.image}" alt=""></a>
                                <div class="card-body">
                                    <h4>${productList.name}</h4>
                                    <h5 style="color: red;">${productList.priceFormatted} VND</h5>
                                    <p class="card-text"></p>
                                </div>
                                <div class="card-footer">
                                    <input   onclick="location.href = 'details/${productList.id}'" style="background: #ffcc00;margin-left: 30px; color: red ;width: 80px; height: 40px;" type="button" value="Mua" />
                                </div>
                            </div>
                        </div>
                    </c:forEach>                      
                </div>

            </div>

        </div>
    </div>



    <!-- Footer -->
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
