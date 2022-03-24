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
                    <li><a href="index.html" class="toptip" title="Homepage"> <i
                            class="icon-home"></i> </a></li>
                    <li><a href="shop.html"> Shop </a></li>
                    <li> SHOPPING BAG</li>
                </ul>
            </div><!-- breadcrumb -->
        </div>

        <div class="row row-fluid clearfix mbf">
            <div class="span8 posts">
                <div class="def-block">
                    <h4> SHOPPING BAG </h4><span class="liner"></span>

                    <div class="products shop clearfix">
                        <div class="grid_12">
                            <form action="#" method="post">
                                <div class="bag_table">
                                    <table class="shop_table footable tablet footable-loaded"
                                           cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th data-hide="phone" class="product-thumbnail">&nbsp;
                                            </th>
                                            <th class="product-name">Item</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Total</th>
                                            <th class="product-remove">&nbsp;</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <tr class="cart_table_item">
                                            <td class="product-thumbnail">
                                                <a href="#"><img src="images/assets/shop/thumb2.jpg"
                                                                 alt="#"></a>
                                            </td>

                                            <td class="product-name">
                                                <a href="#">109F SOLID WOMEN'S TOP</a>
                                                <div class="product-price">
                                                    <span class="amount">$50.00</span>
                                                </div>
                                            </td>

                                            <td class="product-quantity">
                                                <div class="quantity buttons_added">
                                                    <input name="qty" value="1" size="4" class="qty"
                                                           maxlength="12">
                                                </div>
                                            </td>

                                            <td class="product-subtotal">
                                                <span class="amount">$55.00</span>
                                            </td>

                                            <td class="product-remove tac">
                                                <a href="#" class="remove toptip"
                                                   original-title="Remove this item">×</a>
                                            </td>
                                        </tr>


                                        <tr class="cart_table_item">
                                            <td class="product-thumbnail">
                                                <a href="#"><img src="images/assets/shop/thumb1.jpg"
                                                                 alt="#"></a>
                                            </td>

                                            <td class="product-name">
                                                <a href="#">MEN'S TOP</a>
                                                <div class="product-price">
                                                    <span class="amount">$110.00</span>
                                                </div>
                                            </td>

                                            <td class="product-quantity">
                                                <div class="quantity buttons_added">
                                                    <input name="qty" value="2" size="4" class="qty"
                                                           maxlength="12">
                                                </div>
                                            </td>

                                            <td class="product-subtotal">
                                                <span class="amount">$220.00</span>
                                            </td>

                                            <td class="product-remove tac">
                                                <a href="#" class="remove toptip"
                                                   original-title="Remove this item">×</a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div><!-- bag table -->
                            </form><!-- end form -->
                        </div><!-- grid12 -->
                    </div><!-- products -->

                </div><!-- def block -->
            </div><!-- span8 posts -->

            <div class="span4 sidebar">
                <div class="def-block widget">
                    <h4> Have a coupon? </h4><span class="liner"></span>
                    <div class="widget-content">
                        <div class="clearfix">
                            <form action="#" method="post">
                                <input name="text" class="coupon_input"
                                       placeholder="Enter coupon code" value="">
                                <button type="button" class="tbutton coupon_button small"
                                        name="button"><span>Apply</span></button>
                            </form>
                        </div>
                    </div><!-- widget content -->
                </div><!-- widget shop cart -->

                <div class="def-block widget">
                    <h4> SHOPPING BAG TOTALS </h4><span class="liner"></span>
                    <div class="widget-content">
                        <table class="total_w_table" cellspacing="0">
                            <tbody>
                            <tr class="cart-subtotal">
                                <th><strong>Subtotal</strong></th>
                                <td><strong><span class="amount">$275.00</span></strong></td>
                            </tr>
                            <tr class="shipping">
                                <th>Shipping</th>
                                <td>Free Shipping<input type="hidden" name="shipping_method"
                                                        id="shipping_method" value="free_shipping">
                                </td>
                            </tr>
                            <tr class="total">
                                <th><strong>Total</strong></th>
                                <td><strong><span class="amount">$275.00</span></strong></td>
                            </tr>
                            </tbody>
                        </table>
                        <button type="button" class="tbutton mt medium" name="update_cart"><span>Update Bag</span>
                        </button>
                        <button type="button" class="tbutton mt medium color2" name="proceed"><span>Checkout</span>
                        </button>
                    </div><!-- widget content -->
                </div><!-- widget shop cart -->

            </div><!-- span4 sidebar -->
        </div><!-- row clearfix -->
    </div><!-- end page content -->
</div>