/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Scripts/AsyncCalls.js"/>
/// <reference path="~/Services/EntityWrappers.asmx">

// Guardado de registros

function saveDatosConstruccionesAsync(idAvaluo, datosTiposConstruccion,
    datosConstruccion, callBack) {
    EntityWrappers.SaveDatosConstruccion(
        idAvaluo
        , datosTiposConstruccion
        , datosConstruccion
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}
function saveDatosCondominioAsync(idAvaluo, datosCondominio, datosSuperficieCondominio,
    datosAreaComun, datosAreaComunComplementaria, callBack) {
    EntityWrappers.SaveDatosCondominio(
        idAvaluo
        , datosCondominio
        , datosSuperficieCondominio
        , datosAreaComun
        , datosAreaComunComplementaria
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}
function saveSuperficiesInmuebleAsync(idAvaluo, datosSuperficies, callBack) {
    EntityWrappers.SaveSuperficies(
        idAvaluo
        , datosSuperficies
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}

// Carga de datos

function loadTiposConstruccionesAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadTiposConstrucciones(
        idAvaluo, asyncCallSingleListBack, asyncCallFail, callBackList);
}
function loadDatosConstruccionesAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadDatosConstrucciones(
        idAvaluo, asyncCallSingleListBack, asyncCallFail, callBackList);
}
function loadDatosCondominioAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadDatosCondominio(
        idAvaluo, asyncCallListBack, asyncCallFail, callBackList);
}
function loadDatosSuperficiesCondominioAsync(idAvaluo, complementarias, callBackList) {
    EntityWrappers.LoadDatosAreaComun(
        idAvaluo, complementarias, asyncCallSingleListBack, asyncCallFail, callBackList);
}
function loadSuperficiesInmuebleAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadSuperficies(
        idAvaluo, asyncCallSingleListBack, asyncCallFail, callBackList);
}
