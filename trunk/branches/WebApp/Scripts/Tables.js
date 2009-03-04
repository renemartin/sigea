// Clonación de tablas
var tables = new Array();

function addCloningTable(table, base_row_index, min_items, max_items) {
    tables[table.id] = new Object();
    tables[table.id].base_row = table.rows[base_row_index];
    tables[table.id].count = 0;
    tables[table.id].min_items = min_items;
    tables[table.id].max_items = max_items;
}

function getCloningTableCount(table_id) {
    return tables[table_id].count;
}

function addClonedRow(table_id) {
    if (tables[table_id].count == tables[table_id].max_items) {
        showMessage("La tabla contiene su número máximo de elementos");
        return false;
    }

    var base_row = tables[table_id].base_row;
    var cloned_row = base_row.cloneNode(true);

    setupClonedRow(cloned_row, ++tables[table_id].count);
    base_row.parentNode.appendChild(cloned_row);

    return true;
}

function removeClonedRow(table_id) {
    if (tables[table_id].count == tables[table_id].min_items) {
        showMessage("La tabla contiene su número mínimo de elementos");
        return;
    }

    tables[table_id].count--;

    var row_delete = tables[table_id].base_row.parentNode.lastChild;
    row_delete.parentNode.removeChild(row_delete);
}

function setupClonedRow(cloned_row, num) {
    cloned_row.style.display = "block";

    var i = null;
    var inputs = cloned_row.getElementsByTagName("input");
    for (i = 0; i < inputs.length; i++) {
        setupClonedControl(inputs[i], num);
    }
    var radios = cloned_row.getElementsByTagName("radio");
    for (i = 0; i < inputs.length; i++) {
        setupClonedControl(radios[i], num);
    }
    var selects = cloned_row.getElementsByTagName("select");
    for (i = 0; i < inputs.length; i++) {
        setupClonedControl(selects[i], num);
    }     
}

function setupClonedControl(control, num) {
    if (typeof(control) != "undefined"
        && control.type != null
        && (control.type == "checkbox"
            || control.type == "radio"
            || control.type == "text"
            || control.type == "select"
            || control.type == "select-one")) {

        var old_id = control.getAttribute("id");
        control.setAttribute("id", old_id + "_" + num);
    }
}