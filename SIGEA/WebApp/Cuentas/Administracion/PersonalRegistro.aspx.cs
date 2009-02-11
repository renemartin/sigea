using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Administracion_PersonalRegistro : System.Web.UI.Page
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
        int idPersonal = 0;
        if (Request.QueryString["idPersonal"] != null)
        {
            if (!int.TryParse(Request.QueryString["idPersonal"], out idPersonal))
                throw new Exception("Identificador de personal inválido");
        }
        scripts.AppendLine(string.Format("loadPersonal({0});", idPersonal));
    }
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsPersonalRegistro", scripts.ToString(), true);
    }
    private void SetAttributes()
    {
        save_ImBtn.Attributes.Add("onClick", "savePersonal(); return false");
    }
}
