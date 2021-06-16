﻿using Mi_Empleo2.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
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
    public partial class Perfil : System.Web.UI.Page
    {
        static string base64String = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            var token = Session["token"];
            if (token == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                var task = Task.Run(async () => await getUser());
                UserModel serviceResult = task.Result;
                TBName.Text = serviceResult.first_name;
                TBApellido.Text = serviceResult.last_name;
                TBEmail.Text = serviceResult.email;
                TBProfe.Text = serviceResult.profession;
                LBUser.Text = serviceResult.username;
                TBPhone.Text = serviceResult.phone;
                image.ImageUrl = serviceResult.image;
                image.Visible = true;
                SkillsModel skills = Newtonsoft.Json.JsonConvert.DeserializeObject<SkillsModel>(serviceResult.skills);
                TBSkill1.Text = skills.skill1;
                TBSkill2.Text = skills.skill2;
                TBSkill3.Text = skills.skill3;
                TBSkill4.Text = skills.skill4;
                SitesModel sites = Newtonsoft.Json.JsonConvert.DeserializeObject<SitesModel>(serviceResult.sites);
                TBSite1.Text = sites.site1;
                TBSite2.Text = sites.site2;
                TBSite3.Text = sites.site3;
                TBSite4.Text = sites.site4;
                TBEx.Text = serviceResult.experience;
                DDLugar.Text = serviceResult.experience;
            }
        }

        public System.Drawing.Image base64()
        {
            byte[] imageBytes = Convert.FromBase64String(base64String);
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
            ms.Write(imageBytes, 0, imageBytes.Length);
            System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
            return image;
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

        public async Task<bool> updateUser(UserModel user)
        {
            var token = Session["token"];
            bool responses = false;
            UserModel serviceResult = new UserModel();
            string uri = ConfigurationManager.AppSettings["production"] + "users/detail/";
            HttpClient httpClient = new HttpClient();
            try
            {
                using (HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Put, uri))
                {
                    string stringContent = JsonConvert.SerializeObject(user);
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
                                serviceResult = Newtonsoft.Json.JsonConvert.DeserializeObject<UserModel>(responseStringContent);
                                responses = true;
                                return responses;
                            }
                        }
                    }
                }
            }
            catch (WebException ex)
            {
                Console.WriteLine(ex);
            }
            return responses;
        }

        protected void upload_Click(object sender, EventArgs e)
        {
            UserModel userModel = new UserModel();
            userModel.first_name = TBName.Text;
            userModel.last_name=  TBApellido.Text;
            userModel.email = TBEmail.Text;
            userModel.profession = TBProfe.Text;
            userModel.username = LBUser.Text;
            userModel.phone = TBPhone.Text;
            if (FileUpload1.FileName != "")
            {
                System.IO.Stream fs = FileUpload1.PostedFile.InputStream;
                System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                string imagen = "data:image/png;base64," + base64String;
                userModel.image = imagen;
            }
            else
            {
                userModel.image = image.ImageUrl;
            }
            SkillsModel skills = new SkillsModel()
            {
                skill1 = TBSkill1.Text,
                skill2 = TBSkill2.Text,
                skill3 = TBSkill3.Text,
                skill4 = TBSkill4.Text
            };
            userModel.skills = JsonConvert.SerializeObject(skills);

            SitesModel sites = new SitesModel()
            {
                site1 = TBSite1.Text,
                site2 = TBSite2.Text,
                site3 = TBSite3.Text,
                site4 = TBSite4.Text
            };
            userModel.sites = JsonConvert.SerializeObject(sites);
            userModel.experience = TBEx.Text;
            userModel.place = DDLugar.Text;
            var task = Task.Run(async () => await updateUser(userModel));
        }

        protected void recargar_Click(object sender, EventArgs e)
        {
            System.IO.Stream fs = FileUpload1.PostedFile.InputStream;
            System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            image.ImageUrl = "data:image/png;base64," + base64String;
            image.Visible = true;
        }
    }
}