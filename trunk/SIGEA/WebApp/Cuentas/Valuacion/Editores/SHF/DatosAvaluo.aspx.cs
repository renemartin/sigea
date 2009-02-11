using System;
using System.Text;
using System.Web.UI;

public partial class Cuentas_Valuacion_Editores_SHF_DatosAvaluo : System.Web.UI.Page
{
    private StringBuilder scripts;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            scripts = new StringBuilder();

            LoadData();
            Initialization();
            RegisterScripts();
            SetAttributes();
        }
    }

    private void LoadData()
    {
        int idAvaluo = 0;
        if (Request.QueryString["idAvaluo"] != null)
        {
            if (!int.TryParse(Request.QueryString["idAvaluo"], out idAvaluo))
                throw new Exception("Identificador de avalúo inválido");
        }
        else
        {
            throw new Exception("Identificador de avalúo no proporcionado");
        }
        scripts.AppendLine(string.Format("loadForm({0});", idAvaluo));
    }
    private void Initialization()
    {        
        scripts.AppendLine("setupForm();");
    }
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsDatosAvaluo", scripts.ToString(), true);
    }
    private void SetAttributes()
    {
        navegador_Ctrl.AccionEditar = "editForm(); return false;";
        navegador_Ctrl.AccionGuardar = "saveForm(); return false;";
        navegador_Ctrl.AccionCancelar = "cancelEdit(); return false;";
    }
}
