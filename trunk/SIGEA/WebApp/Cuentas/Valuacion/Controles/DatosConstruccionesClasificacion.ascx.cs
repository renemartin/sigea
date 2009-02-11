using System;

public partial class Cuentas_Valuacion_Controles_DatosConstruccionesClasificacion : System.Web.UI.UserControl
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
        agregarFila_ImBtn.OnClientClick = "addClonedRow('tabla_construcciones'); return false;";
        removerFila_ImBtn.OnClientClick = "removeClonedRow('tabla_construcciones'); return false;";
    }
}
