using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class DatoCondominio
    {
        public static DatoCondominio GetFromId(SIGEADataContext data_context, int idCondominio)
        {
            var dato_condominio = from d in data_context.DatoCondominio
                                  where d.idCondominio == idCondominio
                                  select d;

            if (!dato_condominio.Any())
                return null;

            return dato_condominio.Single();
        }

        public static DatoCondominio GetFromDataUpdate(SIGEADataContext data_context, int idCondominio)
        {
            DatoCondominio dato_condominio = GetFromId(data_context, idCondominio);

            if (dato_condominio == null)
            {
                dato_condominio = new DatoCondominio();
                dato_condominio.idCondominio = idCondominio;
                data_context.DatoCondominio.InsertOnSubmit(dato_condominio);
            }

            return dato_condominio;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("avanceObra", avanceObra);
            data.Add("unidadesNucleo", unidadesNucleo);
            data.Add("unidadesConjunto", unidadesConjunto);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            avanceObra = float.Parse(data["avanceObra"].ToString());
            unidadesNucleo = int.Parse(data["unidadesNucleo"].ToString());
            unidadesConjunto = int.Parse(data["unidadesConjunto"].ToString());
        }
    }
}
