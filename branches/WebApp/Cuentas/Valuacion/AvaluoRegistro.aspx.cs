using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_AvaluoRegistro : System.Web.UI.Page
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
            throw new Exception("Identificador de avalúo no proporcionado");
        }
        scripts.AppendLine(string.Format("getRegistroAvaluo({0});", idAvaluo));        
    }
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsAvaluoRegistro", scripts.ToString(), true);
    }
    private void SetAttributes()
    {
        asignar_ImBtn.OnClientClick = "asignarAvaluo(); return false;";
        editar_ImBtn.OnClientClick = "editarAvaluo(); return false;";
        revisar_ImBtn.OnClientClick = "revisarAvaluo(); return false;";
        descargar_ImBtn.OnClientClick = "descargarAvaluo(); return false;";
    }
}
