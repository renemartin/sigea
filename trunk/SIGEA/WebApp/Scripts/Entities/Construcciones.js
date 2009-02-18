/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Scripts/AsyncCalls.js"/>
/// <reference path="~/Services/MethodCallers.asmx">
/// <reference path="~/Services/EntityWrappers.asmx">

//guardar datos

function saveTipoConstruccionAsync( idConstruccion, datosTipoConstruccion, callBack) {
    EntityWrappers.SaveTipoConstruccion(
        idConstruccion
        , datosTipoConstruccion
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );
}

function saveConstruccionInmuebleAsync( idConstruccion, datosConstruccion, datosCondominio, callBack) {
    EntittyWrappers.SaveConstruccionInmueble(
        idConstruccion
        , datosConstruccion
        , datosCondominio
        , asyncCallResultBack
        , asyncCallFail
        , callBack
   );
}

function saveSuperficieAsync( idConstruccion, datosSuperficie, datosSuperficieCondominio, datosSuperficieAdicional, callBack) {
    EntityWrappers.SaveSuperficie(
        idConstruccion
        , datosSuperficie
        , datosSuperficieCondominio
        , datosSuperficieAdicional
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );
}  

//cargar datos

function loadDatosTipoConstruccionAsync( idConstruccion, callBackList) {
    EntityWrappers.LoadTipoConstruccion(
        idConstruccion
        , asyncCallListBack
        , asyncCallFail
        , callBackList
    );
}

function loadDatosConstruccionInmuebleAsync( idConstruccion, callBackList) {
    EntityWrappers.LoadConstruccionInmueble(
        idConstruccion
        , asyncCallListBack
        , asyncCallFail
        , callBackList
    );
}

function loadDatosSuperficieAsync( idConstruccion, callBackList) {
    EntityWrappers.LoadSuperficie(
        idConstruccion
        , asyncCallListBack
        , asyncCallFail
        , callBackList
    );
}
