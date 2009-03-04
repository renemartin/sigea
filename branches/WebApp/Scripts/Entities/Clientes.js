/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Services/MethodCallers.asmx">
/// <reference path="~/Services/EntityWrappers.asmx">

// Guardado de registro

function saveClienteAsync(idCliente, datosPersonales, datosContacto, datosDireccion, datosUsuario, callBack) {
    EntityWrappers.SaveCliente(
        idCliente
        , datosPersonales
        , datosContacto
        , datosDireccion
        , datosUsuario
        , saveClienteAsync_Complete
        , asyncCallFail
        , callBack
    );
}
function saveClienteAsync_Complete(result, callBack) {
    if (callBack != null)
        callBack(result);
}

// Carga de registro

function loadClienteAsync(idCliente, callBackList) {
    EntityWrappers.LoadCliente(
        idCliente
        , asyncCallListBack
        , asyncCallFail
        , callBackList
    );
}

// Eliminación de registro

function deleteClienteAsync(idCliente, callBack, parameter) {
    var context = new Array();
    context[0] = callBack;
    context[1] = parameter;

    EntityWrappers.DeleteCliente(
        idCliente
        , deleteClienteAsync_Complete
        , asyncCallFail
        , context
    );
}
function deleteClienteAsync_Complete(result, context) {
    if (context != null && context.length == 2) {
        context[0](context[1]);
    }
}

// Obtención de datos

function getUrlFotoClienteAsync(idCliente, callBack) {
    EntityWrappers.GetUrlFotoCliente(
        idCliente
        , getUrlFotoClienteAsync_Complete
        , asyncCallFail
        , callBack
    );
}
function getUrlFotoClienteAsync_Complete(result, callBack) {
    if (callBack != null)
        callBack(result);
}