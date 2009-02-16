using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Cuentas_Valuacion_Controles_Infraestructura : System.Web.UI.UserControl
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
        aguaPotable_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_agua_potable'), this.checked);"
            + " updateNivelInfraestructura();");
        drenaje_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_drenaje'), this.checked);"
            + " updateNivelInfraestructura();");
        electrificacion_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_electrificacion'), this.checked);"
            + " updateNivelInfraestructura();");
        alumbradoPublico_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_alumbrado'), this.checked);"
            + " updateNivelInfraestructura();"); ;
        vialidades_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_vialidades'), this.checked);"
            + " updateNivelInfraestructura();"); ;
        banquetas_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_banquetas'), this.checked);"
            + " updateNivelInfraestructura();"); ;
        guarniciones_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_guarniciones'), this.checked);"
            + " updateNivelInfraestructura();");

        gasNatural_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_gas_natural'), this.checked);"
            + " updateNivelInfraestructura();");
        redTelefonica_CBox.Attributes.Add("onclick", 
            "setVisibility($get('seccion_red_telefonica'), this.checked);");
        transporteUrbano_CBox.Attributes.Add("onclick", 
            "setVisibility($get('seccion_transporte_urbano'), this.checked);");
        transporteSuburbano_CBox.Attributes.Add("onclick", 
            "setVisibility($get('seccion_transporte_suburbano'), this.checked);");
        vigilancia_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_vigilancia_municipal'), this.checked);"
            + " updateNivelInfraestructura();");
    }
}
