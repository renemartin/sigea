using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using SIGEA.Classes.Entities;

public partial class Controles_BusquedaComparable : System.Web.UI.UserControl
{
    public event EventHandler Search;
    public event EventHandler Cancel;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Tipo == TipoComparable.Costos)
            {
                construccion_Panel.CssClass = "hidden";
            }

            if (OnClientSearch != "")
            {
                buscar_ImBtn.OnClientClick = OnClientSearch 
                    + " return false;";
            }

            if (OnClientCancel != "")
            {
                cancelar_ImBtn.OnClientClick = OnClientCancel 
                    + " " + ID + ".clear(); return false;";
            }
        }
    }

    public TipoComparable Tipo
    {
        set { ViewState["Tipo"] = value; }
        get 
        { 
            return ViewState["Tipo"] == null 
                ? TipoComparable.Costos 
                : (TipoComparable)ViewState["Tipo"]; 
        }
    }
    public RunningMode Mode
    {
        set { ViewState["Mode"] = value; }
        get
        {
            return ViewState["Mode"] == null
                ? RunningMode.Server
                : (RunningMode)ViewState["Mode"];
        }
    }
    public Dictionary<string, string> GetColeccionBusqueda()
    {
        Dictionary<string, string> coleccion = new Dictionary<string, string>();

        coleccion.Add("valorOferta", valorOferta_TBox.Text);
        coleccion.Add("operadorValor", operador_DDList.SelectedItem == null ? "" : operador_DDList.SelectedValue);
        coleccion.Add("numeroFrentes", numeroFrentes_TBox.Text);
        coleccion.Add("superficieTerreno", superficieTerreno_TBox.Text);
        
        coleccion.Add("superficieConstruida", superficieConstruida_TBox.Text);
        coleccion.Add("usoSuelo", usoSuelo_DDList.SelectedItem == null ? "" : usoSuelo_DDList.SelectedValue);
        coleccion.Add("clase", clase_DDList.SelectedItem == null ? "" : clase_DDList.SelectedValue);
        coleccion.Add("conservacion", conservacion_DDList.SelectedItem == null ? "" : conservacion_DDList.SelectedValue);
        coleccion.Add("atiguedad", antiguedad_TBox.Text);
        coleccion.Add("avanceObra", avanceObra_TBox.Text);
        coleccion.Add("calidadProyecto", calidadProyecto_DDList.SelectedItem == null ? "" : calidadProyecto_DDList.SelectedValue);
        
        coleccion.Add("calle", calle_TBox.Text);
        coleccion.Add("codigoPostal", codigoPostal_TBox.Text);
        coleccion.Add("asentamiento", asentamiento_TBox.Text);
        coleccion.Add("municipio", municipio_TBox.Text);
        coleccion.Add("estado", estado_TBox.Text);

        return coleccion;
    }
    public string OnClientSearch
    {
        set { ViewState["OnClientSearch"] = value; }
        get { return ViewState["OnClientSearch"] == null ? "" : ViewState["OnClientSearch"].ToString(); }
    }
    public string OnClientCancel
    {
        set { ViewState["OnClientCancel"] = value; }
        get { return ViewState["OnClientCancel"] == null ? "" : ViewState["OnClientCancel"].ToString(); }
    }
    public string DescripcionBusqueda
    {
        get
        {
            StringBuilder desc = new StringBuilder();
            
            if (valorOferta_TBox.Text != "")
                desc.Append(string.Format(", Valor de oferta {0} {1}", operador_DDList.SelectedItem.Text, valorOferta_TBox.Text));
            if(fechaCreacion_TBox.Text != "")
                desc.Append(", Fecha de creación: " + fechaCreacion_TBox.Text);
            if(numeroFrentes_TBox.Text != "")
                desc.Append(", Numero de frentes: " + numeroFrentes_TBox.Text);
            if (superficieTerreno_TBox.Text != "")
                desc.Append(", Superficie de terreno aproximada: " + superficieTerreno_TBox.Text);
            if (superficieConstruida_TBox.Text != "")
                desc.Append(", Superficie construida aproximada: " + superficieConstruida_TBox.Text);
            if (usoSuelo_DDList.SelectedValue != "0")
                desc.Append(", Uso de suelo: " + usoSuelo_DDList.SelectedItem.Text);
            if (clase_DDList.SelectedValue != "0")
                desc.Append(", Clase: " + clase_DDList.SelectedItem.Text);
            if (conservacion_DDList.SelectedValue != "0")
                desc.Append(", Estado de conservación: " + conservacion_DDList.SelectedItem.Text);
            if (antiguedad_TBox.Text != "")
                desc.Append(", Antigüedad: " + antiguedad_TBox.Text);
            if (avanceObra_TBox.Text != "")
                desc.Append(", Avance de obra: " + avanceObra_TBox.Text);
            if (calidadProyecto_DDList.SelectedValue != "0")
                desc.Append(", Calidad de proyecto: " + calidadProyecto_DDList.SelectedItem.Text);
            if (calle_TBox.Text != "")
                desc.Append(", Calle: " + calle_TBox.Text);
            if (codigoPostal_TBox.Text != "")
                desc.Append(", Código postal: " + codigoPostal_TBox.Text);
            if (asentamiento_TBox.Text != "")
                desc.Append(", Asentamiento: " + asentamiento_TBox.Text);
            if (municipio_TBox.Text != "")
                desc.Append(", Municipio: " + municipio_TBox.Text);
            if (estado_TBox.Text != "")
                desc.Append(", Estado: " + estado_TBox.Text);

            string descripcion = desc.ToString();
            if (descripcion.Length == 0)
                return string.Empty;
            return desc.ToString().Substring(2, descripcion.Length-2);
        }
    }
    public bool CancelarVisible
    {
        set { cancelar_ImBtn.Visible = value; }
        get { return cancelar_ImBtn.Visible; }
    }

    public void Clear()
    {
        valorOferta_TBox.Text = "";
        operador_DDList.SelectedIndex = 0;
        fechaCreacion_TBox.Text = "";
        numeroFrentes_TBox.Text = "";
        superficieTerreno_TBox.Text = "";
        
        superficieConstruida_TBox.Text = "";
        usoSuelo_DDList.SelectedIndex = 0;
        clase_DDList.SelectedIndex = 0;
        conservacion_DDList.SelectedIndex = 0;
        antiguedad_TBox.Text = "";
        avanceObra_TBox.Text = "";
        calidadProyecto_DDList.SelectedIndex = 0;
        
        calle_TBox.Text = "";
        codigoPostal_TBox.Text = "";
        asentamiento_TBox.Text = "";
        municipio_TBox.Text = "";
        estado_TBox.Text = "";
    }
    public void SetupContext(object sender, LinqDataSourceContextEventArgs e)
    {
        e.ObjectInstance = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
    }

    protected void OnSearch()
    {
        if (Search != null)
        {
            Search(this, EventArgs.Empty);
        }
    }
    protected void OnCancel()
    {
        if (Cancel != null)
        {
            Cancel(this, EventArgs.Empty);
        }
    }

    protected void buscar_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        OnSearch();
    }
    protected void cancelar_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        Clear();
        OnCancel();
    }
}
