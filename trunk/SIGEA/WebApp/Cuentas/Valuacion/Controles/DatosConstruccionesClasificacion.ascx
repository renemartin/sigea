<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosConstruccionesClasificacion.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosConstruccionesClasificacion" %>

<table id="tabla_construcciones" class="tablaCompactaExtendida">
    <tr class="filaHeader">
        <td>
            Tipo
        </td>
        <td>
            Descripción
        </td>
        <td>
            Clase
        </td>
        <td>
            Superficie (m²)
        </td>
        <td>
            Fuente
        </td>
        <td>
            # Niv. tipo
        </td>
        <td>
            # Niv. cuerpo
        </td>
        <td>
            Edad (años)
        </td>
        <td>
            Avance obra (%)
        </td>
        <td>
            Vida útil (años)
        </td>
        <td>
            Estado cons.
        </td>
        <td>
            <asp:ImageButton ID="agregarFila_ImBtn" runat="server" SkinID="AddSmall" />
            <asp:ImageButton ID="removerFila_ImBtn" runat="server" SkinID="RemoveSmall" />
        </td>
    </tr>
    <tr style="display:none;">
        <td class="celdaValor">
            <asp:CheckBox ID="tipo_CBox" Text="Const." runat="server" />
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="descripcion_TBox" runat="server" SkinID="Compacto" MaxLength="50"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="clase_DDList" runat="server" SkinID="Compacto">
            </asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="superficie_TBox" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="fuente_DDList" runat="server" SkinID="Compacto">
            </asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="nivelesTipo_TBox" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="nivelesCuerpo_TBox" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="edad_TBox" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="avance_TBox" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="vidaUtil_TBox" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="estadoCons_DDList" runat="server" SkinID="Compacto">
            </asp:DropDownList>
        </td>
        <td>
        </td>
    </tr>
</table>

<script type="text/javascript">
    function ClasificacionConstrucciones() {
        
        // Inicialización
        ClasificacionConstrucciones_Init = true;
        ClasificacionConstrucciones.prototype.addConstruccionRow = addConstruccionRow;
        ClasificacionConstrucciones.prototype.removeConstruccionRow = removeConstruccionRow;
        ClasificacionConstrucciones.prototype.getData = getData;
        ClasificacionConstrucciones.prototype.setData = setData;
        ClasificacionConstrucciones.prototype.validate = validate;
        ClasificacionConstrucciones.prototype.fillRowData = fillRowData;
        ClasificacionConstrucciones.prototype.addRowValidator = addRowValidator;

        this.parent_id = "<%= ClientID %>";
        this.validators = new Array();
        this.addRowValidator(1);
        addCloningTable($get("tabla_construcciones"), 1, 1, 5);

        // Control de filas
        function addConstruccionRow(fill) {
            var row_num = getCloningTableCount('tabla_construcciones');
            if (addClonedRow("tabla_construcciones")) {
                if (fill == null || fill == true) {
                    this.fillRowData(row_num + 1);
                }
                this.addRowValidator(row_num + 1);                              
            }
        }

        function removeConstruccionRow(data) {
            var row_num = getCloningTableCount('tabla_construcciones');
            removeClonedRow("tabla_construcciones");
            this.validators[row_num - 1] = null;
        }

        // Databindings
        function getData() {
            var data_set = new Array();
            var data = null;
            var i = null;
            var row_num = getCloningTableCount('tabla_construcciones');           

            for (i = 1; i <= row_num; i++) {
                data = new Object();
                data.numeroTipo = i;
                data.accesorio = $get(this.parent_id + "_tipo_CBox_" + i).checked;
                data.descripcion = $get(this.parent_id + "_descripcion_TBox_" + i).value;
                data.idClase = $get(this.parent_id + "_clase_DDList_" + i).value;
                data.superficie = $get(this.parent_id + "_superficie_TBox_" + i).value;
                data.idFuente = $get(this.parent_id + "_fuente_DDList_" + i).value;
                data.otraFuente = "";
                data.niveles = $get(this.parent_id + "_nivelesTipo_TBox_" + i).value;
                data.nivelesCuerpo = $get(this.parent_id + "_nivelesCuerpo_TBox_" + i).value;
                data.edad = $get(this.parent_id + "_edad_TBox_" + i).value;
                data.avanceObra = $get(this.parent_id + "_avance_TBox_" + i).value;
                data.vidaUtil = $get(this.parent_id + "_vidaUtil_TBox_" + i).value;
                data.idConservacion = $get(this.parent_id + "_estadoCons_DDList_" + i).value;

                data_set[i - 1] = data;
            }

            return data_set;
        }

        function setData(data) {           
            if (data != null) {
                var i = null;
                for (i = 1; i <= data.length; i++) {
                    this.addConstruccionRow(false);                                     
                    
                    $get(this.parent_id + "_tipo_CBox_" + i).checked = data[i - 1].accesorio;
                    $get(this.parent_id + "_descripcion_TBox_" + i).value = data[i - 1].descripcion;
                    $get(this.parent_id + "_clase_DDList_" + i).selectedValue = data[i - 1].idClase;
                    $get(this.parent_id + "_superficie_TBox_" + i).value = data[i - 1].superficie;
                    $get(this.parent_id + "_fuente_DDList_" + i).selectedValue = data[i - 1].idFuente;
                    $get(this.parent_id + "_nivelesTipo_TBox_" + i).value = data[i - 1].niveles;
                    $get(this.parent_id + "_nivelesCuerpo_TBox_" + i).value = data[i - 1].nivelesCuerpo;
                    $get(this.parent_id + "_edad_TBox_" + i).value = data[i - 1].edad;
                    $get(this.parent_id + "_avance_TBox_" + i).value = data[i - 1].avanceObra;
                    $get(this.parent_id + "_vidaUtil_TBox_" + i).value = data[i - 1].vidaUtil;
                    $get(this.parent_id + "_estadoCons_DDList_" + i).selectedValue = data[i - 1].idConservacion;

                    this.fillRowData(i);
                }
            }
            else {
                this.addConstruccionRow();
            }
        }

        // Llenado de datos
        function fillRowData(row_num) {
            fillClaseInmueble(this.parent_id + "_clase_DDList_" + row_num);
            fillFuente(this.parent_id + "_fuente_DDList_" + row_num);
            fillEstadoConservacion(this.parent_id + "_estadoCons_DDList_" + row_num);
        }

        // Validación
        function validate() {
            var validated = true;
            var row_num = getCloningTableCount('tabla_construcciones');
            var i = null;

            for (i = 0; i < row_num; i++) {
                if (this.validators[i] != null) {
                    if (!this.validators[i].validate())
                        validated = false;
                }
                else {
                    validated = false;
                }
            }

            return validated;
        }

        function addRowValidator(row_num) {
            var controls = new Array(
                $get(this.parent_id + "_tipo_CBox_" + row_num),            // 0
                $get(this.parent_id + "_descripcion_TBox_" + row_num),     // 1
                $get(this.parent_id + "_clase_DDList_" + row_num),         // 2
                $get(this.parent_id + "_superficie_TBox_" + row_num),      // 3
                $get(this.parent_id + "_fuente_DDList_" + row_num),        // 4                
                $get(this.parent_id + "_nivelesTipo_TBox_" + row_num),     // 5
                $get(this.parent_id + "_nivelesCuerpo_TBox_" + row_num),  // 6
                $get(this.parent_id + "_edad_TBox_" + row_num),            // 7
                $get(this.parent_id + "_avance_TBox_" + row_num),          // 8
                $get(this.parent_id + "_vidaUtil_TBox_" + row_num),        // 9
                $get(this.parent_id + "_estadoCons_DDList_" + row_num)     // 10
            );

            var validator = new ControlValidator(controls);
            validator.addNumericField(3, true);
            validator.addNumericField(5, false);
            validator.addNumericField(6, false);
            validator.addNumericField(7, true);
            validator.addNumericField(8, true);
            validator.addNumericField(9, true);

            this.validators[row_num - 1] = validator;
        }       
    }

    function calcularVidaUtil(sender) {
        var parent_id = "<%= ClientID %>";
        var num_fila = sender.parentElement.parentElement.getAttribute("indice");
        
        var clase = $get(parent_id + "_clase_DDList_" + num_fila);
        var edad = $get(parent_id + "_edad_TBox_" + num_fila);
        var vida_util = $get(parent_id + "_vidaUtil_TBox_" + num_fila);
        
        if (clase.value != "0") {
            calculaVidaUtil(clase.value, edad.value, vida_util);
        }
    }

    this["<%= ID %>"] = new ClasificacionConstrucciones();
</script>