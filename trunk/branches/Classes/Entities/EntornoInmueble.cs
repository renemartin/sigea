using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class EntornoInmueble
    {
        public static EntornoInmueble GetForDataUpdate(SIGEADataContext data_context, Inmueble inmueble)
        {
            EntornoInmueble datos_entorno = inmueble.EntornoInmueble;

            if (datos_entorno == null)
            {
                datos_entorno = new EntornoInmueble();
                datos_entorno.idInmueble = inmueble.idInmueble;
                data_context.EntornoInmueble.InsertOnSubmit(datos_entorno);
            }

            return datos_entorno;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idTipoClasificacionZona", idTipoClasificacionZona);
            data.Add("idTipoConstrucciones", idTipoConstrucciones);
            data.Add("idTipoDensidadPoblacion", idTipoDensidadPoblacion);
            data.Add("idTipoProximidadUrbana", idTipoProximidadUrbana);
            data.Add("idTipoNivelSocioEconomico", idTipoNivelSocioEconomico);
            data.Add("indiceSaturacion", indiceSaturacion);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            idTipoClasificacionZona = short.Parse(data["idTipoClasificacionZona"].ToString());
            idTipoConstrucciones = short.Parse(data["idTipoConstrucciones"].ToString());
            idTipoDensidadPoblacion = short.Parse(data["idTipoDensidadPoblacion"].ToString());
            idTipoProximidadUrbana = short.Parse(data["idTipoProximidadUrbana"].ToString());
            idTipoNivelSocioEconomico = short.Parse(data["idTipoNivelSocioEconomico"].ToString());
            indiceSaturacion = short.Parse(data["indiceSaturacion"].ToString());
        }
    }

    public partial class ViasAcceso
    {
        public static Dictionary<string, object>[] GetViasAcceso(Inmueble inmueble)
        {
            var vias_acceso_query = from va in inmueble.ViasAcceso
                                    orderby va.idViaAcceso
                                    select va.GetData();

            if (!vias_acceso_query.Any())
                return null;

            return vias_acceso_query.ToArray();
        }
        public static void SetViasAcceso(Inmueble inmueble, Dictionary<string, object>[] data_set)
        {
            ViasAcceso via_acceso = null;
            foreach (Dictionary<string, object> data in data_set)
            {
                var via_acceso_query = from vi in inmueble.ViasAcceso
                                       where vi.idViaAcceso == int.Parse(data["idViaAcceso"].ToString())
                                       select vi;

                if (via_acceso_query.Any())
                {
                    via_acceso = via_acceso_query.Single();
                }
                else
                {
                    via_acceso = new ViasAcceso();
                    inmueble.ViasAcceso.Add(via_acceso);
                }

                via_acceso.SetData(data);
            }

            var delete_query = from vi in inmueble.ViasAcceso
                               where vi.idViaAcceso > data_set.Length
                               select vi;
            foreach(ViasAcceso delete_item in delete_query.ToList())
                inmueble.ViasAcceso.Remove(delete_item);
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("idViaAcceso", idViaAcceso);
            data.Add("idImportanciaVia", idImportanciaVia);
            data.Add("nombreVia", nombreVia);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            idViaAcceso = int.Parse(data["idViaAcceso"].ToString());
            idImportanciaVia = short.Parse(data["idImportanciaVia"].ToString());
            nombreVia = data["nombreVia"].ToString();
        }
    }

    public partial class InfraestructuraInmueble
    {
        public static InfraestructuraInmueble GetForDataUpdate(SIGEADataContext data_context, Inmueble inmueble)
        {
            InfraestructuraInmueble datos_infraestructura = inmueble.InfraestructuraInmueble;

            if (datos_infraestructura == null)
            {
                datos_infraestructura = new InfraestructuraInmueble();
                datos_infraestructura.idInmueble = inmueble.idInmueble;
                data_context.InfraestructuraInmueble.InsertOnSubmit(datos_infraestructura);
            }

            return datos_infraestructura;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("aguaPotable", aguaPotable);
            data.Add("aguaPotableSuministro", aguaPotableSuministro);
            data.Add("electrificacion", electrificacion);
            data.Add("electrificacionRedAerea", electrificacionRedAerea);
            data.Add("electrificacionConAcometida", electrificacionConAcometida);
            data.Add("drenaje", drenaje);
            data.Add("drenajeConexion", drenajeConexion);
            data.Add("drenajeFosaSeptica", drenajeFosaSeptica);
            data.Add("alumbradoPublico", alumbradoPublico);
            data.Add("alumbradoPublicoAereo", alumbradoPublicoAereo);
            data.Add("vialidades", vialidades);
            data.Add("idTipoVialidades", idTipoVialidades);
            data.Add("anchoVialidades", anchoVialidades);
            data.Add("banquetas", banquetas);
            data.Add("idTipoBanquetas", idTipoBanquetas);
            data.Add("guarniciones", guarniciones);
            data.Add("idTipoGuarniciones", idTipoGuarniciones);
            data.Add("nivelInfraestructura", nivelInfraestructura);
            data.Add("nivelInfraestructuraSHF", nivelInfraestructuraSHF);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            aguaPotable = (bool)data["aguaPotable"];
            aguaPotableSuministro = (bool)data["aguaPotableSuministro"];
            electrificacion = (bool)data["electrificacion"];
            electrificacionRedAerea = (bool)data["electrificacionRedAerea"];
            electrificacionConAcometida = (bool)data["electrificacionConAcometida"];
            drenaje = (bool)data["drenaje"];
            drenajeConexion = (bool)data["drenajeConexion"];
            drenajeFosaSeptica = (bool)data["drenajeFosaSeptica"];
            alumbradoPublico = (bool)data["alumbradoPublico"];
            alumbradoPublicoAereo = (bool)data["alumbradoPublicoAereo"];
            vialidades = (bool)data["vialidades"];
            idTipoVialidades = data.ContainsKey("idTipoVialidades") 
                ? (short?)short.Parse(data["idTipoVialidades"].ToString())
                : null;
            anchoVialidades = data.ContainsKey("anchoVialidades")
                ? (double?)double.Parse(data["anchoVialidades"].ToString())
                : null;
            banquetas = (bool)data["banquetas"];
            idTipoBanquetas = data.ContainsKey("idTipoBanquetas")
                ? (short?)short.Parse(data["idTipoBanqueras"].ToString())
                : null;
            guarniciones = (bool)data["guarniciones"];
            idTipoGuarniciones = data.ContainsKey("idTipoGuarniciones")
                ? (short?)short.Parse(data["idTipoGuarniciones"].ToString())
                : null;

            nivelInfraestructura = float.Parse(data["nivelInfraestructura"].ToString());
            nivelInfraestructuraSHF = short.Parse(data["nivelInfraestructuraSHF"].ToString());
        }
    }

    public partial class ServiciosInmueble
    {
        public static ServiciosInmueble GetForDataUpdate(SIGEADataContext data_context, Inmueble inmueble)
        {
            ServiciosInmueble datos_servicios = inmueble.ServiciosInmueble;

            if (datos_servicios == null)
            {
                datos_servicios = new ServiciosInmueble();
                datos_servicios.idInmueble = inmueble.idInmueble;
                data_context.ServiciosInmueble.InsertOnSubmit(datos_servicios);
            }

            return datos_servicios;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("gasNatural", gasNatural);
            data.Add("gasNaturalSuministro", gasNaturalSuministro);
            data.Add("redTelefonica", redTelefonica);
            data.Add("redTelefonicaAerea", redTelefonicaAerea);
            data.Add("redTelefonicaAcometida", redTelefonicaAcometida);
            data.Add("transporteUrbano", transporteUrbano);
            data.Add("transporteUrbanoDistancia", transporteUrbanoDistancia);
            data.Add("transporteUrbanoFrecuencia", transporteUrbanoFrecuencia);
            data.Add("transporteSuburbano", transporteSuburbano);
            data.Add("transporteSuburbanoDistancia", transporteSuburbanoDistancia);
            data.Add("transporteSuburbanoFrecuencia", transporteSuburbanoFrecuencia);
            data.Add("vigilancia", vigilancia);
            data.Add("vigilanciaMunicipal", vigilanciaMunicipal);
            data.Add("senalizacionNomenclatura", senalizacionNomencaltura);
            data.Add("recoleccionBasura", recoleccionBasura);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            gasNatural = (bool)data["gasNatural"];
            gasNaturalSuministro = (bool)data["gasNaturalSuministro"];
            redTelefonica = (bool)data["redTelefonica"];
            redTelefonicaAerea = (bool)data["redTelefonicaAerea"];
            redTelefonicaAcometida = (bool)data["redTelefonicaAcometida"];
            transporteUrbano = (bool)data["transporteUrbano"];
            transporteUrbanoDistancia = data.ContainsKey("transporteUrbanoDistancia")
                ? (float?)float.Parse(data["transporteUrbanoDistancia"].ToString())
                : null;
            transporteUrbanoFrecuencia = data.ContainsKey("transporteUrbanoFrecuencia")
                ? (float?)float.Parse(data["transporteUrbanoFrecuencia"].ToString())
                : null;
            transporteSuburbano = (bool)data["transporteSuburbano"];
            transporteSuburbanoDistancia = data.ContainsKey("transporteUrbanoDistancia")
                ? (float?)float.Parse(data["transporteUrbanoDistancia"].ToString())
                : null;
            transporteSuburbanoFrecuencia = data.ContainsKey("transporteSuburbanoFrecuencia")
                ? (float?)float.Parse(data["transporteSuburbanoFrecuencia"].ToString())
                : null;
            vigilancia = (bool)data["vigilancia"];
            vigilanciaMunicipal = (bool)data["vigilanciaMunicipal"];
            senalizacionNomencaltura = (bool)data["senalizacionNomenclatura"];
            recoleccionBasura = (bool)data["recoleccionBasura"];
        }
    }

    public partial class EquipamientoInmueble
    {
        public static EquipamientoInmueble GetForDataUpdate(SIGEADataContext data_context, Inmueble inmueble)
        {
            EquipamientoInmueble datos_equipamiento = inmueble.EquipamientoInmueble;

            if (datos_equipamiento == null)
            {
                datos_equipamiento = new EquipamientoInmueble();
                datos_equipamiento.idInmueble = inmueble.idInmueble;
                data_context.EquipamientoInmueble.InsertOnSubmit(datos_equipamiento);
            }

            return datos_equipamiento;
        }

        public Dictionary<string, object> GetData()
        {
            Dictionary<string, object> data = new Dictionary<string, object>();

            data.Add("distanciaBanco", distanciaBanco);
            data.Add("distanciaEscuela", distanciaEscuela);
            data.Add("distanciaEstacionTransporte", distanciaEstacionTransporte);
            data.Add("distanciaHospital", distanciaHospital);
            data.Add("distanciaIglesia", distanciaIglesia);
            data.Add("distanciaMercado", distanciaMercado);
            data.Add("distanciaParque", distanciaParque);
            data.Add("distanciaPlaza", distanciaPlaza);
            data.Add("proximidadGeneral", proximidadGeneral);
            data.Add("nivelEquipamientoUrbano", nivelEquipamientoUrbano);

            return data;
        }

        public void SetData(Dictionary<string, object> data)
        {
            distanciaBanco = data.ContainsKey("distanciaBanco")
                ? (float?)float.Parse(data["distanciaBanco"].ToString())
                : null;
            distanciaEscuela = data.ContainsKey("distanciaEscuela")
                ? (float?)float.Parse(data["distanciaEscuela"].ToString())
                : null;
            distanciaEstacionTransporte = data.ContainsKey("distanciaEstacionTransporte")
                ? (float?)float.Parse(data["distanciaEstacionTransporte"].ToString())
                : null;
            distanciaHospital = data.ContainsKey("distanciaHospital")
                ? (float?)float.Parse(data["distanciaHospital"].ToString())
                : null;
            distanciaIglesia = data.ContainsKey("distanciaIglesia")
                ? (float?)float.Parse(data["distanciaIglesia"].ToString())
                : null;
            distanciaMercado = data.ContainsKey("distanciaMercado")
                ? (float?)float.Parse(data["distanciaMercado"].ToString())
                : null;
            distanciaParque = data.ContainsKey("distanciaParque")
                ? (float?)float.Parse(data["distanciaParque"].ToString())
                : null;
            distanciaPlaza = data.ContainsKey("distanciaPlaza")
                ? (float?)float.Parse(data["distanciaPlaza"].ToString())
                : null;

            proximidadGeneral = float.Parse(data["proximidadGeneral"].ToString());
            nivelEquipamientoUrbano = short.Parse(data["nivelEquipamientoUrbano"].ToString());
        }
    }
}
