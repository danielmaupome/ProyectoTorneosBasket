<%-- 
    Document   : base.jsp
    Created on : 3/07/2019, 04:27:28 PM
    Author     : Cesar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
</div>
</div>
</div>
<!-- Start Twitter -->
<div class="twitter-widget loading">
    <div class="container">
        <div class="col-lg-12">
            <div class="widget-content">
                <div class="twitter-feed paginated" data-id="uouapps" data-limit="3" data-interval="0"><span class="loading-anim"><span></span></span></div>
            </div>
        </div>
    </div>
</div>
<!-- End Twitter -->

<!-- Start Footer -->
<footer id="footer">
    <div class="container">

        <!-- Start Footer-Top -->
        <div class="footer-top clearfix">
            <div class="widget col-lg-3 col-md-3 col-sm-6">
                <h5 class="widget-title">About FC</h5>
                <p>Lorem ipsum dolor sit amet consete adipisicing elit. Proin nibh augue.</p>
                <ul class="contact-info custom-list">
                    <li><i class="fa fa-map-marker"></i><span>10 Milk Street #230 Boston, MA 02108</span></li>
                    <li><i class="fa fa-phone"></i><span>+1 (123) 456-7890</span></li>
                    <li><i class="fa fa-envelope"></i><span><a href="mailto:example@example.com">example@example.com</a></span></li>
                </ul>
            </div>
            <div class="widget col-lg-3 col-md-3 col-sm-6">
                <h5 class="widget-title">Information</h5>
                <ul class="custom-list">
                    <li><a href="#">About the Club</a></li>
                    <li><a href="#">Shop</a></li>
                    <li><a href="#">Our Team</a></li>
                    <li><a href="#">Tickets and Membership</a></li>
                    <li><a href="#">Features</a></li>
                    <li><a href="#">404 Error Page</a></li>
                </ul>
            </div>
            <div class="widget col-lg-3 col-md-3 col-sm-6">
                <h5 class="widget-title">Support</h5>
                <ul class="custom-list">
                    <li><a href="#">Terms and Conditions</a></li>
                    <li><a href="#">Website Accessibility Statement</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Sitemap</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Account</a></li>
                </ul>
            </div>
            <div class="widget col-lg-3 col-md-3 col-sm-6">
                <h5 class="widget-title">Gallery</h5>
                <ul class="gallery custom-list row">
                    <li><a href="#"><img src="img/gallery_footer.jpg" alt=""></a></li>
                    <li><a href="#"><img src="img/gallery_footer2.jpg" alt=""></a></li>
                    <li><a href="#"><img src="img/gallery_footer3.jpg" alt=""></a></li>
                    <li><a href="#"><img src="img/gallery_footer4.jpg" alt=""></a></li>
                    <li><a href="#"><img src="img/gallery_footer5.jpg" alt=""></a></li>
                    <li><a href="#"><img src="img/gallery_footer6.jpg" alt=""></a></li>
                </ul>
            </div>
        </div>
        <!-- End Footer-Top -->

        <!-- Start Sposnors -->
        <div class="sponsors clearfix">
            <h5 class="text-center">Sponsors</h5>
            <div class="sponsor-logo text-center col-lg-2 col-md-2 col-sm-4">
                <img src="img/partner.png" alt="">
            </div>
            <div class="sponsor-logo text-center col-lg-2 col-md-2 col-sm-4">
                <img src="img/partner2.png" alt="">
            </div>
            <div class="sponsor-logo text-center col-lg-2 col-md-2 col-sm-4">
                <img src="img/partner3.png" alt="">
            </div>
            <div class="sponsor-logo text-center col-lg-2 col-md-2 col-sm-4">
                <img src="img/partner4.png" alt="">
            </div>
            <div class="sponsor-logo text-center col-lg-2 col-md-2 col-sm-4">
                <img src="img/partner5.png" alt="">
            </div>
            <div class="sponsor-logo text-center col-lg-2 col-md-2 col-sm-4">
                <img src="img/partner6.png" alt="">
            </div>
        </div>
        <!-- End Sponsors -->

    </div>

    <!-- Start Copyrights -->
    <div class="copyrights clearfix text-center">
        <p class="col-lg-12">© Copyright 2019 FC Theme. Todos los derechos reservados</p>
    </div>
    <!-- End Copyrights -->

</footer>
<!-- End Footer -->

<!-- Start Back-to-Top -->
<a href="#" id="back-to-top">
    <i class="fa fa-angle-up"></i>
</a>
<!-- End Back-to-Top -->

</div> 
<!-- end #main-wrapper -->

<!-- Scripts -->
<script src="js/jquery.min.js"></script>
<script src="js/scripts.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.ba-outside-events.min.js"></script>
<script src="js/tab.js"></script>
<script src='js/bootstrap-datepicker.js'></script>
<script src="js/jquery.vide.min.js"></script>
<script src="twitter/jquery.tweet.min.js" type="text/javascript"></script>

</body>
<%}else{
response.sendRedirect("index.html");
}%>