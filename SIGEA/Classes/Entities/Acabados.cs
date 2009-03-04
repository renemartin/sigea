using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class EstructurasTipoConstruccion
    {

        public static EstructurasTipoConstruccion GetForDataUpdate(SIGEADataContext data_context, TipoConstruccion tipoConstruccion)
        {
            EstructurasTipoConstruccion datos_estructuras = tipoConstruccion.EstructurasTipoConstruccion;
            if (datos_estructuras == null)
            {
                datos_estructuras = new EstructurasTipoConstruccion();
                datos_estructuras.numeroTipo = tipoConstruccion.numeroTipo;
                datos_estructuras.idConstruccion = tipoConstruccion.idConstruccion;
                data_context.EstructurasTipoConstruccion.InsertOnSubmit(datos_estructuras);
            }
            return datos_estructuras;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();
            data.Add("cimentacion", cimentacion);
            data.Add("entrepisos", entrepisos);
            data.Add("muros", muros);
            data.Add("trabes", trabes);
            data.Add("escaleras", escaleras);
            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            cimentacion = data["cimentacion"].ToString();
            entrepisos = data["entrepisos"].ToString();
            muros = data["muros"].ToString();
            trabes = data["trabes"].ToString();
            escaleras = data["escaleras"].ToString();
        }

    }

    public partial class AcabadoTipoConstruccion
    {
        public static Dictionary<string, object>[] GetAcabados(TipoConstruccion tipo_construccion)
        {
            var acabados_query = from ac in tipo_construccion.AcabadoTipoConstruccion
                                 orderby ac.idTipoAcabado
                                 select ac.GetData();

            if (!acabados_query.Any())
                return null;

            return acabados_query.ToArray();

        }

        public static void SetAcabados(TipoConstruccion tipo_construccion, Dictionary<string, object>[] data_set)
        {
            AcabadoTipoConstruccion acabado = null;
            foreach (Dictionary<string, object> data in data_set)
            {
                var acabados_query = from ac in tipo_construccion.AcabadoTipoConstruccion
                                     where ac.idTipoAcabado == short.Parse(data["idTipoAcabado"].ToString())
                                     select ac;
                if (acabados_query.Any())
                {
                    acabado = acabados_query.Single();
                }
                else
                {
                    acabado = new AcabadoTipoConstruccion();
                    tipo_construccion.AcabadoTipoConstruccion.Add(acabado);
                }

                acabado.SetData(data);
            }
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();
            data.Add("idTipoAcabado", idTipoAcabado);
            data.Add("piso", piso);
            data.Add("muro", muro);
            data.Add("plafon", plafon);
            return data;


        }
        public void SetData(Dictionary<string, object> data)
        {
            idTipoAcabado = short.Parse(data["idTipoAcabado"].ToString());
            piso = data["piso"].ToString();
            muro = data["muro"].ToString();
            plafon = data["plafon"].ToString();
        }
    }

}

