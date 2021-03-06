<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Publicaciones.aspx.cs" Inherits="Mi_Empleo2.Publicaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="src/css/Publicaciones.css" rel="stylesheet" />
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
        <div class="fondo" style="border-bottom-left-radius: 100px; border-bottom-right-radius: 100px;">
            <div class="container text-color" style="position: relative">
                <div class="row" style="padding-top: 60px; height: 140px;">
                    <h1 style="color: white;">Mi Empleo</h1>
                    <%--<div class="col-3">
                        <asp:TextBox runat="server" placeholder="Trabajo, Descripcion" CssClass="button" />
                    </div>
                    <div class="col-3">
                        <asp:DropDownList runat="server" CssClass="button">
                            <asp:ListItem Selected="True" Value="White"> Lugar </asp:ListItem>
                            <asp:ListItem Value="Silver"> Delicias </asp:ListItem>
                            <asp:ListItem Value="DarkGray">Parral  </asp:ListItem>
                            <asp:ListItem Value="Khaki"> Meoqui  </asp:ListItem>
                            <asp:ListItem Value="Khaki"> Camargo  </asp:ListItem>
                            <asp:ListItem Value="Khaki"> Rosales  </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-5">
                        <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary button2" />
                    </div>--%>
                </div>
            </div>
        </div>
    </form>
    <div class="container">
        <% foreach (var x in listUsers)
            { %>
        <div class="courses-container">
            <div class="course">
                <div class="course-preview">
                    <h2><%= x.first_name%> <%= x.last_name%></h2>
                </div>
                <div class="course-info">
                    <h6>Especialidad</h6>
                    <h2><%= x.profession %></h2>
                    <form action="/User.aspx">
                        <input type="text" id="user" name="user" hidden="hidden" value="<%= x.id %>" />
                        <button type="submit" class="btn2">Continuar</button>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</body>
</html>
