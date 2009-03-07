using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class ConstruccionInmueble
    {
        public static ConstruccionInmueble GetFromIdAvaluo(SIGEADataContext data_context, int idAvaluo)
        {
            var construccion_query = from c in data_context.ConstruccionInmueble
                                     join i in data_context.Inmueble on c.idInmueble equals i.idInmueble
                                     join a in data_context.AvaluoInmobiliario on i.idInmueble equals a.idInmueble
                                     where a.idAvaluo == idAvaluo
                                     select c;

            if (!construccion_query.Any())
                return null;

            return construccion_query.Single();
        }

        public static ConstruccionInmueble GetForDataUpdate(Inmueble inmueble)
        {
            ConstruccionInmueble construccion_inmueble = inmueble.ConstruccionInmueble;

            if (construccion_inmueble == null)
            {
                construccion_inmueble = new ConstruccionInmueble();
                inmueble.ConstruccionInmueble = construccion_inmueble;
            }

            return construccion_inmueble;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idClaseGeneral", idClaseGeneral);
            data.Add("idConservacionGeneral", idConservacionGeneral);
            data.Add("idCalidadProyecto", idCalidadProyecto);
            data.Add("nombreConstructor", constructor);
            data.Add("avanceObraGeneral", avanceObraGeneral);
            data.Add("nivelesConstruccion", nivelesConstruccion);
            data.Add("nivelEdificio", nivelEdificio);
            data.Add("horizontal", horizontal);
            data.Add("vertical", vertical);
            data.Add("unidadesRentables", unidadesRentables);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            idClaseGeneral = short.Parse(data["idClaseGeneral"].ToString());
            idConservacionGeneral = short.Parse(data["idConservacionGeneral"].ToString());
            idCalidadProyecto = short.Parse(data["idCalidadProyecto"].ToString());
            constructor = data["nombreConstructor"].ToString();
            avanceObraGeneral = float.Parse(data["avanceObraGeneral"].ToString());
            nivelesConstruccion = short.Parse(data["nivelesConstruccion"].ToString());
            nivelEdificio = short.Parse(data["nivelEdificio"].ToString());
            horizontal = (bool)data["horizontal"];
            vertical = (bool)data["vertical"];
            unidadesRentables = short.Parse(data["unidadesRentables"].ToString());
        }

        public void SetFachada(Dictionary<string, object> data)
        {
            fachada = data["fachada"].ToString();
        }

        public Dictionary<string, object> GetFachada()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("fachada", fachada);

            return data;
        }
    }
}