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

function saveDatosEstructurasAsync(idAvaluo, datosEstructuras, callBack) {
    EntityWrappers.SaveEstructuras(
        idAvaluo
        , datosEstructuras
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );
}
function saveDatosAcabadosAsync(idAvaluo, datosAcabados, callBack) {
    EntityWrappers.SaveAcabados(
        idAvaluo
        , datosAcabados
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );
}

function saveDatosFachadaAsync(idAvaluo, datosFachada, callBack) {
    EntityWrappers.SaveFachada(
        idAvaluo
        , datosFachada
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );
}

function saveDatosInstalacionesConstruccionAsync(idAvaluo, datosInstalacionesTipoConstruccion, datosInstalacionesPrivativas, datosInstalacionesComunes, callBack) {
    EntityWrappers.SaveInstalacionesConstruccion(
        idAvaluo
        , datosInstalacionesTipoConstruccion
        , datosInstalacionesPrivativas
        , datosInstalacionesComunes
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );
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
function loadDatosCondominioAsync(idAvaluo, control) {
    EntityWrappers.LoadDatosCondominio(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadSuperficiesInmuebleAsync(idAvaluo, control) {
    EntityWrappers.LoadSuperficies(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}

function loadEstructurasAsync(idAvaluo, control) {
    EntityWrappers.LoadEstructuras(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadAcabadosAsync(idAvaluo, control) {
    EntityWrappers.LoadAcabados(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadFachadaAsync(idAvaluo, control) {
    EntityWrappers.LoadFachada(
        idAvaluo, asyncControlFachada, asyncCallFail, control);
}
function loadInstalacionesAsync(idAvaluo, control) {
    EntityWrappers.LoadInstalacionTipoConstruccion(
        idAvaluo, asyncControlLoad, asyncCallFail, control);
}
function loadInstalacionesAdicionalesAsync(idAvaluo, comun, control) {
    EntityWrappers.LoadInstalacionConstruccion(
        idAvaluo, comun, asyncControlLoad, asyncCallFail, control);
}
