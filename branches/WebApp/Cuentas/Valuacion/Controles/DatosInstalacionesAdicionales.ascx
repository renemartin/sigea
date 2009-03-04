<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosInstalacionesAdicionales.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_InstalacionesAdicionales" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<table id="<%= ClientID %>_tabla_instalaciones">
    <tr class="filaHeader">
        <td style="width:150px;">
            Descripción
        </td>
        <td style="width:80px;">
            Cantidad
        </td>
        <td style="width:100px;">
            Unidad
        </td>
        <td style="width:80px;">
            Edad <span class="textoChico">(años)</span>
        </td>
        <td style="width:150px;">
            Estado de conservación
        </td>
        <td>
            <asp:ImageButton ID="agregarFila_ImBtn" runat="server" SkinID="AddSmall" />
            <asp:ImageButton ID="removerFila_ImBtn" runat="server" SkinID="RemoveSmall" />
        </td>
    </tr>
    <tr style="display: none;">
        <td class="celdaValor">
            <asp:TextBox ID="descripcion_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cantidad_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="unidad_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="edad_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="conservacion_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td>
        </td>
    </tr>
</table>

<script type="text/javascript">

    function InstalacionesAdicionales() {

        // Inicialización
        InstalacionesAdicionales.prototype.addInstalacionesRow = addInstalacionesRow;
        InstalacionesAdicionales.prototype.removeInstalacionesRow = removeInstalacionesRow;
        InstalacionesAdicionales.prototype.fillRowData = fillRowData;
        InstalacionesAdicionales.prototype.setData = setData;
        InstalacionesAdicionales.prototype.getData = getData;
        InstalacionesAdicionales.prototype.addRowValidator = addRowValidator;
        InstalacionesAdicionales.prototype.validate = validate;

        this.parent_id = "<%= ClientID %>";
        this.validators = new Array();
        addCloningTable($get(this.parent_id + "_tabla_instalaciones"), 1, 0, 5);        

        // Control de filas
        function addInstalacionesRow(fill) {
            var row_num = getCloningTableCount(this.parent_id + "_tabla_instalaciones");
            if (addClonedRow(this.parent_id + "_tabla_instalaciones")) {
                if (fill == null || fill == true) {
                    this.fillRowData(row_num + 1);
                }
                this.addRowValidator(row_num + 1);
            }
        }

        function removeInstalacionesRow(data) {
            var row_num = getCloningTableCount(this.parent_id + "_tabla_instalaciones");
            removeClonedRow(this.parent_id + "_tabla_instalaciones");
            this.validators[row_num - 1] = null;
        }

        // Llenado de datos
        function fillRowData(row_num) {
            fillUnidad(this.parent_id + "_unidad_DDList_" + row_num);
            fillEstadoConservacion(this.parent_id + "_conservacion_DDList_" + row_num);
        }

        // DataBindings
        function setData(data) {
            if (data != null) {
                var i = null;
                for (i = 1; i <= data.length; i++) {
                    this.addInstalacionesRow(false);

                    $get(this.parent_id + "_descripcion_TBox_" + i).value = data[i - 1].descripcion;
                    $get(this.parent_id + "_cantidad_TBox_" + i).value = data[i - 1].cantidad;
                    $get(this.parent_id + "_unidad_DDList_" + i).selectedValue = data[i - 1].idTipoUnidad;
                    $get(this.parent_id + "_edad_TBox_" + i).value = data[i - 1].edad;
                    $get(this.parent_id + "_conservacion_DDList_" + i).selectedValue = data[i - 1].idTipoConservacion;

                    this.fillRowData(i);
                }
            }
        }

        function getData() {
            var data_set = new Array();
            var data = null;
            var row_num = getCloningTableCount(this.parent_id + '_tabla_instalaciones');

            var i = null;
            for (i = 1; i <= row_num; i++) {

                data = new Object();
                data.idInstalacion = i;
                data.descripcion = $get(this.parent_id + "_descripcion_TBox_" + i).value;
                data.cantidad = $get(this.parent_id + "_cantidad_TBox_" + i).value;
                data.idTipoUnidad = $get(this.parent_id + "_unidad_DDList_" + i).value;
                data.edad = $get(this.parent_id + "_edad_TBox_" + i).value;
                data.idTipoConservacion = $get(this.parent_id + "_conservacion_DDList_" + i).value;

                data_set[i - 1] = data;
            }
            return data_set;
        }

        // Validación
        function validate() {
            var validated = true;
            var row_num = getCloningTableCount(this.parent_id + "_tabla_instalaciones");
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
                $get(this.parent_id + "_descripcion_TBox_" + row_num),        // 0
                $get(this.parent_id + "_cantidad_TBox_" + row_num),           // 1
                $get(this.parent_id + "_unidad_DDList_" + row_num),           // 2
                $get(this.parent_id + "_edad_TBox_" + row_num),               // 3
                $get(this.parent_id + "_conservacion_DDList_" + row_num)      // 4
            );

            var validator = new ControlValidator(controls);
            validator.addNumericField(1, false);
            validator.addNumericField(3, true);

            this.validators[row_num - 1] = validator;
        }
    }

    this["<%= ID %>"] = new InstalacionesAdicionales();
    
</script>

