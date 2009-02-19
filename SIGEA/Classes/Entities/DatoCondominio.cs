using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class DatoCondominio
    {
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
            data.Add("unidadesRentables", unidadesRentables);
            data.Add("unidadesNucleo", unidadesNucleo);
            data.Add("unidadesConjunto", unidadesConjunto);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            avanceObra = float.Parse(data["avanceObra"].ToString());
            unidadesRentables = int.Parse(data["unidadesRentables"].ToString());
            unidadesNucleo = int.Parse(data["unidadesNucleo"].ToString());
            unidadesConjunto = int.Parse(data["unidadesConjunto"].ToString());
        }
    }
}
