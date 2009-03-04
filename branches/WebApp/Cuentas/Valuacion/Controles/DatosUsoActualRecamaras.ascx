<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosUsoActualRecamaras.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosRecamara" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<table id="tabla_recamaras">
    <tr>
        <td align="right" style="width: 500px;">
            <asp:ImageButton ID="agregarFila_ImBtn" runat="server" SkinID="AddSmall" />
            <asp:ImageButton ID="removerFila_ImBtn" runat="server" SkinID="RemoveSmall" />
        </td>
    </tr>
    <tr style="display: none;">
        <td>
            <table>
                <tr>
                    <td class="celdaTituloSec">
                        Cantidad:
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="cantidad_TBox" runat="server" SkinID="Numero"></asp:TextBox>
                    </td>
                    <td class="celdaTituloSec">
                        Planta:
                    </td>
                    <td class="celdaValor">
                        <asp:DropDownList ID="tipoPlanta_DDList" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="celdaValor" colspan="4">
                        <asp:RadioButton ID="sinCloset_RBtn" Text="Sin closet" GroupName="Closet" runat="server" />
                        <asp:RadioButton ID="espacioCloset_RBtn" Text="Espacio closet" GroupName="Closet"
                            runat="server" />
                        <asp:RadioButton ID="closetEquipado_RBtn" Text="Closet Equipado" GroupName="Closet"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="celdaValor" colspan="4">
                        <asp:CheckBox ID="terraza_CBox" Text="Terraza" runat="server" />
                        <asp:CheckBox ID="balcon_CBox" Text="Balcón" runat="server" />
                        <asp:CheckBox ID="vestidor_CBox" Text="Vestidor" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<script type="text/javascript">

    function UsoActualRecamaras() {

        // Inicialización
        if (typeof (UsoActualRecamaras_Init) == "undefined") {
            UsoActualRecamaras_Init = true;
            UsoActualRecamaras.prototype.addRecamaraRow = addRecamaraRow;
            UsoActualRecamaras.prototype.removeRecamaraRow = removeRecamaraRow;
            UsoActualRecamaras.prototype.setData = setData;
            UsoActualRecamaras.prototype.getData = getData;
            UsoActualRecamaras.prototype.fillRowData = fillRowData;
            UsoActualRecamaras.prototype.addRowValidator = addRowValidator;
            UsoActualRecamaras.prototype.validate = validate;
        }

        addCloningTable($get("tabla_recamaras"), 1, 1, 5);
        this.parent_id = "<%= ClientID %>";
        this.validators = new Array();
        this.addRowValidator(1);

        // Control de filas
        function addRecamaraRow(fill) {
            var row_num = getCloningTableCount('tabla_recamaras');
            if (addClonedRow("tabla_recamaras")) {
                if (fill == null || fill == true) {
                    this.fillRowData(row_num + 1);
                }
                this.addRowValidator(row_num + 1);
            }
        }

        function removeRecamaraRow(data) {
            var row_num = getCloningTableCount('tabla_recamaras');
            removeClonedRow("tabla_recamaras");
            this.validators[row_num - 1] = null;
        }

        // DataBindings
        function setData(data) {
            if (data != null) {

                var i = null;
                for (i = 1; i <= data.length; i++) {
                    this.addRecamaraRow(false);

                    $get(this.parent_id + "_cantidad_TBox_" + i).value = data[i - 1].cantidad;
                    $get(this.parent_id + "_tipoPlanta_DDList_" + i).selectedValue = data[i - 1].planta;
                    $get(this.parent_id + "_espacioCloset_RBtn_" + i).checked = data[i - 1].espacioCloset;
                    $get(this.parent_id + "_closetEquipado_RBtn_" + i).checked = data[i - 1].closetEquipado;
                    $get(this.parent_id + "_terraza_CBox_" + i).checked = data[i - 1].terraza;
                    $get(this.parent_id + "_balcon_CBox_" + i).checked = data[i - 1].balcon;
                    $get(this.parent_id + "_vestidor_CBox_" + i).checked = data[i - 1].vestidor;

                    this.fillRowData(i);
                }
            }
            else {
                this.addRecamaraRow();
            }
        }

        function getData() {
            var data_set = new Array();
            var data = null;
            var i = null;
            var row_num = getCloningTableCount('tabla_recamaras');

            for (i = 1; i <= row_num; i++) {
                data = new Object();
                data.idUsoRecamara = i;
                data.cantidad = $get(this.parent_id + "_cantidad_TBox_" + i).value;
                data.planta = $get(this.parent_id + "_tipoPlanta_DDList_" + i).value;
                data.espacioCloset = $get(this.parent_id + "_espacioCloset_RBtn_" + i).checked;
                data.closetEquipado = $get(this.parent_id + "_closetEquipado_RBtn_" + i).checked;
                data.terraza = $get(this.parent_id + "_terraza_CBox_" + i).checked;
                data.balcon = $get(this.parent_id + "_balcon_CBox_" + i).checked;
                data.vestidor = $get(this.parent_id + "_vestidor_CBox_" + i).checked;

                data_set[i - 1] = data;
            }

            return data_set;
        }

        // Llenado de datos
        function fillRowData(row_num) {
            fillPlanta(this.parent_id + "_tipoPlanta_DDList_" + row_num);
        }

        // Validación
        function validate() {
            var validated = true;
            var row_num = getCloningTableCount('tabla_recamaras');
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
                $get(this.parent_id + "_cantidad_TBox_" + row_num),           // 0
                $get(this.parent_id + "_tipoPlanta_DDList_" + row_num),       // 1
                $get(this.parent_id + "_espacioCloset_RBtn_" + row_num),      // 2
                $get(this.parent_id + "_closetEquipado_RBtn_" + row_num),     // 3 
                $get(this.parent_id + "_terraza_CBox_" + row_num),            // 4 
                $get(this.parent_id + "_balcon_CBox_" + row_num),             // 5
                $get(this.parent_id + "_vestidor_CBox_" + row_num)            // 6
            );

            var validator = new ControlValidator(controls);
            validator.addNumericField(1, false);

            this.validators[row_num - 1] = validator;
        }
    }

    this["<%= ID %>"] = new UsoActualRecamaras();
    
</script>

