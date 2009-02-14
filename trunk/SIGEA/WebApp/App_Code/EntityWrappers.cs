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
    public Entity[] LoadAvaluo(int idAvaluo)
    {
        Entity[] datos = new Entity[4];

        AvaluoInmobiliario avaluo = AvaluoInmobiliario.GetFromId(common_context, idAvaluo);
        if (avaluo == null)
            throw new Exception("El identificador del avalúo es inválido");

        datos[0] = avaluo.GetData();
        if (avaluo.DatoCredito != null)
        {
            datos[1] = avaluo.DatoCredito.GetData();
        }
        datos[2] = avaluo.Solicitante.GetData();
        datos[3] = avaluo.Solicitante.Direccion.GetData();

        return datos;
    }

    [WebMethod]
    public void CancelarAvaluo(int idAvaluo)
    {
        SIGEADataContext data_context = new SIGEADataContext();
        AvaluoInmobiliario.Cancel(data_context, idAvaluo);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public object GetRegistroAvaluo(int idAvaluo)
    {
        return AvaluoInmobiliario.GetRegistro(common_context, idAvaluo);
    }

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
    public void saveDeclaraciones(
        int idAvaluo
        , Entity datosDeclaracion
        , Entity datosAdvertencia)
    {
        SIGEADataContext data_context = new SIGEADataContext();
        AvaluoInmobiliario avaluo = AvaluoInmobiliario.GetFromId(data_context, idAvaluo);

        if (avaluo == null)
            throw new Exception("El identificador del avalúo es inválido");

        if (datosDeclaracion != null)
        {
            Declaraciones declaracion = Declaraciones.GetForDataUpdate(data_context, idAvaluo);
            declaracion.SetData(datosDeclaracion, datosAdvertencia);
        }
        else
        {
            avaluo.Declaraciones = null;
        }

        data_context.SubmitChanges();
    }

    #endregion

    #region Inmuebles

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
        inmueble.AvaluoInmobiliario.Single().UpdateSubTipo(inmueble.idTipoInmueble);

        data_context.SubmitChanges();
    }

    [WebMethod]
    public Entity[] LoadInmueble(int idAvaluo)
    {
        Inmueble inmueble = Inmueble.GetFromIdAvaluo(common_context, idAvaluo);
        if (inmueble == null)
            throw new Exception("El identificador del avalúo es inválido");

        Entity[] datos = new Entity[5];

        datos[0] = inmueble.GetData();
        datos[1] = inmueble.DireccionInmueble.GetData();
        datos[2] = inmueble.DireccionInmueble.Direccion.GetData();
        datos[3] = inmueble.Propietario.GetData();
        datos[4] = inmueble.Propietario.Direccion.GetData();

        return datos;
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
        Entity[] datos = new Entity[4];

        Valuador valuador = Valuador.GetFromId(common_context, idValuador);
        if (valuador == null)
            throw new Exception("El identificador del valuador es inválido");

        Usuario usuario = Valuador.GetUsuarioFromId(common_context, idValuador);

        datos[0] = valuador.GetData();
        datos[1] = valuador.DatoContacto.GetData();
        datos[2] = valuador.Direccion.GetData();
        if (usuario != null)
            datos[3] = usuario.GetData();
        else
            datos[3] = null;

        return datos;
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
        Entity[] datos = new Entity[4];

        Cliente cliente = Cliente.GetFromId(common_context, idCliente);
        if (cliente == null)
            throw new Exception("El identificador del cliente es inválido");

        Usuario usuario = Cliente.GetUsuarioFromId(common_context, idCliente);

        datos[0] = cliente.GetData();
        datos[1] = cliente.DatoContacto.GetData();
        datos[2] = cliente.Direccion.GetData();
        if (usuario != null)
            datos[3] = usuario.GetData();
        else
            datos[3] = null;

        return datos;
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
        Entity[] datos = new Entity[2];

        Personal personal = Personal.GetFromId(data_context, idPersonal);
        if (personal == null)
            throw new Exception("El identificador del personal es inválido");


        datos[0] = personal.GetData();
        if (personal.Usuario != null)
            datos[1] = personal.Usuario.GetData();
        else
            datos[1] = null;

        return datos;
    }

    [WebMethod]
    public void DeletePersonal(int idPersonal)
    {
        SIGEADataContext data_context = new SIGEADataContext();
        Personal.Delete(data_context, idPersonal);

        data_context.SubmitChanges();
    }
    #endregion

    #region Comparable
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
        Entity[] datos = new Entity[4];

        ComparableInmobiliario comparable = ComparableInmobiliario.GetFromId(common_context, idComparable);
        if (comparable == null)
            throw new Exception("El identificador del comparable es inválido");

        datos[0] = comparable.GetData();
        datos[1] = comparable.DatoContacto.GetData();
        datos[2] = comparable.Direccion.GetData();

        return datos;
    }

    [WebMethod]
    public void DeleteComaprable(int idComparable)
    {
        SIGEADataContext data_context = new SIGEADataContext();
        ComparableInmobiliario.Delete(data_context, idComparable);

        data_context.SubmitChanges();
    }

    #endregion

    #endregion
}

