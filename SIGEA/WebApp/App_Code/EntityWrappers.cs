﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Script.Services;
using System.Web.Services;
using SIGEA.Classes.Entities;
using Entity = System.Collections.Generic.Dictionary<string, object>;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[ScriptService]
public class EntityWrappers : System.Web.Services.WebService
{
    SIGEADataContext common_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);

    public EntityWrappers()
    {
        common_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
    }

    #region Avaluos

    #region Datos del avaluo
    [WebMethod]
    public object[] SaveAvaluoInmueble(
        Entity datosAvaluo
        , Entity datosCredito
        , Entity datosSolicitante
        , Entity datosDireccionSolicitante
        , Entity datosInmueble
        , Entity datosUbicacionInmueble
        , Entity datosDireccionInmueble
        , Entity datosPropietario
        , Entity datosDireccionPropietario)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);

        int idAvaluo = 0;

        try
        {
            AvaluoInmobiliario avaluo = AvaluoInmobiliario.GetForDataUpadte(data_context, 0);

            CodigoPostal cp_solicitante = CodigoPostal.GetFromData(data_context, datosDireccionSolicitante);
            CodigoPostal cp_inmueble = CodigoPostal.GetFromData(data_context, datosDireccionInmueble);
            CodigoPostal cp_propietario = CodigoPostal.GetFromData(data_context, datosDireccionPropietario);

            avaluo.SetData(datosAvaluo);
            avaluo.Solicitante.SetData(datosSolicitante);
            avaluo.Solicitante.Direccion.SetData(cp_solicitante, datosDireccionSolicitante);
            avaluo.Inmueble.SetData(datosInmueble);
            avaluo.Inmueble.DireccionInmueble.SetData(datosUbicacionInmueble);
            avaluo.Inmueble.DireccionInmueble.Direccion.SetData(cp_inmueble, datosDireccionInmueble);
            avaluo.Inmueble.Propietario.SetData(datosPropietario);
            avaluo.Inmueble.Propietario.Direccion.SetData(cp_propietario, datosDireccionPropietario);
            avaluo.UpdateSubTipo(avaluo.Inmueble.idTipoInmueble);

            if (datosCredito != null)
            {
                DatoCredito credito = DatoCredito.GetForDataUpdate(data_context, avaluo);
                credito.SetData(datosCredito);
            }
            avaluo.GenerarIDE(data_context);
            data_context.SubmitChanges();
            idAvaluo = avaluo.idAvaluo;
        }
        catch (Exception ex)
        {
            return new object[] { 0, ex.Message };
        }

        return new object[] { idAvaluo, string.Empty };
    }

    [WebMethod]
    public void SaveAvaluo(
        int idAvaluo
        , Entity datosAvaluo
        , Entity datosCredito
        , Entity datosSolicitante
        , Entity datosDireccionSolicitante)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        AvaluoInmobiliario avaluo = AvaluoInmobiliario.GetFromId(data_context, idAvaluo);

        if (avaluo == null)
            throw new Exception("El identificador del avalúo es inválido");

        avaluo.SetData(datosAvaluo);

        if (datosCredito != null)
        {
            DatoCredito credito = DatoCredito.GetForDataUpdate(data_context, avaluo);
            credito.SetData(datosCredito);
        }
        else
        {
            avaluo.DatoCredito = null;
        }

        avaluo.Solicitante.SetData(datosSolicitante);
        CodigoPostal cp_solicitante = CodigoPostal.GetFromData(data_context, datosDireccionSolicitante);
        avaluo.Solicitante.Direccion.SetData(cp_solicitante, datosDireccionSolicitante);
        data_context.SubmitChanges();
    }

    [WebMethod]
    public Entity[] LoadAvaluo(int idAvaluo)
    {
        Entity[] data = new Entity[2];

        AvaluoInmobiliario avaluo = AvaluoInmobiliario.GetFromId(common_context, idAvaluo);
        if (avaluo == null)
            throw new Exception("El identificador del avalúo es inválido");

        data[0] = avaluo.GetData();
        if (avaluo.DatoCredito != null)
        {
            data[1] = avaluo.DatoCredito.GetData();
        }

        return data;
    }

    [WebMethod]
    public Entity[] LoadSolicitante(int idAvaluo)
    {
        Entity[] data = new Entity[2];

        AvaluoInmobiliario avaluo = AvaluoInmobiliario.GetFromId(common_context, idAvaluo);
        if (avaluo == null)
            throw new Exception("El identificador del avalúo es inválido");

        data[0] = avaluo.Solicitante.GetData();
        data[1] = avaluo.Solicitante.Direccion.GetData();

        return data;
    }

    [WebMethod]
    public object GetRegistroAvaluo(int idAvaluo)
    {
        return AvaluoInmobiliario.GetRegistro(common_context, idAvaluo);
    }

    [WebMethod]
    public void CancelarAvaluo(int idAvaluo)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        AvaluoInmobiliario.Cancel(data_context, idAvaluo);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public void SaveDeclaraciones(
        int idAvaluo
        , Entity datosDeclaraciones
        , Entity datosAdvertencias)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Declaraciones declaracion = Declaraciones.GetForDataUpdate(data_context, idAvaluo);

        if (declaracion == null)
            throw new Exception("El identificador del avalúo es inválido");

        declaracion.SetData(datosDeclaraciones, datosAdvertencias);
        data_context.SubmitChanges();
    }

    [WebMethod]
    public Entity LoadDeclaraciones(int idAvaluo)
    {
        Declaraciones declaraciones = Declaraciones.GetFromId(common_context, idAvaluo);

        if (declaraciones == null)
            return null;

        return declaraciones.GetDataDeclaraciones();
    }

    [WebMethod]
    public Entity LoadAdvertencias(int idAvaluo)
    {
        Declaraciones declaraciones = Declaraciones.GetFromId(common_context, idAvaluo);

        if (declaraciones == null)
            return null;

        return declaraciones.GetDataAdvertencias();
    }
    #endregion

    #region Asignacion de avaluos

    [WebMethod]
    public string SaveAsignacionAvaluo(int idAvaluo, Entity datosAsignacion)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        try
        {
            AsignacionAvaluo.Save(data_context, idAvaluo, datosAsignacion);
            data_context.SubmitChanges();
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
        return string.Empty;
    }

    [WebMethod]
    public Entity LoadAsignacionAvaluo(int idAvaluo)
    {
        return AsignacionAvaluo.Load(common_context, idAvaluo);
    }

    [WebMethod]
    public void DeleteAsignacionAvaluo(int idAvaluo)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        AsignacionAvaluo.Delete(data_context, idAvaluo);
        data_context.SubmitChanges();
    }

    #endregion

    #region Metodos del avaluo
    [WebMethod]
    public object[] VerificarExistenciaAvaluoPorIDE(string IDE)
    {
        object[] result = new object[2];

        var avaluo_query = from a in common_context.AvaluoInmobiliario
                           where a.IDE.ToLower() == IDE.ToLower().TrimEnd()
                           select a.idAvaluo;

        if (avaluo_query.Any())
        {
            result[0] = true;
            result[1] = avaluo_query.Single();
        }
        else
        {
            result[0] = false;
        }

        return result;
    }

    [WebMethod]
    public object GetEstadoInmuebleAvaluo(int idAvaluo)
    {
        return AvaluoInmobiliario.GetEstadoInmueble(common_context, idAvaluo);
    }
    #endregion

    #endregion

    #region Inmuebles

    #region Datos del inmueble
    [WebMethod]
    public void SaveInmueble(
        int idAvaluo
        , Entity datosInmueble
        , Entity datosUbicacionInmueble
        , Entity datosDireccionInmueble
        , Entity datosPropietario
        , Entity datosDireccionPropietario)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);

        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);
        if (inmueble == null)
            throw new Exception("El identificador del avalúo es inválido");

        CodigoPostal cp_inmueble = CodigoPostal.GetFromData(data_context, datosDireccionInmueble);
        CodigoPostal cp_propietario = CodigoPostal.GetFromData(data_context, datosDireccionPropietario);

        inmueble.SetData(datosInmueble);
        inmueble.DireccionInmueble.SetData(datosUbicacionInmueble);
        inmueble.DireccionInmueble.Direccion.SetData(cp_inmueble, datosDireccionInmueble);
        inmueble.Propietario.SetData(datosPropietario);
        inmueble.Propietario.Direccion.SetData(cp_propietario, datosDireccionPropietario);
        inmueble.AvaluoInmobiliario.UpdateSubTipo(inmueble.idTipoInmueble);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public Entity[] LoadInmueble(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);
        if (inmueble == null)
            throw new Exception("El identificador del avalúo es inválido");

        Entity[] data = new Entity[3];

        data[0] = inmueble.GetData();
        data[1] = inmueble.DireccionInmueble.GetData();
        data[2] = inmueble.DireccionInmueble.Direccion.GetData();

        return data;
    }

    [WebMethod]
    public Entity[] LoadPropietario(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);
        if (inmueble == null)
            throw new Exception("El identificador del avalúo es inválido");

        Entity[] data = new Entity[2];

        data[0] = inmueble.Propietario.GetData();
        data[1] = inmueble.Propietario.Direccion.GetData();

        return data;
    }
    #endregion

    #region Ubicación del inmueble
    [WebMethod]
    public void SaveUbicacionInmueble(
        int idAvaluo
        , Entity datosCalles
        , Entity datosTerreno)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);

        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        UbicacionCallesInmueble calles = UbicacionCallesInmueble.GetForDataUpdate(data_context, inmueble);
        UbicacionInmueble ubicacion = UbicacionInmueble.GetForDataUpdate(data_context, inmueble);

        ubicacion.SetData(datosTerreno);
        calles.SetData(datosCalles);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public Entity LoadDatosTerreno(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);
        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        if (inmueble.UbicacionInmueble == null)
            return null;

        return inmueble.UbicacionInmueble.GetData();
    }

    [WebMethod]
    public Entity LoadDatosTerrenoCalles(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);
        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        if (inmueble.UbicacionCallesInmueble == null)
            return null;

        return inmueble.UbicacionCallesInmueble.GetData();
    }
    #endregion

    #region Entorno del inmueble
    [WebMethod]
    public void SaveEntorno(
        int idAvaluo
        , Entity datosEntorno
        , Entity[] datosViasAcceso)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);

        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        EntornoInmueble entorno = EntornoInmueble.GetForDataUpdate(data_context, inmueble);
        entorno.SetData(datosEntorno);

        ViasAcceso.SetViasAcceso(inmueble, datosViasAcceso);
        data_context.SubmitChanges();
    }

    [WebMethod]
    public object[] LoadEntorno(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);

        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        object[] data = new object[2];
        if (inmueble.EntornoInmueble != null)
            data[0] = inmueble.EntornoInmueble.GetData();
        data[1] = ViasAcceso.GetViasAcceso(inmueble);

        return data;
    }

    [WebMethod]
    public void SaveInfraestructura(
        int idAvaluo
        , Entity datosInfraestructura
        , Entity datosServicios)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);

        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        InfraestructuraInmueble infraestructura = InfraestructuraInmueble.GetForDataUpdate(data_context, inmueble);
        infraestructura.SetData(datosInfraestructura);

        ServiciosInmueble servicios = ServiciosInmueble.GetForDataUpdate(data_context, inmueble);
        servicios.SetData(datosServicios);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public Entity[] LoadInfraestructura(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);

        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        Entity[] data = new Entity[2];
        if (inmueble.InfraestructuraInmueble != null)
            data[0] = inmueble.InfraestructuraInmueble.GetData();
        if (inmueble.ServiciosInmueble != null)
            data[1] = inmueble.ServiciosInmueble.GetData();

        return data;
    }

    [WebMethod]
    public void SaveEquipamiento(int idAvaluo, Entity datosEquipamiento)
    {

        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);

        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        EquipamientoInmueble equipamiento = EquipamientoInmueble.GetForDataUpdate(data_context, inmueble);
        equipamiento.SetData(datosEquipamiento);
        data_context.SubmitChanges();
    }

    [WebMethod]
    public Entity LoadEquipamiento(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);

        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        if (inmueble.EquipamientoInmueble == null)
            return null;

        return inmueble.EquipamientoInmueble.GetData();
    }
    #endregion

    #region Uso actual del inmueble
    [WebMethod]
    public void SaveUsoActual(
            int idAvaluo
            , Entity datosDistribucion
            , Entity[] datosRecamaras
            , Entity[] datosPlantas)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);

        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        UsoActualInmueble uso_actual = UsoActualInmueble.GetForDataUpdate(data_context, inmueble);
        uso_actual.SetData(datosDistribucion);
        UsoActualRecamara.SetRecamaras(uso_actual, datosRecamaras);
        UsoActualArea.SetPlantas(uso_actual, datosPlantas);
        data_context.SubmitChanges();
    }

    [WebMethod]
    public Entity LoadUsoActualDistribucion(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);

        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un uso actual registrado");
        }

        if (inmueble.UsoActualInmueble == null)
            return null;

        return inmueble.UsoActualInmueble.GetData();
    }
    [WebMethod]

    public Entity[] LoadUsoActualRecamaras(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);

        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        if (inmueble.UsoActualInmueble == null || inmueble.UsoActualInmueble.UsoActualRecamara == null)
            return null;

        return UsoActualRecamara.GetRecamaras(inmueble.UsoActualInmueble);
    }
    [WebMethod]

    public Entity[] LoadUsoActualPlantas(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);

        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        if (inmueble.UsoActualInmueble == null || inmueble.UsoActualInmueble.UsoActualArea == null)
            return null;

        return UsoActualArea.GetPlantas(inmueble.UsoActualInmueble);
    }

    #endregion

    #region Escrituras del inmueble
    [WebMethod]
    public void SaveEscriturasInmueble(
            int idAvaluo
            , Entity datosEscrituras
           )
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);
        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }
        EscriturasInmueble escrituras = EscriturasInmueble.GetForDataUpdate(data_context, inmueble);
        escrituras.SetData(datosEscrituras);
        data_context.SubmitChanges();
    }
    [WebMethod]
    public Entity LoadEscrituras(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);
        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }
        if (inmueble.EscriturasInmueble == null)
            return null;
        return inmueble.EscriturasInmueble.GetData();
    }
    #endregion
    
    #region Geolocalizacion del inmueble
    [WebMethod]
    public void SaveGeolocalizacionInmueble(
        int idAvaluo
        , Entity datosGeolocalizacion
        )
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);
        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }
        GeolocalizacionInmueble geolocalizacion = GeolocalizacionInmueble.GetForDataUpdate(data_context, inmueble);
        geolocalizacion.SetData(datosGeolocalizacion);
        data_context.SubmitChanges();
    }
    [WebMethod]
    public Entity LoadGeolocalizacion(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);
        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }
        if (inmueble.GeolocalizacionInmueble == null)
            return null;
        return inmueble.GeolocalizacionInmueble.GetData();
    }
    #endregion

    #region Métodos del inmueble
    [WebMethod]
    public bool GetInmuebleEsCondominal(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);

        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        return inmueble.RegimenPropiedad.descripcion.ToLower() == "condominal";
    }
    #endregion

    #endregion

    #region Construcciones

    #region Construccion inmueble
    [WebMethod]
    public void SaveDatosConstruccion(
        int idAvaluo
        , Entity[] datosTiposConstruccion
        , Entity datosConstrucciones)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);
        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        ConstruccionInmueble construccion = ConstruccionInmueble.GetForDataUpdate(inmueble);
        construccion.SetData(datosConstrucciones);
        TipoConstruccion.SetTiposConstruccion(data_context, construccion, datosTiposConstruccion);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public Entity[] LoadTiposConstrucciones(int idAvaluo)
    {
        ConstruccionInmueble construccion = ConstruccionInmueble.GetFromIdAvaluo(common_context, idAvaluo);
        if (construccion == null)
            return null;

        return TipoConstruccion.GetTiposConstruccion(construccion);
    }

    [WebMethod]
    public Entity LoadDatosConstrucciones(int idAvaluo)
    {
        ConstruccionInmueble construccion = ConstruccionInmueble.GetFromIdAvaluo(common_context, idAvaluo);
        if (construccion == null)
            return null;

        return construccion.GetData();
    }
    #endregion

    #region Condominio
    [WebMethod]
    public void SaveDatosCondominio(
        int idAvaluo
        , Entity datosCondominio
        , Entity superficiesCondominio
        , Entity[] datosAreaComun
        , Entity[] datosAreaComunComplementaria)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);
        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        DatoCondominio condominio = DatoCondominio.GetFromDataUpdate(inmueble);
        condominio.SetData(datosCondominio);
        SuperficiesCondominio superficies = SuperficiesCondominio.GetForDataUpdate(condominio);
        superficies.SetData(superficiesCondominio);
        AreaComun.SetAreasComunes(condominio, datosAreaComun, false);
        AreaComun.SetAreasComunes(condominio, datosAreaComunComplementaria, true);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public object[] LoadDatosCondominio(int idAvaluo)
    {
        DatoCondominio condominio = DatoCondominio.GetFromIdAvaluo(common_context, idAvaluo);
        if (condominio == null)
            return null;

        object[] data = new object[4];

        data[0] = condominio.GetData();

        if (condominio.SuperficiesCondominio != null)
            data[1] = condominio.SuperficiesCondominio.GetData();

        data[2] = AreaComun.GetAreasComunes(condominio, false);
        data[3] = AreaComun.GetAreasComunes(condominio, true);

        return data;
    }
    [WebMethod]
    public object[] LoadDatosConstruccionesComunes(int idAvaluo)
    {
        object[] data = new object[2];
        DatoCondominio condominio = DatoCondominio.GetFromIdAvaluo(common_context, idAvaluo);
        if (condominio == null)
            return null;

        data[0] = AreaComun.GetAreasComunes(condominio, false);
        data[1] = AreaComun.GetAreasComunes(condominio, true);

        return data;
    }
    #endregion

    #region Superficies
    [WebMethod]
    public void SaveSuperficies(
        int idAvaluo
        , Entity datosSuperfice)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);
        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        SuperficiesInmueble superficies = SuperficiesInmueble.GetForDataUpdate(inmueble);
        superficies.SetData(datosSuperfice);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public Entity LoadSuperficies(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);
        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        if (inmueble.SuperficiesInmueble == null)
            return null;

        return inmueble.SuperficiesInmueble.GetData();
    }
    #endregion

    #region Elementos
    [WebMethod]
    public void SaveEstructuras(
        int idAvaluo
        , Entity datosEstructuras
        )
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        TipoConstruccion tipo_construccion = TipoConstruccion.GetFromIdAvaluo(data_context, idAvaluo, 1);

        if (tipo_construccion == null)
        {
            throw new Exception("El avalúo no cuenta con un tipo de construcción registrado");
        }

        EstructurasTipoConstruccion estructuras = EstructurasTipoConstruccion.GetForDataUpdate(data_context, tipo_construccion);
        estructuras.SetData(datosEstructuras);
        data_context.SubmitChanges();
    }

    [WebMethod]
    public void SaveAcabados(
        int idAvaluo
        , Entity[] datosAcabados
        )
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        TipoConstruccion tipo_construccion = TipoConstruccion.GetFromIdAvaluo(data_context, idAvaluo, 1);

        if (tipo_construccion == null)
        {
            throw new Exception("El avalúo no cuenta con un tipo de construcción registrado");
        }

        AcabadoTipoConstruccion.SetAcabados(tipo_construccion, datosAcabados);
        data_context.SubmitChanges();
    }

    [WebMethod]
    public void SaveFachada(
        int idAvaluo
        , Entity datosFachada
        )
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);

        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        ConstruccionInmueble construccion = ConstruccionInmueble.GetForDataUpdate(inmueble);
        construccion.SetFachada(datosFachada);
        data_context.SubmitChanges();
    }

    [WebMethod]
    public void SaveInstalacionesConstruccion(
        int idAvaluo
        , Entity datosInstalacionesTipoConstruccion
        , Entity[] datosInstalacionesPrivativas
        , Entity[] datosInstalacionesComunes
        )
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        TipoConstruccion tipo_construccion = TipoConstruccion.GetFromIdAvaluo(data_context, idAvaluo, 1);
        ConstruccionInmueble construccion = ConstruccionInmueble.GetFromIdAvaluo(data_context, idAvaluo);

        if (tipo_construccion == null || construccion == null)
        {
            throw new Exception("El avalúo no cuenta con construcciones registradas");
        }

        InstalacionesTipoConstruccion instalaciones_tipo = InstalacionesTipoConstruccion.GetForDataUpdate(data_context, tipo_construccion);

        instalaciones_tipo.SetData(datosInstalacionesTipoConstruccion);
        if (datosInstalacionesComunes != null)
            InstalacionConstruccion.SetInstalacionesConstruccion(construccion, datosInstalacionesPrivativas, false);
        if (datosInstalacionesPrivativas != null)
            InstalacionConstruccion.SetInstalacionesConstruccion(construccion, datosInstalacionesComunes, true);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public Entity LoadEstructuras(int idAvaluo)
    {
        TipoConstruccion tipo_construccion = TipoConstruccion.GetFromIdAvaluo(common_context, idAvaluo, 1);

        if (tipo_construccion.EstructurasTipoConstruccion == null)
            return null;

        return tipo_construccion.EstructurasTipoConstruccion.GetData();
    }

    [WebMethod]
    public Entity[] LoadAcabados(int idAvaluo)
    {
        TipoConstruccion tipo_construccion = TipoConstruccion.GetFromIdAvaluo(common_context, idAvaluo, 1);

        if (tipo_construccion.AcabadoTipoConstruccion == null)
            return null;

        return AcabadoTipoConstruccion.GetAcabados(tipo_construccion);
    }
    [WebMethod]
    public Entity LoadFachada(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);

        if (inmueble == null)
            return null;

        ConstruccionInmueble construccion = ConstruccionInmueble.GetForDataUpdate(inmueble);
        return construccion.GetFachada();
    }

    [WebMethod]
    public Entity LoadInstalacionTipoConstruccion(int idAvaluo)
    {
        TipoConstruccion tipo_construccion = TipoConstruccion.GetFromIdAvaluo(common_context, idAvaluo, 1);

        if (tipo_construccion.InstalacionesTipoConstruccion == null)
            return null;

        return tipo_construccion.InstalacionesTipoConstruccion.GetData();
    }

    [WebMethod]
    public Entity[] LoadInstalacionConstruccion(int idAvaluo, bool comun)
    {
        ConstruccionInmueble construccion = ConstruccionInmueble.GetFromIdAvaluo(common_context, idAvaluo);

        if (construccion.InstalacionConstruccion == null)
            return null;

        return InstalacionConstruccion.GetInstalacionesConstruccion(construccion, comun);
    }

    [WebMethod]
    public object[] LoadInstalacionesEnfoqueCostos(int idAvaluo)
    {
        object[] data = new object[2];
        ConstruccionInmueble construccion = ConstruccionInmueble.GetFromIdAvaluo(common_context, idAvaluo);
        if (construccion.InstalacionConstruccion == null)
            return null;
        data[0] = InstalacionConstruccion.GetInstalacionesConstruccion(construccion, false);
        data[1] = InstalacionConstruccion.GetInstalacionesConstruccion(construccion, true);
        return data;
    }
    #endregion


    #endregion

    #region Comparables
    [WebMethod]
    public long SaveComparable(
        int idComparable
        , Entity datosComparable
        , Entity datosUbicacion
    )
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);

        ComparableInmobiliario comparable = ComparableInmobiliario.GetDataForUpdate(data_context, idComparable);
        if (comparable == null)
            throw new Exception("El identificador del comparable es inválido");

        CodigoPostal cp_direccion = CodigoPostal.GetFromData(data_context, datosUbicacion);
        comparable.SetDatos(datosComparable);
        comparable.Direccion.SetData(cp_direccion, datosUbicacion);

        data_context.SubmitChanges();

        return comparable.idComparable;
    }

    [WebMethod]
    public Entity[] LoadComparable(int idComparable)
    {
        Entity[] data = new Entity[2];

        ComparableInmobiliario comparable = ComparableInmobiliario.GetFromId(common_context, idComparable);
        if (comparable == null)
            throw new Exception("El identificador del comparable es inválido");

        data[0] = comparable.GetData();
        data[1] = comparable.Direccion.GetData();

        return data;
    }

    [WebMethod]
    public void DeleteComaparable(int idComparable)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        ComparableInmobiliario.Delete(data_context, idComparable);

        data_context.SubmitChanges();
    }

    #endregion

    #region Cuentas

    #region Valuador
    [WebMethod]
    public int SaveValuador(
        int idValuador
        , Entity datosPersonales
        , Entity datosContacto
        , Entity datosDireccion
        , Entity datosUsuario)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);

        Valuador valuador = Valuador.GetForDataUpdate(data_context, idValuador);
        if (valuador == null)
            throw new Exception("El identificador de valuador es inválido");

        Usuario usuario = Usuario.GetForDataUpdate(data_context, (int)datosUsuario["idUsuario"]);
        if (usuario == null)
            throw new Exception("El nombre de usuario es inválido");

        short[] roles = (from o in ((object[])datosUsuario["roles"])
                         select (short)o).ToArray();

        CodigoPostal cp_direccion = CodigoPostal.GetFromData(data_context, datosDireccion);

        int idUsuario = 0;
        if (idValuador != 0)
        {
            idUsuario = valuador.GetUsuarioMaster().idUsuario;
        }
        else
        {
            idUsuario = (int)datosUsuario["idUsuario"];
        }

        valuador.SetData(datosPersonales);
        valuador.DatoContacto.SetData(datosContacto);
        valuador.Direccion.SetData(cp_direccion, datosDireccion);

        if (Usuario.CheckExistingUsername(data_context,
                        datosUsuario["nombreUsuario"].ToString(),
                        idUsuario))
        {
            usuario.SetDatos(datosUsuario);
            usuario.UpdateRoles(data_context, roles);

            valuador.UpdateUsuarioMaster(usuario);
        }
        else
        {
            throw new Exception("El nombre de usuario especificado ya ha sido tomado por otro usuario");
        }

        data_context.SubmitChanges();

        return valuador.idValuador;
    }

    [WebMethod]
    public Entity[] LoadValuador(int idValuador)
    {
        Entity[] data = new Entity[4];

        Valuador valuador = Valuador.GetFromId(common_context, idValuador);
        if (valuador == null)
            throw new Exception("El identificador del valuador es inválido");

        Usuario usuario = Valuador.GetUsuarioFromId(common_context, idValuador);

        data[0] = valuador.GetData();
        data[1] = valuador.DatoContacto.GetData();
        data[2] = valuador.Direccion.GetData();
        if (usuario != null)
            data[3] = usuario.GetData();
        else
            data[3] = null;

        return data;
    }

    [WebMethod]
    public void DeleteValuador(int idValuador)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Valuador.Delete(data_context, idValuador);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public string GetUrlFotoValuador(int idValuador)
    {
        return Valuador.GetUrlFoto(common_context, idValuador);
    }
    #endregion

    #region Cliente
    [WebMethod]
    public int SaveCliente(
        int idCliente
        , Entity datosPersonales
        , Entity datosContacto
        , Entity datosDireccion
        , Entity datosUsuario)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);

        Cliente cliente = Cliente.GetForDataUpdate(data_context, idCliente);
        if (cliente == null)
            throw new Exception("El identificador de cliente es inválido");

        Usuario usuario = Usuario.GetForDataUpdate(data_context, (int)datosUsuario["idUsuario"]);
        if (usuario == null)
            throw new Exception("El nombre de usuario es inválido");

        short[] roles = (from o in ((object[])datosUsuario["roles"])
                         select (short)o).ToArray();

        CodigoPostal cp_direccion = CodigoPostal.GetFromData(data_context, datosDireccion);

        cliente.SetData(datosPersonales);
        cliente.DatoContacto.SetData(datosContacto);
        cliente.Direccion.SetData(cp_direccion, datosDireccion);

        int idUsuario = 0;
        if (idCliente != 0)
        {
            idUsuario = cliente.GetUsuarioMaster().idUsuario;
        }
        else
        {
            idUsuario = (int)datosUsuario["idUsuario"];
        }

        if (Usuario.CheckExistingUsername(data_context,
                        datosUsuario["nombreUsuario"].ToString(),
                        (int)datosUsuario["idUsuario"]))
        {
            usuario.SetDatos(datosUsuario);
            usuario.UpdateRoles(data_context, roles);

            cliente.UpdateUsuarioMaster(usuario);
        }
        else
        {
            throw new Exception("El nombre de usuario especificado ya ha sido tomado por otro usuario");
        }

        data_context.SubmitChanges();

        return cliente.idCliente;
    }

    [WebMethod]
    public Entity[] LoadCliente(int idCliente)
    {
        Entity[] data = new Entity[4];

        Cliente cliente = Cliente.GetFromId(common_context, idCliente);
        if (cliente == null)
            throw new Exception("El identificador del cliente es inválido");

        Usuario usuario = Cliente.GetUsuarioFromId(common_context, idCliente);

        data[0] = cliente.GetData();
        data[1] = cliente.DatoContacto.GetData();
        data[2] = cliente.Direccion.GetData();
        if (usuario != null)
            data[3] = usuario.GetData();
        else
            data[3] = null;

        return data;
    }

    [WebMethod]
    public void DeleteCliente(int idCliente)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Cliente.Delete(data_context, idCliente);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public string GetUrlFotoCliente(int idCliente)
    {
        return Cliente.GetUrlFoto(common_context, idCliente);
    }
    #endregion

    #region Personal
    [WebMethod]
    public int SavePersonal(
        int idPersonal
        , Entity datosPersonales
        , Entity datosUsuario)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);

        Personal personal = Personal.GetForDataUpdate(data_context, idPersonal);
        if (personal == null)
            throw new Exception("El identificador de personal es inválido");

        Usuario usuario = Usuario.GetForDataUpdate(data_context, (int)datosUsuario["idUsuario"]);
        if (usuario == null)
            throw new Exception("El nombre de usuario es inválido");

        short[] roles = (from o in ((object[])datosUsuario["roles"])
                         select (short)o).ToArray();

        personal.SetData(datosPersonales);

        if (Usuario.CheckExistingUsername(data_context,
                        datosUsuario["nombreUsuario"].ToString(),
                        (int)datosUsuario["idUsuario"]))
        {
            usuario.SetDatos(datosUsuario);
            usuario.UpdateRoles(data_context, roles);

            if (personal.Usuario == null)
            {
                personal.Usuario = usuario;
            }
        }
        else
        {
            throw new Exception("El nombre de usuario especificado ya ha sido tomado por otro usuario");
        }

        data_context.SubmitChanges();

        return personal.idPersonal;
    }

    [WebMethod]
    public Entity[] LoadPersonal(int idPersonal)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Entity[] data = new Entity[2];

        Personal personal = Personal.GetFromId(data_context, idPersonal);
        if (personal == null)
            throw new Exception("El identificador del personal es inválido");


        data[0] = personal.GetData();
        if (personal.Usuario != null)
            data[1] = personal.Usuario.GetData();
        else
            data[1] = null;

        return data;
    }

    [WebMethod]
    public void DeletePersonal(int idPersonal)
    {
        SIGEADataContext data_context = new SIGEADataContext(ConfigurationManager.ConnectionStrings["SIGEA_ConnectionString"].ConnectionString);
        Personal.Delete(data_context, idPersonal);

        data_context.SubmitChanges();
    }
    #endregion

    #endregion
}

