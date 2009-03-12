using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using SIGEA.Classes.Entities;

[ScriptService]
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class MethodCallers : System.Web.Services.WebService
{
    SIGEADataContext data_context;

    public MethodCallers()
    {
        data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
    }

    #region Data fillers

    #region Comunes

    [WebMethod]
    public IEnumerable<object> GetListaEstados()
    {
        var estados = from e in data_context.Estado
                      select new { display = e.nombreEstado, value = e.claveEstado };

        return estados.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaMunicipios(int claveEstado)
    {
        var municipios = from m in data_context.Municipio
                         where m.claveEstado == claveEstado
                         orderby m.nombreMunicipio
                         select new { display = m.nombreMunicipio, value = m.idMunicipio };

        return municipios.ToArray();
    }

    #endregion

    #region Administracion

    [WebMethod]
    public IEnumerable<object> GetListaTiposValuador()
    {
        var tipos = from e in data_context.TipoValuador
                    orderby e.idTipoValuador
                    select new { display = e.descripcion, value = e.idTipoValuador };

        return tipos.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaClientes()
    {
        var lista = from e in data_context.Cliente
                    where e.activo
                    orderby e.nombre
                    select new { display = e.nombre, value = e.idCliente };

        return lista.ToArray();
    }

    #endregion

    #region Valuación

    #region Avalúo

    [WebMethod]
    public IEnumerable<object> GetListaPropositosAvaluo()
    {
        var lista = from e in data_context.PropositoAvaluo
                    orderby e.idProposito
                    select new { display = e.descripcion, value = e.idProposito };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposCredito()
    {
        var lista = from e in data_context.TipoCredito
                    orderby e.idTipoCredito
                    select new { display = e.decripcion, value = e.idTipoCredito, att1 = e.tieneCofinanciamiento };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaEntidadesFinanciamiento(int idTipoCredito)
    {
        int[] idTipoMap = { 0, 1, 2, 3, 2, 3, 1, 7 };

        var lista = from e in data_context.EntidadFinanciamiento
                    where (e.idTipoCredito == idTipoMap[idTipoCredito] || e.idTipoCredito == idTipoCredito)
                        && e.financiamiento
                    orderby e.nombre
                    select new { display = e.nombre, value = e.idEntidad, att1 = e.TipoCreditoInterno.Any() };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaEntidadesCofinanciamiento(int idTipoCredito)
    {
        int[] idTipoMap = { 0, 1, 2, 3, 1, 1, 1, 7 };

        var lista = from e in data_context.EntidadFinanciamiento
                    where (e.idTipoCredito == idTipoMap[idTipoCredito] || e.idTipoCredito == idTipoCredito)
                        && e.cofinanciamiento
                    orderby e.nombre
                    select new { display = e.nombre, value = e.idEntidad };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposCreditoInterno(int idEntidadOtorgante)
    {
        var lista = from e in data_context.TipoCreditoInterno
                    orderby e.idTipoCreditoInterno
                    where e.idEntidad == idEntidadOtorgante
                    select new { display = e.descripcion, value = e.idTipoCreditoInterno };

        return lista.ToArray();
    }

    #endregion

    #region Inmueble

    [WebMethod]
    public IEnumerable<object> GetListaTiposInmueble()
    {
        var lista = from e in data_context.TipoInmueble
                    orderby e.idTipoInmueble
                    select new { display = e.descripcion, value = e.idTipoInmueble };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposRegimenPropiedad()
    {
        var lista = from e in data_context.RegimenPropiedad
                    orderby e.idRegimenPropiedad
                    select new { display = e.descripcion, value = e.idRegimenPropiedad };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposOrientacion()
    {
        var lista = from e in data_context.TipoOrientacion
                    select new { display = e.descripcion, value = e.idTipoOrientacion };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposUbicacion()
    {
        var lista = from e in data_context.TipoUbicacion
                    select new { display = e.descripcion, value = e.idTipoUbicacion };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposTopografia()
    {
        var lista = from e in data_context.TipoTopografia
                    select new { display = e.descripcion, value = e.idTipoTopografia };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaCaracPanoramicas()
    {
        var lista = from e in data_context.TipoCaracteristicaPanoramica
                    orderby e.descripcion
                    select new { display = e.descripcion, value = e.idTipoCaracteristica };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposUsoSuelo()
    {
        var lista = from e in data_context.TipoUsoSuelo
                    orderby e.descripcion
                    select new { display = e.descripcion, value = e.idTipoUsoSuelo };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposFuente()
    {
        var lista = from e in data_context.TipoFuente
                    select new { display = e.descripcion, value = e.idTipoFuente };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposServidumbre()
    {
        var lista = from e in data_context.TipoServidumbre
                    orderby e.descripcion
                    select new { display = e.descripcion, value = e.idTipoServidumbre };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposClasificacionZona(int idClase)
    {
        var lista = from e in data_context.TipoClasificacionZona
                    where e.idClase == null || e.idClase == idClase
                    orderby e.descripcion
                    select new { display = e.descripcion, value = e.idTipoClasificacionZona };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposProximidadUrbana()
    {
        var lista = from e in data_context.TipoProximidadUrbana
                    orderby e.descripcion
                    select new { display = e.descripcion, value = e.idTipoProximidadUrbana };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposNivelSocioeconomico()
    {
        var lista = from e in data_context.TipoNivelSocioeconomico
                    orderby e.idTipoNivelEconomico
                    select new { display = e.descripcion, value = e.idTipoNivelEconomico };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposConstruccionPredominante()
    {
        var lista = from e in data_context.TipoConstruccionPredominante
                    orderby e.descripcion
                    select new { display = e.descripcion, value = e.idTipoConstruccionPredominante };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposDensidad()
    {
        var lista = from e in data_context.TipoDensidad
                    orderby e.descripcion
                    select new { display = e.descripcion, value = e.idTipoDensidad };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposImportanciaVia()
    {
        var lista = from e in data_context.TipoImportanciaVialidad
                    orderby e.idImportanciaVialidad
                    select new { display = e.descripcion, value = e.idImportanciaVialidad };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaMateriales(string tipo)
    {
        var lista = from e in data_context.ValorMaterial
                    where e.TipoMaterial.descripcion.ToLower() == tipo.ToLower().Trim()
                    orderby e.descripcion
                    select new { display = e.descripcion, value = e.idValorMaterial };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposClaseInmueble()
    {
        var lista = from e in data_context.ClaseInmueble
                    orderby e.idClase
                    select new { display = e.descripcion, value = e.idClase, att1 = e.vidaUtil };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposEstadoConservacion()
    {
        var lista = from e in data_context.TipoEstadoConservacion
                    orderby e.descripcion
                    select new { display = e.descripcion, value = e.idTipoEstadoConservacion };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposCalidadProyecto()
    {
        var lista = from e in data_context.TipoCalidadProyecto
                    orderby e.descricion
                    select new { display = e.descricion, value = e.idTipoCalidadProyecto };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaServicios(string tipo)
    {
        var lista = from e in data_context.ValorServicio
                    where e.TipoServicio.descripcion.ToLower() == tipo.ToLower().Trim()
                    orderby e.descripcion
                    select new { display = e.descripcion, value = e.idValorServicio };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposUnidad()
    {
        var lista = from e in data_context.TipoUnidad
                    orderby e.idTipoUnidad
                    select new { display = e.descripcion, value = e.idTipoUnidad };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposEstacionamiento()
    {
        var lista = from e in data_context.TipoEstacionamiento
                    orderby e.idTipoEstacionamiento
                    select new { display = e.descripcion, value = e.idTipoEstacionamiento };

        return lista.ToArray();
    }

    [WebMethod]
    public IEnumerable<object> GetListaTiposPlanta()
    {
        var lista = from e in data_context.TipoPlanta
                    orderby e.idTipoPlanta
                    select new { display = e.descripcion, value = e.idTipoPlanta };

        return lista.ToArray();
    }

    #endregion

    #endregion

    #region Comparables

    [WebMethod]
    public IEnumerable<object> GetListaTipoComparable()
    {
        var lista = from c in data_context.TipoComparable
                    orderby c.descripcion
                    select new { display = c.descripcion, value = c.idTipoComparable };

        return lista.ToArray();
    }

    #endregion

    #endregion

    #region Auto completes

    [WebMethod]
    public string[] GetAsentamientos(string prefixText, int count, string contextKey)
    {
        List<string> lista = new List<string>();

        if (!string.IsNullOrEmpty(contextKey))
        {
            string[] context_params = contextKey.Split(',');
            int idMunicipio = 0;
            string codigoPostal = string.Empty;

            if (int.TryParse(context_params[0], out idMunicipio))
            {
                if (context_params.Length > 1)
                {
                    codigoPostal = context_params[1];
                }

                lista = Ubicaciones.GetAsentamientos(data_context, prefixText, count, idMunicipio, codigoPostal);
            }
        }

        return lista.ToArray();
    }

    [WebMethod]
    public string[] GetNombresValuadores(string prefixText, int count, string contextKey)
    {
        int claveEstado = 0;
        int.TryParse(contextKey, out claveEstado);
        return Valuador.GetNombresValuadores(data_context, prefixText, count, claveEstado);
    }

    [WebMethod]
    public string[] GetNombresControladores(string prefixText, int count, string contextKey)
    {
        int claveEstado = 0;
        int.TryParse(contextKey, out claveEstado);
        return Valuador.GetNombresControladores(data_context, prefixText, count, claveEstado);
    }

    [WebMethod]
    public string[] GetNombresMateriales(string prefixText, int count, string contextKey)
    {
        return Materiales.GetMateriales(data_context, prefixText, count, contextKey);
    }
    [WebMethod]
    public string[] GetDescripcionServicios(string prefixText, int count, string contextKey)
    {
        return Servicios.GetServicios(data_context, prefixText, count, contextKey);
    }
    #endregion

    #region Búsquedas escalares
    [WebMethod]
    public string GetCodigoPostal(int idMunicipio, string asentamiento)
    {
        return Ubicaciones.GetCodigoPostal(data_context, idMunicipio, asentamiento);
    }

    [WebMethod]
    public string GetDescripcionUsoActual(int idAvaluo)
    {
        UsoActualInmueble uso_actual = UsoActualInmueble.GetFromIdAvaluo(data_context, idAvaluo);
        if (uso_actual == null)
            return "No especificada...";

        return uso_actual.ToString();
    }

    [WebMethod]
    public bool CheckIfConstruccion(int idAvaluo)
    {
        return AvaluoInmobiliario.CheckIfConstruccion(data_context, idAvaluo);
    }
    #endregion

    #region Obtención de registros
    [WebMethod]
    public object GetDatosSintesis(int idAvaluo)
    {
        return AvaluoInmobiliario.GetSintesis(data_context, idAvaluo);
    }

    #endregion

}

