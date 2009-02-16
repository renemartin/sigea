﻿/// <reference name="MicrosoftAjax.js"/>

// Mensajes

function showMessage(message) {
    alert(message);
}
function showErrorMessage(message) {
    alert(message);
}
function requestConfirmation(message) {
    return confirm(message);
}

// Ventanas

function openModalWindow(url, width, height) {
    return window.showModalDialog(url, "",
        String.format("status:no;dialogWidth:{0}px;dialogHeight:{1}px", width, height));
}
function openFullWindow(url, name) {
    var width = screen.availWidth;
    var height = screen.availHeight;

    var pop = window.open(url, name,
        String.format("width={0},height={1},left=0,top=0,screenX=0,screenY=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes")
            , width, height);

    pop.resizeTo(width, height);
    pop.focus();

    return pop;
}
function closeWindow(ask) {
    if (ask) {
        if (requestConfirmation("¿Desea cerrar esta ventana?"))
            window.close();
    }
    else
        window.close();
}
function redirect(url) {
    window.location.href = url;
}

// Notificaciones carga

function showControlLoading(target_id) {
    var target = $get(target_id);
    if (!target.disabled) {
        target.setAttribute("load-disabled", true);
        target.disabled = true;
    }

    var loading = document.createElement("img");
    loading.id = "loading_" + target_id
    loading.setAttribute("class", "spinner");
    loading.setAttribute("className", "spinner");
    if (target.nextSibling)
        target.parentNode.insertBefore(loading, target.nextSibling);
    else
        target.parentNode.appendChild(loading);
}

function hideControlLoading(target_id) {
    var target = $get(target_id);
    if (target.disabled && target.getAttribute("load-disabled") != undefined)
        target.disabled = false;

    var loading = $get("loading_" + target_id, target.parentNode);
    if (loading != undefined) {
        target.parentNode.removeChild(loading);
        setVisibility(loading, false);
    }
}

// Controles general

function setVisibility(target, visible, type) {
    if (type == null)
        type = "block";
    target.style.display = visible ? type : "none";
}
function getVisibility(control) {
    return control.style.display != "none";
}

function clearControl(control) {
    switch (control.type) {
        case "text":
            control.value = "";
            break;
        case "checkbox":
            control.checked = false;
            break;
        case "select":
        case "select-one":
            control.selectedIndex = 0;
            control.setAttribute("selectedValue", null);
            break;
        default:
            control.value = "";
    }
}


// Controles select

function clearSelect(select) {
    for (var i = select.options.length - 1; i >= 0; i--) {
        select.options[i] = null;
    }
}
function setSelectText(select, text) {
    if (select.options.length > 0)
        clearSelect(select);

    addSelectOption(select, text, null);
}
function setSelectTextById(select_id, text) {
    setSelectText($get(select_id));
}

function addSelectOption(select, display, value) {
    var option = document.createElement("option");
    option.text = display;
    option.value = value;
    try {
        select.add(option, null);
    }
    catch (ex) {
        select.add(option);
    }
    return option;
}

// Fecha y hora

var date_format = "dd/MM/yyyy"

function getDate(date_string) {
    var date_parts = date_string.split("/");
    var new_date_string = String.format("{0}/{1}/{2}", date_parts[1], date_parts[0], date_parts[2]);
    var date = new Date(new_date_string);

    return date;
}
function getDateString(date) {
    if (date == null)
        return "";
    return date.format(date_format);
}

// Formato

function getNumString(num, decimals) {
    if (num == null)
        return ""
    if (decimals == null)
        return num;
    return parseFloat(num).toFixed(decimals);
}

function getCurrString(num) {
    if (num == null)
        return ""
    return "$ " + num.toFixed(2);
}