<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
    <title>Remix - Music & Band Site Template HTML5 and CSS3</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <!-- Seo Meta -->
    <meta name="description" content="Remix - Music & Band Site Template HTML5 and CSS3">
    <meta name="keywords"
          content="remix, music, light, dark, themeforest, multi purpose, band, css3, html5">

    <!-- Styles -->
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.min.css"
          media="screen"/>
    <link rel="stylesheet" type="text/css" href="style.css" id="dark" media="screen"/>
    <link rel="stylesheet" type="text/css" href="js/rs-plugin/css/settings.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="styles/icons/icons.css" media="screen"/>
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>

    <!-- Favicon -->
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=EmulateIE8; IE=EDGE"/>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" type="text/css" href="styles/icons/font-awesome-ie7.min.css"/>
    <![endif]-->
</head>
<body>
<tiles:insertAttribute name="header"/>
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="footer"/>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/codevz.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
<script type="text/javascript" src="js/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="js/jquery.jplayer.js"></script>
<script type="text/javascript" src="js/ttw-music-player-min.js"></script>
<script type="text/javascript" src="music/myplaylist.js"></script>
<script type="text/javascript" src="js/countdown.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<script type="text/javascript">
    /* <![CDATA[ */
    jQuery(document).ready(function () {

        jQuery('.tp-banner').revolution({
            delay: 9000,
            startwidth: 1060,
            startheight: 610,
            hideThumbs: 10,
            navigationType: "off",
            fullWidth: "on",
            forceFullWidth: "on"
        });

        jQuery("#event1").countdown({
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