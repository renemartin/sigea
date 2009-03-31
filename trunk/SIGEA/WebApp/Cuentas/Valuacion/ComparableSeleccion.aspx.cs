using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using SIGEA.Classes.Entities;

public partial class Cuentas_Valuacion_ComparableSeleccion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void SetupContext(object sender, LinqDataSourceContextEventArgs e)
    {
        e.ObjectInstance = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
    }
}
