using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_Editores_SHF_Modulos_Escrituras : System.Web.UI.Page
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
        int idAvaluo = 0;
        if (Request.QueryString["idAvaluo"] != null)
        {
            if (!int.TryParse(Request.QueryString["idAvaluo"], out idAvaluo))
            {
                throw new Exception("Identificador de avalúo inválido");
            }
            scripts.AppendLine(string.Format("loadEscrituras({0});", idAvaluo));
        }
    }
    private void RegisterScripts()
    {
        scripts.AppendLine("setupValidator();");
        Page.ClientScript.RegisterStartupScript(typeof(Page), "scriptsEscrituras", scripts.ToString(), true);
    }

    private void SetAttributes()
    {
        save_ImBtn.Attributes.Add("onClick", "saveEscrituras(); return false");
    }
}
