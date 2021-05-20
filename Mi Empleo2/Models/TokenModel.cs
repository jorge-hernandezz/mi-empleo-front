using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mi_Empleo2.Models
{
    public class Token
    {
        public string auth_token { get; set; }
        public bool state { get; set; }
    }
}