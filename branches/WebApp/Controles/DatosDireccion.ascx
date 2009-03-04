<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosDireccion.ascx.cs"
    Inherits="Controles_DatosDireccion" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<link href="../App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<table>
    <tr>
        <td class="celdaTitulo">
            Calle:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="calle_TBox" runat="server"></asp:TextBox>
            <span class="subCampo">#</span>
            <asp:TextBox ID="numExt_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="subCampo">Int.</span>
            <asp:TextBox ID="numInt_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Entre:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="entre1_TBox" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="entre2_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Estado:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="estado_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Municipio:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="municipio_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Asentamiento:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="asentamiento_TBox" runat="server"></asp:TextBox>
            <cc1:AutoCompleteExtender ID="asentamiento_TBox_AutoCompleteExtender" runat="server"
                TargetControlID="asentamiento_TBox" ServicePath="~/Services/MethodCallers.asmx"
                ServiceMethod="GetAsentamientos" CompletionInterval="500"
                FirstRowSelected="True" MinimumPrefixLength="0" UseContextKey="True" 
                ContextKey="">
            </cc1:AutoCompleteExtender>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            C.P:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cp_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>

<script type="text/javascript">

    function Direccion() {

        // Inicialización
        Direccion.prototype.getData = getData;
        Direccion.prototype.setData = setData;
        Direccion.prototype.fillData = fillData;
        Direccion.prototype.updateMunicipios = updateMunicipios;
        Direccion.prototype.validate = validate;
        Direccion.prototype.onMunicipioChanged = onMunicipioChanged;
        Direccion.prototype.onAsentamientoLostFocus = onAsentamientoLostFocus;
        Direccion.prototype.onCPLostFocus = onCPLostFocus;
        Direccion.prototype.setAsentamientoContextKey = setAsentamientoContextKey;
        this.parent_id = "<%= ClientID %>";

        // Inicialización de validador
        this.controls = new Array(
            $get(this.parent_id + "_calle_TBox"),           // 0
            $get(this.parent_id + "_entre1_TBox"),          // 1
            $get(this.parent_id + "_entre2_TBox"),          // 2
            $get(this.parent_id + "_numExt_TBox"),          // 3
            $get(this.parent_id + "_numInt_TBox"),          // 4
            $get(this.parent_id + "_estado_DDList"),        // 5
            $get(this.parent_id + "_municipio_DDList"),     // 6
            $get(this.parent_id + "_asentamiento_TBox"),    // 7
            $get(this.parent_id + "_cp_TBox")               // 8
        );
        this.validator = new ControlValidator(this.controls);
        this.validator.addOptionalField(1);
        this.validator.addOptionalField(2);
        this.validator.addOptionalField(4);
        this.validator.addNumericField(8, false);

        // DataBindings
        function getData() {
            var data = new Object();

            data.calle = $get(this.parent_id + "_calle_TBox").value;
            data.entre1 = $get(this.parent_id + "_entre1_TBox").value;
            data.entre2 = $get(this.parent_id + "_entre2_TBox").value;
            data.numeroExterior = $get(this.parent_id + "_numExt_TBox").value;
            data.numeroInterior = $get(this.parent_id + "_numInt_TBox").value;
            data.claveEstado = $get(this.parent_id + "_estado_DDList").value;
            data.idMunicipio = $get(this.parent_id + "_municipio_DDList").value;
            data.nombreAsentamiento = $get(this.parent_id + "_asentamiento_TBox").value;
            data.codigoPostal = $get(this.parent_id + "_cp_TBox").value;

            return data;
        }
        function setData(data) {
            if (data != null) {
                $get(this.parent_id + "_calle_TBox").value = data.calle;
                $get(this.parent_id + "_entre1_TBox").value = data.entre1;
                $get(this.parent_id + "_entre2_TBox").value = data.entre2
                $get(this.parent_id + "_numExt_TBox").value = data.numeroExterior;
                $get(this.parent_id + "_numInt_TBox").value = data.numeroInterior
                $get(this.parent_id + "_estado_DDList").selectedValue = data.claveEstado
                $get(this.parent_id + "_municipio_DDList").selectedValue = data.idMunicipio
                $get(this.parent_id + "_asentamiento_TBox").value = data.nombreAsentamiento;
                $get(this.parent_id + "_cp_TBox").value = data.codigoPostal;
            }

            this.fillData();
        }

        // Llenado de datos
        function fillData() {
            fillEstados(this.parent_id + "_estado_DDList");
            this.updateMunicipios();
        }
        function updateMunicipios() {
            fillMunicipios(this.parent_id + "_municipio_DDList", this.parent_id + "_estado_DDList");
        }

        // Validación
        function validate() {
            return this.validator.validate();
        }

        // Autocompletes

        function onMunicipioChanged() {
            this.setAsentamientoContextKey();
        }

        function onAsentamientoLostFocus() {
            var municipio = $get(this.parent_id + "_municipio_DDList");
            var asentamiento = $get(this.parent_id + "_asentamiento_TBox");
            var codigo_postal = $get(this.parent_id + "_cp_TBox");

            if (asentamiento.value != "" && codigo_postal.value == "") {
                getCodigoPostal(municipio.value, asentamiento.value, codigo_postal);
            }
        }

        function onCPLostFocus() {
            var codigo_postal = $get(this.parent_id + "_cp_TBox");
            this.setAsentamientoContextKey();
        }

        function setAsentamientoContextKey() {
            var context_key = "";
            var municipio = $get(this.parent_id + "_municipio_DDList");
            var codigo_postal = $get(this.parent_id + "_cp_TBox");
            var auto_complete = $get(this.parent_id + "_asentamiento_TBox").AutoCompleteBehavior;

            if (municipio != null && municipio.value != "0") {
                context_key = municipio.value;
                if (codigo_postal != null && codigo_postal.value != "") {
                    context_key += "," + codigo_postal.value;
                }
            }

            auto_complete.set_contextKey(context_key);
        }
    }

    this["<%= ID %>"] = new Direccion();
    
</script>

