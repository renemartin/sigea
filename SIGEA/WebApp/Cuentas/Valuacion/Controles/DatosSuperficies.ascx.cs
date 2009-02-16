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

public partial class Cuentas_Valuacion_Controles_DatosSuperficies : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string SuperficiesConstruccionesID
    {
        get { return superficiesConstrucciones_Ctrl.ClientID; }
    }
    public string SuperficiesObrasID
    {
        get { return superficiesObras_Ctrl.ClientID; }
    }
}
