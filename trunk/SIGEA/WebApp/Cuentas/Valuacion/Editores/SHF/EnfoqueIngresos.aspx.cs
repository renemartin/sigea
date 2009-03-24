using System;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_Editores_SHF_EnfoqueIngresos : System.Web.UI.Page
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
        SetEdit("form_homologacion", editar_homologacion_ImBtn, guardar_homologacion_ImBtn, cancelar_homologacion_ImBtn);
        SetCancel("form_homologacion", editar_homologacion_ImBtn, guardar_homologacion_ImBtn, cancelar_homologacion_ImBtn);
        guardar_homologacion_ImBtn.OnClientClick = "saveHomologacion(); return false;";

        SetEdit("form_capitalizacion", editar_capitalizacion_ImBtn, guardar_capitalizacion_ImBtn, cancelar_capitalizacion_ImBtn);
        SetCancel("form_capitalizacion", editar_capitalizacion_ImBtn, guardar_capitalizacion_ImBtn, cancelar_capitalizacion_ImBtn);
        guardar_capitalizacion_ImBtn.OnClientClick = "saveCapitalizacion(); return false;";

        SetEdit("form_deducciones", editar_deducciones_ImBtn, guardar_deducciones_ImBtn, cancelar_deducciones_ImBtn);
        SetCancel("form_deducciones", editar_deducciones_ImBtn, guardar_deducciones_ImBtn, cancelar_deducciones_ImBtn);
        guardar_deducciones_ImBtn.OnClientClick = "saveDeducciones(); return false;";
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
