using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class DatoCredito
    {
        public static DatoCredito GetFromId(SIGEADataContext data_context, int idAvaluo)
        {
            var credito_query = from dc in data_context.DatoCredito
                                where dc.idAvaluo == idAvaluo
                                select dc;

            if (!credito_query.Any())
                return null;

            return credito_query.Single();
        }
        public static DatoCredito GetForDataUpdate(SIGEADataContext data_context, int idAvaluo)
        {
            DatoCredito credito = GetFromId(data_context, idAvaluo);

            if (credito == null)
            {
                credito = new DatoCredito();    
            }

            return credito;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idTipoCredito", idTipoCredito);
            data.Add("idEntidadOtorgante", idEntidadOtorgante);
            data.Add("idEntidadCofinanciamiento", idEntidadCofinanciamiento);
            data.Add("idTipoCreditoInterno", idTipoCreditoInterno);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            idTipoCredito = short.Parse(data["idTipoCredito"].ToString());
            idEntidadOtorgante = short.Parse(data["idEntidadOtorgante"].ToString());

            idEntidadCofinanciamiento = data.ContainsKey("idEntidadCofinanciamiento")
                ? (short?)short.Parse(data["idEntidadCofinanciamiento"].ToString())
                : null;
            idTipoCreditoInterno = data.ContainsKey("idTipoCreditoInterno")
                ? (short?)short.Parse(data["idTipoCreditoInterno"].ToString())
                : null;
        }
    }
}
