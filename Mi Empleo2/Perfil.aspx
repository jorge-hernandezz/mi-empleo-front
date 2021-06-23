<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Mi_Empleo2.Perfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="src/css/Perfil.css" rel="stylesheet" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
    <div class="container emp-profile">
        <form runat="server">
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-img img">
                        <asp:Image runat="server" ID="image" alt="" />
                        <div class="file btn btn-lg btn-primary">
                            Cambiar foto                              
                            <asp:FileUpload runat="server" ID="FileUpload1" />
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="profile-head">
                        <h4>Información Personal</h4>
                        <asp:TextBox Text="text" runat="server" ID="TBProfe" CssClass="text-box2 foo" />
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Perfil</a>
                            </li>
                        </ul>
                    </div>
                    <asp:Button Text="Recargar" ID="recargar" OnClick="recargar_Click" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-work">
                        <p style="font-size: 20px;">Redes</p>
                        <asp:TextBox Text="text" runat="server" ID="TBSite1" CssClass="text-box foo" />
                        <br />
                        <asp:TextBox Text="text" runat="server" ID="TBSite2" CssClass="text-box margin foo" />
                        <br />
                        <asp:TextBox Text="text" runat="server" ID="TBSite3" CssClass="text-box margin foo" />
                        <br />
                        <asp:TextBox Text="text" runat="server" ID="TBSite4" CssClass="text-box margin foo" />
                        <p style="font-size: 20px;">Habilidades</p>
                        <asp:TextBox Text="text" runat="server" ID="TBSkill1" CssClass="text-box foo" />
                        <br />
                        <asp:TextBox Text="text" runat="server" ID="TBSkill2" CssClass="text-box margin foo" />
                        <br />
                        <asp:TextBox Text="text" runat="server" ID="TBSkill3" CssClass="text-box margin foo" />
                        <br />
                        <asp:TextBox Text="text" runat="server" ID="TBSkill4" CssClass="text-box margin foo" />
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="row">
                                <div class="col-md-2">
                                    <label>Usuario</label>
                                </div>
                                <div class="col-md-10">
                                    <asp:Label Text="text" runat="server" ID="LBUser" CssClass="foo" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="margin2">Nombre</label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox Text="text" runat="server" ID="TBName" CssClass="text-box2 margin2 foo" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="margin2">Apellido</label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox Text="text" runat="server" ID="TBApellido" CssClass="text-box2 margin2 foo" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="margin2">Email</label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox Text="text" runat="server" ID="TBEmail" CssClass="text-box2 margin2 foo" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="margin2">Teléfono</label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox Text="text" runat="server" ID="TBPhone" CssClass="text-box2 margin2 foo" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="margin2">Experiencia</label>
                                </div>
                                <div class="col-md-10">
                                    <asp:TextBox Text="text" runat="server" ID="TBEx" CssClass="text-box2 margin2 foo" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="margin2">Localidad</label>
                                </div>
                                <div class="col-md-10" >
                                    <asp:DropDownList runat="server" ID="DDLugar" CssClass="button text-box2 margin2 foo">
                                        <asp:ListItem Selected="True" Value="Lugar"> Lugar </asp:ListItem>
                                        <asp:ListItem Value="Delicias"> Delicias </asp:ListItem>
                                        <asp:ListItem Value="Parral">Parral  </asp:ListItem>
                                        <asp:ListItem Value="Meoqui"> Meoqui  </asp:ListItem>
                                        <asp:ListItem Value="Camargo"> Camargo  </asp:ListItem>
                                        <asp:ListItem Value="Rosales"> Rosales  </asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="margin2">Curriculum</label>
                                </div>
                                <div class="col-md-10" style="margin-top: 24px !important">
                                    <asp:FileUpload ID="FileUpload2" runat="server" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 margin2">
                                    <asp:Button Text="Editar Perfil" runat="server" ID="upload" class="profile-edit-btn" name="btnAddMore" OnClick="upload_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Experience</label>
                                </div>
                                <div class="col-md-6">
                                    <p>Expert</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Hourly Rate</label>
                                </div>
                                <div class="col-md-6">
                                    <p>10$/hr</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Total Projects</label>
                                </div>
                                <div class="col-md-6">
                                    <p>230</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>English Level</label>
                                </div>
                                <div class="col-md-6">
                                    <p>Expert</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Availability</label>
                                </div>
                                <div class="col-md-6">
                                    <p>6 months</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Your Bio</label><br />
                                    <p>Your detail description</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
