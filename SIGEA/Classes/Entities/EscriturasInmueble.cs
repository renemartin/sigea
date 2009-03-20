using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class EscriturasInmueble
    {
        public static EscriturasInmueble GetForDataUpdate(SIGEADataContext data_context, Inmueble inmueble)
        {
            EscriturasInmueble datos_escrituras = inmueble.EscriturasInmueble;
            if (datos_escrituras == null)
            {
                datos_escrituras = new EscriturasInmueble();         
                inmueble.EscriturasInmueble = datos_escrituras;
            }
            return datos_escrituras;
        }
        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();
            data.Add("numero",numero);
            data.Add("libro",libro);
            data.Add("volumen",volumen);
            data.Add("notario",notario);
            data.Add("notaria",notaria);
            data.Add("plaza", plaza);
            data.Add("fecha", fecha);
            return data;
        }
        public void SetData (Dictionary<string,object> data)
        {
            numero = data["numero"].ToString();
            libro = data["libro"].ToString();
            volumen = data["volumen"].ToString();
            notario = data["notario"].ToString();
            notaria = data["notaria"].ToString();
            plaza = data["plaza"].ToString();
            fecha = (DateTime)data["fecha"];
        }        
    }
}
