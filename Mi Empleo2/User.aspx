<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Mi_Empleo2.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="src/css/user.css" rel="stylesheet" />
    <link href="src/css/fontawesome-all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous" />
    <title></title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="padding-left: 15px;">
        <a class="navbar-brand" href="#">Mi Empleo</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="MainMenu.aspx">Inicio </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Perfil.aspx">Perfil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Ayuda.aspx">Ayuda</a>
                </li>
            </ul>
        </div>
    </nav>
    <form id="form1" runat="server">
        <!-- Nav -->
        <!-- Home -->
        <article id="top" class="wrapper style1">
            <div class="container">
                <div class="row">
                    <div class="col-4 col-5-large col-12-medium">
                        <span class="image fit">
                            <asp:Image ImageUrl="imageurl" runat="server" ID="Imagen" />
                        </span>
                    </div>
                    <div class="col-8 col-7-large col-12-medium">
                        <header>
                            <asp:Label Text="" runat="server" ID="TBNombre" CssClass="title1" />
                            <br />
                            <asp:Label Text="" runat="server" ID="TBCarrera" CssClass="title2" />
                        </header>
                        <p>
                            Hola! Soy 
                        <asp:Label Text="Jorge Hernandez" runat="server" ID="Nombre2" />
                            <asp:Label Text="Software Development" runat="server" ID="TBCarrera2" />
                            con
                            <asp:Label Text="3" runat="server" ID="LBExp" />
                            años de experiencia
                        especializado en 
                            <asp:Label Text="Desarrollador WEB" runat="server" ID="lbs4" />
                            <asp:Label Text="HTML" runat="server" ID="lbs1" />
                            <asp:Label Text="CSS" runat="server" ID="lbs2"/>
                            <asp:Label Text="Django Rest Framework" runat="server" ID="lbs3" />
                            si estas interesado en mi descarga mi CV.
                        </p>
                        <%= cv %>
                        <%--<asp:LinkButton Text="Descarga CV" ID="CV" OnClick="CV_Click" CssClass="button large scrolly" runat="server" />--%>
                        <!-- <a href="#contact" class="button large scrolly">Contactame</a> -->
                    </div>
                </div>
            </div>
        </article>
        <!-- Contact -->
        <article id="contact" class="wrapper style4">
            <div class="container medium">
                <header>
                    <h2>Contacta conmigo</h2>
                </header>
               <%-- <div class="row">
                    <div class="col-12">--%>

                       <%-- <p>Si requieres más información sobre mi.</p>--%>
                        <%--<form method="post" action="#">
                            <div class="row">
                                <div class="col-6 col-12-small">
                                    <input type="text" name="name" id="name" placeholder="Nombre" />
                                </div>
                                <div class="col-6 col-12-small">
                                    <input type="text" name="email" id="email" placeholder="Email" />
                                </div>
                                <div class="col-12">
                                    <input type="text" name="subject" id="subject" placeholder="Asunto" />
                                </div>
                                <div class="col-12">
                                    <textarea name="message" id="message" placeholder="Mensaje"></textarea>
                                </div>
                                <div class="col-12">
                                    <ul class="actions">
                                        <li>
                                            <input type="submit" value="Enviar Mensaje" /></li>
                                        <li>
                                            <input type="reset" value="Limpiar Formulario" class="alt" /></li>
                                    </ul>
                                </div>
                            </div>
                        </form>--%>
                    </div>
                    <div class="col-12">
                        <hr />
                        <h3>Encuentrame en mis redes</h3>
                        <ul class="social">
                            <li><a href="<%= link%>" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
                            <li><a href="<%= twiter%>" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                            <li><a href="<%= face%>" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                            <!--
								<li><a href="#" class="icon solid fa-rss"><span>RSS</span></a></li>
								<li><a href="#" class="icon brands fa-instagram"><span>Instagram</span></a></li>
								<li><a href="#" class="icon brands fa-foursquare"><span>Foursquare</span></a></li>
								<li><a href="#" class="icon brands fa-skype"><span>Skype</span></a></li>
								<li><a href="#" class="icon brands fa-soundcloud"><span>Soundcloud</span></a></li>
								<li><a href="#" class="icon brands fa-youtube"><span>YouTube</span></a></li>
								<li><a href="#" class="icon brands fa-blogger"><span>Blogger</span></a></li>
								<li><a href="#" class="icon brands fa-flickr"><span>Flickr</span></a></li>
								<li><a href="#" class="icon brands fa-vimeo"><span>Vimeo</span></a></li>
								-->
                        </ul>
                        <hr />
                    </div>
                <%--</div>
                <footer>
                    <ul id="copyright">
                        <li>&copy; Derechos Reservados</li>
                        <li>Design: <a href="http://html5up.net">SORUS</a></li>
                    </ul>
                </footer>
            </div>--%>
        </article>

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/browser.min.js"></script>
        <script src="assets/js/breakpoints.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>
    </form>
</body>
</html>
