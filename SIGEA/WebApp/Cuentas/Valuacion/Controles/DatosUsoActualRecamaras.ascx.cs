using System;

public partial class Cuentas_Valuacion_Controles_DatosRecamara : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            AddAttributes();
        }
    }

    private void AddAttributes()
    {
        agregarFila_ImBtn.OnClientClick = "addClonedRow('tabla_recamaras'); return false;";
        removerFila_ImBtn.OnClientClick = "removeClonedRow('tabla_recamaras'); return false;";
    }
}
