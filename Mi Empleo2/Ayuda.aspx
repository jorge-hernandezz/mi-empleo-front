<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ayuda.aspx.cs" Inherits="Mi_Empleo2.Ayuda" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="src/css/Ayuda.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
        <div>
            <div style="background-color: #f2f5fa">
                <div class="text-center">
                    <h1 class="text-center" style="padding-top: 50px; padding-bottom: 20px;"><strong>Curriculum Vitae</strong></h1>
                </div>
                <div class="container">
                    <div class="row" style="height: 500px;">
                        <div class="col-12 col-md-6" style="margin: auto; text-align: center;">
                            <h1>¿Qué es?</h1>
                            <p style="text-align: justify;">Se trata del documento que recoge la información personal, educativa, formativa y laboral que una persona ha adquirido a lo largo de su vida. Su objetivo es el de servir como apoyo y representación ante la postulación para un puesto de trabajo.</p>
                        </div>
                        <div class="col-12 col-md-6" style="margin: auto; text-align: center;">
                            <iframe width="560" height="315" src="https://www.youtube.com/embed/uqCFn2ks34w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fondo">
                <div class="container">
                    <div class="row" style="height: 500px;">
                        <div class="col-12 col-md-6 efectss" style="margin: auto; text-align: center;">
                            <asp:Image ImageUrl="~/src/img/cv.png" runat="server" CssClass="imagen3" />
                        </div>
                        <div class="col-12 col-md-6" style="margin: auto; color: white;">
                            <h1 style="margin: auto; text-align: center;">¿Qué debe incluir un curriculum vitae?</h1>
                            <ul>
                                <li>Datos personales.</li>
                                <li>Experiencia profesional.</li>
                                <li>Formación.</li>
                                <li>Idiomas.</li>
                                <li>Habilidades y otros datos de interés.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div style="background-color: #f2f5fa">
                <div class="container">
                    <div class="row" style="height: 500px;">
                        <div class="col-12 col-md-6" style="margin: auto; text-align: center;">
                            <h2>Escoge el tipo de currículum más adecuado</h2>
                            <p style="text-align: justify;">Escoger un formato de currículum u otro dependerá especialmente de tus experiencias laborales previas. ¿Has desempeñado dos o más empleos similares al que vas a solicitar?</p>
                        </div>
                        <div class="col-12 col-md-6 efects2" style="margin: auto; text-align: center;">
                            <asp:Image ImageUrl="~/src/img/ayuda.png" runat="server" CssClass="imagen2" />
                        </div>
                    </div>
                    <div class="text-center" style="padding-bottom: 50px;">
                        <div class="btn btn-primary button2">
                            <a runat="server" class="btn-primary" style="text-decoration: none;" href="https://www.micvideal.es/">Crealo aquí</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
