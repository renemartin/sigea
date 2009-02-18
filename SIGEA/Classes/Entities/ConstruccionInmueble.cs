using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class ConstruccionInmueble
    {
        public static ConstruccionInmueble GetFromId(SIGEADataContext data_context, int idConstruccion)
        {
            var construccionInmueble_query = from c in data_context.ConstruccionInmueble
                                             where c.idConstruccion == idConstruccion
                                             select c;

            if (!construccionInmueble_query.Any())
                return null;

            return construccionInmueble_query.Single();
        }

        public static ConstruccionInmueble GetForDataUpdate(SIGEADataContext data_context, int idConstruccion)
        {
            ConstruccionInmueble construccion_inmueble = GetFromId(data_context, idConstruccion);

            if (construccion_inmueble == null)
            {
                construccion_inmueble = new ConstruccionInmueble();
                construccion_inmueble.idConstruccion = idConstruccion;
                data_context.ConstruccionInmueble.InsertOnSubmit(construccion_inmueble);
            }

            return construccion_inmueble;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idCalidadProyecto", idCalidadProyecto);
            data.Add("avanceObra", avanceObra);
            data.Add("idClase", idClase);
            data.Add("idConservacion", idConservacion);
            data.Add("unidadRentable", unidadRentable);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            idCalidadProyecto = short.Parse(data["idCalidadProyecto"].ToString());
            avanceObra = float.Parse(data["avanceObra"].ToString());
            idClase = short.Parse(data["idClase"].ToString());
            idConservacion = short.Parse(data["idConservacion"].ToString());
            unidadRentable = int.Parse(data["unidadRentable"].ToString());
        }
    }
}
