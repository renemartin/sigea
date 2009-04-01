using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using SIGEA.Classes.Entities;

public partial class Cuentas_Valuacion_ComparableSeleccion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetParameters();
        }
    }

    private void GetParameters()
    {
        short idTipoComparable = 0;
        int idAvaluo = 0;
        
        if(Request.QueryString["idTipoComparable"] != null)
        {
            if(!short.TryParse(Request.QueryString["idTipoComparable"], out idTipoComparable))
                throw new Exception("Identificador de tipo comparable inválido");
        }
        else
            throw new Exception("Identificador de comparable no proporcionado");

        if (Request.QueryString["idAvaluo"] != null)
        {
            if (!int.TryParse(Request.QueryString["idAvaluo"], out idAvaluo))
                throw new Exception("Identificador de tipo avalúo inválido");
        }
        else
            throw new Exception("Identificador de avalúo no proporcionado");
    }

    public short IdTipoComparable
    {
        set 
        { 
            ViewState["idTipoComparable"] = value;
            BusquedaComparable_Ctrl.Tipo = (TipoComparable)value;
        }
        get { return ViewState["idTipoComparable"] == null ? (short)0 : (short)ViewState["idTipoComparable"]; }
    }

    public int IdAvaluo
    {
        set { ViewState["idAvaluo"] = value; }
        get { return ViewState["idAvaluo"] == null ? 0 : (int)ViewState["idAvaluo"];  }
    }

    public void SetupContext(object sender, LinqDataSourceContextEventArgs e)
    {
        e.ObjectInstance = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
    }

    public void BusquedaComparable_Search(object sender, EventArgs e)
    { 
            
    }
}
