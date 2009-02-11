using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class ComparableInmobiliario
    {
        public void SetDatos(Dictionary<string, object> datosComparable)
        {
            nombre = datosComparable["nombre"].ToString();
            idTipoComparable = short.Parse(datosComparable["idTipoComparable"].ToString());
            valorOferta = decimal.Parse(datosComparable["valorOferta"].ToString());
            idUsoSuelo = short.Parse(datosComparable["idUsoSuelo"].ToString());
            numeroFrentes = int.Parse(datosComparable["numeroFrentes"].ToString());
            superficieTerreno = double.Parse(datosComparable["superficieTerreno"].ToString());
            superficieConstruida = double.Parse(datosComparable["superficieConstruida"].ToString());
            idClase = short.Parse(datosComparable["idClase"].ToString());
            antiguedad = double.Parse(datosComparable["antiguedad"].ToString());
            idConservacion = short.Parse(datosComparable["idConservacion"].ToString());
            idCalidadProyecto = short.Parse(datosComparable["idCalidadProyecto"].ToString());
            antiguedad = double.Parse(datosComparable["antiguedad"].ToString());
            avanceObra = double.Parse(datosComparable["avanceObra"].ToString());
            fechaCreacion = DateTime.Today;
            revisado = true;
            activo = true;
        }

        public static ComparableInmobiliario GetFromID(SIGEADataContext data_context, int idComparable)
        {
            var comparable = data_context.ComparableInmobiliario.Where(c => c.idComparable == idComparable);
            if (!comparable.Any())
                return null;

            return comparable.Single();
        }

        public static ComparableInmobiliario GetDataForUpdate(SIGEADataContext data_context, int idComparable)
        {
            ComparableInmobiliario comparable = null;

            if (idComparable == 0)
            {
                comparable = new ComparableInmobiliario();
                comparable.DatoContacto = new DatoContacto();
                comparable.Direccion = new Direccion();

                data_context.ComparableInmobiliario.InsertOnSubmit(comparable);
            }
            else 
            {
                comparable = GetFromID(data_context, idComparable);
                if (comparable != null)
                {
                    if (comparable.DatoContacto == null)
                        comparable.DatoContacto = new DatoContacto();

                    if(comparable.Direccion == null)
                        comparable.Direccion = new Direccion();
                }
            }

            return comparable;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> datos = new Dictionary<string, object>();

            datos.Add("nombre", nombre);
            datos.Add("idTipoComparable", idTipoComparable);
            datos.Add("valorOferta", valorOferta);
            datos.Add("idUsoSuelo", idUsoSuelo);
            datos.Add("numeroFrentes", numeroFrentes);
            datos.Add("superficieTerreno", superficieTerreno);
            datos.Add("superficieConstruida", superficieConstruida);
            datos.Add("idClase", idClase);
            datos.Add("antiguedad", antiguedad);
            datos.Add("idConservacion", idConservacion);
            datos.Add("idCalidadProyecto", idCalidadProyecto);
            datos.Add("avanceObra", avanceObra);
            datos.Add("fechaCreacion", fechaCreacion);
            datos.Add("fechaActualizacion", fechaActualizacion);
            datos.Add("activo", activo);
            datos.Add("revisado", revisado);

            return datos;
        }
    }
}
