using Mi_Empleo2.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mi_Empleo2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Registrar_Click(object sender, EventArgs e)
        {
            var task = Task.Run(async () => await Registro(user.Text, password.Text, name.Text, lastname.Text, email.Text));
            var result = task.Result;
            if (result.message == "success")
            {
                ClientScript.RegisterStartupScript(GetType(), "Message", @"<SCRIPT LANGUAGE='javascript'>swal(""Fallo!"", ""¡Registrado correctamente!"", ""success"");</script>");
                Response.Redirect("Login.aspx");
            }
            else
            {
                switch (result.message)
                {
                    case "not success":
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error')", true);
                        break;
                }
            }            
        }

        public async Task<RegisterResponseModel> Registro(string username, string password, string first_name, string last_name, string email)
        {
            RegisterResponseModel register = new RegisterResponseModel();
            string uri = ConfigurationManager.AppSettings["production"] + "users/register/";
            HttpClient httpClient = new HttpClient();
            RegistroModel registro = new RegistroModel();
            registro.username = username;
            registro.password = password;
            registro.email = email;
            registro.first_name = first_name;
            registro.last_name = last_name;
            try
            {
                using (HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Post, uri))
                {
                    string stringContent = JsonConvert.SerializeObject(registro);
                    HttpContent httpContent = new StringContent(stringContent, Encoding.UTF8, "application/json");
                    request.Content = httpContent;
                    httpClient.DefaultRequestHeaders.Clear();
                    using (HttpResponseMessage response = await httpClient.SendAsync(request))
                    {
                        using (HttpContent content = response.Content)
                        {
                            if (response.IsSuccessStatusCode)
                            {
                                string responseStringContent = await content.ReadAsStringAsync();
                                register = Newtonsoft.Json.JsonConvert.DeserializeObject<RegisterResponseModel>(responseStringContent);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(GetType(), "Message", @"<SCRIPT LANGUAGE='javascript'>swal(""Fallo!"", ""¡No se pudo registar el usuario!"", ""error"");</script>");
                            }                            
                        }
                    }
                }
            }
            catch (Exception e)
            {

            }
            return register;
        }
    }
}