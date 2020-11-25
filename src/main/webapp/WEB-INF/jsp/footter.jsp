<%-- 
    Document   : footter
    Created on : Oct 30, 2020, 9:08:58 AM
    Author     : Trung Nam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <footer class="section footer-classic context-dark bg-image" style="background: #006666">
            <div class="container">
                <div class="row row-30">
                    <div class="col-md-4 col-xl-5">
                        <div class="pr-xl-4"><a class="brand" href="index.html"><img class="brand-logo-light" src="${pageContext.request.contextPath}/images/logo1.jpg" alt="" width="100" height="70" ></a>
                            <p>"Làm sao bạn có thể sống một cuộc sống thượng đỉnh nếu bạn không mang giày Sneaker?"-CEO Bảo Thành ♥</p>
                            <p> "Hãy mang những giấc mơ của bạn lên đôi chân để dẫn lối giấc mơ đó thành hiện thực"-Founder Trung Nam♥</p>
                            <!-- Rights-->

                            <p class="rights"><span>©  </span><span class="copyright-year">2018</span><span> </span><span>Waves</span><span>. </span><span>All Rights Reserved.</span></p>
                        </div>
                    </div>
                    <div class="col-md-4">
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
