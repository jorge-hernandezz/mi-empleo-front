<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Mi_Empleo2.WebForm1" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="src/css/Login.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" id="form">
            <div class="pb-3">
                <div class="form-container sign-up-container">
                    
                        <h1>Create Account</h1>
                        <div class="social-container">
                            <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                            <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                        <span>or use your email for registration</span>
                        <input type="text" placeholder="Name" />
                        <input type="email" placeholder="Email" />
                        <input type="password" placeholder="Password" />
                        <button>Sign Up</button>
                  
                </div>
                <div class="form-container sign-in-container">
                    <div class="form">
                        <h1>Iniciar Sesión</h1>
                        <asp:TextBox runat="server" ID="user" placeholder="Nombre de Usuario" />
                        <asp:TextBox runat="server" ID="password" TextMode="Password" placeholder="Contraseña"/>
                        <a href="#">¿Olvidaste tu contraseña?</a>
                        <asp:Button Text="Iniciar" runat="server" ID="logins" OnClick="logins_Click1" CssClass="button" />
                    </div>
                </div>
                <div class="overlay-container">
                    <div class="overlay">
                        <div class="overlay-panel overlay-right">
                            <h1>¿Buscas Empleo?</h1>
                            <p>Ingrese sus datos personales y comience su busqueda de empleo</p>
                            <asp:Button Text="Registrar" runat="server" ID="register" OnClick="register_Click" CssClass="button" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
