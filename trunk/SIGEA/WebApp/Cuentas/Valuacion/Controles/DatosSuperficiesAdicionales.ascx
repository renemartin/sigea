<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosSuperficiesAdicionales.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosSuperficiesAdicionales" %>

<table id="<%= ClientID %>_tabla_adicionales">
    <tr class="filaHeader">
        <td style="width:180px">
            Concepto
        </td>
        <td style="width:180px">
            Superficie
        </td>
        <td>
            <asp:ImageButton ID="agregarFila_ImBtn" runat="server" SkinID="AddSmall" />
            <asp:ImageButton ID="removerFila_ImBtn" runat="server" SkinID="RemoveSmall" />
        </td>
    </tr>
    <tr style="display:none;">
        <td class="celdaValor">
            <asp:TextBox ID="Concepto_TBox" runat="server" MaxLength="40"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="Superficie_TBox" runat="server"></asp:TextBox>
            <span class="textoChico">m²</span>
        </td>
        <td>
        </td>
    </tr>
</table>

<script type="text/javascript">
    function SuperficiesAdicionales() {

        // Inicialización
        SuperficiesAdicionales.prototype.addSuperficieRow = addSuperficieRow;
        SuperficiesAdicionales.prototype.removeSuperficieRow = removeSuperficieRow;
        SuperficiesAdicionales.prototype.setData = setData;
        SuperficiesAdicionales.prototype.getData = getData;
        SuperficiesAdicionales.prototype.validate = validate;
        SuperficiesAdicionales.prototype.addRowValidator = addRowValidator;

        this.parent_id = "<%= ClientID %>";
        this.validators = new Array();
        addCloningTable($get(this.parent_id + "_tabla_adicionales"), 1, 0, 5);

        // Control de filas
        function addSuperficieRow() {
            var row_num = getCloningTableCount(this.parent_id + "_tabla_adicionales");
            if (addClonedRow(this.parent_id + "_tabla_adicionales")) {
                this.addRowValidator(row_num + 1);
            }
        }

        function removeSuperficieRow(data) {
            var row_num = getCloningTableCount(this.parent_id + "_tabla_adicionales");
            removeClonedRow(this.parent_id + "_tabla_adicionales");
            this.validators[row_num - 1] = null;
        }

        // Databindings
        function setData(data) {
            if (data == null)
                return;

            var i = null;
            for (i = 1; i <= data.length; i++) {
                this.addSuperficieRow();
                
                $get(this.parent_id + "_Concepto_TBox_" + i).value = data[i - 1].concepto;
                $get(this.parent_id + "_Superficie_TBox_" + i).value = data[i - 1].superficie;
            }
        }

        function getData() {
            var data_set = new Array();
            var i = null;
            var row_num = getCloningTableCount(this.parent_id + '_tabla_adicionales');

            for (i = 1; i <= row_num; i++) {
                data = new Object();
                data.idArea = i;
                data.concepto = $get(this.parent_id + "_Concepto_TBox_" + i).value;
                data.superficie = $get(this.parent_id + "_Superficie_TBox_" + i).value;

                data_set[i - 1] = data;
            }

            return data_set;
        }

        // Validación
        function validate() {
            var validated = true;
            var row_num = getCloningTableCount(this.parent_id + "_tabla_adicionales");
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
                $get(this.parent_id + "_Concepto_TBox_" + row_num),    // 0
                $get(this.parent_id + "_Superficie_TBox_" + row_num)   // 1
            );

            var validator = new ControlValidator(controls);
            validator.addNumericField(1, true);

            this.validators[row_num - 1] = validator;
        }
    }

    this["<%= ID %>"] = new SuperficiesAdicionales();
    
</script>

