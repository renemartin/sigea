using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using SIGEA.Classes.Entities;

public class FileUploader
{
    SIGEADataContext data_context;

    public FileUploader(SIGEADataContext data_context)
    {
        this.data_context = data_context;
    }

    public Archivo SaveImage(int idArchivo, string title, HttpPostedFile file, string folder_name, int scale_width, int scale_height)
    {
        if (file == null || string.IsNullOrEmpty(file.FileName))
            throw new Exception("Debe proporcionar un archivo para subir");

        Image image = ImageResizer.Resize(Bitmap.FromStream(file.InputStream), scale_width, scale_height);

        string file_name = Path.GetFileNameWithoutExtension(file.FileName);
        string file_extension = ".jpg";
        string new_file_name = string.Empty;
        string new_file_path = string.Empty;

        Archivo archivo = SaveFile(
            idArchivo
            , title
            , file_name
            , file_extension
            , folder_name
            , file.ContentType);

        new_file_name = archivo.idArchivo.ToString();
        new_file_path = Path.Combine("~/" + folder_name, new_file_name + ".jpg");

        try
        {            
            image.Save(HttpContext.Current.Server.MapPath(new_file_path), ImageFormat.Jpeg);
        }
        catch
        {
            data_context.Archivo.DeleteOnSubmit(archivo);
            data_context.SubmitChanges();
            return null;
        }

        return archivo;
    }

    public Archivo SaveFile(int idArchivo, string title, HttpPostedFile file, string folder_name)
    {
        if (file == null || string.IsNullOrEmpty(file.FileName))
            throw new Exception("Debe proporcionar un archivo para subir");


        string file_name = Path.GetFileNameWithoutExtension(file.FileName);
        string file_extension = Path.GetExtension(file.FileName);
        string new_file_name = string.Empty;
        string new_file_path = string.Empty;

        Archivo archivo = SaveFile(
            idArchivo
            , title
            , file_name
            , file_extension
            , folder_name
            , file.ContentType);

        new_file_name = archivo.idArchivo + file_extension;
        new_file_path = Path.Combine("~/" + folder_name, new_file_name);

        try
        {
            file.SaveAs(HttpContext.Current.Server.MapPath(new_file_path));
        }
        catch
        {
            data_context.Archivo.DeleteOnSubmit(archivo);
            data_context.SubmitChanges();
            return null;
        }

        return archivo;
    }

    private Archivo SaveFile(int idArchivo, string title, string file_name, string file_extension, string folder_name, string MIME_type)
    {
        Archivo archivo = Archivo.GetForDataUpdate(data_context, idArchivo, folder_name);
        archivo.SetData(title, file_name, file_extension, MIME_type);

        data_context.SubmitChanges();

        return archivo;
    }

    public Archivo UpdateTitulo(int idArchivo, string title)
    {
        Archivo archivo = Archivo.GetFromId(data_context, idArchivo);
        if (archivo != null)
        {
            archivo.titulo = title;
        }

        return archivo;
    }
}
