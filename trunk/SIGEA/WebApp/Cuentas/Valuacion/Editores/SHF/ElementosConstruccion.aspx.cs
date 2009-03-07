using System;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_Editores_SHF_ElementosConstruccion : System.Web.UI.Page
{
    private StringBuilder scripts;
    private int idAvaluo;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            scripts = new StringBuilder();

            Initialization();
            LoadData();
            RegisterScripts();
            SetAttributes();
        }
    }
    private void Initialization()
    {
        scripts.AppendLine("setupForm();");
    }
    private void LoadData()
    {
        idAvaluo = 0;
        if (Request.QueryString["idAvaluo"] != null)
        {
            if (!int.TryParse(Request.QueryString["idAvaluo"], out idAvaluo))
                throw new Exception("Identificador de avalúo inválido");
        }
        else
        {
            throw new Exception("Identificador de avalúo no proporcionado");
        }
        scripts.AppendLine(string.Format("loadConstruccion({0});", idAvaluo));
    }
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsEdicion", scripts.ToString(), true);
    }
    private void SetAttributes()
    {
        SetEdit("form_estructuras", editar_estructuras_ImBtn, guardar_estructuras_ImBtn, cancelar_estructuras_ImBtn);
        SetCancel("form_estructuras", editar_estructuras_ImBtn, guardar_estructuras_ImBtn, cancelar_estructuras_ImBtn);
        guardar_estructuras_ImBtn.OnClientClick = "saveDatosEstructuras(); return false;";

        SetEdit("form_acabados", editar_acabados_ImBtn, guardar_acabados_ImBtn, cancelar_acabados_ImBtn);
        SetCancel("form_acabados", editar_acabados_ImBtn, guardar_acabados_ImBtn, cancelar_acabados_ImBtn);
        guardar_acabados_ImBtn.OnClientClick = "saveDatosAcabados(); return false;";

        SetEdit("form_instalaciones", editar_instalaciones_ImBtn, guardar_instalaciones_ImBtn, cancelar_instalaciones_ImBtn);
        SetCancel("form_instalaciones", editar_instalaciones_ImBtn, guardar_instalaciones_ImBtn, cancelar_instalaciones_ImBtn);
        guardar_instalaciones_ImBtn.OnClientClick = "saveDatosInstalaciones(); return false;";
    }

    private void SetEdit(string form, ImageButton editar, ImageButton guardar, ImageButton cancelar)
    {
        editar.OnClientClick = String.Format("editForm('{0}', '{1}', '{2}', '{3}'); return false;"
            , form
            , editar.ClientID
            , guardar.ClientID
            , cancelar.ClientID);
    }
    private void SetCancel(string form, ImageButton editar, ImageButton guardar, ImageButton cancelar)
    {
        cancelar.OnClientClick = String.Format("cancelEdit('{0}', '{1}', '{2}', '{3}', {4}); return false;"
            , form
            , editar.ClientID
            , guardar.ClientID
            , cancelar.ClientID
            , idAvaluo);
    }
}
