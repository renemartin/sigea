using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class TipoConstruccion
    {
        public static TipoConstruccion GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo, int numeroTipo)
        {
            var tipoConstruccion_query = from tc in data_context.TipoConstruccion
                                         join c in data_context.ConstruccionInmueble on tc.idConstruccion equals c.idConstruccion
                                         join i in data_context.Inmueble on c.idInmueble equals i.idInmueble
                                         join a in data_context.AvaluoInmobiliario on i.idInmueble equals a.idInmueble
                                         where a.idAvaluo == idAvaluo && tc.numeroTipo == numeroTipo
                                         select tc;
                                         

            if (!tipoConstruccion_query.Any())
                return null;

            return tipoConstruccion_query.Single();               
        }

        public static int GetVidaUtilFromIDClase(SIGEADataContext data_context, int idClase) 
        {
            var vida_util_query = from c in data_context.ClaseInmueble
                                         where c.idClase == idClase
                                         select (int)c.vidaUtil;

            if (!vida_util_query.Any())
                return 0;

            return vida_util_query.Single();
        }
        
        public static Dictionary<string, object>[] GetTiposConstruccion(ConstruccionInmueble construccion)
        {
            var tipos_construccion_query = from tc in construccion.TipoConstruccion
                                           orderby tc.numeroTipo
                                           select tc.GetData();

            if (!tipos_construccion_query.Any())
                return null;

            return tipos_construccion_query.ToArray();
        }
        public static void SetTiposConstruccion(SIGEADataContext data_context, ConstruccionInmueble construccion, Dictionary<string, object>[] data_set)
        {
            TipoConstruccion tipo_construccion = null;
            foreach (Dictionary<string, object> data in data_set)
            {
                var tipos_construccion_query = from tc in construccion.TipoConstruccion
                                      where tc.numeroTipo == short.Parse(data["numeroTipo"].ToString())
                                      select tc;

                if (tipos_construccion_query.Any())
                {
                    tipo_construccion = tipos_construccion_query.Single();
                }
                else
                {
                    tipo_construccion = new TipoConstruccion();
                    construccion.TipoConstruccion.Add(tipo_construccion);
                }

                tipo_construccion.SetData(data);
            }

            var delete_query = from tc in construccion.TipoConstruccion
                               where tc.numeroTipo > data_set.Length
                               select tc;
            //foreach (TipoConstruccion delete_item in delete_query.ToList())
            //    construccion.TipoConstruccion.Remove(delete_item);
            data_context.TipoConstruccion.DeleteAllOnSubmit(delete_query.ToList());
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("numeroTipo", numeroTipo);
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
            numeroTipo = short.Parse(data["numeroTipo"].ToString());
            idClase = short.Parse(data["idClase"].ToString());
            idConservacion = short.Parse(data["idConservacion"].ToString());
            idFuente = short.Parse(data["idFuente"].ToString());
            otraFuente = "";
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
