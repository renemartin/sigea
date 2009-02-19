using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Administracion_Comparables : System.Web.UI.Page
{
    private StringBuilder scripts;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            scripts = new StringBuilder();
            scripts.AppendLine(string.Format("fillTipoComparable('{0}');", filtroComparables_DDList.ClientID));
            RegisterScripts();        
        }
    }
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
                typeof(Page), "scriptComparable", scripts.ToString(), true);
    }
}
