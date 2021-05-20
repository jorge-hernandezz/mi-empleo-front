<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Mi_Empleo2.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="src/css/Registro.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" id="form">
            <div class="pb-3">
                <div class="form-container ">
                    <div class="form">
                        <h1 style="margin-top: 30px; margin-bottom:30px;">Registro</h1>
                        <asp:TextBox runat="server" placeholder="Nombre de usuario" ID="user" />
                        <asp:TextBox runat="server" placeholder="Nombre" ID="name" />
                        <asp:TextBox runat="server" placeholder="Apellido" ID="lastname" />
                        <asp:TextBox runat="server" placeholder="Contraseña" ID="password" TextMode="Password" />
                        <asp:TextBox runat="server" placeholder="Correo" ID="email" />                                                
                        <asp:Button Text="Registrar" runat="server" ID="Registrar" OnClick="Registrar_Click" CssClass="button" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
