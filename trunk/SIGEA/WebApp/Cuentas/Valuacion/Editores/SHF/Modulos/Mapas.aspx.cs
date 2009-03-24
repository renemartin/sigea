using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using SIGEA.Classes.Entities;
using System.Configuration;
using System.IO;

public partial class Cuentas_Valuacion_Editores_SHF_Modulos_Mapas : System.Web.UI.Page
{
    private StringBuilder scripts;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            scripts = new StringBuilder();

            GetParameters();
            RegisterScripts();
            SetAttributes();
        }
    }
    private void SaveMapa(int idInmueble, int idMapa, int idArchivo, bool esMacro, string titulo, HttpPostedFile postedFile)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);

        try
        {
            string folder = ConfigurationManager.AppSettings["mapasFolderPath"];
            FileUploader uploader = new FileUploader(data_context);

            Archivo archivo = uploader.SaveImage(idArchivo, titulo, postedFile, folder, 300, 200);
            if (archivo != null)
            {
                MapaLocalizacion mapa = MapaLocalizacion.GetForDataUpdate(data_context, idMapa, idInmueble);
                mapa.SetData(data_context, archivo, esMacro);
                data_context.SubmitChanges();
                LoadMapa(mapa, esMacro);
            }
        }
        catch (Exception ex)
        {
            FormUtils.ShowErrorMessage(this, ex.Message);
        }

    }
    private void DeleteMapa(int idMapa, bool esMacro)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        MapaLocalizacion mapa = MapaLocalizacion.GetFromId(data_context, idMapa);
        string URLMapa = Server.MapPath("~/" + mapa.Archivo.GetUrl().Split('?')[0]);
        if(File.Exists(URLMapa))
        {
            File.Delete(URLMapa);
        }
        MapaLocalizacion.Delete(data_context, mapa);
        data_context.SubmitChanges();
        LoadMapa(null, esMacro);
    }
    
    private void GetParameters()
    {
        if (Request.QueryString["idAvaluo"] == null)
        {
            FormUtils.ShowErrorMessage(this, "Identificador de avalúo no proporcionado");
            CloseWindow();
            return;
        }

        int idAvaluo;
        if (!int.TryParse(Request.QueryString["idAvaluo"], out idAvaluo))
        {
            FormUtils.ShowErrorMessage(this, "Identificador de avalúo inválido");
            CloseWindow();
            return;
        }

        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);
        if (inmueble == null)
        {
            FormUtils.ShowErrorMessage(this, "Identificador de avalúo inválido");
            CloseWindow();
            return;
        }

        idInmueble_HF.Value = inmueble.idInmueble.ToString();
        LoadData(data_context, inmueble.idInmueble);
    }
    private void LoadData(SIGEADataContext data_context, int idInmueble)
    {
        LoadMapa(MapaLocalizacion.GetFromIdInmueble(data_context, idInmueble, true), true);
        LoadMapa(MapaLocalizacion.GetFromIdInmueble(data_context, idInmueble, false), false);
    }
    private void LoadMapa(MapaLocalizacion mapa, bool mapaMacro)
    {
        if (mapa == null)
        {
            if (mapaMacro)
            {
                mapaMacrolocalizacion_Ima.ImageUrl = "~/Images/NoDisponible.jpg";
                mapaMacrolocalizacion_Ima.Width = 120;
                eliminarMacro_ImBtn.Visible = false;
            }
            else
            {
                mapaMicrolocalizacion_Ima.ImageUrl = "~/Images/NoDisponible.jpg";
                mapaMicrolocalizacion_Ima.Width = 120;
                eliminarMicro_ImBtn.Visible = false;
            }
        }
        else
        {
            if (mapaMacro)
            {
                idMapaMacro_HF.Value = mapa.idMapa.ToString();
                idArchivoMacro_HF.Value = mapa.idArchivo.ToString();
                URLMacro_HF.Value = mapa.Archivo.GetUrl();
                mapaMacrolocalizacion_Ima.ImageUrl = "~/" + URLMacro_HF.Value;
                mapaMacrolocalizacion_Ima.Width = 300;
                eliminarMacro_ImBtn.Visible = true;
            }
            else
            {
                idMapaMicro_HF.Value = mapa.idMapa.ToString();
                idArchivoMicro_HF.Value = mapa.idArchivo.ToString();
                URLMicro_HF.Value = mapa.Archivo.GetUrl();
                mapaMicrolocalizacion_Ima.ImageUrl = "~/" + URLMicro_HF.Value;
                mapaMicrolocalizacion_Ima.Width = 300;
                eliminarMicro_ImBtn.Visible = true;
            }
        }
    }
    private void CloseWindow()
    {
        ClientScript.RegisterStartupScript(typeof(Page), "closeWindowScript", "closeWindow(false);", true);
    }
    
    private void RegisterScripts()
    {
        Page.ClientScript.RegisterStartupScript(typeof(Page), "scriptsGeolocalizacion", scripts.ToString(), true);
    }

    private void SetAttributes()
    {

    }

    protected void subirMicro_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        int idInmueble = int.Parse(idInmueble_HF.Value);
        int idMapa = int.Parse(idMapaMicro_HF.Value);
        int idArchivo = int.Parse(idArchivoMicro_HF.Value);

        SaveMapa(idInmueble, idMapa, idArchivo, false, "Mapa de microlocalización", fileMicro_Fup.PostedFile);
    }
    protected void subirMacro_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        int idInmueble = int.Parse(idInmueble_HF.Value);
        int idMapa = int.Parse(idMapaMacro_HF.Value);
        int idArchivo = int.Parse(idArchivoMacro_HF.Value);

        SaveMapa(idInmueble, idMapa, idArchivo, true, "Mapa de macrolocalización", fileMacro_Fup.PostedFile);
    }

    protected void eliminarMicro_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        int idMapa = int.Parse(idMapaMicro_HF.Value);
        DeleteMapa(idMapa, false);
    }
    protected void eliminarMacro_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        int idMapa = int.Parse(idMapaMacro_HF.Value);
        DeleteMapa(idMapa, true);
    }
}
