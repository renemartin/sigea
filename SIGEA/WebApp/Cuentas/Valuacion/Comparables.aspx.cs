using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIGEA.Classes.Entities;

public partial class Cuentas_Valuacion_Comparables : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SetStartupParams();
            SetAttributes();
        }
        else
        {
            data_gridView.DataBind();
        }
    }
   
    public void SetupContext(object sender, LinqDataSourceContextEventArgs e)
    {
        e.ObjectInstance = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
    }
    private void SetStartupParams()
    {
        if (Session["idTipoComparableGrid"] == null)
        {
            Session["idTipoComparableGrid"] = "1";
            buscador_Ctrl.Tipo = TipoComparable.Costos;
        }
        else
        {
            tipo_DDList.SelectedValue = Session["idTipoComparableGrid"].ToString();
            buscador_Ctrl.Tipo = (TipoComparable)int.Parse(Session["idTipoComparableGrid"].ToString());
        }
        Session["filtrosComparablesGrid"] = null;
        filtro_Lbl.Text = "No especificado";
    }
    private void SetAttributes()
    {
        addNew_ImBtn.Attributes.Add("onclick", "addNewComparable(); return false;");
    }

    protected void tipo_DDList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["idTipoComparableGrid"] = tipo_DDList.SelectedValue;
        buscador_Ctrl.Tipo = (TipoComparable)int.Parse(tipo_DDList.SelectedValue);
    }
    protected void buscar_ImBtn_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        buscador_Ctrl.Hidden = false;        
    }
    protected void buscador_Ctrl_Search(object sender, EventArgs e)
    {        
        buscador_Ctrl.Hidden = true;        

        string descripcion_busqueda = buscador_Ctrl.DescripcionBusqueda;
        if (!string.IsNullOrEmpty(buscador_Ctrl.DescripcionBusqueda))
        {
            filtro_Lbl.Text = buscador_Ctrl.DescripcionBusqueda;
            Session["filtrosComparablesGrid"] = buscador_Ctrl.GetColeccionBusqueda();
        }
        else
        {
            filtro_Lbl.Text = "No especificado";
            Session["filtrosComparablesGrid"] = null;
        }
    }
    protected void buscador_Ctrl_Cancel(object sender, EventArgs e)
    {
        filtro_Lbl.Text = "No especificado";
        buscador_Ctrl.Clear();
        buscador_Ctrl.Hidden = true;
        Session["filtrosComparablesGrid"] = null;
    }
}
