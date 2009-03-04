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
            "setVisibility($get('seccion_agua_potable'), this.checked); "
            + ID + ".updateNivelInfraestructura();");
        drenaje_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_drenaje'), this.checked); "
            + ID + ".updateNivelInfraestructura();");
        electrificacion_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_electrificacion'), this.checked); "
            + ID + ".updateNivelInfraestructura();");
        alumbradoPublico_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_alumbrado'), this.checked); "
            + ID + ".updateNivelInfraestructura();"); ;
        vialidades_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_vialidades'), this.checked); "
            + "setVialidadesSelection(this.checked); "
            + ID + ".updateNivelInfraestructura();"); ;
        banquetas_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_banquetas'), this.checked); "
            + "setBanquetasSelection(this.checked); "
            + ID + ".updateNivelInfraestructura();"); ;
        guarniciones_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_guarniciones'), this.checked); "
            + "setGuarnicionesSelection(this.checked); "
            + ID + ".updateNivelInfraestructura();");

        gasNatural_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_gas_natural'), this.checked); "
            + ID + ".updateNivelInfraestructura();");
        redTelefonica_CBox.Attributes.Add("onclick", 
            "setVisibility($get('seccion_red_telefonica'), this.checked); ");
        transporteUrbano_CBox.Attributes.Add("onclick", 
            "setVisibility($get('seccion_transporte_urbano'), this.checked); "
            + "setTransporteUrbanoSelection(this.checked);");
        transporteSuburbano_CBox.Attributes.Add("onclick", 
            "setVisibility($get('seccion_transporte_suburbano'), this.checked); "
            + "setTransporteSuburbanoSelection(this.checked);");
        vigilancia_CBox.Attributes.Add("onclick",
            "setVisibility($get('seccion_vigilancia_municipal'), this.checked); "
            + ID + ".updateNivelInfraestructura();");
    }
}
