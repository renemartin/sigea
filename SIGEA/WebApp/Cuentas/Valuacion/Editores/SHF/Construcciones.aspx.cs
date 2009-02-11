using System;
using System.Text;
using System.Web.UI;

public partial class Cuentas_Valuacion_Editores_SHF_Construcciones : System.Web.UI.Page
{
    private StringBuilder scripts;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            scripts = new StringBuilder();

            FillData();
            RegisterScripts();
            SetAttributes();
        }
    }

    private void FillData()
    {
        scripts.AppendLine("disableControls($get('form'));");

        scripts.AppendLine("fillConstruccionesData();");
        scripts.AppendLine("fillConstruccionesClasificacionData();");
        scripts.AppendLine("fillSuperficiesData();");

        scripts.AppendLine("setupTablaConstrucciones();");
        scripts.AppendLine("setupTablaSuperficiesAdicionales('"+ superficiesConstrucciones_Ctrl.ClientID +"');");
        scripts.AppendLine("setupTablaSuperficiesAdicionales('"+ superficiesObras_Ctrl.ClientID +"');");
    }
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsConstrucciones", scripts.ToString(), true);
    }
    private void SetAttributes()
    {
        editarUsoActua_ImBtn.OnClientClick = "editUsoActual(); return false;";
    }
}
