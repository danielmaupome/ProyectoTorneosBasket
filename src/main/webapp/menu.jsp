<%-- 
    Document   : base.jsp
    Created on : 3/07/2019, 04:27:28 PM
    Author     : Cesar
--%>

<%@page import="mx.com.develop.objects.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");
    if (usuarioEnSesion != null) {
%>

<!-- Stylesheets -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/owl.carousel.css">

<!-- Google Fonts -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!--[if IE 9]>
  <script src="js/media.match.min.js"></script>
<![endif]-->
</head>

<body>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v3.3&appId=1501505336740215&autoLogAppEvents=1"></script>
    <div id="main-wrapper">

        <!-- Start Header -->
        <header id="header" class="second-version">
            <div class="container">
                <div class="header-logo">
                    <a href="index.html"><img src="img/logo.png" alt=""></a>
                    <div class="triangle-left"></div>
                    <div class="triangle-right"></div>
                </div>
            </div>
            <div class="header-toolbar">
                <div class="container">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="header-user pull-right">
                            <ul class="custom-list">
                                <li>
                                    <div class="header-user-forms">
                                        <div class="header-login">
                                            <a href="#" class="">Entrar</a>
                                            <div>
                                                <form action="acceso.jsp" class="default-form">
                                                    <p class="form-row">
                                                        <input type="text" class="form-control" placeholder="Usuario" name="login">
                                                    </p>
                                                    <p class="form-row">
                                                        <input type="password" class="form-control" placeholder="Password" name="password">
                                                    </p>
                                                    <p class="form-row">
                                                        <input type="submit" class="btn full-width" value="Entrar">
                                                    </p>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Cart (0)</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-navbar">
                <div class="container">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <nav class="navigation">
                            <ul class="list-inline text-center custom-list">
                                <li class="has-submenu">
                                    <a href="#">Home</a>
                                </li>
                                <li><a href="#">Inicio <span class="sr-only">(current)</span></a></li>
                                <li><a href="equipos.jsp">Equipos</a></li>
                                <li><a href="jugadores.jsp">Jugadores</a></li>
                                <li><a href="partidos.jsp">Partidos</a></li>
                                <li><a href="usuarios.jsp">Usuarios</a>
                            </ul>
                        </nav>
                        <ul class="social list-inline">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                        <button class="navbar-toggle">
                            <i class="fa fa-list"></i>
                        </button>
                    </div>
                </div>
            </div>
        </header>
        <!-- End Header -->
        <!-- Start About -->
        <div id="about" class="about">

            <!-- Start Container -->
            <div class="container">
                <div class="training-table col-lg-12 col-md-12 col-xs-12">
                                    <header>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                    </header>