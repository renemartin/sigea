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
        distanciaBanco_TBox.Attributes.Add("onchange", ID + ".updateNivelEquipamiento();");
        distanciaEscuela_TBox.Attributes.Add("onchange", ID + ".updateNivelEquipamiento();");
        distanciaHospital_TBox.Attributes.Add("onchange", ID + ".updateNivelEquipamiento();");
        distanciaIglesia_TBox.Attributes.Add("onchange", ID + ".updateNivelEquipamiento();");
        distanciaMercado_TBox.Attributes.Add("onchange", ID + ".updateNivelEquipamiento();");
        distanciaParque_TBox.Attributes.Add("onchange", ID + ".updateNivelEquipamiento();");
        distanciaPlaza_TBox.Attributes.Add("onchange", ID + ".updateNivelEquipamiento();");
        distanciaTransporte_TBox.Attributes.Add("onchange", ID + ".updateNivelEquipamiento();");
    }
}
