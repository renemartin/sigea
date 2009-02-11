using System;
using System.Text;
using System.Web.UI;

public partial class Cuentas_Valuacion_Editores_SHF_Entorno : System.Web.UI.Page
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
        scripts.AppendLine("disableControls($get('form'));");

        scripts.AppendLine("fillEntornoData(0);");
        scripts.AppendLine("fillEntornoViasAccesoData();");
        scripts.AppendLine("fillEntornoInfraestructuraData();");
    }
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsEntorno", scripts.ToString(), true);
    }
}
