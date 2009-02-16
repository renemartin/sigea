using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class UbicacionInmueble
    {
        public static UbicacionInmueble GetForDataUpdate(SIGEADataContext data_context, Inmueble inmueble)
        {
            UbicacionInmueble datos_ubicacion = inmueble.UbicacionInmueble;

            if (datos_ubicacion == null)
            {
                datos_ubicacion = new UbicacionInmueble();
                datos_ubicacion.idInmueble = inmueble.idInmueble;
                data_context.UbicacionInmueble.InsertOnSubmit(datos_ubicacion);
            }

            return datos_ubicacion;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idTipoUbicacion", idTipoUbicacion);
            data.Add("idTipoTopografia", idTipotopografia);
            data.Add("idTipoCaracteristicasPanoramicas", idTipoCaracteristicasPanoramicas);
            data.Add("idTipoUsoSuelo", idTipoUsoSuelo);
            data.Add("idTipoServidumbre", idTipoServidumbre);
            data.Add("idFuenteMedidas", idFuenteMedida);
            data.Add("otraFuente", otraFuente);
            data.Add("configuracionRegular", configuracionRegular);
            data.Add("densidadHabitantes", densidadHabitantes);
            data.Add("densidadViviendas", densidadViviendas);
            data.Add("frentes", frentes);
            data.Add("lados", lados);
            data.Add("descripcionColindancias", descripcionColindancias);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            idTipoUbicacion = short.Parse(data["idTipoUbicacion"].ToString());
            idTipotopografia = short.Parse(data["idTipoTopografia"].ToString());
            idTipoCaracteristicasPanoramicas = short.Parse(data["idTipoCaracteristicasPanoramicas"].ToString());
            idTipoUsoSuelo = short.Parse(data["idTipoUsoSuelo"].ToString());
            idTipoServidumbre = short.Parse(data["idTipoServidumbre"].ToString());
            idFuenteMedida = short.Parse(data["idFuenteMedidas"].ToString());
            otraFuente = data["otraFuente"].ToString();
            configuracionRegular = (bool)data["configuracionRegular"];
            densidadHabitantes = double.Parse(data["densidadHabitantes"].ToString());
            densidadViviendas = double.Parse(data["densidadViviendas"].ToString());
            frentes = short.Parse(data["frentes"].ToString());
            lados = short.Parse(data["lados"].ToString());
            descripcionColindancias = data["descripcionColindancias"].ToString();
        }
    }

    public partial class UbicacionCallesInmueble
    {
        public static UbicacionCallesInmueble GetForDataUpdate(SIGEADataContext data_context, Inmueble inmueble)
        {
            UbicacionCallesInmueble datos_calles = inmueble.UbicacionCallesInmueble;

            if (datos_calles == null)
            {
                datos_calles = new UbicacionCallesInmueble();
                datos_calles.idInmueble = inmueble.idInmueble;
                data_context.UbicacionCallesInmueble.InsertOnSubmit(datos_calles);
            }

            return datos_calles;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idTipoOrientacion1", idTipoOrientacion1);
            data.Add("idTipoOrientacion2", idTipoOrientacion2);
            data.Add("idTipoOrientacion3", idTipoOrientacion3);
            data.Add("calleTransversal1", calleTransversal1);
            data.Add("calleTransversal2", calleTransversal2);
            data.Add("calleLimitrofe", calleLimitrofe);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            idTipoOrientacion1 = short.Parse(data["idTipoOrientacion1"].ToString());
            idTipoOrientacion2 = short.Parse(data["idTipoOrientacion2"].ToString());
            idTipoOrientacion3 = short.Parse(data["idTipoOrientacion3"].ToString());
            calleTransversal1 = data["calleTransversal1"].ToString();
            calleTransversal2 = data["calleTransversal2"].ToString();
            calleLimitrofe = data["calleLimitrofe"].ToString();
        }
    }
}
