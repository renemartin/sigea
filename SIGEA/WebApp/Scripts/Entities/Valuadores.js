/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Scripts/SelectFiller.js"/>
/// <reference path="~/Scripts/AsyncCalls.js"/>
/// <reference path="~/Services/MethodCallers.asmx">
/// <reference path="~/Services/EntityWrappers.asmx">

// Guardado de registro

function saveValuadorAsync(idValuador, datosPersonales, datosContacto, datosDireccion, datosUsuario, callBack) {
    EntityWrappers.SaveValuador(
        idValuador
        , datosPersonales
        , datosContacto
        , datosDireccion
        , datosUsuario
        , saveValuadorAsync_Complete
        , asyncCallFail
        , callBack
    );
}
function saveValuadorAsync_Complete(result, callBack) {
    if (callBack != null)
        callBack(result);
}

// Carga de registro

function loadValuadorAsync(idValuador, callBackList) {
    EntityWrappers.LoadValuador(
        idValuador
        , asyncCallListBack
        , asyncCallFail
        , callBackList
    );
}


// Eliminación de registro

function deleteValuadorAsync(idValuador, callBack, parameter) {
    var context = new Array();
    context[0] = callBack;
    context[1] = parameter;

    EntityWrappers.DeleteValuador(
        idValuador
        , deleteValuadorAsync_Complete
        , asyncCallFail
        , context
    );
}
function deleteValuadorAsync_Complete(result, context) {
    if (context != null && context.length == 2) {
        context[0](context[1]);
    }
}

// Obtención de datos

function getUrlFotoValuadorAsync(idValuador, callBack) {
    EntityWrappers.GetUrlFotoValuador(
        idValuador
        , getUrlFotoValuadorAsync_Complete
        , asyncCallFail
        , callBack
    );
}
function getUrlFotoValuadorAsync_Complete(result, callBack) {
    if (callBack != null)
        callBack(result);
}
