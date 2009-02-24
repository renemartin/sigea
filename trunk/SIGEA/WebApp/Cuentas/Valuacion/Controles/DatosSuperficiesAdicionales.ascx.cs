using System;

public partial class Cuentas_Valuacion_Controles_DatosSuperficiesAdicionales : System.Web.UI.UserControl
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
        agregarFila_ImBtn.OnClientClick = ID + ".addSuperficieRow(); return false;";
        removerFila_ImBtn.OnClientClick = ID + ".removeSuperficieRow(); return false;";
    }
}
