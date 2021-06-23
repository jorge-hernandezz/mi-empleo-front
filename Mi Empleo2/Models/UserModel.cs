using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mi_Empleo2.Models
{
    public class UserModel
    {
        public string username { get; set; }
        public string image { get; set; }
        public string email { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string phone { get; set; }
        public string profession { get; set; }
        public string sites { get; set; }
        public string skills { get; set; }               
        public string experience { get; set; }               
        public string place { get; set; }  
        public string cv { get; set; }
    }
}