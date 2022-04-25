<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="fluidGridSystem">
    <div id="layout" class="full">
        <div class="page-content back_to_up">
            <div class="row clearfix mb">
                <div class="breadcrumbIn">
                    <ul>
                        <li><a href="index.html" class="toptip" title="Homepage"> <i
                                class="icon-home"></i> </a></li>
                        <li><a href="shop.html"> Shop </a></li>
                        <li> Shop Checkout</li>
                    </ul>
                </div><!-- breadcrumb -->
            </div>

            <div class="row row-fluid clearfix mbf">
                <div class="span12">
                    <div class="def-block">
                        <h4> Shop Checkout </h4><span class="liner"></span>

                        <div class="products shop checkout clearfix">
                            <table class="shop_table gbtr_order_details">
                                <thead>
                                <tr>
                                    <th class="product-name">Product</th>
                                    <th class="product-total">Total</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr class="cart-subtotal">
                                    <th>Cart Subtotal</th>
                                    <td><span class="amount">$275.00</span></td>
                                </tr>

                                <tr class="shipping">
                                    <th>Shipping</th>
                                    <td>Free Shipping<input type="hidden" name="shipping_method"
                                                            id="shipping_method"
                                                            value="free_shipping"></td>
                                </tr>

                                <tr class="total">
                                    <th><strong>Order Total</strong></th>
                                    <td>
                                        <strong><span class="amount">$275.00</span></strong>
                                    </td>
                                </tr>


                                </tfoot>
                                <tbody>

                                <tr class="checkout_table_item">
                                    <td class="product-name">109F SOLID WOMEN'S TOP <strong
                                            class="product-quantity">× 1</strong></td>
                                    <td class="product-total"><span class="amount">$55.00</span>
                                    </td>
                                </tr>
                                <tr class="checkout_table_item">
                                    <td class="product-name">MEN'S TOP <strong
                                            class="product-quantity">× 2</strong></td>
                                    <td class="product-total"><span class="amount">$220.00</span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <form method="post" id="track_order" action="#">
                                <input type="submit" id="sendOrder" value="Place Order">
                            </form>
                        </div><!-- products -->

                    </div><!-- def block -->
                </div><!-- span12 -->
            </div><!-- row clearfix -->
        </div><!-- end page content -->
    </div><!-- end layout -->
</div>