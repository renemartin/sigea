using System;
using System.Collections.Generic;
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
    }
}
