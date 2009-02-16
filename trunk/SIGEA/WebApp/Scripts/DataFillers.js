/// <reference name="MicrosoftAjax.js"/>

// Metodos comunes

function fillSelect(data, target_id) {    
    var select = $get(target_id);
    var option = null;

    option = addSelectOption(select, "Seleccione...", 0);
    option.setAttribute("att1", "false");

    for (i = 0; i < data.length; i++) {
        option = addSelectOption(select, data[i].display, data[i].value);
        if (data[i].att1 != undefined)
            option.setAttribute("att1", data[i].att1.toString());
        if (select.selectedValue != undefined && select.selectedValue != null)
            option.selected = (select.selectedValue == data[i].value.toString());
        select.appendChild(option);
    }
    if (data.length == 2) {
        select.options[1].selected = true;
    }
    hideControlLoading(target_id);
}

function prepareCascadeSelect(target_id, parent_id, no_selection_text) {
    var target = $get(target_id);
    var parent = $get(parent_id);
    var parent_key = parent.value;

    if (target.options.length == 0 && parent.selectedValue != undefined)
        parent_key = parent.selectedValue;

    clearSelect(target);

    if (parent.value == undefined || parent_key == 0) {
        addSelectOption(target, no_selection_text, 0);
        target.setAttribute("cascade-disabled", true);
        target.disabled = true;
        return null;
    }

    if (target.getAttribute("cascade-disabled") != undefined) {
        target.removeAttribute("cascade-disabled");
        target.disabled = false;
    }
    return parent_key;
}

// Ubicaciones

function fillEstados(estados_id) {
    showControlLoading(estados_id);
    MethodCallers.GetListaEstados(
        fillSelect, asyncCallFail, estados_id);
}

function fillMunicipios(municipios_id, estados_id) {    
    var parent_key = prepareCascadeSelect(municipios_id, estados_id, "Seleccione un estado...");
    if (parent_key != null) {
        showControlLoading(municipios_id);
        MethodCallers.GetListaMunicipios(
            parent_key, fillSelect, asyncCallFail, municipios_id);
    }
}

// Avalúos

function fillProposito(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaPropositosAvaluo(
        fillSelect, asyncCallFail, target_id);
}
function fillTipoCredito(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposCredito(
        fillSelect, asyncCallFail, target_id);
}
function fillEntidadOtorgante(target_id, parent_id, callBack) {    
    var context = new Array();
    context[0] = target_id;
    context[1] = callBack;

    var parent_key = prepareCascadeSelect(target_id, parent_id, "Selecciona un tipo de credito...");
    if (parent_key != null) {
        showControlLoading(target_id);
        MethodCallers.GetListaEntidadesFinanciamiento(
            parent_key, fillEntidadOtorgante_Complete, asyncCallFail, context);
    }
}
function fillEntidadOtorgante_Complete(result, context) {
    fillSelect(result, context[0]);
    context[1]();
}
function fillCreditoInterno(target_id, parent_id) {
    var parent_key = prepareCascadeSelect(target_id, parent_id, "Selecciona un tipo de credito...");
    if (parent_key != null) {
        showControlLoading(target_id);
        MethodCallers.GetListaTiposCreditoInterno(
            parent_key, fillSelect, asyncCallFail, target_id);
    }
}
function fillEntidadCofinanciamiento(target_id, parent_id) {
    var parent_key = prepareCascadeSelect(target_id, parent_id, "Selecciona un tipo de credito...");
    if (parent_key != null) {
        showControlLoading(target_id);
        MethodCallers.GetListaEntidadesCofinanciamiento(
            parent_key, fillSelect, asyncCallFail, target_id);
    }
}
function fillFuente(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposFuente(
        fillSelect, asyncCallFail, target_id);
}

// Cuentas

function fillCliente(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaClientes(
        fillSelect, asyncCallFail, target_id);
}

function fillTiposValuador(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposValuador(
        fillSelect, asyncCallFail, target_id);
}

// Inmuebles

function fillTipoInmueble(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposInmueble(
        fillSelect, asyncCallFail, target_id);
}
function fillRegimenPropiedad(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposRegimenPropiedad(
        fillSelect, asyncCallFail, target_id);
}
function fillOrientacion(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposOrientacion(
        fillSelect, asyncCallFail, target_id);
}
function fillUbicacion(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposUbicacion(
        fillSelect, asyncCallFail, target_id);
}
function fillTopografia(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposTopografia(
        fillSelect, asyncCallFail, target_id);
}
function fillCaracPanoramicas(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaCaracPanoramicas(
        fillSelect, asyncCallFail, target_id);
}
function fillUsoSuelo(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposUsoSuelo(
        fillSelect, asyncCallFail, target_id);
}
function fillServidumbre(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposServidumbre(
        fillSelect, asyncCallFail, target_id);
}
function fillClasificacionZona(target_id, idClase) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposClasificacionZona(
        idClase, fillSelect, asyncCallFail, target_id);
}
function fillProximidadUrbana(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposProximidadUrbana(
        fillSelect, asyncCallFail, target_id);
}
function fillNivelSocioeconomico(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposNivelSocioeconomico(
        fillSelect, asyncCallFail, target_id);
}
function fillConstruccionPredominante(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposConstruccionPredominante(
        fillSelect, asyncCallFail, target_id);
}
function fillDensidad(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposDensidad(
        fillSelect, asyncCallFail, target_id);
}
function fillImportanciaVialidad(target_id) {
    MethodCallers.GetListaTiposImportanciaVia(
        fillSelect, asyncCallFail, target_id);
}
function fillMaterial(target_id, tipo) {
    showControlLoading(target_id);
    MethodCallers.GetListaMateriales(
        tipo, fillSelect, asyncCallFail, target_id);
}
function fillClaseInmueble(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposClaseInmueble(
        fillSelect, asyncCallFail, target_id);
}
function fillEstadoConservacion(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposEstadoConservacion(
        fillSelect, asyncCallFail, target_id);
}
function fillCalidadProyecto(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposCalidadProyecto(
        fillSelect, asyncCallFail, target_id);
}
function fillServicio(target_id, tipo) {
    showControlLoading(target_id);
    MethodCallers.GetListaServicios(
        tipo, fillSelect, asyncCallFail, target_id);
}
function fillUnidad(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTiposUnidad(
        fillSelect, asyncCallFail, target_id);
}

//Comparables
function fillTipoComparable(target_id) {
    showControlLoading(target_id);
    MethodCallers.GetListaTipoComparable(
        fillSelect, asyncCallFail, target_id);
}