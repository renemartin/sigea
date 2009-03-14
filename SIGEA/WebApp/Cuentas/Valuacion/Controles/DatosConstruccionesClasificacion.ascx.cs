using System;

public partial class Cuentas_Valuacion_Controles_DatosConstruccionesClasificacion : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SetAttributes();
            AddAttributes();
        }
    }

    private void AddAttributes()
    {
        agregarFila_ImBtn.OnClientClick = ID + ".addConstruccionRow(); return false;";
        removerFila_ImBtn.OnClientClick = ID + ".removeConstruccionRow(); return false;";
    }

    private void SetAttributes()
    {
        clase_DDList.Attributes.Add("onchange", ID + ".onEdadLostFocus(this);");
        edad_TBox.Attributes.Add("onchange", ID + ".onEdadLostFocus(this);");
        vidaUtil_TBox.Attributes.Add("onblur", ID + ".onEdadLostFocus(this);");
    }
}
