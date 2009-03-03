using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_Controles_DatosCondominio : System.Web.UI.UserControl
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
        fuenteIndiviso_DDList.Attributes.Add("onchange", "setFuenteIndivisoSelection();");
        fuentePrivativo_DDList.Attributes.Add("onchange", "setFuentePrivativoSelection();");
    }
}
