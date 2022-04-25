<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<%-- 배너 --%>
<div class="sliderr">
    <div class="tp-banner-container">
        <div class="tp-banner">
            <ul>
                <!-- SLIDE  -->
                <li data-transition="random" data-slotamount="7" data-masterspeed="5000">
                    <!-- MAIN IMAGE -->
                    <img src="${resources}/images/main1.png" alt="slidebg1"
                         data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">
                    <!-- LAYERS -->
                    <div class="tp-caption modern_big_redbg randomrotate"
                         data-x="603"
                         data-y="384"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="1200"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11">Catch
                    </div>
                    <div class="tp-caption modern_big_redbg randomrotate"
                         data-x="701"
                         data-y="328"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="1700"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11">Cultural
                    </div>
                    <div class="tp-caption modern_big_redbg randomrotate"
                         data-x="833"
                         data-y="280"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="2200"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11">Current
                    </div>
                </li>

                <!-- SLIDE  -->
                <li data-transition="random" data-slotamount="7" data-masterspeed="5000">
                    <!-- MAIN IMAGE -->
                    <img src="${resources}/images/main2.png" alt="slidebg1"
                         data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">
                    <!-- LAYERS -->
                    <div class="tp-caption modern_big_redbg randomrotate"
                         data-x="603"
                         data-y="384"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="1200"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11">Catch
                    </div>
                    <div class="tp-caption modern_big_redbg randomrotate"
                         data-x="701"
                         data-y="328"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="1700"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11">Cultural
                    </div>
                    <div class="tp-caption modern_big_redbg randomrotate"
                         data-x="833"
                         data-y="280"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="2200"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11">Current
                    </div>
                </li>

            </ul><!-- End Slides -->
            <div class="tp-bannertimer"></div>
        </div>
    </div>
</div>
<%-- 내용 --%>
<div class="page-content" style="margin-bottom: 140px;">

</div>