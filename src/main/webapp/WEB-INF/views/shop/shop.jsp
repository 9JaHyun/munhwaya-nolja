<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<div id="layout" class="full">
    <div class="under_header">
        <img src="${resources}/images/assets/breadcrumbs10.png" alt="#">
    </div><!-- under header -->

    <div class="page-content back_to_up">
        <div class="row clearfix mb">
            <div class="breadcrumbIn">
                <ul>
                    <li><a href="index.html" class="toptip" original-title="Homepage"> <i class="icon-home"></i> </a></li>
                    <li> Shop </li>
                </ul>
            </div><!-- breadcrumb -->
        </div>

        <div class="row row-fluid clearfix mbf">
            <div class="span8 posts">
                <div class="def-block">
                    <h4> Products </h4><span class="liner"></span>

                    <div class="products shop clearfix">
                        <div class="grid_12">
                            <div class="product grid_6">
                                <img class="product_img" src="images/assets/shop/1.jpg" alt=""><!-- featured thumbnail -->
                                <img class="product_img_hover" src="images/assets/shop/2.jpg" alt=""><!-- featured thumbnail hover -->
                                <div class="sale">Sale</div>
                                <div class="product_inner">
                                    <h3> <a href="shop_product.html"> Product Title Here </a> </h3>
                                    <div class="clearfix">
                                        <p class="price"> $789 </p>
                                        <p class="rating"> <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i> </p>
                                    </div>
                                </div>
                                <div class="product_meta clearfix">
                                    <a href="shop_product.html" class="f_btn add_c"><span><i class="icon-shopping-cart"></i> Add to Cart</span></a>
                                    <a href="shop_product.html" class="f_btn"><span><i class="icon-align-justify"></i> Details</span></a>
                                </div>
                            </div><!-- product -->

                            <div class="product grid_6">
                                <img class="product_img" src="images/assets/shop/3.jpg" alt=""><!-- featured thumbnail -->
                                <img class="product_img_hover" src="images/assets/shop/4.jpg" alt=""><!-- featured thumbnail hover -->
                                <div class="product_inner">
                                    <h3> <a href="shop_product.html"> Product Title Here </a> </h3>
                                    <div class="clearfix">
                                        <p class="price"> $668 </p>
                                        <p class="rating"> <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-empty"></i> </p>
                                    </div>
                                </div>
                                <div class="product_meta clearfix">
                                    <a href="shop_product.html" class="f_btn add_c"><span><i class="icon-shopping-cart"></i> Add to Cart</span></a>
                                    <a href="shop_product.html" class="f_btn"><span><i class="icon-align-justify"></i> Details</span></a>
                                </div>
                            </div><!-- product -->

                            <div class="product grid_6">
                                <img class="product_img" src="images/assets/shop/5.jpg" alt=""><!-- featured thumbnail -->
                                <img class="product_img_hover" src="images/assets/shop/6.jpg" alt=""><!-- featured thumbnail hover -->
                                <div class="product_inner">
                                    <h3> <a href="shop_product.html"> Product Title Here </a> </h3>
                                    <div class="clearfix">
                                        <p class="price"> $557 </p>
                                        <p class="rating"> <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i> </p>
                                    </div>
                                </div>
                                <div class="product_meta clearfix">
                                    <a href="shop_product.html" class="f_btn add_c"><span><i class="icon-shopping-cart"></i> Add to Cart</span></a>
                                    <a href="shop_product.html" class="f_btn"><span><i class="icon-align-justify"></i> Details</span></a>
                                </div>
                            </div><!-- product -->

                            <div class="product grid_6">
                                <img class="product_img" src="images/assets/shop/7.jpg" alt=""><!-- featured thumbnail -->
                                <img class="product_img_hover" src="images/assets/shop/8.jpg" alt=""><!-- featured thumbnail hover -->
                                <div class="product_inner">
                                    <h3> <a href="shop_product.html"> Product Title Here </a> </h3>
                                    <div class="clearfix">
                                        <p class="price"> $458 </p>
                                        <p class="rating"> <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-empty"></i> </p>
                                    </div>
                                </div>
                                <div class="product_meta clearfix">
                                    <a href="shop_product.html" class="f_btn add_c"><span><i class="icon-shopping-cart"></i> Add to Cart</span></a>
                                    <a href="shop_product.html" class="f_btn"><span><i class="icon-align-justify"></i> Details</span></a>
                                </div>
                            </div><!-- product -->
                        </div><!-- products -->
                    </div><!-- gridfull -->

                    <div class="pagination-tt clearfix">
                        <ul>
                            <li><span class="deactive">1</span></li>
                            <li><a href="#" class="tbutton"><span>2</span></a></li>
                            <li><a href="#" class="tbutton"><span>3</span></a></li>
                            <li><span class="deactive">...</span></li>
                            <li><a href="#" class="tbutton"><span>8</span></a></li>
                        </ul>
                        <span class="pages">Page 1 of 8</span>
                    </div><!-- pagination -->

                </div><!-- def block -->
            </div><!-- span8 posts -->

            <div class="span4 sidebar">
                <div class="def-block widget">
                    <h4> Shopping Cart </h4><span class="liner"></span>
                    <div class="widget-content">
                        <p> <i class="icons-bag mid" style="font-size: 40px;vertical-align: middle;"></i> Your Shopping Cart is Empty </p>
                    </div><!-- widget content -->
                </div><!-- widget shop cart -->

                <div class="def-block widget">
                    <h4> Products Categories </h4><span class="liner"></span>
                    <div class="widget-content">
                        <ul class="list">
                            <li><a href="#"><i class="icon-caret-right"></i> T-shirts (7) </a></li>
                            <li><a href="#"><i class="icon-caret-right"></i> Bags (13)</a></li>
                            <li><a href="#"><i class="icon-caret-right"></i> VSTi (10)</a></li>
                            <li><a href="#"><i class="icon-caret-right"></i> Plugins (54)</a></li>
                        </ul>
                    </div><!-- widget content -->
                </div><!-- widget categories -->

                <div class="def-block widget">
                    <h4> Top Sales </h4><span class="liner"></span>
                    <div class="widget-content">
                        <ul class="tab-content-items">
                            <li class="clearfix">
                                <a class="post-thumbnail" href="shop_single.html"><img width="60" height="60" src="images/assets/shop/thumb1.jpg" alt="#"></a>
                                <h3><a href="shop_single.html">Next Elections Resolutions could be</a></h3>
                                <p class="rating"> <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-empty"></i> </p>
                            </li>
                            <li class="clearfix">
                                <a class="post-thumbnail" href="shop_single.html"><img width="60" height="60" src="images/assets/shop/thumb2.jpg" alt="#"></a>
                                <h3><a href="shop_single.html">Praesent adipiscing mi eget ipsum imperdiet</a></h3>
                                <p class="rating"> <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i> </p>
                            </li>
                            <li class="clearfix">
                                <a class="post-thumbnail" href="shop_single.html"><img width="60" height="60" src="images/assets/shop/thumb3.jpg" alt="#"></a>
                                <h3><a href="shop_single.html">Paul Thomson on Post with SoundCloud</a></h3>
                                <p class="rating"> <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-empty"></i> </p>
                            </li>
                        </ul>
                    </div><!-- widget content -->
                </div><!-- widget top sales -->

                <div class="def-block widget">
                    <h4> Tags </h4><span class="liner"></span>
                    <div class="widget-content tags">
                        <a href="#" class="toptip" original-title="17 Product"><i class="icon-tag"></i> T-shirt </a>
                        <a href="#" class="toptip" original-title="44 Product"><i class="icon-tag"></i> Bag </a>
                        <a href="#" class="toptip" original-title="1 Product"><i class="icon-tag"></i> pro </a>
                        <a href="#" class="toptip" original-title="10 Product"><i class="icon-tag"></i> Book </a>
                        <a href="#" class="toptip" original-title="29 Product"><i class="icon-tag"></i> Sports </a>
                        <a href="#" class="toptip" original-title="2 Product"><i class="icon-tag"></i> premium </a>
                    </div><!-- widget content -->
                </div><!-- widget tags -->

            </div><!-- span4 sidebar -->
        </div><!-- row clearfix -->
    </div><!-- end page content -->
</div><!-- end layout -->