using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_Controles_DatosComparable : System.Web.UI.UserControl
{
    private StringBuilder scripts;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            scripts = new StringBuilder();

            RegisterScripts();
            SetAttributes();
        }
    }

    public short IdTipoComparable
    {
        set 
        { 
            ViewState["IdTipoComparable"] = value;
            scripts.AppendLine("setTipoComparableSelection('" + value + "');");
        }
        get { return ViewState["IdTipoComparable"] == null ? (short)0 : (short)ViewState["IdTipoComparable"]; }
    }

    private void RegisterScripts()
    {        
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsDatosComparable", scripts.ToString(), true);
    }
    private void SetAttributes()
    {
        tipoComparable_DDList.Attributes.Add("onchange", "setTipoComparableSelection(this.value); return false");
    }
}
