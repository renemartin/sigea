/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Services/EntityWrappers.asmx">

// Guardado de registro

function savePersonalAsync(idPersonal, datosPersonales, datosUsuario, callBack) {
    EntityWrappers.SavePersonal(
        idPersonal
        , datosPersonales
        , datosUsuario
        , savePersonalAsync_Complete
        , asyncCallFail
        , callBack
    );
}
function savePersonalAsync_Complete(result, callBack) {
    if (callBack != null)
        callBack(result);
}

// Carga de registro

function loadPersonalAsync(idPersonal, callBackList) {
    EntityWrappers.LoadPersonal(
        idPersonal
        , asyncCallListBack
        , asyncCallFail
        , callBackList
    );
}

// Eliminación de registro

function deletePersonalAsync(idPersonal, callBack, parameter) {
    var context = new Array();
    context[0] = callBack;
    context[1] = parameter;

    EntityWrappers.DeletePersonal(
        idPersonal
        , deletePersonalAsync_Complete
        , asyncCallFail
        , context
    );
}
function deletePersonalAsync_Complete(result, context) {
    if (context != null && context.length == 2) {
        context[0](context[1]);
    }
}