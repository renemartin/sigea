using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIGEA.Classes.Entities;


public partial class Cuentas_Valuacion_Editores_SHF_Modulos_Documentos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetParameters();
        }
    }

    public string GetShowMethod(int idDocumento, int idArchivo, string urlDocumento, string titulo)
    {
        return string.Format("loadDocumento({0},{1},'{2}','{3}'); return false;",
            idDocumento,
            idArchivo,
            urlDocumento,
            titulo);
    }

    private void SaveDocumento()
    {
        int idAvaluo = int.Parse(idAvaluo_HF.Value);
        int idDocumento = int.Parse(idDocumento_HF.Value);
        int idArchivo = int.Parse(idArchivo_HF.Value);

        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);

        try
        {

            FileUploader uploader = new FileUploader(data_context);
            string folder_name = ConfigurationManager.AppSettings["docsFolderPath"];

            Archivo archivoDocumento = null;

            if (cambioDocumento_HF.Value != "")
            {
                archivoDocumento = uploader.SaveFile(idArchivo, descripcion_TBox.Text, file_Fup.PostedFile, folder_name);
            }
            else
            {
                archivoDocumento = uploader.UpdateTitulo(idArchivo, descripcion_TBox.Text);
            }

            if (archivoDocumento == null)
            {
                throw new Exception("Ocurrió un error al crear el archivo del documento");
            }

            DocumentoAvaluo documento = DocumentoAvaluo.GetForDataUpdate(data_context, idDocumento, idAvaluo);
            documento.SetData(archivoDocumento, short.Parse(tipo_DDList.SelectedValue));

            data_context.SubmitChanges();

            documentos_View.DataBind();
        }
        catch (Exception ex)
        {
            FormUtils.ShowErrorMessage(this, ex.Message);
        }

        ClearForm();
    }
    private void DeleteDocumento()
    {
        int idDocumento = int.Parse(idDocumento_HF.Value);
        string urlDocumento = Server.MapPath("~/" + urlDocumento_HF.Value.Split('?')[0]);        

        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        try
        {
            if (File.Exists(urlDocumento))
            {
                File.Delete(urlDocumento);
            }

            DocumentoAvaluo.Delete(data_context, idDocumento);
            data_context.SubmitChanges();

            documentos_View.DataBind();
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

        idDocumento_HF.Value = "0";
        idArchivo_HF.Value = "0";
        urlDocumento_HF.Value = "";
        cambioDocumento_HF.Value = "True";
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

        idAvaluo_HF.Value = idAvaluo.ToString();
    }
    private void CloseWindow()
    {
        ClientScript.RegisterStartupScript(typeof(Page), "closeWindowScript", "closeWindow(false);", true);
    }

    protected void subir_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        SaveDocumento();
    }
    protected void cancelar_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        ClearForm();
    }
    protected void eliminar_ImBtn_Click(object sender, ImageClickEventArgs e)
    {
        DeleteDocumento();
    }
    public void SetupContext(object sender, LinqDataSourceContextEventArgs e)
    {
        e.ObjectInstance = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
    }
}
