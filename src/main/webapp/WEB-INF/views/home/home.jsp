<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Slider 배너 --%>
<div class="sliderr">
    <div class="tp-banner-container">
        <div class="tp-banner" >
            <ul>
                <!-- SLIDE  -->
                <li data-transition="random" data-slotamount="7" data-masterspeed="5000" >
                    <!-- MAIN IMAGE -->
                    <img src="/images/slides/slider1.jpg"  alt="slidebg1"  data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">
                    <!-- LAYERS -->
                    <div class="tp-caption fade"
                         data-x="566"
                         data-y="306"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="800"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11"><img src="images/slides/slide1-cap1.png" alt=""></div>

                    <div class="tp-caption lfb"
                         data-x="566"
                         data-y="305"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="1200"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11"><img src="images/slides/slide1-cap2.png" alt=""></div>

                    <div class="tp-caption lft"
                         data-x="741"
                         data-y="305"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="1200"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11"><img src="images/slides/slide1-cap3.png" alt=""></div>

                    <div class="tp-caption lfb"
                         data-x="711"
                         data-y="374"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="2000"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11"><img src="images/slides/slide1-cap4.png" alt=""></div>

                    <div class="tp-caption lft"
                         data-x="714"
                         data-y="374"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="2000"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11"><img src="images/slides/slide1-cap5.png" alt=""></div>
                </li>

                <!-- SLIDE  -->
                <li data-transition="random" data-slotamount="7" data-masterspeed="5000" >
                    <!-- MAIN IMAGE -->
                    <img src="images/slides/slider9.jpg"  alt="slidebg1"  data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">
                    <!-- LAYERS -->
                    <div class="tp-caption modern_big_bluebg randomrotate"
                         data-x="603"
                         data-y="384"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="1200"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11">Responsive Design</div>

                    <div class="tp-caption modern_big_redbg randomrotate"
                         data-x="701"
                         data-y="328"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="1700"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11">Retina Ready</div>
                </li>

                <!-- SLIDE  -->
                <li data-transition="random" data-slotamount="7" data-masterspeed="5000" >
                    <!-- MAIN IMAGE -->
                    <img src="images/slides/slider3.jpg"  alt="slidebg1"  data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">
                    <!-- LAYERS -->
                    <div class="tp-caption modern_big_redbg randomrotate"
                         data-x="560"
                         data-y="253"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="1000"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11">Revolution Slider</div>

                    <div class="tp-caption modern_m_bluebg randomrotate"
                         data-x="560"
                         data-y="310"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="1500"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11">Awesome MusicPlayer</div>

                    <div class="tp-caption modern_m_bluebg randomrotate"
                         data-x="560"
                         data-y="355"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="2000"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11">Wonderful Gallery</div>

                    <div class="tp-caption modern_m_bluebg randomrotate"
                         data-x="560"
                         data-y="400"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="2500"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11">Seo Optimized</div>

                    <div class="tp-caption modern_m_bluebg randomrotate"
                         data-x="560"
                         data-y="445"
                         data-hoffset="0"
                         data-speed="700"
                         data-start="3000"
                         data-easing="Back.easeInOut"
                         data-endspeed="300"
                         style="z-index: 11">and Much More ...</div>
                </li>

            </ul><!-- End Slides -->
            <div class="tp-bannertimer"></div>
        </div>
    </div>
</div>
<%-- 내용 --%>
<div class="page-content">
    <div class="row clearfix mbf">
        <div class="music-player-list"></div>
    </div><!-- row music player -->

    <div class="row row-fluid clearfix mbf">
        <div class="span8">
            <div class="def-block">
                <h4> Latest News </h4><span class="liner"></span>

                <div class="news row-fluid animtt" data-gen="fadeUp" style="opacity:0;">
                    <div class="span5"><img class="four-radius" src="images/assets/news1.jpg" alt="#"></div>
                    <div class="span7">
                        <h3 class="news-title"> <a href="news_single.html">Australia’s 2014 Soundwave Festival</a> </h3>
                        <p>Nine Inch Nails aren't on the bill, and they won't play the fest anytime soon. Soundwave promoter AJ Maddah started a Twitter war-of-words with a few choice comments about NIN's Trent Reznor.</p>
                        <div class="meta">
                            <span> <i class="icon-time mi"></i>August 26, 2022 5:09 AM </span> | <span> <a href="#"><i class="icon-comments-alt"></i> 14</a> </span>
                        </div><!-- meta -->
                        <a href="news_single.html" class="sign-btn tbutton small"><span>Read More</span></a>
                    </div><!-- span7 -->
                </div><!-- news -->

                <div class="news row-fluid animtt" data-gen="fadeUp" style="opacity:0;">
                    <div class="span5"><img class="four-radius" src="images/assets/news2.jpg" alt="#"></div>
                    <div class="span7">
                        <h3 class="news-title"> <a href="news_single.html">MTV Video Music Awards 2022</a> </h3>
                        <p>Nine Inch Nails aren't on the bill, and they won't play the fest anytime soon. Soundwave promoter AJ Maddah started a Twitter war-of-words with a few choice comments about NIN's Trent Reznor.</p>
                        <div class="meta">
                            <span> <i class="icon-time mi"></i>August 24, 2022 8:10 PM </span> | <span> <a href="#"><i class="icon-comments-alt"></i> 5</a> </span>
                        </div><!-- meta -->
                        <a href="news_single.html" class="sign-btn tbutton small"><span>Read More</span></a>
                    </div><!-- span7 -->
                </div><!-- news -->

                <div class="news row-fluid animtt" data-gen="fadeUp" style="opacity:0;">
                    <div class="span5"><img class="four-radius" src="images/assets/news3.jpg" alt="#"></div>
                    <div class="span7">
                        <h3 class="news-title"> <a href="news_single.html">VMAs With A Round Of 'Applause'</a> </h3>
                        <p>Nine Inch Nails aren't on the bill, and they won't play the fest anytime soon. Soundwave promoter AJ Maddah started a Twitter war-of-words with a few choice comments about NIN's Trent Reznor.</p>
                        <div class="meta">
                            <span> <i class="icon-time mi"></i>August 20, 2022 2:00 AM </span> | <span> <a href="#"><i class="icon-comments-alt"></i> 27</a> </span>
                        </div><!-- meta -->
                        <a href="news_single.html" class="tbutton small"><span>Read More</span></a>
                    </div><!-- span7 -->
                </div><!-- news -->

                <div class="load-news tac"><a href="#" class="tbutton small"><span>Load More</span></a></div>
            </div><!-- def block -->
        </div><!-- span8 news -->

        <div class="span4">
            <div class="def-block widget animtt" data-gen="fadeUp" style="opacity:0;">
                <h4> Events </h4><span class="liner"></span>
                <div class="widget-content row-fluid">
                    <div class="span12 mb">
                        <ul id="event1" class="event-timer">
                            <li>
                                <span class="days">00</span>
                                <p class="timeRefDays">days</p>
                            </li>
                            <li>
                                <span class="hours">00</span>
                                <p class="timeRefHours">hours</p>
                            </li>
                            <li>
                                <span class="minutes">00</span>
                                <p class="timeRefMinutes">min</p>
                            </li>
                            <li>
                                <span class="seconds">00</span>
                                <p class="timeRefSeconds">sec</p>
                            </li>
                        </ul> <!-- end timer -->
                    </div><!-- timer -->

                    <div class="grid_8">
                        <p class="event-titlett">Bono Serenades Warren</p>
                    </div>
                    <div class="grid_4">
                        <a href="#" class="tbutton buy-ticket small"><span>Buy Ticket</span></a>
                    </div>

                </div><!-- widget content -->
            </div><!-- def block widget events -->

            <div class="def-block widget animtt" data-gen="fadeUp" style="opacity:0;">
                <h4> Featured Videos </h4><span class="liner"></span>
                <div class="widget-content row-fluid">
                    <div class="videos clearfix flexslider">
                        <ul class="slides">
                            <li class="featured-video">
                                <a href="video_single_wide.html">
                                    <img src="images/assets/video1.jpg" alt="#">
                                    <i class="icon-play-sign"></i>
                                    <h3>I Know You Want Me</h3>
                                    <span>Fitbull</span>
                                </a>
                            </li><!-- slide -->
                            <li class="featured-video">
                                <a href="video_single_wide.html">
                                    <img src="images/assets/video2.jpg" alt="#">
                                    <i class="icon-play-sign"></i>
                                    <h3>I Like It</h3>
                                    <span>Enrique</span>
                                </a>
                            </li><!-- slide -->
                            <li class="featured-video">
                                <a href="video_single_wide.html">
                                    <img src="images/assets/video3.jpg" alt="#">
                                    <i class="icon-play-sign"></i>
                                    <h3>Tommorow</h3>
                                    <span>Dj Michele</span>
                                </a>
                            </li><!-- slide -->
                        </ul>
                    </div>
                </div><!-- widget content -->
            </div><!-- def block widget videos -->

            <div class="def-block widget animtt" data-gen="fadeUp" style="opacity:0;">
                <h4> Popular Tracks </h4><span class="liner"></span>
                <div class="widget-content row-fluid">
                    <div class="scroll-mp3" style="height: 220px;">
                        <div class="content">
                            <ul class="tab-content-items">
                                <li class="clearfix">
                                    <a class="m-thumbnail" href="mp3_single_half.html"><img width="50" height="50" src="images/assets/thumb-mp3-1.jpg" alt="#"></a>
                                    <h3><a href="mp3_single_half.html">Don’t go mary ( Remix )</a></h3>
                                    <span> Alexander </span>
                                    <span> 1,892,250 Plays </span>
                                </li>
                                <li class="clearfix">
                                    <a class="m-thumbnail" href="mp3_single_half.html"><img width="50" height="50" src="images/assets/thumb-mp3-2.jpg" alt="#"></a>
                                    <h3><a href="mp3_single_half.html">That's My Kind Of Night </a></h3>
                                    <span> Alexander Mikoole </span>
                                    <span> 998,879 Plays </span>
                                </li>
                                <li class="clearfix">
                                    <a class="m-thumbnail" href="mp3_single_half.html"><img width="50" height="50" src="images/assets/thumb-mp3-3.jpg" alt="#"></a>
                                    <h3><a href="mp3_single_half.html">Magna Carta... Holy Grail </a></h3>
                                    <span> Joe </span>
                                    <span> 792,240 Plays </span>
                                </li>
                                <li class="clearfix">
                                    <a class="m-thumbnail" href="mp3_single_half.html"><img width="50" height="50" src="images/assets/thumb-mp3-4.jpg" alt="#"></a>
                                    <h3><a href="mp3_single_half.html">If you love me</a></h3>
                                    <span> Enrique </span>
                                    <span> 788,471 Plays </span>
                                </li>
                                <li class="clearfix">
                                    <a class="m-thumbnail" href="mp3_single_half.html"><img width="50" height="50" src="images/assets/thumb-mp3-5.jpg" alt="#"></a>
                                    <h3><a href="mp3_single_half.html">Burning For you</a></h3>
                                    <span> Lura </span>
                                    <span> 710,105 Plays </span>
                                </li>
                                <li class="clearfix">
                                    <a class="m-thumbnail" href="mp3_single_half.html"><img width="50" height="50" src="images/assets/thumb-mp3-6.jpg" alt="#"></a>
                                    <h3><a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a></h3>
                                    <span> Babel </span>
                                    <span> 611,748 Plays </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div><!-- widget content -->
            </div><!-- def block widget popular items -->

        </div><!-- span4 sidebar -->
    </div><!-- row clearfix -->

</div>

