using Mi_Empleo2.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mi_Empleo2
{
    public partial class Publicaciones : System.Web.UI.Page
    {
        public List<UsersAllModel> listUsers;
        protected void Page_Load(object sender, EventArgs e)
        {
            var token = Session["token"];
            if (token == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (Session["MenuUsers"] != null)
            {
                listUsers = (List<UsersAllModel>)Session["MenuUsers"];
                //Session["MenuUsers"] = null;
            }
            else if (Session["DesarrolloUsers"] != null)
            {
                string desarrollo = "desarrollo";
                var task = Task.Run(async () => await getUsersCategory(desarrollo));
                listUsers = task.Result;
                //Session["DesarrolloUsers"] = null;
            }
            else if (Session["TecUsers"] != null)
            {
                string tecnologias = "tecnologias";
                var task = Task.Run(async () => await getUsersCategory(tecnologias));
                listUsers = task.Result;
                //Session["TecUsers"] = null;
            }
            else if (Session["MedicinaUsers"] != null)
            {
                string medicina = "medicina";
                var task = Task.Run(async () => await getUsersCategory(medicina));
                listUsers = task.Result;
                //Session["MedicinaUsers"] = null;
            }
            else if (Session["TodosUsers"] != null)
            {
                var task = Task.Run(async () => await getUsers());
                listUsers = task.Result;
                //Session["TodosUsers"] = null;
            }
        }

        public async Task<List<UsersAllModel>> getUsers()
        {
            var token = Session["token"];
            List<UsersAllModel> serviceResult = new List<UsersAllModel>();
            string uri = ConfigurationManager.AppSettings["production"] + "users/list/all/";
            HttpClient httpClient = new HttpClient();
            try
            {
                using (HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Get, uri))
                {
                    request.Headers.Add("Authorization", "Token " + token);
                    using (HttpResponseMessage response = await httpClient.SendAsync(request))
                    {
                        using (HttpContent content = response.Content)
                        {
                            if (response.IsSuccessStatusCode)
                            {
                                string responseStringContent = await content.ReadAsStringAsync();
                                serviceResult = Newtonsoft.Json.JsonConvert.DeserializeObject<List<UsersAllModel>>(responseStringContent);
                                return serviceResult;
                            }
                        }
                    }
                }
            }
            catch (WebException ex)
            {
                Console.WriteLine(ex);
            }
            return serviceResult;
        }

        public async Task<List<UsersAllModel>> getUsersCategory(string category)
        {
            var token = Session["token"];
            List<UsersAllModel> serviceResult = new List<UsersAllModel>();
            string uri = ConfigurationManager.AppSettings["production"] + "users/category/";
            HttpClient httpClient = new HttpClient();
            var data = new
            {
                category = category
            };
            try
            {
                using (HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Post, uri))
                {
                    string stringContent = JsonConvert.SerializeObject(data);
                    HttpContent httpContent = new StringContent(stringContent, Encoding.UTF8, "application/json");
                    request.Content = httpContent;
                    request.Headers.Add("Authorization", "Token " + token);
                    using (HttpResponseMessage response = await httpClient.SendAsync(request))
                    {
                        using (HttpContent content = response.Content)
                        {
                            if (response.IsSuccessStatusCode)
                            {
                                string responseStringContent = await content.ReadAsStringAsync();
                                serviceResult = Newtonsoft.Json.JsonConvert.DeserializeObject<List<UsersAllModel>>(responseStringContent);
                                return serviceResult;
                            }
                        }
                    }
                }
            }
            catch (WebException ex)
            {
                Console.WriteLine(ex);
            }
            return serviceResult;
        }
    }
}