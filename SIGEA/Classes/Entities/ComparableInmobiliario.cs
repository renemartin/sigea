using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.IO;
using System.Text;
using System.Data.Linq;

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
                text.Append(", CP: ");
                text.Append(this.Direccion.CodigoPostal.codigoPostal1);
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
            data_context.ObjectTrackingEnabled = false;

            DataLoadOptions options = new DataLoadOptions();
            options.LoadWith<ComparableInmobiliario>(Comparable => Comparable.Direccion);
            options.LoadWith<Direccion>(Direccion => Direccion.CodigoPostal);
            options.LoadWith<CodigoPostal>(CP => CP.Asentamiento);
            options.LoadWith<Asentamiento>(Asentamiento => Asentamiento.Municipio);
            options.LoadWith<Municipio>(Municipio => Municipio.Estado);
            data_context.LoadOptions = options;
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
                                       c.TipoComparable,
                                       c.numeroFrentes,
                                       c.superficieTerreno,
                                       c.superficieConstruida,
                                       c.TipoUsoSuelo,
                                       c.idUsoSuelo,
                                       c.idClase,
                                       c.idConservacion,
                                       c.antiguedad,
                                       c.avanceObra,
                                       c.idCalidadProyecto,
                                       c.Direccion.calle,
                                       c.Direccion.CodigoPostal.Asentamiento.nombreAsentamiento,
                                       c.Direccion.CodigoPostal.codigoPostal1,
                                       c.Direccion.CodigoPostal.Asentamiento.Municipio.nombreMunicipio,
                                       c.Direccion.CodigoPostal.Asentamiento.Municipio.Estado.nombreEstado
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
                if (filtros["fechaCreacion"] != "")
                {
                    DateTime fechaCreacion = DateTime.Parse(filtros["fechaCreacion"]);
                    comparables_list = comparables_list.Where(c => c.fechaCreacion <= fechaCreacion); ;
                }
                if (filtros["numeroFrentes"] != "")
                {
                    int frentes = int.Parse(filtros["numeroFrentes"]);
                    comparables_list = comparables_list.Where(c => c.numeroFrentes == frentes);
                }
                if (filtros["superficieTerreno"] != "")
                {
                    float rangoST = 1;
                    float superficieTerreno = float.Parse(filtros["superficieTerreno"]);
                    comparables_list = comparables_list.Where(c => (c.superficieTerreno >= (superficieTerreno - rangoST) && superficieTerreno <= (superficieTerreno + rangoST)));
                }
                if (filtros["superficieConstruida"] != "")
                {
                    float rangoSC = 3;
                    float superficieConstruida = float.Parse(filtros["superficieConstruida"]);
                    comparables_list = comparables_list.Where(c => (c.superficieConstruida >= (superficieConstruida - rangoSC) && c.superficieConstruida <= (superficieConstruida + rangoSC)));
                }
                if (filtros["usoSuelo"] != "" && filtros["usoSuelo"] != "0")
                {
                    short idUsoSuelo = short.Parse(filtros["usoSuelo"]);
                    comparables_list = comparables_list.Where(c => c.idUsoSuelo == idUsoSuelo);
                }
                if (filtros["clase"] != "" && filtros["clase"] != "0")
                {
                    short idClase = short.Parse(filtros["clase"]);
                    comparables_list = comparables_list.Where(c => c.idClase == idClase);
                }
                if (filtros["conservacion"] != "" && filtros["conservacion"] != "0")
                {
                    short idConservacion = short.Parse(filtros["clase"]);
                    comparables_list = comparables_list.Where(c => c.idConservacion == idConservacion);
                }
                if (filtros["atiguedad"] != "")
                {
                    float rangoAntiguedad = 2;
                    float antiguedad = float.Parse(filtros["antiguedad"]);
                    comparables_list = comparables_list.Where(c => (c.antiguedad >= (antiguedad - rangoAntiguedad) && c.antiguedad <= (antiguedad + rangoAntiguedad)));
                }
                if (filtros["avanceObra"] != "")
                {
                    float rangoAvanceO = 2;
                    float avanceObra = float.Parse(filtros["avanceObra"]);
                    comparables_list = comparables_list.Where(c => (c.avanceObra >= (avanceObra - rangoAvanceO) && c.avanceObra <= (avanceObra + rangoAvanceO)));
                }
                if (filtros["calidadProyecto"] != "" && filtros["calidadProyecto"] != "0")
                {
                    short idCalidadProyecto = short.Parse(filtros["calidadProyecto"]);
                    comparables_list = comparables_list.Where(c => c.idCalidadProyecto == idCalidadProyecto);
                }
                if (filtros["calle"] != "")
                {
                    comparables_list = comparables_list.Where(c => c.calle.ToLower().StartsWith(filtros["calle"].Trim().ToLower()));
                }
                if (filtros["codigoPostal"] != "")
                {
                    comparables_list = comparables_list.Where(c => c.codigoPostal1 == filtros["codigoPostal"]);
                }
                if (filtros["asentamiento"] != "")
                {
                    comparables_list = comparables_list.Where(c => c.nombreAsentamiento.ToLower() == filtros["asentamiento"].Trim().ToLower());
                }
                if (filtros["municipio"] != "")
                {
                    comparables_list = comparables_list.Where(c => c.nombreMunicipio.ToLower() == filtros["municipio"].Trim().ToLower());
                }
                if (filtros["estado"] != "")
                {
                    comparables_list = comparables_list.Where(c => c.nombreEstado.ToLower() == filtros["estado"].Trim().ToLower());
                }
            }

            return comparables_list.ToArray();
        }
    }
}
