<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosTerreno.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosTerreno" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<table>
    <tr>
        <td class="celdaTitulo">
            Frentes:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="frentes_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Configuración:
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="configuracionRegular_CBox" runat="server" Text="Regular" />
        </td>
        <td class="celdaTituloSec">
            Lados:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="lados_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Ubicación:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="ubicacion_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Topografía:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="topografia_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Caracteristicas panoramicas:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="caracPanoramicas_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Uso de suelo:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="usoSuelo_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Habitantes por hectárea:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="habHectarea_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Viviendas por hectárea:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="vivHectarea_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Servidumbre y/o restricciones:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="servidumbre_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
</table>
<table>
    <tr>
    <td colspan="2" class="celdaHeader">
    Descripción de colindancias
    </td>
    </tr>
    <tr>
        <td class="celdaTitulo" valign="top">
            Fuente de medidas y colindancias:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="fuenteMedidas_DDList" runat="server">
            </asp:DropDownList>
            <div id="seccion_fuente_medidas" style="display: none;">
                <span class="subCampo">Especifique:</span>
                <asp:TextBox ID="otraFuente_TBox" runat="server"></asp:TextBox></div>
        </td>
    </tr>
    <tr>
        <td class="celdaHeader" colspan="2">
            Colindancias
        </td>
    </tr>
    <tr>
        <td class="celdaValor" colspan="2">
            <asp:TextBox ID="colindancias_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine" Height="100px" Width="550px"></asp:TextBox>
        </td>
    </tr>
</table>

<script type="text/javascript">

    function DatosTerreno() {

        // Inicialización
        if (typeof (DatosTerreno_Init) == "undefined") {
            DatosTerreno_Init = true;
            DatosTerreno.prototype.fillData = fillData;
            DatosTerreno.prototype.setData = setData;
            DatosTerreno.prototype.getData = getData;
            DatosTerreno.prototype.validate = validate;
        }

        // Inicialización de validador
        this.controls = new Array(
            $get("<%= frentes_TBox.ClientID %>"),               // 0
            $get("<%= configuracionRegular_CBox.ClientID %>"),  // 1
            $get("<%= lados_TBox.ClientID %>"),                 // 2
            $get("<%= ubicacion_DDList.ClientID %>"),           // 3
            $get("<%= topografia_DDList.ClientID %>"),          // 4
            $get("<%= caracPanoramicas_DDList.ClientID %>"),    // 5
            $get("<%= usoSuelo_DDList.ClientID %>"),            // 6
            $get("<%= habHectarea_TBox.ClientID %>"),           // 7
            $get("<%= vivHectarea_TBox.ClientID %>"),           // 8
            $get("<%= servidumbre_DDList.ClientID %>"),         // 9
            $get("<%= fuenteMedidas_DDList.ClientID %>"),       // 10
            $get("<%= otraFuente_TBox.ClientID %>"),            // 11
            $get("<%= colindancias_TBox.ClientID %>")           // 12
        );
        this.validator = new ControlValidator(this.controls);
        this.validator.addOptionalField(11);
        this.validator.addNumericField(0, false);
        this.validator.addNumericField(2, false);
        this.validator.addNumericField(7, true);
        this.validator.addNumericField(8, true);

        // Llenado de datos
        function fillData() {
            fillUbicacion("<%= ubicacion_DDList.ClientID %>");
            fillTopografia("<%= topografia_DDList.ClientID %>");
            fillCaracPanoramicas("<%= caracPanoramicas_DDList.ClientID %>");
            fillUsoSuelo("<%= usoSuelo_DDList.ClientID %>");
            fillServidumbre("<%= servidumbre_DDList.ClientID %>");
            fillFuente("<%= fuenteMedidas_DDList.ClientID %>");
        }

        // Databindings
        function setData(data) {
            if (data != null) {
                $get("<%= frentes_TBox.ClientID %>").value = data.frentes;
                $get("<%= configuracionRegular_CBox.ClientID %>").checked = data.configuracionRegular;
                $get("<%= lados_TBox.ClientID %>").value = data.lados;
                $get("<%= ubicacion_DDList.ClientID %>").selectedValue = data.idTipoUbicacion;
                $get("<%= topografia_DDList.ClientID %>").selectedValue = data.idTipoTopografia;
                $get("<%= caracPanoramicas_DDList.ClientID %>").selectedValue = data.idTipoCaracteristicasPanoramicas;
                $get("<%= usoSuelo_DDList.ClientID %>").selectedValue = data.idTipoUsoSuelo;
                $get("<%= habHectarea_TBox.ClientID %>").value = data.densidadHabitantes;
                $get("<%= vivHectarea_TBox.ClientID %>").value = data.densidadViviendas;
                $get("<%= servidumbre_DDList.ClientID %>").selectedValue = data.idTipoServidumbre;
                $get("<%= fuenteMedidas_DDList.ClientID %>").selectedValue = data.idFuenteMedidas;
                $get("<%= otraFuente_TBox.ClientID %>").value = data.otraFuente;
                $get("<%= colindancias_TBox.ClientID %>").value = data.descripcionColindancias;

                setVisibility($get("seccion_fuente_medidas"), data.otraFuente != "");
            }

            this.fillData();
        }

        function getData() {
            var data = new Object();

            data.frentes = $get("<%= frentes_TBox.ClientID %>").value;
            data.configuracionRegular = $get("<%= configuracionRegular_CBox.ClientID %>").checked;
            data.lados = $get("<%= lados_TBox.ClientID %>").value;
            data.idTipoUbicacion = $get("<%= ubicacion_DDList.ClientID %>").value;
            data.idTipoTopografia = $get("<%= topografia_DDList.ClientID %>").value;
            data.idTipoCaracteristicasPanoramicas = $get("<%= caracPanoramicas_DDList.ClientID %>").value;
            data.idTipoUsoSuelo = $get("<%= usoSuelo_DDList.ClientID %>").value;
            data.densidadHabitantes = $get("<%= habHectarea_TBox.ClientID %>").value;
            data.densidadViviendas = $get("<%= vivHectarea_TBox.ClientID %>").value;
            data.idTipoServidumbre = $get("<%= servidumbre_DDList.ClientID %>").value;
            data.idFuenteMedidas = $get("<%= fuenteMedidas_DDList.ClientID %>").value;
            data.otraFuente = getVisibility($get("seccion_fuente_medidas"))
            ? $get("<%= otraFuente_TBox.ClientID %>").value : "";
            data.descripcionColindancias = $get("<%= colindancias_TBox.ClientID %>").value;

            return data;
        }

        // Validación
        function validate() {
            return this.validator.validate();
        }
        
    }

    // Validacion de selecciones
    function setFuenteMedidasSelection() {
        var fuente_medidas = $get("<%= fuenteMedidas_DDList.ClientID %>");

        setVisibility($get("seccion_fuente_medidas"),
            fuente_medidas.options[fuente_medidas.selectedIndex].text.toLowerCase() == "otra");
    }

    this["<%= ID %>"] = new DatosTerreno();
    
</script>