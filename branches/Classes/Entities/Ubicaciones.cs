using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public class Ubicaciones
    {
        public static short GetIdTipoAsentamiento(SIGEADataContext data_context, string nombreTipo)
        {
            return data_context.TipoAsentamiento.Single(ta => ta.tipoAsentamiento1.ToUpper() == nombreTipo.ToUpper()).idTipoAsentamiento;
        }

        public static CodigoPostal GetCodigoPostal(SIGEADataContext data_context, string codigoPostal, string nombreAsentamiento, int idMunicipio)
        {
            Asentamiento asentamiento_entity = null;
            CodigoPostal codigo_postal_entity = null;

            // Obtener asentamiento
            var asentamientos = from a in data_context.Asentamiento
                                where a.nombreAsentamiento == nombreAsentamiento && a.idMunicipio == idMunicipio
                                select a;
            if (asentamientos.Count() == 1)
            {
                asentamiento_entity = asentamientos.Single();
            }
            else
            {
                asentamiento_entity = new Asentamiento();
                asentamiento_entity.idTipoAsentamiento = GetIdTipoAsentamiento(data_context, "colonia");
                asentamiento_entity.capturado = true;
                asentamiento_entity.nombreAsentamiento = nombreAsentamiento;
                asentamiento_entity.idMunicipio = idMunicipio;
            }

            // Obtener codigo postal
            var codigos_postales = from cp in data_context.CodigoPostal
                                   where cp.codigoPostal1 == codigoPostal && cp.idAsentamiento == asentamiento_entity.idAsentamiento
                                   select cp;
            if (codigos_postales.Count() == 1)
            {
                codigo_postal_entity = codigos_postales.Single();
            }
            else
            {
                codigo_postal_entity = new CodigoPostal();
                codigo_postal_entity.capturado = true;
                codigo_postal_entity.codigoPostal1 = codigoPostal;
                codigo_postal_entity.Asentamiento = asentamiento_entity;
            }

            return codigo_postal_entity;
        }

        public static string GetCodigoPostal(SIGEADataContext data_context, int idMunicipio, string asentamiento)
        {
            var cp_query = from cp in data_context.CodigoPostal
                           where cp.Asentamiento.nombreAsentamiento.ToLower() == asentamiento.ToLower().Trim()
                            && cp.Asentamiento.idMunicipio == idMunicipio
                           select cp.codigoPostal1;

            if (cp_query.Count() != 1)
                return string.Empty;

            return cp_query.Single();
        }

        public static List<string> GetAsentamientos(SIGEADataContext data_context, string prefix, int count,
            int idMunicipio, string codigoPostal)
        {
            var asentamientos = from a in data_context.Asentamiento select a;

            if (!string.IsNullOrEmpty(codigoPostal))
            {
                asentamientos = from a in asentamientos 
                                join cp in data_context.CodigoPostal on a.idAsentamiento equals cp.idAsentamiento 
                                where a.idMunicipio == idMunicipio
                                    && cp.codigoPostal1 == codigoPostal
                                select a;
            }
            else
            {
                asentamientos = asentamientos.Where(a => a.idMunicipio == idMunicipio);
            }

            var lista = asentamientos.Select(a => a.nombreAsentamiento).Where(a => a.ToLower().StartsWith(prefix.Trim().ToLower()));

            if (count > 0)
            {
                lista = lista.Take(count);
            }

            return lista.ToList();
        }
       
    }
}
