using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class SuperficiesInmueble
    {
        public static SuperficiesInmueble GetForDataUpdate(Inmueble inmueble)
        {
            SuperficiesInmueble superficies_inmueble = inmueble.SuperficiesInmueble;

            if (superficies_inmueble == null)
            {
                superficies_inmueble = new SuperficiesInmueble();
                inmueble.SuperficiesInmueble = superficies_inmueble;
            }

            return superficies_inmueble;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("totalTerreno", totalTerreno);
            data.Add("frenteLote", frenteLote);
            data.Add("fuenteTerreno", fuenteTerreno);
            data.Add("otraFuenteTerreno", otraFuenteTerreno);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            totalTerreno = float.Parse(data["totalTerreno"].ToString());
            frenteLote = float.Parse(data["fenteLote"].ToString());
            fuenteTerreno = int.Parse(data["fuenteTerreno"].ToString());
            otraFuenteTerreno = data["otraFuenteTerreno"].ToString();
        }

    }
}
