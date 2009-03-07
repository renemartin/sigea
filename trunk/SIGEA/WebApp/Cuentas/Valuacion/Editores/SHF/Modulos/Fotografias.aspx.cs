using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIGEA.Classes.Entities;

public partial class Cuentas_Valuacion_Editores_SHF_Modulos_Fotografias : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetParameters();
        }
    }

    public string GetShowMethod(int idFotografia, int idArchivo, int idArchivoThumbnail, string titulo, bool principal) {
        return string.Format("showPhoto({0},{1},{2},'{3}',{4}); return false;",
            idFotografia,
            idArchivo,
            idArchivoThumbnail,
            titulo,
            principal ? "true" : "false");
    }

    private void ShowPhoto(string url_foto)
    {
        foto_Ima.ImageUrl = "~/" + url_foto;
        foto_Ima.Visible = true;
    }
    private void SavePhoto()
    {
        int idInmueble = int.Parse(idInmueble_HF.Value);
        int idFotografia = int.Parse(idFotografia_HF.Value);
        int idArchivo = int.Parse(idArchivo_HF.Value);
        int idArchivoThumbnail = int.Parse(idThumbnail_HF.Value);

        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        FileUploader uploader = new FileUploader(data_context);
        try
        {                        
            string folder_name = ConfigurationManager.AppSettings["photosFolderPath"];

            Archivo archivoFoto = uploader.SaveImage(idArchivo, descripcion_TBox.Text, file_Fup.PostedFile, folder_name, 800, 600);
            Archivo archivoThumbnail = uploader.SaveImage(idArchivoThumbnail, descripcion_TBox.Text, file_Fup.PostedFile, folder_name, 100, 75);
            
            if (archivoFoto == null || archivoThumbnail == null)
            {
                throw new Exception("Ocurrió un error al crear el archivo de imágen");
            }

            FotografiaInmueble fotografia = FotografiaInmueble.GetForDataUpdate(data_context, idFotografia, idInmueble);
            fotografia.SetData(data_context, archivoFoto, archivoThumbnail, principal_CBox.Checked);
            data_context.SubmitChanges();

            fotos_View.DataBind();
        }
        catch (Exception ex)
        {
            FormUtils.ShowErrorMessage(this, ex.Message);
        }

        ClearForm();
    }
    private void DeletePhoto()
    {
        ClearForm();
    }
    private void ClearForm()
    {
        descripcion_TBox.Text = string.Empty;
        principal_CBox.Checked = false;
        idFotografia_HF.Value = "0";
        idArchivo_HF.Value = "0";
        idThumbnail_HF.Value = "0";
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
    }
    private void CloseWindow()
    {
        ClientScript.RegisterStartupScript(typeof(Page), "closeWindowScript", "closeWindow(false);", true);
    }

    protected void subir_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        SavePhoto();
    }
    protected void eliminar_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        DeletePhoto();
    }
}
