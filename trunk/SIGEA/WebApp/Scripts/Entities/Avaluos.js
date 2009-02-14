/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Scripts/AsyncCalls.js"/>
/// <reference path="~/Services/MethodCallers.asmx">
/// <reference path="~/Services/EntityWrappers.asmx">

// Guardado de registros

function saveAvaluoInmuebleAsync(idAvaluo, datosAvaluo, datosCredito, datosSolicitante, datosDireccionSolicitante, datosInmueble, datosUbicacionInmueble, 
        datosDireccionInmueble, datosPropietario, datosDireccionPropietario, callBack) {
    EntityWrappers.SaveAvaluoInmueble(
        idAvaluo
        , datosAvaluo
        , datosCredito
        , datosSolicitante
        , datosDireccionSolicitante
        , datosInmueble
        , datosUbicacionInmueble
        , datosDireccionInmueble
        , datosPropietario
        , datosDireccionPropietario
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );    
}
function saveAsignacionAvaluoAsync(idAvaluo, datosAsignacion, callBack) {
    EntityWrappers.SaveAsignacionAvaluo(
        idAvaluo
        , datosAsignacion
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}

function saveAvaluoAsync(idAvaluo, datosAvaluo, datosCredito, datosSolicitante, datosDireccion, callBack) {
    EntityWrappers.SaveAvaluo(
        idAvaluo
        , datosAvaluo
        , datosCredito
        , datosSolicitante
        , datosDireccion
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );
}

function saveDeclaracionesAsync(idAvaluo, datosDeclaraciones, datosAdvertencias, callBack) {
    EntityWrappers.SaveDeclaraciones(
        idAvaluo
        , datosDeclaraciones
        , datosAdvertencias
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );
}

// Cancelación de avalúo

function cancelarAvaluoAsync(sender, idAvaluo, callBack) {
    var context = new Array();
    context[0] = sender;
    context[1] = callBack;
    
    EntityWrappers.CancelarAvaluo(
        idAvaluo
        , asyncCallSenderBack
        , asyncCallFail
        , context);
}

// Eliminación de asignación

function deleteAsignacionAvaluoAsync(idAvaluo, callBack) {
    EntityWrappers.DeleteAsignacionAvaluo(
        idAvaluo
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}

// Carga de datos

function loadDatosAvaluoAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadAvaluo(
        idAvaluo
        , asyncCallListBack
        , asyncCallFail
        , callBackList);
}
function getRegistroAvaluoAsync(idAvaluo, callBack) {
    EntityWrappers.GetRegistroAvaluo(
        idAvaluo
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}
function loadAsignacionAvaluoAsync(idAvaluo, callBack) {
    EntityWrappers.LoadAsignacionAvaluo(
        idAvaluo
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}
function verificarExistenciaAvaluoPorIDEAsync(IDE, callBack) {
    EntityWrappers.VerificarExistenciaAvaluoPorIDE(
        IDE
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}
function getEstadoInmuebleAvaluoAsync(idAvaluo, callBack) {
    EntityWrappers.GetEstadoInmuebleAvaluo(
        idAvaluo
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}

// Disponibilidad de acciones

function verificarAccionAsignar(idStatus) {
    return idStatus == status_alta;
}
function verificarAccionEditar(idStatus) {
    return idStatus == status_elaboracion || idStatus == status_correccion;
}
function verificarAccionRevisar(idStatus) {
    return idStatus == status_sin_revisor || idStatus == status_revision;
}
function verificarAccionDescargar(idStatus) {
    return idStatus == status.finalizado;
}

// Constantes
var status_alta = 1;
var status_elaboracion = 2;
var status_sin_revisor = 3;
var status_revision = 4;
var status_correccion = 5;
var status_finalizado = 9;