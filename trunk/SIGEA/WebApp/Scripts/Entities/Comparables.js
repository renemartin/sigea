/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Scripts/Utils.js"/>
/// <reference path="~/Scripts/SelectFiller.js"/>
/// <reference path="~/Scripts/AsyncCalls.js"/>
/// <reference path="~/Services/MethodCallers.asmx">
/// <reference path="~/Services/EntityWrappers.asmx">

function saveComparableAsync(idComparable, datosComparable, callBack) {
    EntityWrappers.SaveComparable(
        idComparable
        , datosComparable[0]
        , datosComparable[1]
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );
}

function loadComparableAsync(idComparable, control){
    EntityWrappers.LoadComparable(
        idComparable
        , asyncControlLoad
        , asyncCallFail
        , control
    );
}

function deleteComparableAsync(idComparable, callBack){    
    EntityWrappers.DeleteComparable(
        idComparable
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );
}