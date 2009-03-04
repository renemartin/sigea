using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class DatoCondominio
    {
        public static DatoCondominio GetFromIdAvaluo(SIGEADataContext common_context, int idAvaluo)
        {
            var condominio_query = from dc in common_context.DatoCondominio
                                   join i in common_context.Inmueble on dc.idInmueble equals i.idInmueble
                                   join a in common_context.AvaluoInmobiliario on i.idInmueble equals a.idInmueble
                                   where a.idAvaluo == idAvaluo
                                   select dc;

            if (!condominio_query.Any())
                return null;

            return condominio_query.Single();
        }

        public static DatoCondominio GetFromDataUpdate(Inmueble inmueble)
        {
            DatoCondominio dato_condominio = inmueble.DatoCondominio;

            if (dato_condominio == null)
            {
                dato_condominio = new DatoCondominio();
                inmueble.DatoCondominio = dato_condominio;
            }

            return dato_condominio;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("avanceObra", avanceObra);
            data.Add("unidadesRentNucleo", unidadesNucleo);
            data.Add("unidadesRentConjunto", unidadesConjunto);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            avanceObra = float.Parse(data["avanceObra"].ToString());
            unidadesNucleo = int.Parse(data["unidadesRentNucleo"].ToString());
            unidadesConjunto = int.Parse(data["unidadesRentConjunto"].ToString());
        }
    }
}
