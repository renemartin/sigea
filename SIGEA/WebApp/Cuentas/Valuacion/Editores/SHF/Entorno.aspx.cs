using System;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_Editores_SHF_Entorno : System.Web.UI.Page
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
        scripts.AppendLine(string.Format("loadForm({0});", idAvaluo));
    }
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(
            typeof(Page), "scriptsEdicion", scripts.ToString(), true);
    }
    private void SetAttributes()
    {
        SetEdit("form_entorno", editar_entorno_ImBtn, guardar_entorno_ImBtn, cancelar_entorno_ImBtn);
        SetCancel("form_entorno", editar_entorno_ImBtn, guardar_entorno_ImBtn, cancelar_entorno_ImBtn);
        guardar_entorno_ImBtn.OnClientClick = "saveDatosEntorno(); return false;";

        SetEdit("form_infraestructura", editar_infraestructura_ImBtn, guardar_infraestructura_ImBtn, cancelar_infraestructura_ImBtn);
        SetCancel("form_infraestructura", editar_infraestructura_ImBtn, guardar_infraestructura_ImBtn, cancelar_infraestructura_ImBtn);
        guardar_infraestructura_ImBtn.OnClientClick = "saveDatosInfraestructura(); return false;";

        SetEdit("form_servicios", editar_servicios_ImBtn, guardar_servicios_ImBtn, cancelar_servicios_ImBtn);
        SetCancel("form_servicios", editar_servicios_ImBtn, guardar_servicios_ImBtn, cancelar_servicios_ImBtn);
        guardar_servicios_ImBtn.OnClientClick = "saveDatosServicios(); return false;";

        SetEdit("form_equipamiento", editar_equipamiento_ImBtn, guardar_equipamiento_ImBtn, cancelar_equipamiento_ImBtn);
        SetCancel("form_equipamiento", editar_equipamiento_ImBtn, guardar_equipamiento_ImBtn, cancelar_equipamiento_ImBtn);
        guardar_equipamiento_ImBtn.OnClientClick = "saveDatosEquipamiento(); return false;";
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
