﻿/// <reference name="MicrosoftAjax.js"/>
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

function loadEstructurasAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadEstructuras(
        idAvaluo, asyncCallListBack, asyncCallFail, callBackList
        );
}
function loadAcabadosAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadAcabados(
        idAvaluo, asyncCallSingleListBack, asyncCallFail, callBackList
        );
}
function loadInstalacionesAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadInstalacionTipoConstruccion(
        idAvaluo, asyncCallListBack, asyncCallFail, callBackList
        );
}
function loadInstalacionesAdicionalesAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadInstalacionConstruccion(
        idAvaluo, asyncCallSingleListBack, asyncCallFail, callBackList
        );
}
