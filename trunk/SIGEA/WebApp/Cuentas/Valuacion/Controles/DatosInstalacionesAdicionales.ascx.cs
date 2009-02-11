using System;

public partial class Cuentas_Valuacion_Controles_InstalacionesAdicionales : System.Web.UI.UserControl
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
        agregarFila_ImBtn.OnClientClick = "addClonedRow('" + ClientID + "_tabla_instalaciones'); return false;";
        removerFila_ImBtn.OnClientClick = "removeClonedRow('" + ClientID + "_tabla_instalaciones'); return false;";
    }
}
