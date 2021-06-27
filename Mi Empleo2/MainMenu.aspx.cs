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
    public partial class MainMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var token = Session["token"];
            if (token == null)
            {
                Response.Redirect("Login.aspx");
            }
            Session["MenuUsers"] = "";
            Session["DesarrolloUsers"] = "";
            Session["TecUsers"] = "";
            Session["MedicinaUsers"] = "";
            Session["TodosUsers"] = "";
        }

        protected void BTNBuscar_Click(object sender, EventArgs e)
        {
            var task = Task.Run(async () => await findUser(TBDesc.Text, DDExp.SelectedValue, DDPlace.Text));
            Session["MenuUsersList"] = task.Result;
            Session["MenuUsers"] = "0";
            Response.Redirect("Publicaciones.aspx");
        }

        public async Task<List<UsersAllModel>> findUser(string description, string experience, string place)
        {
            var token = Session["token"];
            List<UsersAllModel> serviceResult = new List<UsersAllModel>();
            string uri = ConfigurationManager.AppSettings["production"] + "users/search/";
            HttpClient httpClient = new HttpClient();

            switch (place)
            {
                case "1":
                    place = "Delicias";
                    break;
                case "2":
                    place = "Parral";
                    break;
                case "3":
                    place = "Meoqui";
                    break;
                case "4":
                    place = "Camargo";
                    break;
                case "5":
                    place = "Rosales";
                    break;
                default:
                    place = "";
                    break;
            }

            var data = new
            {
                description = description,
                experience = experience,
                place = place
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

        protected void btndes_Click(object sender, EventArgs e)
        {
            Session["DesarrolloUsers"] = "1";
            Response.Redirect("Publicaciones.aspx");
        }

        protected void btntec_Click(object sender, EventArgs e)
        {
            Session["TecUsers"] = "2";
            Response.Redirect("Publicaciones.aspx");
        }

        protected void btnall_Click(object sender, EventArgs e)
        {
            Session["TodosUsers"] = "4";
            Response.Redirect("Publicaciones.aspx");
        }

        protected void btnmedi_Click(object sender, EventArgs e)
        {
            Session["MedicinaUsers"] = "3";
            Response.Redirect("Publicaciones.aspx");
        }
    }
}