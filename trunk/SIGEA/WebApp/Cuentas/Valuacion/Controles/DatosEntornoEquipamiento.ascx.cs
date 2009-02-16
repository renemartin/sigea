using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_Controles_DatosEntornoEquipamiento : System.Web.UI.UserControl
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
        distanciaBanco_TBox.Attributes.Add("onchange", "updateNivelEquipamiento();");
        distanciaEscuela_TBox.Attributes.Add("onchange", "updateNivelEquipamiento();");
        distanciaHospital_TBox.Attributes.Add("onchange", "updateNivelEquipamiento();");
        distanciaIglesia_TBox.Attributes.Add("onchange", "updateNivelEquipamiento();");
        distanciaMercado_TBox.Attributes.Add("onchange", "updateNivelEquipamiento();");
        distanciaParque_TBox.Attributes.Add("onchange", "updateNivelEquipamiento();");
        distanciaPlaza_TBox.Attributes.Add("onchange", "updateNivelEquipamiento();");
        distanciaTransporte_TBox.Attributes.Add("onchange", "updateNivelEquipamiento();");
    }
}
