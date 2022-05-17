using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bus_Start
{
    public partial class bus : System.Web.UI.Page
    {
        public List <string> stopname = null;
        public List<string> lng = null;
        public List<string> lat = null;
        public List<string> postion = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}