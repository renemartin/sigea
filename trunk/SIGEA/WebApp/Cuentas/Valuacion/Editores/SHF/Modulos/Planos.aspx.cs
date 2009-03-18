using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIGEA.Classes.Entities;

public partial class Cuentas_Valuacion_Editores_SHF_Modulos_Planos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetParameters();
        }
    }

    public string GetShowMethod(int idFotografia, int idArchivo, int idArchivoThumbnail,
        string urlFoto, string urlThumbnail, string titulo)
    {
        return string.Format("loadPhoto({0},{1},{2},'{3}','{4}','{5}'); return false;",
            idFotografia,
            idArchivo,
            idArchivoThumbnail,
            urlFoto,
            urlThumbnail,
            titulo);
    }

    private void SaveImage()
    {
        int idInmueble = int.Parse(idInmueble_HF.Value);
        int idPlano = int.Parse(idPlano_HF.Value);
        int idArchivo = int.Parse(idArchivo_HF.Value);
        int idArchivoThumbnail = int.Parse(idThumbnail_HF.Value);

        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);

        try
        {

            FileUploader uploader = new FileUploader(data_context);
            string folder_name = ConfigurationManager.AppSettings["photosFolderPath"];

            Archivo archivoImagen = null;
            Archivo archivoThumbnail = null;

            if (cambioImagen_HF.Value != "")
            {
                archivoImagen = uploader.SaveImage(idArchivo, descripcion_TBox.Text, file_Fup.PostedFile, folder_name, 1024, 768);
                archivoThumbnail = uploader.SaveImage(idArchivoThumbnail, descripcion_TBox.Text, file_Fup.PostedFile, folder_name, 100, 75);
            }
            else
            {
                archivoImagen = uploader.UpdateTitulo(idArchivo, descripcion_TBox.Text);
                archivoThumbnail = uploader.UpdateTitulo(idArchivoThumbnail, descripcion_TBox.Text);
            }

            if (archivoImagen == null || archivoThumbnail == null)
            {
                throw new Exception("Ocurrió un error al crear el archivo de imágen");
            }

            PlanoInmueble plano = PlanoInmueble.GetForDataUpdate(data_context, idPlano, idInmueble);
            plano.SetData(archivoImagen, archivoThumbnail);

            data_context.SubmitChanges();

            planos_View.DataBind();
        }
        catch (Exception ex)
        {
            FormUtils.ShowErrorMessage(this, ex.Message);
        }

        ClearForm();
    }
    private void DeleteImage()
    {
        int idPlano = int.Parse(idPlano_HF.Value);
        string urlImagen = Server.MapPath("~/" + urlImagen_HF.Value.Split('?')[0]);
        string urlThumbnail = Server.MapPath("~/" + urlThumbnail_HF.Value.Split('?')[0]);

        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        try
        {
            if (File.Exists(urlImagen))
            {
                File.Delete(urlImagen);
            }

            if (File.Exists(urlThumbnail))
            {
                File.Delete(urlThumbnail);
            }

            PlanoInmueble.Delete(data_context, idPlano);
            data_context.SubmitChanges();

            planos_View.DataBind();
        }
        catch (Exception ex)
        {
            FormUtils.ShowErrorMessage(this, ex.Message);
        }

        ClearForm();
    }
    private void ClearForm()
    {
        descripcion_TBox.Text = string.Empty;
        idPlano_HF.Value = "0";
        idArchivo_HF.Value = "0";
        idThumbnail_HF.Value = "0";
        urlImagen_HF.Value = "";
        urlThumbnail_HF.Value = "";
        cambioImagen_HF.Value = "True";
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
        SaveImage();
    }
    protected void cancelar_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        ClearForm();
    }
    protected void eliminar_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        DeleteImage();
    }
}
