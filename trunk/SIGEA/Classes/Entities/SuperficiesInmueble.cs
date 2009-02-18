using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class SuperficiesInmueble
    {
        public static SuperficiesInmueble GetFromId(SIGEADataContext data_context, int idInmueble)
        {
            var superficiesInmueble_query = from s in data_context.SuperficiesInmueble
                                            where s.idInmueble == idInmueble
                                            select s;

            if (!superficiesInmueble_query.Any())
                return null;

            return superficiesInmueble_query.Single();
        }

        public static SuperficiesInmueble GetForDataUpdate(SIGEADataContext data_context, int idInmueble)
        {
            SuperficiesInmueble superficies_inmueble = GetFromId(data_context, idInmueble);

            if (superficies_inmueble == null)
            {
                superficies_inmueble = new SuperficiesInmueble();
                superficies_inmueble.DatosCondominio = new DatoCondominio();
                superficies_inmueble.AreaComun = new AreaComun();
                superficies_inmueble.idInmueble = idInmueble;
                data_context.SuperficiesInmueble.InsertOnSubmit(superficies_inmueble);

            }

            return superficies_inmueble;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("totalTerreno", totalTerreno);
            data.Add("frenteLote", frenteLote);
            data.Add("fuenteTerreno", fuenteTerreno);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            totalTerreno = float.Parse(data["totalTerreno"].ToString());
            frenteLote = float.Parse(data["fenteLote"].ToString());
            fuenteTerreno = int.Parse(data["fuenteTerreno"].ToString());
        }

    }
}
