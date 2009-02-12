using System;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cuentas_Valuacion_Editores_SHF_DatosInmueble : System.Web.UI.Page
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
        SetEdit("form_inmueble", editar_inmueble_ImBtn, guardar_inmueble_ImBtn, cancelar_inmueble_ImBtn);
        SetCancel("form_inmueble", editar_inmueble_ImBtn, guardar_inmueble_ImBtn, cancelar_inmueble_ImBtn);
        guardar_inmueble_ImBtn.OnClientClick = "saveDatosInmueble(); return false;";

        SetEdit("form_terreno", editar_terreno_ImBtn, guardar_terreno_ImBtn, cancelar_terreno_ImBtn);
        SetCancel("form_terreno", editar_terreno_ImBtn, guardar_terreno_ImBtn, cancelar_terreno_ImBtn);
        guardar_terreno_ImBtn.OnClientClick = "saveDatosTerreno(); return false;";

        SetEdit("form_colindancias", editar_colindancias_ImBtn, guardar_colindancias_ImBtn, cancelar_colindancias_ImBtn);
        SetCancel("form_colindancias", editar_colindancias_ImBtn, guardar_colindancias_ImBtn, cancelar_colindancias_ImBtn);
        guardar_colindancias_ImBtn.OnClientClick = "saveColindancias(); return false;";
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
