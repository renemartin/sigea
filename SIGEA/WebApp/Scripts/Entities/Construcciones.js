/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Scripts/AsyncCalls.js"/>
/// <reference path="~/Services/EntityWrappers.asmx">

// Guardado de registros

function saveDatosConstruccionesAsync(idAvaluo, datosTiposConstruccion, datosConstruccion, callBack) {
    EntityWrappers.SaveDatosConstruccion(
        idAvaluo
        , datosTiposConstruccion
        , datosConstruccion
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}
function saveDatosCondominioAsync(idAvaluo, datosCondominio, callBack) {   
    EntityWrappers.SaveDatosCondominio(
        idAvaluo
        , datosCondominio[0]
        , datosCondominio[1]
        , datosCondominio[2]
        , datosCondominio[3]
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

function loadTiposConstruccionesAsync(idAvaluo, control) {
    EntityWrappers.LoadTiposConstrucciones(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadDatosConstruccionesAsync(idAvaluo, control) {
    EntityWrappers.LoadDatosConstrucciones(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadDatosCondominioAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadDatosCondominio(
        idAvaluo, asyncControlLoad, asyncCallFail, callBackList);
}
function loadSuperficiesInmuebleAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadSuperficies(
        idAvaluo, asyncControlLoad, asyncCallFail, callBackList);
}
