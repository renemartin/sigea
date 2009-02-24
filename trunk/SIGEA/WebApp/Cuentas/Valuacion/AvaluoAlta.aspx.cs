using System;
using System.Text;
using System.Web.UI;

public partial class Cuentas_Valuacion_AvaluoAlta : System.Web.UI.Page
{
    private StringBuilder scripts;
    private enum PageMode { Personal, Valuador }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            scripts = new StringBuilder();

            SetMode(PageMode.Personal);
            FillData();
            RegisterScripts();
            SetAttributes();
        }
    }

    private void SetMode(PageMode pageMode)
    {
        if (pageMode == PageMode.Personal)
        {
            scripts.AppendLine("setModoPersonal();");
        }
        else
        {
            //TODO: Falta jalar el id del valuador
            scripts.AppendLine("setModoValuador(0);");
        }
    }

    private void FillData()
    {
        scripts.AppendLine("fillAvaluoData();");
        scripts.AppendLine("fillInmuebleData();");
        //scripts.AppendLine("fillDireccionData_Aux('" + datosInmueble_Ctrl.DireccionID + "');");
        //scripts.AppendLine("fillDireccionData_Aux('" + datosSolicitante_Ctrl.DireccionID + "');");
        //scripts.AppendLine("fillDireccionData_Aux('" + datosPropietario_Ctrl.DireccionID + "');");
    }
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsAvaluoAlta", scripts.ToString(), true);
    }
    private void SetAttributes()
    {
        guardar_ImBtn.Attributes.Add("onclick", "saveAvaluo(); return false;");
    }
}
