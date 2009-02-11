// Clonación de tablas
var tables = new Array();

function addCloningTable(table, base_row_index, max_items) {
    tables[table.id] = new Object();
    tables[table.id].base_row = table.rows[base_row_index];
    tables[table.id].count = 1;
    tables[table.id].max_items = max_items;
}

function getCloningTableCount(table_id) {
    return tables[table_id].count;
}

function addClonedRow(table_id) {
    if (tables[table_id].count == tables[table_id].max_items) {
        showMessage("La tabla ya contiene su número máximo de elementos");
        return;
    }
    
    var base_row = tables[table_id].base_row;
    var cloned_row = base_row.cloneNode(true);

    setupClonedRow(cloned_row, tables[table_id].count++);
    base_row.parentNode.appendChild(cloned_row);
}

function removeClonedRow(table_id) {
    if (tables[table_id].count == 1) {
        showMessage("No se puede remover el primer elemento de la tabla");
        return;
    }

    tables[table_id].count--;

    var row_delete = tables[table_id].base_row.parentNode.lastChild;
    row_delete.parentNode.removeChild(row_delete);
}

function setupClonedRow(cloned_row, num) {
    var cell = null;
    
    if (cloned_row.hasChildNodes()) {
        for (i = 0; i < cloned_row.childNodes.length - 1; i++) {
            cell = cloned_row.childNodes[i];
            if (cell.hasChildNodes()) {
                for (j = 0; j < cell.childNodes.length; j++) {
                    if (cell.childNodes[j].nodeType == 1) {
                        setupClonedControl(cell.childNodes[j], num);
                    }
                }                   
            }
        }
    }
}

function setupClonedControl(control, num) {   
    if (control.type == "checkbox"
        || control.type == "text"
        || control.type == "select"
        || control.type == "select-one") {        

        var new_id = null;
        var old_id = control.getAttribute("id");
        var del_index = old_id.lastIndexOf("_");

        if (del_index != -1) {
            new_id = old_id.slice(0, del_index + 1) + num;
        }
        if (new_id == null) {
            showErrorMessage("El indice para el control clonado es inválido");
        }
        control.setAttribute("id", new_id);
        clearControl(control);
    }
}