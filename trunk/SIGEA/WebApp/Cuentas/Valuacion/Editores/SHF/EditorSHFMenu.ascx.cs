using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_Editores_SHF_EditorSHFMenu : System.Web.UI.UserControl
{
    private LinkButton[] links;

    protected void Page_Load(object sender, EventArgs e)
    {
        links = new LinkButton[] {
            avaluo_LkBtn,
            inmueble_LkBtn,
            entorno_LkBtn,
            usoActual_LkBtn,
            construcciones_LkBtn,
            elementos_LkBtn,
            enfoqueCostos_LkBtn,
            enfoqueMercado_LkBtn,
            enfoqueIngresos_LkBtn
        };

        if (!IsPostBack)
        {
            if (Request.QueryString["idAvaluo"] != null)
            {
                foreach (LinkButton link in links)
                {
                    link.PostBackUrl += "?idAvaluo=" + Request.QueryString["idAvaluo"];
                }
            }
        }
    }
}
