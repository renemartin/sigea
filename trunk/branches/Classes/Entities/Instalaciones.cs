using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class InstalacionConstruccion
    {

        public static Dictionary<string, object>[] GetInstalacionesConstruccion(ConstruccionInmueble construccion_inmueble, bool comun)
        {
            var instalaciones_construccion_query = from ic in construccion_inmueble.InstalacionConstruccion
                                                   where ic.comun == comun
                                                   orderby ic.idInstalacion
                                                   select ic.GetData();
            if (!instalaciones_construccion_query.Any())
                return null;

            return instalaciones_construccion_query.ToArray();


        }

        public static void SetInstalacionesConstruccion(ConstruccionInmueble construccion_inmueble, Dictionary<string,
            object>[] data_set, bool comun)
        {
            InstalacionConstruccion instalacion_construccion = null;
            foreach (Dictionary<string, object> data in data_set)
            {
                var instalaciones_construccion_query = from ic in construccion_inmueble.InstalacionConstruccion
                                                       where ic.comun == comun
                                                       && ic.idInstalacion == short.Parse(data["idInstalacion"].ToString())
                                                       select ic;
                if (instalaciones_construccion_query.Any())
                {
                    instalacion_construccion = instalaciones_construccion_query.Single();
                }
                else
                {
                    instalacion_construccion = new InstalacionConstruccion();
                    instalacion_construccion.comun = comun;
                    construccion_inmueble.InstalacionConstruccion.Add(instalacion_construccion);
                }
                instalacion_construccion.SetData(data);
            }
            var delete_query = from ic in construccion_inmueble.InstalacionConstruccion
                               where ic.idInstalacion > data_set.Length && ic.comun == comun
                               select ic;
            foreach (InstalacionConstruccion delete_item in delete_query.ToList())
                construccion_inmueble.InstalacionConstruccion.Remove(delete_item);
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idInstalacion", idInstalacion);
            data.Add("idTipoUnidad", idTipoUnidad);
            data.Add("idTipoConservacion", idTipoConservacion);
            data.Add("descripcion", descripcion);
            data.Add("cantidad", cantidad);
            data.Add("edad", edad);
            data.Add("comun", comun);

            return data;
        }
        public void SetData(Dictionary<string, object> data)
        {
            idInstalacion = short.Parse(data["idInstalacion"].ToString());
            idTipoUnidad = short.Parse(data["idTipoUnidad"].ToString());
            idTipoConservacion = short.Parse(data["idTipoConservacion"].ToString());
            descripcion = data["descripcion"].ToString();
            cantidad = double.Parse(data["cantidad"].ToString());
            edad = double.Parse(data["edad"].ToString());
        }

    }

    public partial class InstalacionesTipoConstruccion
    {
  
        public static InstalacionesTipoConstruccion GetForDataUpdate(SIGEADataContext data_context,TipoConstruccion tipo_construccion )
        {
            InstalacionesTipoConstruccion datos_instalaciones = tipo_construccion.InstalacionesTipoConstruccion;
            if (datos_instalaciones == null)
            {
                datos_instalaciones = new InstalacionesTipoConstruccion();
                datos_instalaciones.numeroTipo = tipo_construccion.numeroTipo;
                datos_instalaciones.idConstruccion = tipo_construccion.idConstruccion;
                data_context.InstalacionesTipoConstruccion.InsertOnSubmit(datos_instalaciones);
            }
            return datos_instalaciones;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();
            data.Add("hidraulicas",hidraulicas);
            data.Add("sanitarias", sanitarias);
            data.Add("electricas", electricas);
            data.Add("carpinteria", carpinteria);
            data.Add("herreria", herreria);
            data.Add("canceleria", canceleria);
            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            hidraulicas = data["hidraulicas"].ToString();
            sanitarias = data["sanitarias"].ToString();
            electricas = data["electricas"].ToString();
            carpinteria = data["carpinteria"].ToString();
            herreria = data["herreria"].ToString();
            canceleria = data["canceleria"].ToString();
        }

        
    }
}
