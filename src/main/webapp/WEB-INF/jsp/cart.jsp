<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/9/2020
  Time: 9:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="${pageContext.request.contextPath}/css/card.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/js/card.js" type="text/javascript"></script>
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
                   

                </ul>
            </div>
        </nav>


        <div style="margin-top: 60px;" class="shopping-cart">

            <div class="column-labels">
                <label class="product-image">Image</label>
                <label class="product-details">Product</label>
                <label class="product-price">Price</label>
                <label class="product-quantity">Quantity</label>
                <label class="product-removal">Remove</label>
                <label class="product-line-price">Total</label>
            </div>
            <c:set var="totalCart" value="0"></c:set>
            <c:forEach var="orderDetails" items="${orderDetailsList}">
                <c:set var="h" value="${h + orderDetails.total}"></c:set>
                    <div class="product">

                        <div class="product-image">
                            <a href="#"><img class="product-image" src="${pageContext.request.contextPath}/images/dienthoai/${orderDetails.product.image}" alt=""></a>
                    </div>
                    <div class="product-details">
                       <h6 style="margin-left: -50px; margin-right: 40px;">Info:     ${orderDetails.product.info} </h6>   
                    </div>
                    <div class="product-price">${orderDetails.product.priceFormatted} VND</div>
                    <div  class="product-quantity">
                        <form action="${pageContext.request.contextPath}/update" method="post">
                            <input type="hidden" name="id"
                                   value="${orderDetails.product.id}"/>
                            <input type="number" name="quantity"
                                   value="${orderDetails.quantity}"style="width: 60px"/>
                            <input  style="width: 80px;" type="submit" value="Update">
                        </form>
                    </div>

                    <div  class="product-removal">
                        <td><a href="${pageContext.request.contextPath}/delete/${orderDetails.product.id}"><svg style="margin-left: 40px;" width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
                                </svg>
                            </a></td>
                    </div>
                    <div class="product-line-price">${h} VND</div>
                </div>



                <div class="totals">



                    <div class="totals-item totals-item-total">
                        <label>Tổng Tiền</label>
                        <div class="totals-value" id="cart-total">${h} VND</div>
                    </div>
                </div>

                        <form style="margin-left: 1300px;" action="${pageContext.request.contextPath}/checkout" method="get">
                        <input type="hidden" name="action" value="checkout">
                        <input type="submit" value="Checkout">
                    </form>


            </div>

        </c:forEach>

        <div>
            <button  style="margin-right: 20px; "class="checkout"> <a href="<c:url value="/"/>">Tiếp Tục Mua Hàng</a></button>
        </div>
    </body>
</html>
