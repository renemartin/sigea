﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class GeolocalizacionInmueble
    {
        public static GeolocalizacionInmueble GetForDataUpdate(SIGEADataContext data_context, Inmueble inmueble)
        {
            GeolocalizacionInmueble datos_geolocalizacion = inmueble.GeolocalizacionInmueble;
            if (datos_geolocalizacion == null)
            {
                datos_geolocalizacion = new GeolocalizacionInmueble();
                inmueble.GeolocalizacionInmueble = datos_geolocalizacion;
            }
            return datos_geolocalizacion;
        }
        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();
            data.Add("formatoAbsoluto", formatoAbsoluto);
            data.Add("longitud", longitud);
            data.Add("latitud", latitud);
            data.Add("altitud", altitud);
            return data;
        }
        public void SetData(Dictionary<string, object> data)
        {
            formatoAbsoluto = (bool)data["formatoAbsoluto"];
            latitud = double.Parse(data["latitud"].ToString());
            longitud = double.Parse(data["longitud"].ToString());
            altitud = double.Parse(data["altitud"].ToString());
        }

        public override string ToString()
        {
            StringBuilder georeferencias = new StringBuilder();
            georeferencias.AppendFormat("Latitud: {0} Longitud: {1} Altitud: {2}",
                Inmueble.GeolocalizacionInmueble.latitud.ToString(),
                Inmueble.GeolocalizacionInmueble.longitud.ToString(),
                Inmueble.GeolocalizacionInmueble.altitud.ToString());

            return georeferencias.ToString();
        }
    }
}
