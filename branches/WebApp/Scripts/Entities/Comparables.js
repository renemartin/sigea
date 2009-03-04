/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Scripts/SelectFiller.js"/>
/// <reference path="~/Scripts/AsyncCalls.js"/>
/// <reference path="~/Services/MethodCallers.asmx">
/// <reference path="~/Services/EntityWrappers.asmx">

function saveComparableAsync(idComparable, datosComparable, datosUbicacion, datosContacto, callBack) {
    EntityWrappers.SaveComparable(
        idComparable
        , datosComparable
        , datosUbicacion
        , datosContacto
        , asyncCallFail
        , callBack
    );
}

function saveComparableAsyncComplete(result, callBack){
    if(callBack != null)
        callBack(result);
}

function loadComparableAsync(idComparable, callBackList){
    EntityWrappers.LoadComparable(
        idComparable
        , asyncCallListBack
        , asyncCallFaill
        , callBackList
    );
}

function loadComparableComplete(result, callBackList){
    if(result != null && callBackList != null){
        for ( i = 0; i < result.lenght; i++){
            callBackList[i + 1](result[i]);
        } 
        
        callBackList[0]();
    }
}

function deleteComparableAsync(idComparable, callBack, parameter){
    var context = new Array();
    context[0] = callBack;
    context[1] = parameter;
    
    EntityWrappers.DeleteComparable(
        idComparable
        , deleteComparableAsync_Complete
        , asyncCallFail
        , context
    );
}

function deleteComparableAsync_Complete(result, context){
    if ( context != null && context.length == 2 ) {
        context[0](context[1]);
    }    
}
