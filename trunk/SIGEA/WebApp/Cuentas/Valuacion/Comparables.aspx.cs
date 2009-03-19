using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIGEA.Classes.Entities;

public partial class Cuentas_Administracion_Comparables : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SetStartupParams();
            SetAttributes();
        }
    }

    private void SetStartupParams()
    {
        if (Session["idTipoComparableGrid"] == null)
        {
            Session["idTipoComparableGrid"] = "1";
        }
        else
        {
            tipo_DDList.SelectedValue = Session["idTipoComparableGrid"].ToString();
        }
    }

    public void SetupContext(object sender, LinqDataSourceContextEventArgs e)
    {
        e.ObjectInstance = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
    }

    private void SetAttributes()
    {
        addNew_ImBtn.Attributes.Add("onclick", "addNewComparable(); return false;");
    }

    protected void search_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        Session["idTipoComparableGrid"] = tipo_DDList.SelectedValue;
    }
}
