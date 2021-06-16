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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public async Task<Token> login(string user, string password)
        {
            Token serviceResult = new Token();
            string uri = ConfigurationManager.AppSettings["production"] +"users/login/";
            HttpClient httpClient = new HttpClient();
            LoginModel loginCompanyRequest = new LoginModel();
            loginCompanyRequest.username = user;
            loginCompanyRequest.password = password;
            try
            {
                using (HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Post, uri))
                {
                    string stringContent = JsonConvert.SerializeObject(loginCompanyRequest);
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
                                serviceResult = Newtonsoft.Json.JsonConvert.DeserializeObject<Token>(responseStringContent);
                                Session["token"] = serviceResult.auth_token;
                                serviceResult.state = true;

                            }
                            else
                            {
                                Session["token"] = "";
                                serviceResult.state = false;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                
            }
            return serviceResult;
        }

        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void logins_Click1(object sender, EventArgs e)
        {
            var task = Task.Run(async () => await login(user.Text, password.Text));
            var result = task.Result;
            if (result.state)
            {
                Response.Redirect("MainMenu.aspx");
            }
        }        
    }
}