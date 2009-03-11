/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Scripts/AsyncCalls.js"/>
/// <reference path="~/Services/MethodCallers.asmx">
/// <reference path="~/Services/EntityWrappers.asmx">

// Guardado de registros

function saveAvaluoInmuebleAsync(datosAvaluo, datosSolicitante, datosInmueble, datosPropietario, callBack) {
    EntityWrappers.SaveAvaluoInmueble(
        datosAvaluo[0]
        , datosAvaluo[1]
        , datosSolicitante[0]
        , datosSolicitante[1]
        , datosInmueble[0]
        , datosInmueble[1]
        , datosInmueble[2]
        , datosPropietario[0]
        , datosPropietario[1]
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
function saveAvaluoAsync(idAvaluo, datosAvaluo, datosSolicitante, callBack) {
    EntityWrappers.SaveAvaluo(
        idAvaluo
        , datosAvaluo[0]
        , datosAvaluo[1]
        , datosSolicitante[0]
        , datosSolicitante[1]
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

// Carga de datos

function loadDatosAvaluoAsync(idAvaluo, control) {
    EntityWrappers.LoadAvaluo(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadDatosSolicitanteAsync(idAvaluo, control) {
    EntityWrappers.LoadSolicitante(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadDeclaracionesAsync(idAvaluo, control) {
    EntityWrappers.LoadDeclaraciones(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadAdvertenciasAsync(idAvaluo, control) {
    EntityWrappers.LoadAdvertencias(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function getRegistroAvaluoAsync(idAvaluo, callBack) {
    EntityWrappers.GetRegistroAvaluo(
        idAvaluo, asyncCallResultBack, asyncCallFail, callBack);
}
function loadAsignacionAvaluoAsync(idAvaluo, callBack) {
    EntityWrappers.LoadAsignacionAvaluo(
        idAvaluo, asyncCallResultBack, asyncCallFail, callBack);
}
function verificarExistenciaAvaluoPorIDEAsync(IDE, callBack) {
    EntityWrappers.VerificarExistenciaAvaluoPorIDE(
        IDE, asyncCallResultBack, asyncCallFail, callBack);
}
function getEstadoInmuebleAvaluoAsync(idAvaluo, callBack) {
    EntityWrappers.GetEstadoInmuebleAvaluo(
        idAvaluo, asyncCallResultBack, asyncCallFail, callBack);
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

function checarConstruccion(idAvaluo, callBack) {    
    MethodCallers.CheckIfConstruccion(
        idAvaluo
        , callBack
        , asyncCallFail
        , idAvaluo
    );
}
