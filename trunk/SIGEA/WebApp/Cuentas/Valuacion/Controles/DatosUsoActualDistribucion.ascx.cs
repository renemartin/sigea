using System;

public partial class Cuentas_Valuacion_Controles_DatosDistribucion : System.Web.UI.UserControl
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
        cocina_CBox.Attributes.Add("onclick", "setCocinaSelection(this.checked);");
        tipoEstacionamiento_DDList.Attributes.Add("onchange", "setEstacionamientoSeleccion(this.value);");
    }
}
