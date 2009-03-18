using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_Editores_SHF_EditorSHF : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SetAttributes();
        }
    }

    private void SetAttributes()
    {
        fotografias_ImBtn.OnClientClick = "openModalWindow('Modulos/Fotografias.aspx?idAvaluo="+ 
                Page.Request.QueryString["idAvaluo"] +"', 680, 550); return false;";

        planos_ImBtn.OnClientClick = "openModalWindow('Modulos/Planos.aspx?idAvaluo=" +
                Page.Request.QueryString["idAvaluo"] + "', 850, 550); return false;";
        
        mapas_ImBtn.OnClientClick = "return false;";
        
        documentos_ImBtn.OnClientClick = "return false;";

        escrituras_ImBtn.OnClientClick = "openModalWindow('Modulos/Escrituras.aspx?idAvaluo=" +
                Page.Request.QueryString["idAvaluo"] + "', 320, 320); return false;";
    }
}
