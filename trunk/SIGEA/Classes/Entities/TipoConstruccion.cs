﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class TipoConstruccion
    {
        public static Dictionary<string, object>[] GetTiposConstruccion(ConstruccionInmueble construccion)
        {
            var tipos_construccion_query = from tc in construccion.TipoConstruccion
                                           orderby tc.numeroTipo
                                           select tc.GetData();

            if (!tipos_construccion_query.Any())
                return null;

            return tipos_construccion_query.ToArray();
        }
        public static void SetTiposConstruccion(ConstruccionInmueble construccion, Dictionary<string, object>[] data_set)
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
            foreach (TipoConstruccion delete_item in delete_query.ToList())
                construccion.TipoConstruccion.Remove(delete_item);
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