using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Administracion_Valuadores : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillData();
            ApplyFilters();
            SetAttributes();
        }
    }

    private void FillData()
    {
        ClientScript.RegisterStartupScript(
            typeof(Page), "valuadoresLoad", "fillTiposValuador(tipoValuador_ID);", true);
    }
    private void ApplyFilters()
    {
        StringBuilder filters = new StringBuilder();
        filters.Append("activo == True");

        if (!string.IsNullOrEmpty(nombre_TBox.Text))
            filters.Append(" && nombre.StartsWith(@nombre)");

        if (tipo_DDList.SelectedItem != null && tipo_DDList.SelectedValue != "0")
            filters.Append(" && idTipoValuador == @idTipoValuador");

        valuadores_DS.Where = filters.ToString();
        valuadores_DS.DataBind();
    }
    private void SetAttributes()
    {
        addNew_ImBtn.Attributes.Add("onclick", "addNewValuador(); return false;");
    }    
    
    protected void search_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        ApplyFilters();
    }
}