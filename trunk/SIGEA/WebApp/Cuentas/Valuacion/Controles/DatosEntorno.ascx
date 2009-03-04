<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEntorno.ascx.cs"
    Inherits="Cuentas_Administracion_DatosEntorno" %>

<table>
    <tr>
        <td class="celdaTitulo">
            Clasificación de zona:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="clasificacionZona_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Referencia de proximidad urbana SHF:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="proximidadUrbana_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Nivel socioeconómico:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="nivelSocioeconomico_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Tipo de construcción predominante en calles circundantes:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="construccionPredominante_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Indice de saturación de la zona:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="indiceSaturacion_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">%</span>
        </td>
        <td class="celdaTituloSec">
            Densidad de población:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="densidadPoblacion_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo" valign="top">
            Vías de acceso e importancia de las mismas:
        </td>
        <td class="celdaValor" colspan="3">
            <table id="tabla_vias">
                <tr>
                    <td class="celdaHeader" style="width: 180px">
                        Nombre de vía
                    </td>
                    <td class="celdaHeader" style="width: 150px">
                        Importancia
                    </td>
                    <td>
                        <asp:ImageButton ID="agregarFila_ImBtn" runat="server" SkinID="AddSmall" />
                        <asp:ImageButton ID="removerFila_ImBtn" runat="server" SkinID="RemoveSmall" />
                    </td>
                </tr>
                <tr style="display: none;">
                    <td class="celdaValor">
                        <asp:TextBox ID="via_TBox" runat="server"></asp:TextBox>
                    </td>
                    <td class="celdaValor">
                        <asp:DropDownList ID="importanciaVia_DDList" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<script type="text/javascript">
    function Entorno() {

        // Inicialización
        if (typeof (Entorno_Init) == "undefined") {
            Entorno_Init = true;
            Entorno.prototype.fillData = fillData;
            Entorno.prototype.fillViasRowData = fillViasRowData;
            Entorno.prototype.addViasRow = addViasRow;
            Entorno.prototype.removeViasRow = removeViasRow;
            Entorno.prototype.setData = setData;
            Entorno.prototype.setDataVias = setDataVias;
            Entorno.prototype.getData = getData;
            Entorno.prototype.getDataVias = getDataVias;
            Entorno.prototype.validate = validate;
            Entorno.prototype.addViasRowValidator = addViasRowValidator;
        }
        this.parent_id = "<%= ClientID %>";
        addCloningTable($get("tabla_vias"), 1, 0, 3);

        // Inicialización de validadores
        this.controls = new Array(
            $get("<%= clasificacionZona_DDList.ClientID %>"),           // 0
            $get("<%= proximidadUrbana_DDList.ClientID %>"),            // 1
            $get("<%= nivelSocioeconomico_DDList.ClientID %>"),         // 2
            $get("<%= construccionPredominante_DDList.ClientID %>"),    // 3
            $get("<%= densidadPoblacion_DDList.ClientID %>"),           // 4
            $get("<%= indiceSaturacion_TBox.ClientID %>")               // 5
        );
        this.entorno_validator = new ControlValidator(this.controls);
        this.entorno_validator.addNumericField(5, true);
        this.vias_validators = new Array();

        // Llenado de datos
        function fillData() {
            fillClasificacionZona("<%= clasificacionZona_DDList.ClientID %>");
            fillProximidadUrbana("<%= proximidadUrbana_DDList.ClientID %>");
            fillNivelSocioeconomico("<%= nivelSocioeconomico_DDList.ClientID %>");
            fillConstruccionPredominante("<%= construccionPredominante_DDList.ClientID %>");
            fillDensidad("<%= densidadPoblacion_DDList.ClientID %>");
        }

        function fillViasRowData(row_num) {
            fillImportanciaVialidad(this.parent_id + "_importanciaVia_DDList_" + row_num);
        }

        // Control de filas
        function addViasRow(fill) {
            var row_num = getCloningTableCount('tabla_vias');
            if (addClonedRow("tabla_vias")) {
                if (fill == null || fill == true) {
                    this.fillViasRowData(row_num + 1);
                }
                this.addViasRowValidator(row_num + 1);
            }
        }

        function removeViasRow(data) {
            var row_num = getCloningTableCount('tabla_vias');
            removeClonedRow("tabla_vias");
            this.vias_validators[row_num - 1] = null;
        }

        // Databindngs
        function setData(data_set) {
            if (data_set != null) {
                if (data_set[0] != null) {
                    $get("<%= clasificacionZona_DDList.ClientID %>").selectedValue = data_set[0].idTipoClasificacionZona;
                    $get("<%= proximidadUrbana_DDList.ClientID %>").selectedValue = data_set[0].idTipoProximidadUrbana;
                    $get("<%= nivelSocioeconomico_DDList.ClientID %>").selectedValue = data_set[0].idTipoNivelSocioEconomico;
                    $get("<%= construccionPredominante_DDList.ClientID %>").selectedValue = data_set[0].idTipoConstrucciones;
                    $get("<%= densidadPoblacion_DDList.ClientID %>").selectedValue = data_set[0].idTipoDensidadPoblacion;
                    $get("<%= indiceSaturacion_TBox.ClientID %>").value = data_set[0].indiceSaturacion;
                }
                this.setDataVias(data_set[1]);
            }

            this.fillData();
        }
        function setDataVias(data) {
            if (data == null)
                return;

            var i = null;
            for (i = 1; i <= data.length; i++) {
                this.addViasRow(false);

                $get(this.parent_id + "_via_TBox_" + i).value = data[i - 1].nombreVia;
                $get(this.parent_id + "_importanciaVia_DDList_" + i).selectedValue = data[i - 1].idImportanciaVia;

                this.fillViasRowData(i);
            }
        }

        function getData() {
            var data_set = Array();

            data_set[0] = new Object();
            data_set[0].idTipoClasificacionZona = $get("<%= clasificacionZona_DDList.ClientID %>").value;
            data_set[0].idTipoProximidadUrbana = $get("<%= proximidadUrbana_DDList.ClientID %>").value;
            data_set[0].idTipoNivelSocioEconomico = $get("<%= nivelSocioeconomico_DDList.ClientID %>").value;
            data_set[0].idTipoConstrucciones = $get("<%= construccionPredominante_DDList.ClientID %>").value;
            data_set[0].idTipoDensidadPoblacion = $get("<%= densidadPoblacion_DDList.ClientID %>").value;
            data_set[0].indiceSaturacion = $get("<%= indiceSaturacion_TBox.ClientID %>").value;

            data_set[1] = this.getDataVias();

            return data_set;
        }
        function getDataVias() {
            var data_set = new Array();
            var row_num = getCloningTableCount('tabla_vias');
            var data = null;
            var i = null;

            for (i = 1; i <= row_num; i++) {
                data = new Object();
                data.idViaAcceso = i;
                data.nombreVia = $get(this.parent_id + "_via_TBox_" + i).value;
                data.idImportanciaVia = $get(this.parent_id + "_importanciaVia_DDList_" + i).value;
                data_set[i - 1] = data;
            }

            return data_set;
        }

        // Validación
        function validate() {
            var validated = true;
            var row_num = getCloningTableCount('tabla_vias');
            var i = null;

            validated = this.entorno_validator.validate();

            for (i = 0; i < row_num; i++) {
                if (this.vias_validators[i] != null) {
                    if (!this.vias_validators[i].validate())
                        validated = false;
                }
                else {
                    validated = false;
                }
            }

            return validated;
        }

        function addViasRowValidator(row_num) {
            var controls = new Array(
                $get(this.parent_id + "_via_TBox_" + row_num),                // 0
                $get(this.parent_id + "_importanciaVia_DDList_" + row_num)    // 1
            );
            var validator = new ControlValidator(controls);

            this.vias_validators[row_num - 1] = validator;
        }
    }

    this["<%= ID %>"] = new Entorno();
    
</script>

