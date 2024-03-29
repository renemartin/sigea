﻿using System;
using System.Collections.Generic;
using System.Configuration;
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
            return Carpeta.ruta + "/" + idArchivo + extension + "?tck=" + DateTime.Now.Ticks;
        }
    }

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
                                       urlThumbnail = f.Archivo1.GetUrl(),
                                       urlFoto = f.Archivo.GetUrl(),
                                       principal = f.principal
                                   };

            return thumbnails_query.ToArray();
        }

        public static void Delete(SIGEADataContext data_context, int idFotografia)
        {
            var foto_query = from f in data_context.FotografiaInmueble
                             where f.idFotografia == idFotografia
                             select f;

            if (foto_query.Any())
            {
                FotografiaInmueble foto = foto_query.Single();
                data_context.Archivo.DeleteOnSubmit(foto.Archivo);
                data_context.Archivo.DeleteOnSubmit(foto.Archivo1);
                data_context.FotografiaInmueble.DeleteOnSubmit(foto);
            }
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

    public partial class PlanoInmueble
    {
        public static PlanoInmueble GetFromId(SIGEADataContext data_context, int idPlano)
        {
            var plano_inmueble = from p in data_context.PlanoInmueble
                                 where p.idPlano == idPlano
                                 select p;

            if (!plano_inmueble.Any())
                return null;

            return plano_inmueble.Single();
        }
        public static PlanoInmueble GetForDataUpdate(SIGEADataContext data_context, int idPlano, int idInmueble)
        {
            PlanoInmueble plano = GetFromId(data_context, idPlano);
            if (plano == null)
            {
                plano = new PlanoInmueble();
                plano.idInmueble = idInmueble;
                data_context.PlanoInmueble.InsertOnSubmit(plano);
            }

            return plano;
        }

        public static IEnumerable<object> GetThumbnails(int idInmueble)
        {
            SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
            var thumbnails_query = from p in data_context.PlanoInmueble
                                   where p.idInmueble == idInmueble
                                   select new
                                   {
                                       idPlano = p.idPlano,
                                       titulo = p.Archivo.titulo,
                                       idArchivoThumbnail = p.Archivo1.idArchivo,
                                       idArchivo = p.Archivo.idArchivo,
                                       urlThumbnail = p.Archivo1.GetUrl(),
                                       urlImagen = p.Archivo.GetUrl()
                                   };

            return thumbnails_query.ToArray();
        }

        public static void Delete(SIGEADataContext data_context, int idPlano)
        {
            var plano_query = from p in data_context.PlanoInmueble
                              where p.idPlano == idPlano
                              select p;

            if (plano_query.Any())
            {
                PlanoInmueble plano = plano_query.Single();
                data_context.Archivo.DeleteOnSubmit(plano.Archivo);
                data_context.Archivo.DeleteOnSubmit(plano.Archivo1);
                data_context.PlanoInmueble.DeleteOnSubmit(plano);
            }
        }

        public void SetData(Archivo plano, Archivo thumbnail)
        {
            Archivo = plano;
            Archivo1 = thumbnail;
        }
    }

    public partial class DocumentoAvaluo
    {
        public static DocumentoAvaluo GetFromId(SIGEADataContext data_context, int idDocumento)
        {
            var documento_avaluo = from d in data_context.DocumentoAvaluo
                                   where d.idDocumentoAvaluo == idDocumento
                                   select d;

            if (!documento_avaluo.Any())
                return null;

            return documento_avaluo.Single();
        }
        public static DocumentoAvaluo GetForDataUpdate(SIGEADataContext data_context, int idDocumento, int idAvaluo)
        {
            DocumentoAvaluo documento = GetFromId(data_context, idDocumento);
            if (documento == null)
            {
                documento = new DocumentoAvaluo();
                documento.idAvaluo = idAvaluo;
                data_context.DocumentoAvaluo.InsertOnSubmit(documento);
            }

            return documento;
        }

        public static IEnumerable<object> GetLista(int idAvaluo)
        {
            SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
            var lista_query = from d in data_context.DocumentoAvaluo
                              where d.idAvaluo == idAvaluo
                              select new
                              {
                                  idDocumento = d.idDocumentoAvaluo,
                                  titulo = d.Archivo.titulo,
                                  idArchivo = d.idArchivo,
                                  urlDocumento = d.Archivo.GetUrl()
                              };

            return lista_query.ToArray();
        }

        public static void Delete(SIGEADataContext data_context, int idDocumento)
        {
            var documento_query = from d in data_context.DocumentoAvaluo
                                  where d.idDocumentoAvaluo == idDocumento
                                  select d;

            if (documento_query.Any())
            {
                DocumentoAvaluo documento = documento_query.Single();
                data_context.Archivo.DeleteOnSubmit(documento.Archivo);
                data_context.DocumentoAvaluo.DeleteOnSubmit(documento);
            }
        }

        public void SetData(Archivo documento, short idTipo)
        {
            Archivo = documento;
            idTipoDocumento = idTipo;
        }
    }

    public partial class MapaLocalizacion
    {
        public static MapaLocalizacion GetFromIdInmueble(SIGEADataContext data_context, int idInmueble, bool esMacro)
        {
            var mapa_localizacion = from m in data_context.MapaLocalizacion
                                    where m.idInmueble == idInmueble && m.mapaMacro == esMacro  
                                    select m;
            if (!mapa_localizacion.Any())
                return null;
            return mapa_localizacion.Single();
        }
        
        public static MapaLocalizacion GetFromId(SIGEADataContext data_context, int idMapa)
        {
            var mapa_localizacion = from m in data_context.MapaLocalizacion
                                    where m.idMapa == idMapa
                                    select m;
            if (!mapa_localizacion.Any())
                return null;
            return mapa_localizacion.Single();
        }
        public static MapaLocalizacion GetForDataUpdate(SIGEADataContext data_context, int idMapa, int idInmueble)
        {
            MapaLocalizacion mapa = GetFromId(data_context, idMapa);
            if (mapa == null)
            {
                mapa = new MapaLocalizacion();
                mapa.idInmueble = idInmueble;
                data_context.MapaLocalizacion.InsertOnSubmit(mapa);
            }
            return mapa;
        }

        public static void Delete(SIGEADataContext data_context, MapaLocalizacion mapa)
        {
            data_context.Archivo.DeleteOnSubmit(mapa.Archivo);
            data_context.MapaLocalizacion.DeleteOnSubmit(mapa);
        }
        public static MapaLocalizacion GetMapa(int idInmueble, bool esMacro)
        {
            SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
            var mapa_query = from m in data_context.MapaLocalizacion
                             where m.idInmueble == idInmueble && m.mapaMacro == esMacro
                             select m;

            if (!mapa_query.Any())
            {
                return null;
            }
            return mapa_query.Single();
        }

        public void SetData(SIGEADataContext data_context, Archivo mapa, bool esMapaMacro)
        {
            Archivo = mapa;
            mapaMacro = esMapaMacro;
        }

    }
}
