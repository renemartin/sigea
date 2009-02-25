using System;
using System.Text;
using System.Web.UI;

public partial class Cuentas_Administracion_ValuadorRegistro : System.Web.UI.Page
{
    private StringBuilder scripts;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            scripts = new StringBuilder();

            LoadData();
            RegisterScripts();
            SetAttributes();
        }
    }

    private void LoadData()
    {
        int idValuador = 0;
        if (Request.QueryString["idValuador"] != null)
        {
            if (!int.TryParse(Request.QueryString["idValuador"], out idValuador))
                throw new Exception("Identificador de valuador inválido");
        }
        scripts.AppendLine(string.Format("loadValuador({0});", idValuador));
    }
    private void RegisterScripts()
    {
        scripts.AppendLine("setupValidator();");
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsValuadorRegistro", scripts.ToString(), true);
    }
    private void SetAttributes()
    {
        save_ImBtn.Attributes.Add("onClick", "saveValuador(); return false");
    }
}
