using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class AreaComun
    {
        public static Dictionary<string, object>[] GetAreasComunes(DatoCondominio dato_condominio, bool complementarias)
        {
            var area_comun_query = from ac in dato_condominio.AreaComun
                                   where ac.complemetaria == complementarias
                                   orderby ac.idArea
                                   select ac.GetData();

            if (!area_comun_query.Any())
                return null;

            return area_comun_query.ToArray();
        }
        public static void SetAreasComunes(DatoCondominio dato_condominio, Dictionary<string, object>[] data_set, bool complementarias)
        {
            AreaComun area_comun = null;
            foreach (Dictionary<string, object> data in data_set)
            {
                var areas_comunes_query = from ac in dato_condominio.AreaComun
                                          where ac.complemetaria == complementarias 
                                            && ac.idArea == short.Parse(data["idArea"].ToString())
                                          select ac;

                if (areas_comunes_query.Any())
                {
                    area_comun = areas_comunes_query.Single();
                }
                else
                {
                    area_comun = new AreaComun();
                    area_comun.complemetaria = complementarias;
                    dato_condominio.AreaComun.Add(area_comun);
                }

                area_comun.SetData(data);
            }

            var delete_query = from ac in dato_condominio.AreaComun
                               where ac.idArea > data_set.Length && ac.complemetaria == complementarias
                               select ac;
            foreach (AreaComun delete_item in delete_query.ToList())
                dato_condominio.AreaComun.Remove(delete_item);
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idArea", idArea);
            data.Add("concepto", concepto);
            data.Add("superficie", superficie);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            idArea = short.Parse(data["idArea"].ToString());
            concepto = data["concepto"].ToString();
            superficie = float.Parse(data["superficie"].ToString());
        }
    }
}
