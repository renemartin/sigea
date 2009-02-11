using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Controles_BusquedaPersonalizada : System.Web.UI.UserControl
{
    private StringBuilder script;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            script = new StringBuilder();
            script.AppendLine(string.Format("fillCampos('{0}')" + Campos_DDList.ClientID));
            RegisterScripts();
        }
    }

    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptCampos", script.ToString(), true);
    }

    protected void BorrarFiltros_Button_Click(object sender, EventArgs e)
    {
        Filtros_TxtArea.Value = "";
    }
    protected void AgregarCondicion_Button_Click(object sender, EventArgs e)
    {
        string condicion = "";

        if (OperadorLogico_LBox.SelectedValue != null)
            condicion = " " + OperadorLogico_LBox.SelectedValue.ToString() + " ";

        condicion += "[" + Campos_DDList.SelectedValue.ToString() + "] "
                        + Simbolos_DDList.SelectedValue.ToString()
                        + " '" + Valor_TBox.Text.ToString() + "' ";

        if (Filtros_TxtArea.Value != null)
        {
            string texto = Filtros_TxtArea.Value.ToString();
            Filtros_TxtArea.Value = "";
            Filtros_TxtArea.Value = texto + condicion;
        }
        else
            Filtros_TxtArea.Value = condicion;
    }
    protected void AplicarFiltros_Button_Click(object sender, EventArgs e)
    {
        //enviar consulta a la clase
    }
    protected void ActualizarFiltros_Button_Click(object sender, EventArgs e)
    {

    }
}
