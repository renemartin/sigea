using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class AreaComun
    {
        public static AreaComun GetFromId(SIGEADataContext data_context, int idArea)
        {
            var areaComun_query = from a in data_context.AreaComun
                                  where a.idArea == idArea
                                  select a;

            if (!areaComun_query.Any())
                return null;

            return areaComun_query.Single();
        }

        public static AreaComun GetFromDataUpdate(SIGEADataContext data_context, int idArea)
        {
            AreaComun area_comun = GetFromId(data_context, idArea);

            if (area_comun == null)
            {
                area_comun = new AreaComun();
                area_comun.idArea = idArea;
                data_context.AreaComun.InsertOnSubmit(area_comun);
            }

            return area_comun;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("concepto", concepto);
            data.Add("superficie", superficie);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            concepto = data["concepto"].ToString();
            superficie = float.Parse(data["superficie"].ToString());
        }
    }
}
