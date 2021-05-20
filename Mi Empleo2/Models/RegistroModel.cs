using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mi_Empleo2.Models
{
    public class RegistroModel
    {
        public string username { get; set; } 
        public string password { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string email { get; set; }
    }
}