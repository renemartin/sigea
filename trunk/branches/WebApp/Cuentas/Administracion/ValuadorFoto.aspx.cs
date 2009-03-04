using System;
using System.Configuration;
using System.Web.UI;
using SIGEA.Classes.Entities;

public partial class Cuentas_Administracion_ValuadorFoto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetParameters();
        }
    }

    private int IdValuador
    {
        set { ViewState["idValuador"] = value; }
        get { return (int)ViewState["idValuador"]; }
    }
    
    private void ShowPhoto(string url_foto)
    {
        foto_Ima.ImageUrl = "~/" + url_foto;
        foto_Ima.Visible = true;
    }
    private void SavePhoto()
    {
        int idArchivo = 0;

        SIGEADataContext data_context = new SIGEADataContext();
        FileUploader uploader = new FileUploader(data_context);
        try
        {            
            Valuador valuador = Valuador.GetFromId(data_context, IdValuador);
            if (valuador.Archivo != null)
                idArchivo = valuador.Archivo.idArchivo;

            string folder_name = ConfigurationManager.AppSettings["photosFolderPath"];

            Archivo archivo = uploader.SaveImage(idArchivo, "Imagen del valuador", file_Fup.PostedFile, folder_name, 150, 150);
            if (archivo == null)
            {
                throw new Exception("Ocurrió un error al crear el archivo de imágen");
            }

            if (idArchivo == 0)
            {
                valuador.Archivo = archivo;
                data_context.SubmitChanges();
            }

            CloseWindow();
        }
        catch (Exception ex)
        {
            FormUtils.ShowErrorMessage(this, ex.Message);
        }
    }

    private void GetParameters()
    {
        if (Request.QueryString["idValuador"] == null)
        {
            FormUtils.ShowErrorMessage(this, "Identificador de valuador no proporcionado");
            CloseWindow();
            return;
        }

        int idValuador;
        if (!int.TryParse(Request.QueryString["idValuador"], out idValuador))
        {
            FormUtils.ShowErrorMessage(this, "Identificador de valuador inválido");
            CloseWindow();
            return;
        }

        SIGEADataContext data_context = new SIGEADataContext();
        Valuador valuador = Valuador.GetFromId(data_context, idValuador);
        if (valuador == null)
        {
            FormUtils.ShowErrorMessage(this, "Valuador no encontrado");
            CloseWindow();
            return;
        }

        string url_foto = valuador.GetUrlFoto();
        if (!string.IsNullOrEmpty(url_foto))
        {
            ShowPhoto(url_foto);
        }

        IdValuador = idValuador;
    }
    private void CloseWindow()
    {
        ClientScript.RegisterStartupScript(typeof(Page), "closeWindowScript", "closeWindow(false);", true);
    }

    protected void save_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        SavePhoto();
    }
}
