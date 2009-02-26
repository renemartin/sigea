using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controles_DatosDireccion : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SetAttributes();
        }
    }

    private void SetAttributes()
    {
        estado_DDList.Attributes.Add("onchange", ID + ".updateMunicipios();");
        municipio_DDList.Attributes.Add("onchange", ID + ".onMunicipioChanged();");
        asentamiento_TBox.Attributes.Add("onblur", ID + ".onAsentamientoLostFocus();");
        cp_TBox.Attributes.Add("onblur", ID + ".onCPLostFocus();");
    }
}
