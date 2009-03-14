using System;

public partial class Cuentas_Valuacion_DatosGeneralesAvaluo : System.Web.UI.UserControl
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
        proposito_DDList.Attributes.Add("onchange", "setPropositoSelection();");        
        tipoCredito_DDList.Attributes.Add("onchange", "setTipoCreditoSelection();");
        entidadOtorgante_DDList.Attributes.Add("onchange", "setEntidadFinanciamientoSelection();");
       
        contado_CBox.Attributes.Add("onclick", "setContadoSelection();");
        promocionVIASC_CBox.Attributes.Add("onclick", "setPromocionSelection();");
        
    }
}
