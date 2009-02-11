using System;
using System.Text;
using System.Web.UI;

public partial class Cuentas_Valuacion_Editores_SHF_Modulos_UsoActual : System.Web.UI.Page
{
    private StringBuilder scripts;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            scripts = new StringBuilder();

            FillData();
            RegisterScripts();
        }
    }

    private void FillData()
    {
        scripts.AppendLine("setupTablaRecamaras();");
    }
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsUsoActual", scripts.ToString(), true);
    }
}
