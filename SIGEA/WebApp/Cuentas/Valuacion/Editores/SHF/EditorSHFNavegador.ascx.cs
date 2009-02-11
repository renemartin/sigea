using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_Editores_SHF_EditorSHFNavegador : System.Web.UI.UserControl
{
    public string AccionEditar
    {
        set { editar_ImBtn.OnClientClick = value; }
        get { return editar_ImBtn.OnClientClick; }
    }
    public string AccionGuardar
    {
        set { guardar_ImBtn.OnClientClick = value; }
        get { return guardar_ImBtn.OnClientClick; }
    }
    public string AccionCancelar
    {
        set { cancelar_ImBtn.OnClientClick = value; }
        get { return cancelar_ImBtn.OnClientClick; }
    }

    public bool VisiblidadEditar
    {
        set { editar_ImBtn.CssClass = value ? "" : "hidden"; }
        get { return editar_ImBtn.CssClass == "hidden"; }
    }
    public bool VisiblidadGuardar
    {
        set { guardar_ImBtn.CssClass = value ? "" : "hidden"; }
        get { return guardar_ImBtn.CssClass == "hidden"; }
    }
    public bool VisiblidadCancelar
    {
        set { cancelar_ImBtn.CssClass = value ? "" : "hidden"; }
        get { return cancelar_ImBtn.CssClass == "hidden"; }
    }
}
