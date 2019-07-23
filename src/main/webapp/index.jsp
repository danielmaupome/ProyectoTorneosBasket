<%-- 
    Document   : index
    Created on : 8/07/2019, 04:28:49 PM
    Author     : Cesar
--%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.io.File"%>
<%@page import="mx.com.develop.tools.ImageTools"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Hashtable"%>
<%@page import="mx.com.develop.model.MbdEquipos"%>
<%@page import="mx.com.develop.objects.Equipo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mx.com.develop.model.MbdPartidos"%>
<%@page import="mx.com.develop.objects.Partido"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Equipo> listaEquipos = new MbdEquipos().obtenerEquiposConPuntos();
    listaEquipos.sort(Equipo.getComparatorPorPuntos());//Se requiere un comparator

    ArrayList<Partido> listaPartidosSiguientes = new MbdPartidos().obtenerPartidosSiguientes();
    Date fechaSiguiente = new MbdPartidos().obtenerFechaPartidoSiguiente();
    SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat formatoFechaHora = new SimpleDateFormat("HH:mm");

    ArrayList<Partido> listaPartidosAnteriores = new MbdPartidos().obtenerPartidosAnteriores();
    Date fechaAnterior = new MbdPartidos().obtenerFechaPartidoAnterior();

    Hashtable<Integer, Equipo> equipos = new MbdEquipos().getEquipos();
    String uploadFolder = ResourceBundle.getBundle("mx.com.develop.properties.rutas").getString("rutaArchivos");
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Lobos Salvajes de Apan</title>

        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/owl.carousel.css">

        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

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
                                    <li><a href="#about">Resultados</a></li>
                                    <li><a href="#teams">Equipos</a></li>
                                    <li><a href="#news">Noticias</a></li>
                                    <li><a href="#footer">Contacto</a></li>
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

            <!-- Start Intro -->
            <div class="intro">
                <div id="home-slider" class="fixed-nav owl-carousel owl-theme">
                    <div class="item">

                        <!-- Start Video Background -->
                        <div id="video_intro" data-vide-bg="video/basketball" data-vide-options="position: 0% 50%"></div>
                        <div class="video_gradient"></div>
                        <!-- End Video Background -->

                        <div class="slide-content col-lg-6 col-lg-offset-3 col-md-12 col-sm-12 text-center">
                            <h1>Lobos salvajes de Apan</h1>
                            <p>En Apan, Hidalgo, se juega la liga con los mejores equipos de la región y el talento apanense. Cada domingo nos reunimos a pasar un buen rato en familia viendo partidos de gran calidad.</p>
                            <a href="#" class="button"><span>Ver m&aacute;s</span><i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="item">
                        <img src="img/slider/bg2.jpg" alt="">
                        <div class="slide-content col-lg-8 col-lg-offset-2 col-md-12 col-sm-12 text-center">
                            <h1>Cumpliendo sueños</h1>
                            <p>La escuela de Básquetbol infantil Cachorros de Apan, fomenta la salud y el deporte en nuestro entorno ofreciéndole a los niños y jóvenes de 8 a 18 años los fundamentos del básquetbol, a fin de que cuenten con las habilidades necesarias para desarrollar esta disciplina de manera competitiva y recreativa a través de técnicas y estrategias actualizadas, apoyadas en el uso de la tecnología, la investigación, y las mejores prácticas descubiertas a nivel mundial.</p>
                            <a href="#" class="button"><span>Ver m&aacute;s</span><i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="item">
                        <img src="img/slider/bg3.jpg" alt="">
                        <div class="slide-content col-lg-8 col-lg-offset-2 col-md-12 col-sm-12 text-center">
                            <h1>One Team. One Dream</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Expedita sequi, harum. Tenetur cumque dolorem laboriosam, similique dicta quaerat quasi quisquam vitae. Quasi placeat voluptates perferendis iure modi, ea animi ipsam.</p>
                            <a href="#" class="button"><span>Ver m&aacute;s</span><i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="item">
                        <img src="img/slider/bg4.jpg" alt="">
                        <div class="slide-content col-lg-8 col-lg-offset-2 col-md-12 col-sm-12 text-center">
                            <h1>One Team. One Dream</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Expedita sequi, harum. Tenetur cumque dolorem laboriosam, similique dicta quaerat quasi quisquam vitae. Quasi placeat voluptates perferendis iure modi, ea animi ipsam.</p>
                            <a href="#" class="button"><span>Ver m&aacute;s</span><i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="customNavigation">
                    <a class="btn prev"><i class="fa fa-angle-left"></i></a>
                    <a class="btn next"><i class="fa fa-angle-right"></i></a>
                </div>
            </div>
            <!-- End Intro -->

            <!-- Start About -->
            <div id="about" class="about">

                <!-- Start Container -->
                <div class="container">

                    <!-- Start Preamble -->
                    <div class="preamble text-center col-lg-10 col-lg-offset-1">
                        <h4>Inscríbete</h4>
                        <p>Puedes inscribir tu equipo, participar con un equipo que está inscrito o venir a apoyar a tu favorito. Impulsemos el básquetbol en Apan.</p>
                    </div>
                    <!-- End Preamble -->

                </div>
                <!-- End Container -->

                <!-- Start Nav-Tabs -->
                <ul class="nav nav-tabs list-inline horizontal-tab" role="tablist">
                    <li class="active"><a href="#matches" role="tab" data-toggle="tab">Partidos</a>
                    </li>
                    <li class=""><a href="#trainings" role="tab" data-toggle="tab">Posiciones</a>
                    </li>
                </ul>
                <!-- End Nav-Tabs -->

                <!-- Start Tab-Content -->
                <div class="tab-content">
                    <div class="container">
                        <div class="tab-pane fade active in" id="matches">

                            <!-- Start Nav-Tabs -->
                            <ul class="nav nav-tabs list-inline experience" role="tablist">
                                <li class="active"><a href="#seniors-matches" role="tab" data-toggle="tab">Libre</a>
                                </li>
                                <li class=""><a href="#juvenile-matches" role="tab" data-toggle="tab">Femenil</a>
                                </li>
                                <li class=""><a href="#veterans-matches" role="tab" data-toggle="tab">Veteranos</a>
                                </li>
                            </ul>
                            <!-- End Nav-Tabs -->

                            <!-- Start Tab Seniors -->
                            <div class="tab-pane fade active in" id="seniors-matches">

                                <!-- Start Result -->
                                <div class="upcoming col-lg-6 col-lg-offset-0 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 clearfix">
                                    <h4 class="border">&Uacute;ltimos Resultados</h4>
                                    <ul class="matches custom-list">
                                        <%for (Partido partido : listaPartidosAnteriores) {
                                                Equipo equipoLocal = equipos.get(partido.getEquipoLocal());
                                                File imagenLocal = new File(uploadFolder + equipoLocal.getLogotipo());

                                                Equipo equipoVisitante = equipos.get(partido.getEquipoVisitante());
                                                File imagenVisitante = new File(uploadFolder + equipoVisitante.getLogotipo());
                                        %>
                                        <li class="match">
                                            <div class="team text-left">
                                                <img style="width:33px; object-fit: cover;" src="<%=ImageTools.encodeFileToBase64Binary(imagenLocal)%>" alt=""><span><%=equipoLocal.getNombre()%></span>
                                            </div>
                                            <div class="marcador">
                                                <div class="marcador_izquierda"><p><%=partido.getMarcadorLocal()%></p></div>
                                                <div class="marcador_centro"><p>:</p></div>
                                                <div class="marcador_derecha"><p><%=partido.getMarcadorVisitante()%></p></div>
                                            </div>
                                            <div class="team right text-right">
                                                <span><%=equipoVisitante.getNombre()%></span>
                                                <img style="width:33px; object-fit: cover;" src="<%=ImageTools.encodeFileToBase64Binary(imagenVisitante)%>" alt="">
                                            </div>
                                        </li>
                                        <%}%>
                                    </ul>
                                    <a class="button text-left prev"><i class="fa fa-angle-left"></i><span>Anterior</span></a>
                                    <div class="match-week">
                                        <%=formatoFecha.format(fechaAnterior)%>
                                    </div>
                                    <a class="button text-right next"><span>Siguiente</span><i class="fa fa-angle-right"></i></a>
                                </div>
                                <!-- End Result -->

                                <!-- Start Upcoming -->
                                <div class="upcoming col-lg-6 col-lg-offset-0 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 clearfix">
                                    <h4 class="border">Siguientes juegos</h4>
                                    <ul class="matches custom-list">
                                        <%for (Partido partido : listaPartidosSiguientes) {
                                                Equipo equipoLocal = equipos.get(partido.getEquipoLocal());
                                                File imagenLocal = new File(uploadFolder + equipoLocal.getLogotipo());

                                                Equipo equipoVisitante = equipos.get(partido.getEquipoVisitante());
                                                File imagenVisitante = new File(uploadFolder + equipoVisitante.getLogotipo());
                                        %>
                                        <li class="match">
                                            <div class="team text-left">
                                                <img style="width:33px; object-fit: cover;" src="<%=ImageTools.encodeFileToBase64Binary(imagenLocal)%>" alt=""><span><%=equipoLocal.getNombre()%></span>
                                            </div>
                                            <div class="schedule">
                                                <span class="team-name">CENTRO</span>
                                                <span class="time"><%=formatoFechaHora.format(partido.getFecha())%></span>
                                            </div>
                                            <div class="team right text-right">
                                                <span><%=equipoVisitante.getNombre()%></span>
                                                <img style="width:33px; object-fit: cover;" src="<%=ImageTools.encodeFileToBase64Binary(imagenVisitante)%>" alt="">
                                            </div>
                                        </li>
                                        <%}%>
                                    </ul>
                                    <a class="button text-left prev"><i class="fa fa-angle-left"></i><span>Anterior</span></a>
                                    <div class="match-week">
                                        <%=formatoFecha.format(fechaSiguiente)%>
                                    </div>
                                    <a class="button text-right next"><span>Siguiente</span><i class="fa fa-angle-right"></i></a>
                                </div>
                                <!-- End Upcoming -->

                            </div>
                            <!-- End Tab Seniors -->

                            <!-- Start Tab Juvenile -->
                            <div class="tab-pane fade" id="juvenile-matches">

                                <!-- Start Result -->
                                <div class="result col-lg-6 col-lg-offset-0 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 clearfix">
                                    <h4 class="border">Latest Result</h4>
                                    <div class="team">
                                        <figure>
                                            <img src="img/team1.jpg" alt="" class="team-background">
                                            <img src="img/team1-logo.png" alt="" class="team-logo">
                                            <figcaption>
                                                FC Lorem
                                            </figcaption>
                                        </figure>
                                    </div>
                                    <div class="match-details">
                                        <header class="match-name"><h5>Match 4</h5></header>
                                        <div class="score">
                                            <span class="color">2</span>
                                            <span>:</span>
                                            <span>1</span>
                                        </div>
                                        <footer class="schedule">
                                            <span class="team-name">CENTRO</span>
                                            <span class="time">30 May 23:00</span>
                                        </footer>
                                    </div>
                                    <div class="team">
                                        <figure>
                                            <img src="img/team2.jpg" alt="" class="team-background">
                                            <img src="img/team2-logo.png" alt="" class="team-logo">
                                            <figcaption>
                                                AFC Ipsum
                                            </figcaption>
                                        </figure>
                                    </div>
                                </div>
                                <!-- End Result -->

                                <!-- Start Upcoming -->
                                <div class="upcoming col-lg-6 col-lg-offset-0 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 clearfix">
                                    <h4 class="border">Siguientes juegos</h4>
                                    <ul class="matches custom-list">
                                        <%for (Partido partido : listaPartidosSiguientes) {
                                                Equipo equipoLocal = equipos.get(partido.getEquipoLocal());
                                                File imagenLocal = new File(uploadFolder + equipoLocal.getLogotipo());

                                                Equipo equipoVisitante = equipos.get(partido.getEquipoVisitante());
                                                File imagenVisitante = new File(uploadFolder + equipoVisitante.getLogotipo());
                                        %>
                                        <li class="match">
                                            <div class="team text-left">
                                                <img style="width:33px; object-fit: cover;" src="<%=ImageTools.encodeFileToBase64Binary(imagenLocal)%>" alt=""><span><%=equipoLocal.getNombre()%></span>
                                            </div>
                                            <div class="schedule">
                                                <span class="team-name">CENTRO</span>
                                                <span class="time"><%=formatoFechaHora.format(partido.getFecha())%></span>
                                            </div>
                                            <div class="team right text-right">
                                                <span><%=equipoVisitante.getNombre()%></span>
                                                <img style="width:33px; object-fit: cover;" src="<%=ImageTools.encodeFileToBase64Binary(imagenVisitante)%>" alt="">
                                            </div>
                                        </li>
                                        <%}%>
                                    </ul>
                                    <a class="button text-left prev"><i class="fa fa-angle-left"></i><span>Anterior</span></a>
                                    <div class="match-week">
                                        <%=formatoFecha.format(fechaSiguiente)%>
                                    </div>
                                    <a class="button text-right next"><span>Siguiente</span><i class="fa fa-angle-right"></i></a>
                                </div>
                                <!-- End Upcoming -->

                            </div>
                            <!-- End Tab Juvenile -->

                            <!-- Start Tab Veteranos -->
                            <div class="tab-pane fade" id="veterans-matches">

                                <!-- Start Result -->
                                <div class="result col-lg-6 col-lg-offset-0 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 clearfix">
                                    <h4 class="border">Latest Result</h4>
                                    <div class="team">
                                        <figure>
                                            <img src="img/team1.jpg" alt="" class="team-background">
                                            <img src="img/team1-logo.png" alt="" class="team-logo">
                                            <figcaption>
                                                FC Lorem
                                            </figcaption>
                                        </figure>
                                    </div>
                                    <div class="match-details">
                                        <header class="match-name"><h5>Match 1</h5></header>
                                        <div class="score">
                                            <span class="color">5</span>
                                            <span>:</span>
                                            <span>3</span>
                                        </div>
                                        <footer class="schedule">
                                            <span class="team-name">CENTRO</span>
                                            <span class="time">30 May 23:00</span>
                                        </footer>
                                    </div>
                                    <div class="team">
                                        <figure>
                                            <img src="img/team2.jpg" alt="" class="team-background">
                                            <img src="img/team2-logo.png" alt="" class="team-logo">
                                            <figcaption>
                                                AFC Ipsum
                                            </figcaption>
                                        </figure>
                                    </div>
                                </div>
                                <!-- End Result -->

                                <!-- Start Upcoming -->
                                <div class="upcoming col-lg-6 col-lg-offset-0 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 clearfix">
                                    <h4 class="border">Siguientes juegos</h4>
                                    <ul class="matches custom-list">
                                        <%for (Partido partido : listaPartidosSiguientes) {
                                                Equipo equipoLocal = equipos.get(partido.getEquipoLocal());
                                                File imagenLocal = new File(uploadFolder + equipoLocal.getLogotipo());

                                                Equipo equipoVisitante = equipos.get(partido.getEquipoVisitante());
                                                File imagenVisitante = new File(uploadFolder + equipoVisitante.getLogotipo());
                                        %>
                                        <li class="match">
                                            <div class="team text-left">
                                                <img style="width:33px; object-fit: cover;" src="<%=ImageTools.encodeFileToBase64Binary(imagenLocal)%>" alt=""><span><%=equipoLocal.getNombre()%></span>
                                            </div>
                                            <div class="schedule">
                                                <span class="team-name">CENTRO</span>
                                                <span class="time"><%=formatoFechaHora.format(partido.getFecha())%></span>
                                            </div>
                                            <div class="team right text-right">
                                                <span><%=equipoVisitante.getNombre()%></span>
                                                <img style="width:33px; object-fit: cover;" src="<%=ImageTools.encodeFileToBase64Binary(imagenVisitante)%>" alt="">
                                            </div>
                                        </li>
                                        <%}%>
                                    </ul>
                                    <a class="button text-left prev"><i class="fa fa-angle-left"></i><span>Anterior</span></a>
                                    <div class="match-week">
                                        <%=formatoFecha.format(fechaSiguiente)%>
                                    </div>
                                    <a class="button text-right next"><span>Siguiente</span><i class="fa fa-angle-right"></i></a>

                                </div>
                                <!-- End Upcoming -->
                            </div>
                            <!-- End Tab Veteranos -->

                        </div>
                        <!-- End Matches -->

                        <!-- Start Trainings -->
                        <div class="tab-pane fade" id="trainings">

                            <!-- Start Nav-Tabs -->
                            <ul class="nav nav-tabs list-inline experience" role="tablist">
                                <li class="active"><a href="#seniors-trainings" role="tab" data-toggle="tab">Libre</a>
                                </li>
                                <li class=""><a href="#juvenile-trainings" role="tab" data-toggle="tab">Femenil</a>
                                </li>
                                <li class=""><a href="#veterans-trainings" role="tab" data-toggle="tab">Veteranos</a>
                                </li>
                            </ul>
                            <!-- End Nav-Tabs -->

                            <!-- Start Tab Seniors -->
                            <div class="tab-pane fade active in" id="seniors-trainings">
                                <div class="training-header col-lg-12 col-md-12 col-sm-12">
                                    <h4 class="border pull-left">Team 5 in Last 6 games</h4>
                                    <div class="training-dropdown pull-right">
                                        <select class="" data-placeholder="Tabla de posiciones Julio 2019">
                                            <option value="option1">Tabla de posiciones Junio 2019</option>
                                            <option value="option2">Tabla de posiciones Diciembre 2018</option>
                                            <option value="option3">Tabla de posiciones Julio 2018</option>
                                            <option value="option4">Tabla de posiciones Enero 2018</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="training-table col-lg-12 col-md-12 col-xs-12">
                                    <header>
                                        <a href="#" class="button prev pull-left"><i class="fa fa-arrow-circle-left"></i><span>Anterior</span></a>
                                        <h5>Tabla de posiciones Junio 2019</h5>
                                        <a href="#" class="button next pull-right"><span>Siguiente</span><i class="fa fa-arrow-circle-right"></i></a>
                                    </header>
                                    <table class="table-index">
                                        <tr>
                                            <th class="col-lg-1 col-md-1 col-xs-1">Posición</th>
                                            <th class="col-lg-4 col-md-4 col-xs-4">Equipo</th>
                                            <th class="col-lg-1 col-md-1 col-xs-1">Puntos a favor</th>
                                            <th class="col-lg-1 col-md-1 col-xs-1">Puntos en Contra</th>
                                            <th class="col-lg-2 col-md-2 col-xs-2">Diferencia</th>
                                            <th class="col-lg-1 col-md-1 col-xs-1">Default</th>
                                            <th class="col-lg-2 col-md-2 col-xs-2">Puntos</th>
                                        </tr>
                                        <%for (int i = 0; i < listaEquipos.size(); i++) {
                                                Equipo equipo = listaEquipos.get(i);
                                        %>
                                        <tr>
                                            <th class="col-lg-1 col-md-1 col-xs-1"><strong><%=i + 1%></strong></th>
                                            <th class="col-lg-4 col-md-4 col-xs-4"><strong><%=equipo.getNombre()%></strong></th>
                                            <th class="col-lg-1 col-md-1 col-xs-1"><%=equipo.getPuntosAFavor()%></th>
                                            <th class="col-lg-1 col-md-1 col-xs-1"><%=equipo.getPuntosEnContra()%></th>
                                            <th class="col-lg-2 col-md-2 col-xs-2"><%=equipo.getPuntosAFavor() - equipo.getPuntosEnContra()%></th>
                                            <th class="col-lg-1 col-md-1 col-xs-1"><%=equipo.getPerdidosPorDefault()%></th>
                                            <th class="col-lg-2 col-md-2 col-xs-2"><strong><%=equipo.getPuntos()%></strong></th>
                                        </tr>
                                        <%}%>
                                    </table>
                                    <footer>
                                        <span>La tabla de posiciones es actualizada cada vez que se actualizan los marcadores.</span>
                                    </footer>
                                </div>
                            </div>
                            <!-- End Tab Seniors -->

                            <!-- Start Tab Juvenile -->
                            <div class="tab-pane fade" id="juvenile-trainings">
                                <div class="training-header col-lg-12 col-md-12 col-xs-12">
                                    <h4 class="border pull-left">Team 12 in Last 6 games</h4>
                                    <div class="training-dropdown pull-right">
                                        <select class="" data-placeholder="Tabla de posiciones Julio 2019">
                                            <option value="option1">Tabla de posiciones Junio 2019</option>
                                            <option value="option2">Tabla de posiciones Diciembre 2018</option>
                                            <option value="option3">Tabla de posiciones Julio 2018</option>
                                            <option value="option4">Tabla de posiciones Enero 2018</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="training-table col-lg-12 col-md-12 col-xs-12">
                                    <header>
                                        <a href="#" class="button prev pull-left"><i class="fa fa-arrow-circle-left"></i><span>Anterior</span></a>
                                        <h5>Tabla de posiciones junio 2019</h5>
                                        <a href="#" class="button next pull-right"><span>Siguiente</span><i class="fa fa-arrow-circle-right"></i></a>
                                    </header>
                                    <table class="table-index">
                                        <tr>
                                            <th class="col-lg-1 col-md-1 col-xs-1">Posición</th>
                                            <th class="col-lg-4 col-md-4 col-xs-4">Equipo</th>
                                            <th class="col-lg-1 col-md-1 col-xs-1">Puntos a favor</th>
                                            <th class="col-lg-1 col-md-1 col-xs-1">Puntos en Contra</th>
                                            <th class="col-lg-2 col-md-2 col-xs-2">Diferencia</th>
                                            <th class="col-lg-1 col-md-1 col-xs-1">Default</th>
                                            <th class="col-lg-2 col-md-2 col-xs-2">Puntos</th>
                                        </tr>
                                        <%for (int i = 0; i < listaEquipos.size(); i++) {
                                                Equipo equipo = listaEquipos.get(i);
                                        %>
                                        <tr>
                                            <th class="col-lg-1 col-md-1 col-xs-1"><strong><%=i + 1%></strong></th>
                                            <th class="col-lg-4 col-md-4 col-xs-4"><strong><%=equipo.getNombre()%></strong></th>
                                            <th class="col-lg-1 col-md-1 col-xs-1"><%=equipo.getPuntosAFavor()%></th>
                                            <th class="col-lg-1 col-md-1 col-xs-1"><%=equipo.getPuntosEnContra()%></th>
                                            <th class="col-lg-2 col-md-2 col-xs-2"><%=equipo.getPuntosAFavor() - equipo.getPuntosEnContra()%></th>
                                            <th class="col-lg-1 col-md-1 col-xs-1"><%=equipo.getPerdidosPorDefault()%></th>
                                            <th class="col-lg-2 col-md-2 col-xs-2"><strong><%=equipo.getPuntos()%></strong></th>
                                        </tr>
                                        <%}%>
                                    </table>
                                    <footer>
                                        <span>La tabla de posiciones es actualizada cada vez que se actualizan los marcadores.</span>
                                    </footer>
                                </div>
                            </div>
                            <!-- End Tab Juvenile -->

                            <!-- Start Tab Veteranos -->
                            <div class="tab-pane fade" id="veterans-trainings">
                                <div class="training-header col-lg-12 col-md-12 col-xs-12">
                                    <h4 class="border pull-left">Team 21 in Last 6 games</h4>
                                    <div class="training-dropdown pull-right">
                                        <select class="" data-placeholder="Tabla de posiciones Julio 2019">
                                            <option value="option1">Tabla de posiciones Junio 2019</option>
                                            <option value="option2">Tabla de posiciones Diciembre 2018</option>
                                            <option value="option3">Tabla de posiciones Julio 2018</option>
                                            <option value="option4">Tabla de posiciones Enero 2018</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="training-table col-lg-12 col-md-12 col-xs-12">
                                    <header>
                                        <a href="#" class="button prev pull-left"><i class="fa fa-arrow-circle-left"></i><span>Anterior</span></a>
                                        <h5>Tabla de posiciones junio 2019</h5>
                                        <a href="#" class="button next pull-right"><span>Siguiente</span><i class="fa fa-arrow-circle-right"></i></a>
                                    </header>
                                    table-index class="table">
                                        <tr>
                                            <th class="col-lg-1 col-md-1 col-xs-1">Posición</th>
                                            <th class="col-lg-4 col-md-4 col-xs-4">Equipo</th>
                                            <th class="col-lg-1 col-md-1 col-xs-1">Puntos a favor</th>
                                            <th class="col-lg-1 col-md-1 col-xs-1">Puntos en Contra</th>
                                            <th class="col-lg-2 col-md-2 col-xs-2">Diferencia</th>
                                            <th class="col-lg-1 col-md-1 col-xs-1">Default</th>
                                            <th class="col-lg-2 col-md-2 col-xs-2">Puntos</th>
                                        </tr>
                                        <%for (int i = 0; i < listaEquipos.size(); i++) {
                                                Equipo equipo = listaEquipos.get(i);
                                        %>
                                        <tr>
                                            <th class="col-lg-1 col-md-1 col-xs-1"><strong><%=i + 1%></strong></th>
                                            <th class="col-lg-4 col-md-4 col-xs-4"><strong><%=equipo.getNombre()%></strong></th>
                                            <th class="col-lg-1 col-md-1 col-xs-1"><%=equipo.getPuntosAFavor()%></th>
                                            <th class="col-lg-1 col-md-1 col-xs-1"><%=equipo.getPuntosEnContra()%></th>
                                            <th class="col-lg-2 col-md-2 col-xs-2"><%=equipo.getPuntosAFavor() - equipo.getPuntosEnContra()%></th>
                                            <th class="col-lg-1 col-md-1 col-xs-1"><%=equipo.getPerdidosPorDefault()%></th>
                                            <th class="col-lg-2 col-md-2 col-xs-2"><strong><%=equipo.getPuntos()%></strong></th>
                                        </tr>
                                        <%}%>
                                    </table>
                                    <footer>
                                        <span>La tabla de posiciones es actualizada cada vez que se actualizan los marcadores.</span>
                                    </footer>
                                </div>
                            </div>
                            <!-- End Tab Veteranos -->

                        </div>
                        <!-- End Trainings -->

                    </div>
                </div>
                <!-- End Tab-Content -->

            </div>
            <!-- End About -->

            <!-- Start Teams -->
            <div id="teams" class="teams">
                <div class="container">

                    <!-- Start Heading -->
                    <div class="heading col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h4 class="border">EQUIPOS</h4>
                    </div>
                    <!-- End Heading -->

                    <!-- Start Teams-Frame -->
                    <div class="teams-frame col-lg-12">

                        <!-- Start Nav-Tabs -->
                        <ul class="nav nav-tabs vertical-tab col-md-12" role="tablist">
                            <li class="active"><a href="#senior-team" role="tab" data-toggle="tab">Libre</a>
                            </li>
                            <li class=""><a href="#juveline-team" role="tab" data-toggle="tab">Femenil</a>
                            </li>
                            <li class=""><a href="#veteran-team" role="tab" data-toggle="tab">Veteranos</a>
                            </li>
                        </ul>
                        <!-- End Nav-Tabs -->

                        <!-- Start Tab Seniors -->
                        <div class="tab-pane fade active in" id="senior-team">

                            <!-- Start Team-Players -->
                            <div class="team-players">
                                <%for (Equipo equipo : listaEquipos) {
                                        File imagenEquipo = new File(uploadFolder + equipo.getLogotipo());
                                %>
                                <div class="player-profile">
                                    <img style="width:184px; object-fit: cover;" src="<%=ImageTools.encodeFileToBase64Binary(imagenEquipo)%>" class="thumbnail">
                                    <span class="name"><%=equipo.getNombre()%></span>
                                </div>
                                <%}%>
                                <div class="player-profile">
                                    <img src="img/team-player10.jpg" alt="" class="thumbnail">
                                    <span class="number">19</span>
                                    <span class="name">Ola Nordmann</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player11.jpg" alt="" class="thumbnail">
                                    <span class="number">6</span>
                                    <span class="name">Mathieu Debuchy</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player8.jpg" alt="" class="thumbnail">
                                    <span class="number">4</span>
                                    <span class="name">Ican Ivanovich</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player11.jpg" alt="" class="thumbnail">
                                    <span class="number">23</span>
                                    <span class="name">Hong Gildong</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player10.jpg" alt="" class="thumbnail">
                                    <span class="number">21</span>
                                    <span class="name">Ican Ivanovich</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player7.jpg" alt="" class="thumbnail">
                                    <span class="number">22</span>
                                    <span class="name">Mathieu Debuchy</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player8.jpg" alt="" class="thumbnail">
                                    <span class="number">33</span>
                                    <span class="name">Ola Nordmann</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player6.jpg" alt="" class="thumbnail">
                                    <span class="number">9</span>
                                    <span class="name">Mathieu Debuchy</span>
                                </div>
                            </div>
                            <!-- End Team-Players -->

                        </div>
                        <!-- End Tab Seniors -->

                        <!-- Start Tab Femenil -->
                        <div class="tab-pane fade" id="juveline-team">

                            <!-- Start Team-Players -->
                            <div class="team-players">
                                <%for (Equipo equipo : listaEquipos) {
                                        File imagenEquipo = new File(uploadFolder + equipo.getLogotipo());
                                %>
                                <div class="player-profile">
                                    <img style="width:184px; object-fit: cover;" src="<%=ImageTools.encodeFileToBase64Binary(imagenEquipo)%>" class="thumbnail">
                                    <span class="name"><%=equipo.getNombre()%></span>
                                </div>
                                <%}%>
                                <div class="player-profile">
                                    <img src="img/team-player10.jpg" alt="" class="thumbnail">
                                    <span class="number">19</span>
                                    <span class="name">Ola Nordmann</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player11.jpg" alt="" class="thumbnail">
                                    <span class="number">6</span>
                                    <span class="name">Mathieu Debuchy</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player8.jpg" alt="" class="thumbnail">
                                    <span class="number">4</span>
                                    <span class="name">Ican Ivanovich</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player7.jpg" alt="" class="thumbnail">
                                    <span class="number">13</span>
                                    <span class="name">Ola Nordmann</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player8.jpg" alt="" class="thumbnail">
                                    <span class="number">45</span>
                                    <span class="name">Hong Gildong</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player10.jpg" alt="" class="thumbnail">
                                    <span class="number">11</span>
                                    <span class="name">Ola Nordmann</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player11.jpg" alt="" class="thumbnail">
                                    <span class="number">23</span>
                                    <span class="name">Hong Gildong</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player10.jpg" alt="" class="thumbnail">
                                    <span class="number">21</span>
                                    <span class="name">Ican Ivanovich</span>
                                </div>
                            </div>
                            <!-- End Team-Players -->

                        </div>
                        <!-- End Tab Femenil -->

                        <!-- Start Tab Veteranos -->
                        <div class="tab-pane fade" id="veteran-team">

                            <!-- Start Team-Players -->
                            <div class="team-players">
                                <%for (Equipo equipo : listaEquipos) {
                                        File imagenEquipo = new File(uploadFolder + equipo.getLogotipo());
                                %>
                                <div class="player-profile">
                                    <img style="width:184px; object-fit: cover;" src="<%=ImageTools.encodeFileToBase64Binary(imagenEquipo)%>" class="thumbnail">
                                    <span class="name"><%=equipo.getNombre()%></span>
                                </div>
                                <%}%>
                                <div class="player-profile">
                                    <img src="img/team-player7.jpg" alt="" class="thumbnail">
                                    <span class="number">13</span>
                                    <span class="name">Ola Nordmann</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player8.jpg" alt="" class="thumbnail">
                                    <span class="number">45</span>
                                    <span class="name">Hong Gildong</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player11.jpg" alt="" class="thumbnail">
                                    <span class="number">15</span>
                                    <span class="name">Mathieu Debuchy</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player10.jpg" alt="" class="thumbnail">
                                    <span class="number">11</span>
                                    <span class="name">Ola Nordmann</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player6.jpg" alt="" class="thumbnail">
                                    <span class="number">21</span>
                                    <span class="name">Hong Gildong</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player7.jpg" alt="" class="thumbnail">
                                    <span class="number">11</span>
                                    <span class="name">Ican Ivanovich</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player8.jpg" alt="" class="thumbnail">
                                    <span class="number">14</span>
                                    <span class="name">Hong Gildong</span>
                                </div>
                                <div class="player-profile">
                                    <img src="img/team-player9.jpg" alt="" class="thumbnail">
                                    <span class="number">18</span>
                                    <span class="name">Hong Gildong</span>
                                </div>
                            </div>
                            <!-- End Team-Players -->

                        </div>
                        <!-- End Tab Veteranos -->

                    </div>
                    <!-- End Teams-Frame -->

                </div>
            </div>
            <!-- End Teams -->

            <!-- Start News -->
            <div id="news" class="news">
                <div class="container">

                    <!-- Start Heading -->
                    <div class="heading col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h4 class="border pull-left">Noticias recientes</h4>
                        <a href="https://www.facebook.com/lobossalvajesdeapan/" target="_blank" class="rest pull-right"><span>Ver todas las noticias</span><i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                    <!-- End Heading -->

                    <!-- Start Single-News -->
                    <div class="single-news col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <article>
                            <div class="fb-page" data-href="https://www.facebook.com/lobossalvajesdeapan/" data-tabs="timeline" data-width="360" data-height="250" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/lobossalvajesdeapan/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/lobossalvajesdeapan/">Lobos Salvajes de Apan</a></blockquote></div>
                        </article>
                    </div>
                    <!-- End Single-News -->

                    <!-- Start Single-News -->
                    <div class="single-news col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <article>
                            <div class="fb-page" data-href="https://www.facebook.com/lobossalvajesdeapan/" data-tabs="timeline" data-width="360" data-height="250" data-small-header="true" data-adapt-container-width="true" data-hide-cover="true" data-show-facepile="false"><blockquote cite="https://www.facebook.com/lobossalvajesdeapan/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/lobossalvajesdeapan/">Lobos Salvajes de Apan</a></blockquote></div>
                        </article>
                    </div>
                    <!-- End Single-News -->

                    <!-- Start Single-News -->
                    <div class="single-news col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <article>
                            <div class="fb-page" data-href="https://www.facebook.com/lobossalvajesdeapan/" data-tabs="messages" data-width="360" data-height="250" data-small-header="true" data-adapt-container-width="true" data-hide-cover="true" data-show-facepile="false"><blockquote cite="https://www.facebook.com/lobossalvajesdeapan/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/lobossalvajesdeapan/">Lobos Salvajes de Apan</a></blockquote></div>
                        </article>
                    </div>
                    <!-- End Single-News -->

                </div>
            </div>
            <!-- End News -->

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
</html>
