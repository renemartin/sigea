using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIGEA.Classes.Entities;

public partial class Cuentas_Administracion_Personal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ApplyFilters();
            SetAttributes();
        }
    }

    public void SetupContext(object sender, LinqDataSourceContextEventArgs e)
    {
        e.ObjectInstance = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
    }

    private void ApplyFilters()
    {
        StringBuilder filters = new StringBuilder();
        filters.Append("activo == True");

        if (!string.IsNullOrEmpty(nombre_TBox.Text))
            filters.Append(" && nombre.StartsWith(@nombre)");

        personal_DS.Where = filters.ToString();
        personal_DS.DataBind();
    }
    private void SetAttributes()
    {
        addNew_ImBtn.Attributes.Add("onclick", "addNewPersonal(); return false;");
    }

    protected void search_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        ApplyFilters();
    }
}
