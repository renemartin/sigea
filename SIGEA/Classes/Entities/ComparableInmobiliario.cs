using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class ComparableInmobiliario
    {
        public static ComparableInmobiliario InsertNew( SIGEADataContext data_context, string calle, decimal valorOferta, string usoSuelo, int numeroFrentes, float superficieTerreno, float superficieConstruida, string clase, float antiguedad, string conservacion, string calidadProyecto, float avanceObra, DateTime fechaCreacion, DateTime fechaActualizacion )
        {
            ComparableInmobiliario comparable_Inmobiliario = new ComparableInmobiliario();

            comparable_Inmobiliario.DatoContactoComparable = new DatoContactoComparable();

            comparable_Inmobiliario.calle = calle;
            comparable_Inmobiliario.valorOferta = valorOferta;
            comparable_Inmobiliario.numeroFrentes = numeroFrentes;
            comparable_Inmobiliario.superficieTerreno = superficieTerreno;
            comparable_Inmobiliario.superficieConstruida = superficieConstruida;
            comparable_Inmobiliario.antiguedad = antiguedad;
            comparable_Inmobiliario.avanceObra = avanceObra;
            comparable_Inmobiliario.fechaCreacion = fechaCreacion;
            comparable_Inmobiliario.fechaActualizacion = fechaActualizacion;
            
            comparable_Inmobiliario.revisado = false;
            comparable_Inmobiliario.activo = true;

            data_context.ComparableInmobiliarios.InsertOnSubmit(comparable_Inmobiliario);
            data_context.SubmitChanges();

            return comparable_Inmobiliario;
        }

        public void SetDatos( Dictionary<string, object> datosComparableInmobiliario )
        {
            calle = datosComparableInmobiliario["calle"].ToString();
            valorOferta = decimal.Parse(datosComparableInmobiliario["valorOferta"].ToString());
            numeroFrentes = int.Parse(datosComparableInmobiliario["numeroFrentes"].ToString());
            superficieTerreno = double.Parse(datosComparableInmobiliario["superficieTerreno"].ToString());
            superficieConstruida = double.Parse(datosComparableInmobiliario["superficieConstruida"].ToString());
            antiguedad = double.Parse(datosComparableInmobiliario["antiguedad"].ToString());
            conservacion = datosComparableInmobiliario["conservacion"].ToString();
            antiguedad = double.Parse(datosComparableInmobiliario["antiguedad"].ToString());
            conservacion = datosComparableInmobiliario["conservacion"].ToString();
            avanceObra = double.Parse(datosComparableInmobiliario["avanceObra"].ToString());
            fechaCreacion = DateTime.Today;
            activo = true;
        }

        public static ComparableInmobiliario GetFromID(SIGEADataContext data_context, int idComparable)
        {
            var comparable = data_context.ComparableInmobiliarios.Where(c => c.idComparable == idComparable);
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
                comparable.DatoContactoComparable = new DatoContactoComparable();
                data_context.ComparableInmobiliarios.InsertOnSubmit(comparable);
            }
            else 
            {
                comparable = GetFromID(data_context, idComparable);
                if (comparable != null)
                {
                    if (comparable.DatoContactoComparable == null)
                        comparable.DatoContactoComparable = new DatoContactoComparable();
                }
            }

            return comparable;
        }
    }
}
