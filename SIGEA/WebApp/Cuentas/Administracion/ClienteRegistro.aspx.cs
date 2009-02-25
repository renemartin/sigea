using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Administracion_ClienteRegistro : System.Web.UI.Page
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
        int idCliente = 0;
        if (Request.QueryString["idCliente"] != null)
        {
            if (!int.TryParse(Request.QueryString["idCliente"], out idCliente))
                throw new Exception("Identificador de cliente inválido");
        }
        scripts.AppendLine(string.Format("loadCliente({0});", idCliente));
    }
    private void RegisterScripts()
    {
        scripts.AppendLine("setupValidator();");
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsClienteRegistro", scripts.ToString(), true);
    }
    private void SetAttributes()
    {
        save_ImBtn.Attributes.Add("onClick", "saveCliente(); return false");
    }
}
