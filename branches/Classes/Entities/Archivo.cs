using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class Archivo
    {
        public static Archivo GetFromId(SIGEADataContext data_context, int idArchivo)
        {
            var archivo_query = from a in data_context.Archivo
                                where a.idArchivo == idArchivo
                                select a;
            if (!archivo_query.Any())
                return null;

            return archivo_query.Single();
        }
        public static Archivo GetForDataUpdate(SIGEADataContext data_context, int idArchivo, string folder_name)
        {
            Archivo archivo = GetFromId(data_context, idArchivo);
            if (archivo == null)
            {
                archivo = new Archivo();
                archivo.fechaCreacion = DateTime.Now;
                data_context.Archivo.InsertOnSubmit(archivo);

                Carpeta carpeta = null;
                var carpeta_query = from c in data_context.Carpeta
                                  where c.ruta == folder_name
                                  select c;
                if (!carpeta_query.Any())
                {
                    carpeta = new Carpeta();
                    carpeta.ruta = folder_name;
                    carpeta.descripcion = "SIGEA Web folder";
                }
                else
                {
                    carpeta = carpeta_query.Single();
                }
                archivo.Carpeta = carpeta;
            }

            return archivo;
        }

        public void SetData(string title, string file_name, string file_extension, string MIME_type)
        {
            titulo = title;
            nombre = file_name;
            extension = file_extension;
            tipoMIME = MIME_type;
            fechaModificacion = DateTime.Now;
        }

        public string GetUrl()
        {
            return Carpeta.ruta + "/" + idArchivo + "?tck=" + DateTime.Now.Ticks;
        }
    }
}
