<%-- 
    Document   : addNewOrder
    Created on : 01-08-2020, 20:00:27
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet" type="text/css"/>
         <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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

                            <a href="${pageContext.request.contextPath}/cart>
                                <svg width="25px" height="25px" viewBox="0 0 16 16" class="bi bi-cart3" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                </svg>

                            </a>
                        </li>
                    
            </ul>
        </div>
    </nav>
   
                                <div style=" background: #ff9966;margin-top: 40px; width: 700px;"class="container">
            <div style=" background: #ff9966;" class="d-flex justify-content-center h-100">
                <div style=" background: #ff9966;" class="card">
                    <h2 style="color: #ffffff; margin-left: 50px;">Check Out</h2>
                    <div  class="card-body">
      
                    <mvc:form modelAttribute="orders" action="${pageContext.request.contextPath}/saveOrder" method="post" style="width: 100%;" >
                        <table>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span style="width: 630px;"class="input-group-text"><i class="fas fa-user"></i>Name</span>
                                </div>
                             
                                <mvc:input style="width:650px;" type="text" placeholder="Name" path="customerName" id="customerName" required="true"/>
                            </div>
                            
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span style="width: 630px;" class="input-group-text"><i class="fas fa-user""></i>Address</span>
                                </div>
                                <mvc:input style="width:650px;" type="text" placeholder="Address" path="customerAddress" id="customerAddress" required="true"/>
                            </div>
                            
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span style="width: 630px;" class="input-group-text"><i class="fas fa-user""></i>Email</span>
                                </div>
                                <mvc:input style="width:650px;" type="text" placeholder="Email" path="user_email" id="user_email" required="true"/>
                            </div>
                            
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span style="width: 630px;" class="input-group-text"><i class="fas fa-user"></i>Phone</span>
                                </div>
                                 <mvc:input style="width:650px;" type="text" placeholder="Phone" path="user_phone" id="user_phone" required="true"/>
                            </div>
                            
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span style="width: 630px; "class="input-group-text"><i class="fas fa-user"></i>Date</span>
                                </div>
                                <mvc:input style="width:650px;" type="date" placeholder="OrderDate" path="orderDate" id="orderDate" />
                            </div>
                            
                           
                            
                           
                            
                            
                                <input style="background: #33ffff; " type="submit" value="Mua" class="btn float-right login_btn">
                            
                        </table>    
                    </mvc:form>
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
                    <div  style="margin-left: -100px;" class="col-md-4">
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
    </body>
</html>