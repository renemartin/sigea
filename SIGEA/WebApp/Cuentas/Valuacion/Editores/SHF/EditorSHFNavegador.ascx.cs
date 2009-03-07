using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_Editores_SHF_EditorSHFNavegador : System.Web.UI.UserControl
{
    private bool anterior_visible = true;
    private bool siguiente_visible = true;
    private bool finalizar_visible = true;
    private string anterior_url = "";
    private string siguiente_url = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            anterior_ImBtn.Visible = anterior_visible;
            siguiente_ImBtn.Visible = siguiente_visible;
            finalizar_ImBtn.Visible = finalizar_visible;

            anterior_ImBtn.OnClientClick = String.Format(
                "window.location.href='{0}?idAvaluo={1}'; return false;",
                    anterior_url,
                    Page.Request.QueryString["idAvaluo"]);
            siguiente_ImBtn.OnClientClick = String.Format(
                "window.location.href='{0}?idAvaluo={1}'; return false;",
                    siguiente_url,
                    Page.Request.QueryString["idAvaluo"]);

            finalizar_ImBtn.OnClientClick = "return false;";
        }
    }

    public bool AnteriorVisible
    {
        get { return anterior_visible; }
        set { anterior_visible = value; }
    }
    public bool SiguienteVisible
    {
        get { return siguiente_visible; }
        set { siguiente_visible = value; }
    }
    public bool FinalizarVisible
    {
        get { return finalizar_visible; }
        set { finalizar_visible = value; }
    }

    public string AnteriorURL
    {
        get { return anterior_url; }
        set { anterior_url = value; }
    }
    public string SiguienteURL
    {
        get { return siguiente_url; }
        set { siguiente_url = value; }
    }
}
