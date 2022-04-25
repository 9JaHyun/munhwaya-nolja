<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<!DOCTYPE html>
<html>
<head>
    <title>CCC</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <!-- Seo Meta -->
    <meta name="description" content="Remix - Music & Band Site Template HTML5 and CSS3">
    <meta name="keywords"
          content="remix, music, light, dark, themeforest, multi purpose, band, css3, html5">

    <!-- Styles -->
    <link rel="stylesheet" type="text/css" href="${resources}/bootstrap/css/bootstrap.min.css"
          media="screen"/>
    <link rel="stylesheet" type="text/css"
          href="${resources}/bootstrap/css/bootstrap-responsive.min.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${resources}/style.css" id="dark" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${resources}/js/rs-plugin/css/settings.css"
          media="screen"/>
    <link rel="stylesheet" type="text/css" href="${resources}/styles/icons/icons.css"
          media="screen"/>
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>

    <!-- Favicon -->
    <link rel="shortcut icon" href="${resources}/images/favicon.ico">
    <link rel="apple-touch-icon" href="${resources}/images/apple-touch-icon.png">
</head>

<body id="fluidGridSystem">
<div id="layout" class="full">
    <tiles:insertAttribute name="header"/>
    	<div class="under_header">
			<img src="resources/images/assets/mypageback.png" alt="#">
		</div>
		<div class="page-content back_to_up">
	    	<div class="row row-fluid clearfix mbf" style="margin-left:150px;">
	    <tiles:insertAttribute name="sidebar"/>
	   			<div class="span8 posts">
	    			<div class="def-block" style="width:1000px;">
	    				<div class="post row-fluid clearfix">
	<tiles:insertAttribute name="body"/>
	     				</div>
	    			</div>
				</div>
	    	</div>
	    </div>
    <tiles:insertAttribute name="footer"/>
</div>

<script type="text/javascript" src="${resources}/js/jquery.min.js"></script>
<script type="text/javascript" src="${resources}/js/codevz.js"></script>
<script type="text/javascript" src="${resources}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${resources}/js/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
<script type="text/javascript" src="${resources}/js/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="${resources}/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="${resources}/js/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="${resources}/js/jquery.jplayer.js"></script>
<script type="text/javascript" src="${resources}/js/ttw-music-player-min.js"></script>
<script type="text/javascript" src="${resources}/music/myplaylist.js"></script>
<script type="text/javascript" src="${resources}/js/countdown.js"></script>
<script type="text/javascript" src="${resources}/js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="${resources}/js/custom.js"></script>
<script type="text/javascript">
    /* <![CDATA[ */
    $(document).ready(function () {

        $('.tp-banner').revolution({
            delay: 9000,
            startwidth: 1060,
            startheight: 610,
            hideThumbs: 10,
            navigationType: "off",
            fullWidth: "on",
            forceFullWidth: "on"
        });

        $("#event1").countdown({
                date: "31 December 2023 23:59:59",
                format: "on"
            },
            function () {
                // callback function
            });

    });
    /* ]]> */
</script>
</body>
</html>