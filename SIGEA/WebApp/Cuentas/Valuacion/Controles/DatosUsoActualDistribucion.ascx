<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosUsoActualDistribucion.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosDistribucion" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<table>
    <tr>
        <td class="celdaTitulo">
            Tipo estacionamiento:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="tipoEstacionamiento_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaValor" colspan="2">
            <div id="seccion_cupo_carros" class="hidden">
                <span class="subCampo">Cupo de carros:</span>
                <asp:TextBox ID="cupoCarros_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            </div>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo" valign="top">
            Jardines:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:CheckBox ID="jardin_CBox" Text="Tiene jardines" runat="server" />&nbsp;<asp:CheckBox
                ID="jardinFondo_CBox" Text="Tiene jardín al fondo" runat="server" />&nbsp;<asp:CheckBox
                    ID="jardinLateral_CBox" Text="Tiene jardín lateral" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaTituloSec">
            Elevador:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:CheckBox ID="elevador_CBox" Text="Tiene elevador" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaTituloSec">
            Baños completos:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosCompletos_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Baños medios:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosMedios_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="celdaTitulo" valign="top">
            Cocina:
        </td>
        <td class="celdaValor" valign="top">
            <asp:CheckBox ID="cocina_CBox" Text="Cuenta con cocina" runat="server" />
            <br />
            <asp:CheckBox ID="comedor_CBox" Text="Comedor" runat="server" />
            <br />
            <asp:CheckBox ID="despensa_CBox" Text="Despensa" runat="server" />
        </td>
        <td class="celdaValor" valign="top">
            <div id="seccion_muebles_cocina" style="display: none;">
                <asp:RadioButton ID="conTarja_RBtn" Text="Con tarja" runat="server" GroupName="mueblesCocina" />
                <br />
                <asp:RadioButton ID="mueblesCocina_RBtn" Text="Muebles de cocina" runat="server"
                    GroupName="mueblesCocina" />
            </div>
        </td>
        <td class="celdaValor" valign="top">
            <div id="seccion_tipo_cocina" style="display: none;">
                <asp:RadioButton ID="cocinaIntegral_RBtn" Text="Cocina integral" runat="server" GroupName="tipoCocina" />
                <br />
                <asp:RadioButton ID="forjadaSitio_RBtn" Text="Forjada en sitio" runat="server" GroupName="tipoCocina" />
            </div>
        </td>
    </tr>
</table>

<script type="text/javascript">
    // Variables
    var sin_estacionamiento = "4";

    function UsoActualDistribucion() {

        // Inicialización
        if (typeof (UsoActualDistribucion_Init) == "undefined") {
            UsoActualDistribucion_Init = true;
            UsoActualDistribucion.prototype.fillData = fillData;
            UsoActualDistribucion.prototype.setData = setData;
            UsoActualDistribucion.prototype.getData = getData;
            UsoActualDistribucion.prototype.validate = validate;
        }

        // Inicialización de validador
        this.controls = new Array(
            $get("<%= tipoEstacionamiento_DDList.ClientID %>"), // 0
            $get("<%= cupoCarros_TBox.ClientID %>"),            // 1
            $get("<%= banosCompletos_TBox.ClientID %>"),        // 2
            $get("<%= banosMedios_TBox.ClientID %>")            // 3
        );
        this.validator = new ControlValidator(this.controls);
        this.validator.addOptionalField(1);
        this.validator.addNumericField(1, false);
        this.validator.addNumericField(2, false);
        this.validator.addNumericField(3, false);

        // Llenado de datos
        function fillData() {
            fillEstacionamiento("<%= tipoEstacionamiento_DDList.ClientID %>");
        }

        // Databindings
        function setData(data) {
            if (data != null) {
                $get("<%= tipoEstacionamiento_DDList.ClientID %>").selectedValue = data.idTipoEstacionamiento;
                $get("<%= cupoCarros_TBox.ClientID %>").value = getNumString(data.cupoEstacionamiento);
                $get("<%= jardin_CBox.ClientID %>").checked = data.jardinesFrontales;
                $get("<%= jardinFondo_CBox.ClientID %>").checked = data.jardinesFondo;
                $get("<%= jardinLateral_CBox.ClientID %>").checked = data.jardinesLateral;
                $get("<%= elevador_CBox.ClientID %>").checked = data.elevador;
                $get("<%= banosCompletos_TBox.ClientID %>").value = data.numBaniosCompletos;
                $get("<%= banosMedios_TBox.ClientID %>").value = data.numBaniosMedios;
                $get("<%= cocina_CBox.ClientID %>").checked = data.cocina;
                $get("<%= comedor_CBox.ClientID %>").checked = data.comedor;
                $get("<%= despensa_CBox.ClientID %>").checked = data.despensa;
                $get("<%= mueblesCocina_RBtn.ClientID %>").checked = data.cocinaMuebles;
                $get("<%= cocinaIntegral_RBtn.ClientID %>").checked = data.cocinaIntegral;

                setVisibility($get("seccion_cupo_carros"), data.idTipoEstacionamiento != sin_estacionamiento);
            }

            this.fillData();
        }

        function getData() {
            var data = new Object();

            data.idTipoEstacionamiento = $get("<%= tipoEstacionamiento_DDList.ClientID %>").value;
            if (data.idTipoEstacionamiento != sin_estacionamiento) {
                data.cupoEstacionamiento = $get("<%= cupoCarros_TBox.ClientID %>").value;
            }
            data.jardinesFrontales = $get("<%= jardin_CBox.ClientID %>").checked;
            data.jardinesFondo = $get("<%= jardinFondo_CBox.ClientID %>").checked;
            data.jardinesLateral = $get("<%= jardinLateral_CBox.ClientID %>").checked;
            data.elevador = $get("<%= elevador_CBox.ClientID %>").checked;
            data.numBaniosCompletos = $get("<%= banosCompletos_TBox.ClientID %>").value;
            data.numBaniosMedios = $get("<%= banosMedios_TBox.ClientID %>").value;
            data.cocina = $get("<%= cocina_CBox.ClientID %>").checked;
            data.cocinaMuebles = $get("<%= mueblesCocina_RBtn.ClientID %>").checked;
            data.cocinaIntegral = $get("<%= cocinaIntegral_RBtn.ClientID %>").checked;
            data.comedor = $get("<%= comedor_CBox.ClientID %>").checked;
            data.despensa = $get("<%= despensa_CBox.ClientID %>").checked;

            return data;
        }

        // Validación
        function validate() {
            return this.validator.validate();
        }
    }

    // Validación de selecciones
    function setCocinaSelection(selected) {
        setVisibility($get("seccion_muebles_cocina"), selected);
        setVisibility($get("seccion_tipo_cocina"), selected);
    }

    function setEstacionamientoSeleccion(valor) {
        setVisibility($get("seccion_cupo_carros")
            , valor != sin_estacionamiento && valor != "0");
    }

    this["<%= ID %>"] = new UsoActualDistribucion();
    
</script>

