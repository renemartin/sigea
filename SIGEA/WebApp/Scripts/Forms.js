// Variables
var form_unloaded = false;
var form_editing_count = 0;
var num_bloques_cargados = 0;

// Habilitar / Deshabilitar controles

function toggleControlEnabled(container, enabled) {
    if (container.nodeType != 1)
        return;

    if (container.onclick != null
        || container.type == "text"
        || container.type == "textarea"
        || container.type == "select-one"
        || container.type == "checkbox"
        || container.type == "radio") {
        if (enabled) {
            if (container.getAttribute("stay-disabled") == undefined) {
                container.disabled = false;
            }
            else {
                container.removeAttribute("stay-disabled");
            }
        }
        else {
            if (container.disabled) {
                container.setAttribute("stay-disabled", true);
            }
            container.disabled = true;
        }
    }
    if (container.hasChildNodes()) {
        var i = 0;
        for (i = 0; i < container.childNodes.length; i++) {
            toggleControlEnabled(container.childNodes[i], enabled);
        }
    }
}

function enableControls(container) {
    toggleControlEnabled(container, true);
}

function disableControls(container) {
    toggleControlEnabled(container, false);
}

// Descarga de página

function beforeUnload(saveCallBack) {
    if (!form_unloaded) {
        form_unloaded = true;
        if (form_editing_count > 0 && saveCallBack != null) {            
            return saveCallBack();
        }
    }
}

// Edición de formulario
function editForm(form_id, edit_id, save_id, cancel_id) {
    $get(edit_id).style.display = "none";
    $get(cancel_id).style.display = "inline";
    $get(save_id).style.display = "inline";

    form_editing_count++;
    enableControls($get(form_id));
}
function cancelEdit(form_id, edit_id, save_id, cancel_id, id_key) {
    $get(edit_id).style.display = "inline";
    $get(cancel_id).style.display = "none";
    $get(save_id).style.display = "none";

    form_editing_count--;
    disableControls($get(form_id));
    
    loadForm(id_key);
}
function terminateEdit(form_id, edit_id, save_id, cancel_id) {
    $get(edit_id).style.display = "inline";
    $get(cancel_id).style.display = "none";
    $get(save_id).style.display = "none";

    form_editing_count--;
    disableControls($get(form_id));
}