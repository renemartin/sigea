using System;
using System.Collections.Generic;
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
    SIGEADataContext common_context = new SIGEADataContext();

    public EntityWrappers()
    {
        common_context = new SIGEADataContext();
    }

    #region Avaluos

    #region data del avaluo
    [WebMethod]
    public int SaveAvaluoInmueble(
        int idAvaluo
        , Entity datosAvaluo
        , Entity datosCredito
        , Entity datosSolicitante
        , Entity datosDireccionSolicitante
        , Entity datosInmueble
        , Entity datosUbicacionInmueble
        , Entity datosDireccionInmueble
        , Entity datosPropietario
        , Entity datosDireccionPropietario)
    {
        SIGEADataContext data_context = new SIGEADataContext();

        AvaluoInmobiliario avaluo = AvaluoInmobiliario.GetForDataUpadte(data_context, idAvaluo);
        if (avaluo == null)
            throw new Exception("El identificador del avalúo es inválido");

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
            DatoCredito credito = DatoCredito.GetForDataUpdate(data_context, idAvaluo);
            credito.SetData(datosCredito);
            if (idAvaluo == 0)
            {
                avaluo.DatoCredito = credito;
            }
        }
        else
        {
            avaluo.DatoCredito = null;
        }

        data_context.SubmitChanges();

        if (idAvaluo == 0)
        {
            avaluo.GenerarIDE();
            data_context.SubmitChanges();
        }

        return avaluo.idAvaluo;
    }

    [WebMethod]
    public void SaveAvaluo(
        int idAvaluo
        , Entity datosAvaluo
        , Entity datosCredito
        , Entity datosSolicitante
        , Entity datosDireccionSolicitante)
    {
        SIGEADataContext data_context = new SIGEADataContext();
        AvaluoInmobiliario avaluo = AvaluoInmobiliario.GetFromId(data_context, idAvaluo);

        if (avaluo == null)
            throw new Exception("El identificador del avalúo es inválido");

        avaluo.SetData(datosAvaluo);

        if (datosCredito != null)
        {
            DatoCredito credito = DatoCredito.GetForDataUpdate(data_context, idAvaluo);
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
        Entity[] data = new Entity[4];

        AvaluoInmobiliario avaluo = AvaluoInmobiliario.GetFromId(common_context, idAvaluo);
        if (avaluo == null)
            throw new Exception("El identificador del avalúo es inválido");

        data[0] = avaluo.GetData();
        if (avaluo.DatoCredito != null)
        {
            data[1] = avaluo.DatoCredito.GetData();
        }
        data[2] = avaluo.Solicitante.GetData();
        data[3] = avaluo.Solicitante.Direccion.GetData();

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
        SIGEADataContext data_context = new SIGEADataContext();
        AvaluoInmobiliario.Cancel(data_context, idAvaluo);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public void SaveDeclaraciones(
        int idAvaluo
        , Entity datosDeclaraciones
        , Entity datosAdvertencias)
    {
        SIGEADataContext data_context = new SIGEADataContext();
        Declaraciones declaracion = Declaraciones.GetForDataUpdate(data_context, idAvaluo);

        if (declaracion == null)
            throw new Exception("El identificador del avalúo es inválido");

        declaracion.SetData(datosDeclaraciones, datosAdvertencias);
        data_context.SubmitChanges();
    }

    [WebMethod]
    public Entity[] LoadDeclaraciones(int idAvaluo)
    {
        Entity[] data = new Entity[2];

        Declaraciones declaraciones = Declaraciones.GetFromId(common_context, idAvaluo);

        if (declaraciones != null)
        {
            data[0] = declaraciones.GetDataDeclaraciones();
            data[1] = declaraciones.GetDataAdvertencias();
        }

        return data;
    }
    #endregion

    #region Asignacion de avaluos

    [WebMethod]
    public void SaveAsignacionAvaluo(int idAvaluo, Entity datosAsignacion)
    {
        SIGEADataContext data_context = new SIGEADataContext();
        AsignacionAvaluo.Save(data_context, idAvaluo, datosAsignacion);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public Entity LoadAsignacionAvaluo(int idAvaluo)
    {
        return AsignacionAvaluo.Load(common_context, idAvaluo);
    }

    [WebMethod]
    public void DeleteAsignacionAvaluo(int idAvaluo)
    {
        SIGEADataContext data_context = new SIGEADataContext();
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
        SIGEADataContext data_context = new SIGEADataContext();

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
        SIGEADataContext data_context = new SIGEADataContext();
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
        SIGEADataContext data_context = new SIGEADataContext();
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
        SIGEADataContext data_context = new SIGEADataContext();
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
        SIGEADataContext data_context = new SIGEADataContext();
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
        SIGEADataContext data_context = new SIGEADataContext();
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
        SIGEADataContext data_context = new SIGEADataContext();
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(data_context, idAvaluo);
        if (inmueble == null)
        {
            throw new Exception("El avalúo no cuenta con un inmueble registrado");
        }

        ConstruccionInmueble construccion = ConstruccionInmueble.GetForDataUpdate(inmueble);
        construccion.SetData(datosConstrucciones);
        TipoConstruccion.SetTiposConstruccion(construccion, datosTiposConstruccion);

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
        SIGEADataContext data_context = new SIGEADataContext();
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
    #endregion

    #region Superficies
    [WebMethod]
    public void SaveSuperficies(
        int idAvaluo
        , Entity datosSuperfice)
    {
        SIGEADataContext data_context = new SIGEADataContext();
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

    #endregion

    #region Comparables
    [WebMethod]
    public long SaveComparable(
        int idComparable
        , Entity datosComparable
        , Entity datosUbicacion
        , Entity datosContacto
        )
    {
        SIGEADataContext data_context = new SIGEADataContext();

        ComparableInmobiliario comparable = ComparableInmobiliario.GetDataForUpdate(data_context, idComparable);
        if (comparable == null)
            throw new Exception("El identificador del comparable es inválido");

        CodigoPostal cp_direccion = CodigoPostal.GetFromData(data_context, datosUbicacion);
        comparable.SetDatos(datosComparable);
        comparable.DatoContacto.SetData(datosContacto);
        comparable.Direccion.SetData(cp_direccion, datosUbicacion);

        data_context.SubmitChanges();

        return comparable.idComparable;
    }

    [WebMethod]
    public Entity[] LoadComparable(int idComparable)
    {
        Entity[] data = new Entity[4];

        ComparableInmobiliario comparable = ComparableInmobiliario.GetFromId(common_context, idComparable);
        if (comparable == null)
            throw new Exception("El identificador del comparable es inválido");

        data[0] = comparable.GetData();
        data[1] = comparable.DatoContacto.GetData();
        data[2] = comparable.Direccion.GetData();

        return data;
    }

    [WebMethod]
    public void DeleteComaprable(int idComparable)
    {
        SIGEADataContext data_context = new SIGEADataContext();
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
        SIGEADataContext data_context = new SIGEADataContext();

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
        SIGEADataContext data_context = new SIGEADataContext();
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
        SIGEADataContext data_context = new SIGEADataContext();

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
        SIGEADataContext data_context = new SIGEADataContext();
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
        SIGEADataContext data_context = new SIGEADataContext();

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
        SIGEADataContext data_context = new SIGEADataContext();
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
        SIGEADataContext data_context = new SIGEADataContext();
        Personal.Delete(data_context, idPersonal);

        data_context.SubmitChanges();
    }
    #endregion

    #endregion
}

