<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="Mi_Empleo2.MainMenu" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="src/css/Menu.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous" />
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
        <div class="imgPrin">
            <div class="sombreado"></div>
            <div class="container text-color" style="position: relative">
                <div class="row" style="padding-top: 160px;">
                    <h1 style="color: white;">Mi Empleo</h1>
                    <p class="text-chido">Busca trabajo, empleate y oportunidades</p>
                    <div class="col-3">
                        <asp:TextBox runat="server" placeholder="Trabajo, Descripcion" CssClass="button" ID="TBDesc"/>
                    </div>

                    <div class="col-3">
                        <asp:DropDownList runat="server" placeholder="Experiencia" CssClass="button" ID="DDExp">
                            <asp:ListItem Selected="True" Value="1"> 1-3 Años </asp:ListItem>
                            <asp:ListItem Value="3"> 3-5 Años  </asp:ListItem>
                            <asp:ListItem Value="5">5-8 Años  </asp:ListItem>
                            <asp:ListItem Value="8"> 8+ Años  </asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-3">
                        <asp:DropDownList runat="server" CssClass="button" ID="DDPlace">
                            <asp:ListItem Selected="True" Value="0"> Lugar </asp:ListItem>
                            <asp:ListItem Value="1"> Delicias </asp:ListItem>
                            <asp:ListItem Value="2">Parral  </asp:ListItem>
                            <asp:ListItem Value="3"> Meoqui  </asp:ListItem>
                            <asp:ListItem Value="4"> Camargo  </asp:ListItem>
                            <asp:ListItem Value="5"> Rosales  </asp:ListItem>
                        </asp:DropDownList>

                    </div>
                    <div class="col-3">
                        <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary button2" ID="BTNBuscar" OnClick="BTNBuscar_Click"/>
                    </div>                    
                    <div id="carro" style="padding-top: 180px;">
                        <div class="text-center" style="padding-bottom:20px;">
                            <asp:Label Text="Trabajos que pueden interesarte" runat="server" CssClass="text-chido"/>
                        </div>                        
                        <div class="container">                            
                            <a class="card">
                                <h3 class="title">Desarrollo</h3>
                                <div class="bar">
                                    <div class="emptybar"></div>
                                    <div class="filledbar"></div>
                                </div>
                                <div class="circle">
                                    <i class="fas fa-code fa-5x"></i>
                                </div>
                            </a>
                            <a class="card">
                                <h3 class="title">Tecnologia</h3>
                                <div class="bar">
                                    <div class="emptybar"></div>
                                    <div class="filledbar"></div>
                                </div>
                                <div class="circle">
                                    <i class="fas fa-laptop fa-5x"></i>
                                </div>
                            </a>
                            <a class="card">
                                <h3 class="title">Medicina</h3>
                                <div class="bar">
                                    <div class="emptybar"></div>
                                    <div class="filledbar"></div>
                                </div>
                                <div class="circle">
                                    <i class="fas fa-notes-medical fa-7x"></i>
                                </div>
                            </a>
                            <a class="card" href="Publicaciones.aspx">
                                <h3 class="title">Todos los Trabajos</h3>
                                <div class="bar">
                                    <div class="emptybar"></div>
                                    <div class="filledbar"></div>
                                </div>
                                <div class="circle">
                                    <i class="fas fa-list-ul fa-7x"></i>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
</body>
</html>
