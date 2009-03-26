using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.IO;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class ComparableInmobiliario
    {
        public string DescripcionComparable
        {
            get
            {
                StringBuilder text = new StringBuilder();
                text.Append(this.numeroFrentes);
                text.Append(" Frentes");
                text.Append("<br/>");
                text.Append("Sup. terreno: ");
                text.Append(this.superficieTerreno.ToString("n"));
                if (this.superficieConstruida.HasValue)
                {
                    text.Append(" Sup. construida: ");
                    text.Append(this.superficieConstruida.Value.ToString("n"));
                }

                return text.ToString().ToUpper();
            }
        }
        public string DescripcionUbicacion
        {
            get 
            {
                StringBuilder text = new StringBuilder();
                text.Append(this.Direccion.calle);
                text.Append(" # ");
                text.Append(this.Direccion.numeroExterior);
                if (!string.IsNullOrEmpty(this.Direccion.numeroInterior))
                {
                    text.Append(" INT. ");
                    text.Append(this.Direccion.numeroInterior);
                }

                text.Append("<br/>");
                text.Append(this.Direccion.CodigoPostal.Asentamiento.Municipio.nombreMunicipio);
                text.Append(", ");
                text.Append(this.Direccion.CodigoPostal.Asentamiento.Municipio.Estado.nombreEstado);

                return text.ToString().ToUpper();
            }
        }
        public string DescripcionContacto
        {
            get
            {
                StringBuilder text = new StringBuilder();
                text.Append(nombreContacto);
                text.Append("<br/>");
                text.Append("Tel: ");
                text.Append(telefonoContacto);
                
                if (!string.IsNullOrEmpty(emailContacto))
                {
                    text.Append(", Email: ");
                    text.Append(emailContacto);
                }

                return text.ToString().ToUpper();
            }
        }       

        public static ComparableInmobiliario GetFromId(SIGEADataContext data_context, int idComparable)
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
                comparable.Direccion = new Direccion();
                comparable.fechaCreacion = DateTime.Today;                
                comparable.activo = true;
                
                data_context.ComparableInmobiliario.InsertOnSubmit(comparable);
            }
            else 
            {
                comparable = GetFromId(data_context, idComparable);
                if (comparable != null)
                {
                    if (comparable.Direccion == null)
                        comparable.Direccion = new Direccion();
                }
                else
                {
                    throw new Exception("Identificador de comparable inválido");
                }
            }

            return comparable;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> datos = new Dictionary<string, object>();

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
            datos.Add("nombreContacto", nombreContacto);
            datos.Add("emailContacto", emailContacto);
            datos.Add("telefonoContacto", telefonoContacto);
            datos.Add("fechaCreacion", fechaCreacion);
            datos.Add("fechaActualizacion", fechaActualizacion);
            datos.Add("activo", activo);

            return datos;
        }
        public void SetDatos(Dictionary<string, object> datosComparable)
        {
            idTipoComparable = short.Parse(datosComparable["idTipoComparable"].ToString());
            valorOferta = decimal.Parse(datosComparable["valorOferta"].ToString());
            numeroFrentes = int.Parse(datosComparable["numeroFrentes"].ToString());
            superficieTerreno = double.Parse(datosComparable["superficieTerreno"].ToString());
            nombreContacto = datosComparable["nombreContacto"].ToString();
            emailContacto = datosComparable["emailContacto"].ToString();
            telefonoContacto = datosComparable["telefonoContacto"].ToString();

            if (datosComparable.ContainsKey("idUsoSuelo"))
            {
                idUsoSuelo = short.Parse(datosComparable["idUsoSuelo"].ToString());
                idClase = short.Parse(datosComparable["idClase"].ToString());
                idConservacion = short.Parse(datosComparable["idConservacion"].ToString());
                idCalidadProyecto = short.Parse(datosComparable["idCalidadProyecto"].ToString());
                superficieConstruida = double.Parse(datosComparable["superficieConstruida"].ToString());
                antiguedad = double.Parse(datosComparable["antiguedad"].ToString());
                avanceObra = double.Parse(datosComparable["avanceObra"].ToString());
            }

            fechaActualizacion = DateTime.Today;
        }
        public static void Delete(SIGEADataContext data_context, int idComparable)
        {
            ComparableInmobiliario comparable_delete = GetFromId(data_context, idComparable);
            if (comparable_delete == null)
            {
                throw new Exception("Identificador de comparable inválido");
            }

            comparable_delete.activo = false;
        }       
    }

    public class ListaComparables
    {
        private SIGEADataContext data_context;

        public ListaComparables()
        {
            data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        }

        public IEnumerable<object> GetLista(short idTipo, Dictionary<string, string> filtros) 
        {
            var comparables_list = from c in data_context.ComparableInmobiliario
                                   where c.idTipoComparable == idTipo
                                   select new
                                   {
                                       c.idComparable,
                                       c.valorOferta,
                                       c.DescripcionComparable,
                                       c.DescripcionUbicacion,
                                       c.DescripcionContacto,
                                       c.fechaCreacion,
                                       c.fechaActualizacion,
                                       c.idTipoComparable,
                                       c.TipoComparable
                                   };

            if (filtros != null)
            {
                if (filtros["valorOferta"] != "" && filtros["operadorValor"] != "")
                {
                    decimal valor = decimal.Parse(filtros["valorOferta"]);
                    switch (filtros["operadorValor"])
                    {
                        case "0":
                            comparables_list = comparables_list.Where(c => c.valorOferta == valor);
                            break;
                        case "1":
                            comparables_list = comparables_list.Where(c => c.valorOferta > valor);
                            break;
                        case "2":
                            comparables_list = comparables_list.Where(c => c.valorOferta >= valor);
                            break;
                        case "3":
                            comparables_list = comparables_list.Where(c => c.valorOferta < valor);
                            break;
                        case "4":
                            comparables_list = comparables_list.Where(c => c.valorOferta <= valor);
                            break;
                    }
                }
            }

            return comparables_list.ToArray();
        }
    }
}
