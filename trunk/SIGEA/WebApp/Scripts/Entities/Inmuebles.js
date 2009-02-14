/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Scripts/AsyncCalls.js"/>
/// <reference path="~/Services/EntityWrappers.asmx">

// Guardado de registros

function saveInmuebleAsync(idAvaluo, datosInmueble, datosUbicacionInmueble,
        datosDireccionInmueble, datosPropietario, datosDireccionPropietario, callBack) {
    EntityWrappers.SaveInmueble(
        idAvaluo
        , datosInmueble
        , datosUbicacionInmueble
        , datosDireccionInmueble
        , datosPropietario
        , datosDireccionInmueble
        , asyncCallResultBack
        , asyncCallFail
        , callBack);
}

// Carga de datos

function loadInmuebleAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadInmueble(
        idAvaluo, asyncCallListBack, asyncCallFail, callBackList);
}