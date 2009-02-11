using System;
using System.Text;
using System.Web.UI;

public partial class Cuentas_Valuacion_Editores_SHF_DatosInmueble : System.Web.UI.Page
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
        scripts.AppendLine("disableControls($get('form_inmueble'));");
        scripts.AppendLine("disableControls($get('form_terreno'));");

        scripts.AppendLine("fillInmuebleData();");
        scripts.AppendLine("fillTerrenoData();");
        scripts.AppendLine("fillTerrenoCallesData();");
        scripts.AppendLine("fillTerrenoColindanciasData();");
        scripts.AppendLine("fillDireccionData_Aux('" + datosInmueble_Ctrl.DireccionID + "');");
        scripts.AppendLine("fillDireccionData_Aux('" + datosPropietario_Ctrl.DireccionID + "');");
    }
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsDatosInmueble", scripts.ToString(), true);
    }
}
