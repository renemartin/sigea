using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_AvaluoAsignacion : System.Web.UI.Page
{
    StringBuilder scripts;

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
        int idAvaluo = 0;
        if (Request.QueryString["idAvaluo"] != null)
        {
            if (!int.TryParse(Request.QueryString["idAvaluo"], out idAvaluo))
                throw new Exception("Identificador de avalúo inválido");
        }
        else
        {
            throw new Exception("Identificador de avalúo inválido no proporcionado");
        }        
        scripts.AppendLine(string.Format("loadAsignacionAvaluo({0});", idAvaluo));
        scripts.AppendLine("getEstadoInmuebleAvaluo();");
    }
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsAvaluoAsignacion", scripts.ToString(), true);
    }
    private void SetAttributes()
    {
        guardar_ImBtn.OnClientClick = "saveAsignacionAvaluo(); return false;";
        eliminar_ImBtn.OnClientClick = "deleteAsignacionAvaluo(); return false;";
        agregarFiltro_ImBtn.OnClientClick = "agregarFiltro(); return false;";
        removerFiltro_ImBtn.OnClientClick = "removerFiltro(); return false;";
    }
}
