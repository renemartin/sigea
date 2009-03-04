// Validación de controles

function ControlValidator(controls, show_errors) {
    if (controls == null) {
        showErrorMessage("Controles a validar no establecidos");
        return;
    }

    if (typeof (ControlValidator_Init) == 'undefined') {
        ControlValidator_Init = true;
        ControlValidator.prototype.setShowErrors = setShowErrors;
        ControlValidator.prototype.getShowErrors = getShowErrors;
        ControlValidator.prototype.addOptionalField = addOptionalField;
        ControlValidator.prototype.removeOptionalField = removeOptionalField;
        ControlValidator.prototype.addNumericField = addNumericField;
        ControlValidator.prototype.addDateField = addDateField;
        ControlValidator.prototype.validateRequiredFields = validateRequiredFields;
        ControlValidator.prototype.validateNumericFields = validateNumericFields;
        ControlValidator.prototype.validateDateFields = validateDateFields;
        ControlValidator.prototype.setErrors = setErrors;
        ControlValidator.prototype.clearErrors = clearErrors;
        ControlValidator.prototype.validate = validate;
    }
    
    this.show_errors = show_errors == null ? true : show_errors;
    this.controls = controls;
    this.optionalFields = new Array();
    this.numericFields = new Array();
    this.dateFields = new Array();
    this.invalid = new Array();

    // Propiedades

     function setShowErrors(show_errors) {
        this.show_errors = show_errors;
    }

    function getShowErrors() {
        return this.show_errors;
    }

    // Metodos

    function addOptionalField(index) {
        this.optionalFields[this.controls[index].id] = true;
    }

    function removeOptionalField(index) {
        this.optionalFields[this.controls[index].id] = false;
    }

    function addNumericField(index, is_float, max_range, min_range) {
        this.numericFields[this.numericFields.length] =
            new NumericValidateItem(index, is_float, max_range, min_range);
    }

    function addDateField(index) {
        this.dateFields[this.dateFields.length] = index;
    }

    function validateRequiredFields() {
        var validated = true;
        var empty = false;
        var i = null;

        for (i = 0; i < this.controls.length; i++) {
            if (!this.optionalFields[this.controls[i].id]) {
                empty = false;
                switch (this.controls[i].type) {
                    case "textarea":
                    case "text":
                        if (this.controls[i].value == "") {
                            empty = true;
                        }
                        break;
                    case "select":
                    case "select-one":
                        if (this.controls[i].value == "" || this.controls[i].value == "0") {
                            empty = true;
                        }
                        break;
                }
                if (empty) {
                    validated = false;
                    this.invalid[this.invalid.length] = [this.controls[i], "Campo requerido"];
                }
            }
        }

        return validated;
    }

    function validateNumericFields() {
        var validated = true;
        var error_message = "";
        var number = NaN;
        var field = null;
        var i = null;

        for (i = 0; i < this.numericFields.length; i++) {
            error_message = "";
            field = this.numericFields[i];

            if (this.controls[field.index].value != "") {
                if (!field.is_float) {
                    number = parseInt(this.controls[field.index].value);
                    if (!isNaN(number)) {
                        this.controls[field.index].value = number;
                    }
                    else {
                        error_message = "Formato de número entero inválido";
                    }
                }
                else {
                    number = parseFloat(this.controls[field.index].value);
                    if (isNaN(number)) {
                        error_message = "Formato de número decimal inválido";
                    }
                }

                if (!isNaN(number)) {
                    if (!isNaN(field.max_num) && number > field.max_num) {
                        error_message = "Número mayor al máximo permitido (" + field.max_num + ")";
                    }
                    if (!isNaN(field.min_num) && number < field.min_num) {
                        error_message = "Número mayor al mínimo permitido (" + field.min_num + ")";
                    }
                }

                if (error_message != "") {
                    validated = false;
                    this.invalid[this.invalid.length] = [this.controls[field.index], error_message];
                }
            }
        }

        return validated;
    }

    function validateDateFields() {
        var validated = true;
        var i = null;

        for (i = 0; i < this.dateFields.length; i++) {
            if (null == new Date(this.controls[dateFields[i]].value)) {
                validated = false;
                this.invalid[this.invalid.length] = [this.controls[dateFields[i]], "Fecha inválida"];
            }
        }

        return validated;
    }

    function setErrors() {
        var i = 0;
        var normal_class = "";

        for (i = 0; i < this.invalid.length; i++) {
            if (this.invalid[i][0].getAttribute("normalClass") == null) {
                normal_class = this.invalid[i][0].getAttribute("class");
                if (normal_class == undefined) {
                    normal_class = this.invalid[i][0].getAttribute("className");
                }
                this.invalid[i][0].setAttribute("normalClass", normal_class);
                this.invalid[i][0].setAttribute("class", "controlError " + normal_class);
                this.invalid[i][0].setAttribute("className", "controlError " + normal_class);

                addTooltip(this.invalid[i][0], this.invalid[i][1], "tooltipError");
            }
        }
    }

    function clearErrors() {
        var i = 0;
        var normal_class = "";

        for (i = 0; i < this.invalid.length; i++) {
            if (this.invalid[i][0].getAttribute("normalClass") != null) {
                normal_class = this.invalid[i][0].getAttribute("normalClass");
                this.invalid[i][0].setAttribute("class", normal_class);
                this.invalid[i][0].setAttribute("className", normal_class);
                this.invalid[i][0].removeAttribute("normalClass");

                removeTooltip(this.invalid[i][0]);
            }
        }
    }

    function validate() {
        if (this.show_errors && this.invalid.length > 0) {
            this.clearErrors();
            this.invalid = new Array();
        }

        this.validateRequiredFields()
        this.validateNumericFields()
        this.validateDateFields();

        if (this.show_errors && this.invalid.length > 0) {
            this.setErrors();
        }

        return this.invalid.length == 0;
    }
}

function NumericValidateItem(index, is_float, max_num, min_num) {
    this.index = index;
    this.is_float = is_float == null ? false : is_float;
    this.max_num = max_num == null ? NaN : max_num;
    this.min_num = min_num == null ? NaN : min_num;
}