using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_Editores_SHF_Modulos_Georeferencias : System.Web.UI.Page
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
        }
        scripts.AppendLine(string.Format("loadGeolocalizacion({0});", idAvaluo));
    }

    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(typeof(Page), "scriptsGeolocalizacion", scripts.ToString(), true);
    }

    private void SetAttributes()
    {
        save_ImBtn.Attributes.Add("onClick", "saveGeolocalizacion(); return false");
        absolutos_RBtn.Attributes.Add("onclick", "setVisibilityFormato(true); ");
        grados_RBtn.Attributes.Add("onclick", "setVisibilityFormato(true);");
    }
}
