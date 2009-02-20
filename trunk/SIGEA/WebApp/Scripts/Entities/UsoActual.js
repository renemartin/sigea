/// <reference name="MicrosoftAjax.js"/>
/// <reference path="~/Scripts/AsyncCalls.js"/>
/// <reference path="~/Services/EntityWrappers.asmx">

function saveUsoActualAsync(idAvaluo, datosDistribucion, datosRecamaras, datosPlantas, callBack) {
    EntityWrappers.SaveUsoActual(
        idAvaluo
        , datosDistribucion
        , datosRecamaras
        , datosPlantas
        , asyncCallResultBack
        , asyncCallFail
        , callBack
    );
}

function loadUsoActualDistribucionAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadUsoActualDistribucion(
        idAvaluo, asyncCallListBack, asyncCallFail, callBackList);
}

function loadUsoActualRecamarasAsync(idAvaluo, callBackList) {
    EntityWrappers.LoadUsoActualRecamaras(
        idAvaluo, asyncCallListBack, asyncCallFail, callBackList);
}

function LoadUsoActualPlantas(idAvaluo, callBackList) {
    EntityWrappers.LoadUsoActualDistribucion(
        idAvaluo, asyncCallListBack, asyncCallFail, callBackList);
}