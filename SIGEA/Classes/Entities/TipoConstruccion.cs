using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class TipoConstruccion
    {
        public static TipoConstruccion GetFromId(SIGEADataContext data_context, int idConstruccion)
        {
            var tipoConstruccion_query = from t in data_context.TipoConstruccion
                                         where t.idConstruccion == idConstruccion
                                         select t;

            if (!tipoConstruccion_query.Any())
                return null;

            return tipoConstruccion_query.Single();
        }

        public static TipoConstruccion GetForDataUpdate(SIGEADataContext data_context, int idConstruccion)
        {
            TipoConstruccion tipo_construccion = GetFromId(data_context, idConstruccion);

            if (tipo_construccion == null)
            {
                tipo_construccion = new TipoConstruccion();
                tipo_construccion.idConstruccion = idConstruccion;
                data_context.TipoConstruccion.InsertOnSubmit(tipo_construccion);
            }

            return tipo_construccion;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idConstruccion", idConstruccion);
            data.Add("idClase", idClase);
            data.Add("idConservacion", idConservacion);
            data.Add("idFuente", idFuente);
            data.Add("descripcion", descripcion);
            data.Add("superficie", superficie);
            data.Add("accesorio", accesorio);
            data.Add("niveles", niveles);
            data.Add("edad", edad);
            data.Add("avanceObra", avanceObra);
            data.Add("vidaUtil", vidaUtil);
            data.Add("nivelesCuerpo", nivelesCuerpo);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            idConstruccion = int.Parse(data["idConstruccion"].ToString());
            idClase = short.Parse(data["idClase"].ToString());
            idConservacion = short.Parse(data["idConservacion"].ToString());
            idFuente = short.Parse(data["idFuente"].ToString());
            descripcion = data["descripcion"].ToString();
            superficie = float.Parse(data["superficie"].ToString());
            accesorio = (bool)data["accesorio"];
            niveles = short.Parse(data["niveles"].ToString());
            edad = float.Parse(data["edad"].ToString());
            avanceObra = float.Parse(data["avanceObra"].ToString());
            vidaUtil = float.Parse(data["vidaUtil"].ToString());
            nivelesCuerpo = short.Parse(data["nivelesCuerpo"].ToString());
        }
    }
}
