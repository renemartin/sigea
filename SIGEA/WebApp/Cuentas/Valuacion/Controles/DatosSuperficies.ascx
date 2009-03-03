<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosSuperficies.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosSuperficies" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<table>
    <tr>
        <td class="celdaTitulo">
            Superficie del terreno:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="superficieTerreno_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m²</span>
        </td>
        <td class="celdaTituloSec">
            Fuente:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="fuenteTerreno_DDList" runat="server">
            </asp:DropDownList>
            <div id="seccion_fuente_terreno" style="display: none;">
                <span class="subCampo">Especifique:</span>
                <asp:TextBox ID="especFuenteTerreno_TBox" runat="server"></asp:TextBox></div>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Frente del lote:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="superficieFrente_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m.</span>
        </td>
    </tr>
</table>

<script type="text/javascript">

    function Superficies() {
        // Inicialización
        if (typeof (Superficies_Init) == "undefined") {
            Superficies_Init = true;
            Superficies.prototype.fillData = fillData;
            Superficies.prototype.setData = setData;
            Superficies.prototype.getData = getData;
            Superficies.prototype.validate = validate;
        }

        // Inicialización de validador
        this.controls = new Array(
            $get("<%= superficieTerreno_TBox.ClientID %>"),   // 0
            $get("<%= fuenteTerreno_DDList.ClientID %>"),     // 1
            $get("<%= especFuenteTerreno_TBox.ClientID %>"),  // 2
            $get("<%= superficieFrente_TBox.ClientID %>")     // 3
        );
        this.validator = new ControlValidator(this.controls);
        this.validator.addOptionalField(2);
        this.validator.addNumericField(0, true);
        this.validator.addNumericField(3, true);
    
        // Llenado de datos
        function fillData() {
            fillFuente("<%= fuenteTerreno_DDList.ClientID %>");
        }

        // DataBindings
        function setData(data) {
            if (data != null) {
                $get("<%= superficieTerreno_TBox.ClientID %>").value = data.totalTerreno;
                $get("<%= fuenteTerreno_DDList.ClientID %>").selectedValue = data.fuenteTerreno;
                $get("<%= especFuenteTerreno_TBox.ClientID %>").value = data.otraFuenteTerreno;
                $get("<%= superficieFrente_TBox.ClientID %>").value = data.frenteLote;

                var otraFuente = data.otraFuenteTerreno != "";
                if (otraFuente) {
                    setVisibility($get("seccion_fuente_terreno"), otraFuente);
                    this.validator.removeOptionalField(2);
                }
            }

            this.fillData();
        }
        function getData() {
            var data = new Object();

            data.totalTerreno = $get("<%= superficieTerreno_TBox.ClientID %>").value;
            data.fuenteTerreno = $get("<%= fuenteTerreno_DDList.ClientID %>").value;
            data.otraFuenteTerreno = getVisibility($get("seccion_fuente_terreno"))
                                ? $get("<%= especFuenteTerreno_TBox.ClientID %>").value : "";
            data.frenteLote = $get("<%= superficieFrente_TBox.ClientID %>").value;
            return data;
        }

        // Validacion
        function validate() {
            return this.validator.validate();
        }
    }

    this["<%= ID %>"] = new Superficies();
    
    // Validacion de selecciones
    function setFuenteTerrenoSelection() {
        var fuente_terreno = $get("<%= fuenteTerreno_DDList.ClientID %>");
        var otra = fuente_terreno.options[fuente_terreno.selectedIndex].text.toLowerCase() == "otra";

        setVisibility($get("seccion_fuente_terreno"), otra);
        if (otra) {
            eval("<%= ID %>").validator.removeOptionalField(2);
        }
        else {
            eval("<%= ID %>").validator.addOptionalField(2)
        }
    }

</script>
