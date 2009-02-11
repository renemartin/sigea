function fillTipoComparable(comparable_id) {
    MethodCallers.GetListaTipoComparable(
        fillSelect, asyncCallFail, comparable_id);
}

function fillUsoSuelo(usoSuelo_id) {
    MethodCallers.GetListaUsoSuelo(
        fillSelect, asyncCallFail, usoSuelo_id);
}

function fillConservacion(conservacion_id) {
    MethodCallers.GetListaConservacion(
        fillSelect, asyncCallFail, conservacion_id);
}

function fillCalidadProyecto(calidadProyecto_id) {
    MethodCallers.GetListaCalidadProyecto(
        fillSelect, asyncCallFail, calidadProyecto_id);
}

function fillClase(clase_id){
    MethodCallers.GetListaClase(
        fillSelect, asyncCallFail, clase_id);
}

function saveComparable(idComparable, datosComparable, datosUbicacion, datosContacto, asyncCallFail, callBack) {
    EntityWrappers.SaveComparable(
        idComparable
        , datosComparable
        , datosUbicacion
        , datosContacto
        , asyncCallFail
        , callBack
    );
}

function saveComparableComplete(result, callBack){
    if(callBack != null)
        callBack();
}

function loadComparable(idComparable, callBackList){
    EntityWrappers.LoadComparable(
        idComparable
        , loadComparableComplete
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