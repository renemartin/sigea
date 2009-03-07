using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class FotografiaInmueble
    {
        public static FotografiaInmueble GetFromId(SIGEADataContext data_context, int idFotografia)
        {
            var fotografia_inmueble = from f in data_context.FotografiaInmueble
                                      where f.idFotografia == idFotografia
                                      select f;

            if (!fotografia_inmueble.Any())
                return null;

            return fotografia_inmueble.Single();
        }
        public static FotografiaInmueble GetForDataUpdate(SIGEADataContext data_context, int idFotografia, int idInmueble)
        {
            FotografiaInmueble foto = GetFromId(data_context, idFotografia);
            if (foto == null)
            {
                foto = new FotografiaInmueble();
                foto.idInmueble = idInmueble;
                data_context.FotografiaInmueble.InsertOnSubmit(foto);
            }

            return foto;
        }

        public static IEnumerable<object> GetThumbnails(int idInmueble)
        {
            SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
            var thumbnails_query = from f in data_context.FotografiaInmueble                                   
                                   where f.idInmueble == idInmueble
                                   select new
                                   {
                                       idFotografia = f.idFotografia,
                                       titulo = f.Archivo.titulo,
                                       idArchivoThumbnail = f.Archivo1.idArchivo,
                                       idArchivo = f.Archivo.idArchivo,
                                       principal = f.principal
                                   };

            return thumbnails_query.ToArray();
        }

        public void SetData(SIGEADataContext data_context, Archivo fotografia, Archivo thumbnail, bool esPrincipal)
        {            
            if (!principal && esPrincipal && Inmueble != null)
            {
                var principal_query = data_context.FotografiaInmueble.Where(f => f.idInmueble == idInmueble && f.principal);
                if (principal_query.Any())
                {
                    principal_query.Single().principal = false;
                }
            }

            Archivo = fotografia;
            Archivo1 = thumbnail;
            principal = esPrincipal;
        }
    }
}
