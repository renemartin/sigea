using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class SuperficiesCondominio
    {
        public static SuperficiesCondominio GetForDataUpdate(DatoCondominio condominio)
        {
            SuperficiesCondominio superficies_condominio = condominio.SuperficiesCondominio;

            if (superficies_condominio == null)
            {
                superficies_condominio = new SuperficiesCondominio();
                condominio.SuperficiesCondominio = superficies_condominio;
            }

            return superficies_condominio;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("totalTerreno", totalTerreno);
            data.Add("indiviso", indiviso);
            data.Add("privativo", privativo);
            data.Add("fuenteIndiviso", fuenteIndiviso);
            data.Add("otraFuenteIndiviso", otraFuenteIndiviso);
            data.Add("fuentePrivativo", fuentePrivativo);
            data.Add("otraFuentePrivativo", otraFuentePrivativo);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            totalTerreno = float.Parse(data["totalTerreno"].ToString());
            indiviso = float.Parse(data["indiviso"].ToString());
            privativo = float.Parse(data["privativo"].ToString());
            fuenteIndiviso = int.Parse(data["fuenteIndiviso"].ToString());
            otraFuenteIndiviso = data["otraFuenteIndiviso"].ToString();
            fuentePrivativo = int.Parse(data["fuentePrivativo"].ToString());
            otraFuentePrivativo = data["otraFuentePrivativo"].ToString();
        }
    }
}
