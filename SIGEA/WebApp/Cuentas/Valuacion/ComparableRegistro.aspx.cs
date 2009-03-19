using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Administracion_ComparableRegistro : System.Web.UI.Page
{
    private StringBuilder script;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            script = new StringBuilder();

            LoadData();
            RegisterScripts();
            SetAttributes();
        }
    }

    private void LoadData()
    {
        int idComparable = 0;
        if (Request.QueryString["idComparable"] != null)
        {
            if (!int.TryParse(Request.QueryString["idComparable"], out idComparable))
                throw new Exception("Identificador de comparable invalido");
        }
        script.AppendLine(string.Format("loadComparable('{0}');", idComparable));
    }

    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptComparableInmobiliario", script.ToString(), true);
    }

    private void SetAttributes()
    {
        save_ImBtn.Attributes.Add("onClick", "saveComparable(); return false");
        cancel_ImBtn.Attributes.Add("onClick", "window.location.href='Comparables.aspx'; return false;");
    }
}
