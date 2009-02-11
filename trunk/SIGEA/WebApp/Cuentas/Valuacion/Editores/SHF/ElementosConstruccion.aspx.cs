using System;
using System.Text;
using System.Web.UI;

public partial class Cuentas_Valuacion_Editores_SHF_ElementosConstruccion : System.Web.UI.Page
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
        scripts.AppendLine("disableControls($get('form_acabados'));");
        scripts.AppendLine("disableControls($get('form_instalaciones'));");

        scripts.AppendLine("fillEstructurasData();");
        scripts.AppendLine("fillInstalacionesData();");
        scripts.AppendLine("fillInstalacionesAdicionalesData('"+ instalacionesPrivativas_Ctrl.ClientID +"');");
        scripts.AppendLine("fillInstalacionesAdicionalesData('" + instalacionesComunes_Ctrl.ClientID + "');");
        scripts.AppendLine("setupTablaSuperficiesAdicionales('" + instalacionesPrivativas_Ctrl.ClientID + "');");
        scripts.AppendLine("setupTablaSuperficiesAdicionales('" + instalacionesComunes_Ctrl.ClientID + "');");
    }
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsEntorno", scripts.ToString(), true);
    }
}
