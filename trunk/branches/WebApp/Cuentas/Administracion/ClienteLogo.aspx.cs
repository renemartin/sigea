using System;
using System.Configuration;
using System.Web.UI;
using SIGEA.Classes.Entities;

public partial class Cuentas_Administracion_ClienteLogo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetParameters();
        }
    }

    private int IdCliente
    {
        set { ViewState["idCliente"] = value; }
        get { return (int)ViewState["idCliente"]; }
    }

    private void ShowPhoto(string url_foto)
    {
        foto_Ima.ImageUrl = "~/" + url_foto + "?tck=" + DateTime.Now.Ticks;
        foto_Ima.Visible = true;
    }
    private void SavePhoto()
    {
        int idArchivo = 0;

        SIGEADataContext data_context = new SIGEADataContext();
        FileUploader uploader = new FileUploader(data_context);
        try
        {
            Cliente cliente = Cliente.GetFromId(data_context, IdCliente);
            if (cliente.Archivo != null)
                idArchivo = cliente.Archivo.idArchivo;

            string folder_name = ConfigurationManager.AppSettings["photosFolderPath"];

            Archivo archivo = uploader.SaveImage(idArchivo, "Imagen del cliente", file_Fup.PostedFile, folder_name, 150, 150);
            if (archivo == null)
            {
                throw new Exception("Ocurrió un error al crear el archivo de imágen");
            }

            if (idArchivo == 0)
            {
                cliente.Archivo = archivo;
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
        if (Request.QueryString["idCliente"] == null)
        {
            FormUtils.ShowErrorMessage(this, "Identificador de valuador no proporcionado");
            CloseWindow();
            return;
        }

        int idCliente;
        if (!int.TryParse(Request.QueryString["idCliente"], out idCliente))
        {
            FormUtils.ShowErrorMessage(this, "Identificador de cliente inválido");
            CloseWindow();
            return;
        }

        SIGEADataContext data_context = new SIGEADataContext();
        Cliente cliente = Cliente.GetFromId(data_context, idCliente);
        if (cliente == null)
        {
            FormUtils.ShowErrorMessage(this, "Cliente no encontrado");
            CloseWindow();
            return;
        }

        string url_foto = cliente.GetUrlFoto();
        if (!string.IsNullOrEmpty(url_foto))
        {
            ShowPhoto(url_foto);
        }

        IdCliente = idCliente;
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
