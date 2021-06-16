﻿using Mi_Empleo2.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mi_Empleo2
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var token = Session["token"];
            if (token == null)
            {
                Response.Redirect("Login.aspx");
            }
            var task = Task.Run(async () => await getUser());
            UserModel serviceResult = task.Result;
            if (!IsPostBack)
            {
                TBNombre.Text = serviceResult.first_name + serviceResult.last_name;
                Nombre2.Text = serviceResult.first_name + serviceResult.last_name;
                TBCarrera.Text = serviceResult.profession;
                TBCarrera2.Text = serviceResult.profession;
                LBExp.Text = serviceResult.experience;
                Imagen.ImageUrl = serviceResult.image;
            }
        }

        public async Task<UserModel> getUser()
        {
            var token = Session["token"];
            UserModel serviceResult = new UserModel();
            string uri = ConfigurationManager.AppSettings["production"] + "users/detail/";
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
                                serviceResult = Newtonsoft.Json.JsonConvert.DeserializeObject<UserModel>(responseStringContent);
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