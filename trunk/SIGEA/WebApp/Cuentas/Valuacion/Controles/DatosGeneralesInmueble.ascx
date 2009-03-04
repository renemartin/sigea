<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosGeneralesInmueble.ascx.cs"
    Inherits="Cuentas_Valuacion_DatosGeneralesInmueble" %>
<%@ Register Src="DatosDireccionInmueble.ascx" TagName="DatosDireccionInmueble" TagPrefix="SIGEA" %>
<%@ Register Src="~/Controles/DatosDireccion.ascx" TagName="DatosDireccion" TagPrefix="SIGEA" %>

<table>
    <tr>
        <td class="celdaTitulo">
            Tipo de inmueble:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="tipoInmueble_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Régimen de propiedad:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="regimenPropiedad_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
</table>
<SIGEA:DatosDireccion ID="direccionInmueble_Ctrl" runat="server" />
<SIGEA:DatosDireccionInmueble ID="ubicacion_Ctrl" runat="server" />
<table>
    <tr>
        <td class="celdaTitulo">
            Teléfono:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="telefono_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Clave catastral:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="claveCatastral_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Cuenta predial:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cuentaPredial_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Cuenta agua:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cuentaAgua_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            CUV:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="CUV_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>

<script type="text/javascript">
    function Inmueble() {

        // Inicialización
        if (typeof (Inmueble_Init) == "undefined") {
            Inmueble_Init = true;
            Inmueble.prototype.getData = getData;
            Inmueble.prototype.setData = setData;
            Inmueble.prototype.fillData = fillData;
            Inmueble.prototype.getIdTipo = getIdTipo;
            Inmueble.prototype.validate = validate;
        }

        // Inicialización de validadores
        this.controls = new Array(
            $get("<%= tipoInmueble_DDList.ClientID %>"),        // 0
            $get("<%= regimenPropiedad_DDList.ClientID %>"),    // 1
            $get("<%= claveCatastral_TBox.ClientID %>"),        // 2
            $get("<%= cuentaPredial_TBox.ClientID %>"),         // 3
            $get("<%= cuentaAgua_TBox.ClientID %>"),            // 4
            $get("<%= telefono_TBox.ClientID %>")               // 5
        );
        this.validator = new ControlValidator(this.controls);
        this.validator.addOptionalField(2);
        this.validator.addOptionalField(3);
        this.validator.addOptionalField(4);
        this.validator.addOptionalField(5);

        // DataBindings
        function getData() {
            var data_set = new Array();

            data_set[0] = new Object();
            data_set[0].idTipoInmueble = $get("<%= tipoInmueble_DDList.ClientID %>").value;
            data_set[0].idRegimenPropiedad = $get("<%= regimenPropiedad_DDList.ClientID %>").value;
            data_set[0].otroTipoInmueble = "";
            data_set[0].claveCatastral = $get("<%= claveCatastral_TBox.ClientID %>").value;
            data_set[0].cuentaPredial = $get("<%= cuentaPredial_TBox.ClientID %>").value;
            data_set[0].cuentaAgua = $get("<%= cuentaAgua_TBox.ClientID %>").value;
            data_set[0].telefono = $get("<%= telefono_TBox.ClientID %>").value;

            data_set[1] = ubicacion_Ctrl.getData();
            data_set[2] = direccionInmueble_Ctrl.getData();            

            return data_set;
        }
        function setData(data_set) {
            if (data_set != null) {
                $get("<%= tipoInmueble_DDList.ClientID %>").selectedValue = data_set[0].idTipoInmueble;
                $get("<%= regimenPropiedad_DDList.ClientID %>").selectedValue = data_set[0].idRegimenPropiedad;
                $get("<%= claveCatastral_TBox.ClientID %>").value = data_set[0].claveCatastral;
                $get("<%= cuentaPredial_TBox.ClientID %>").value = data_set[0].cuentaPredial;
                $get("<%= cuentaAgua_TBox.ClientID %>").value = data_set[0].cuentaAgua;
                $get("<%= telefono_TBox.ClientID %>").value = data_set[0].telefono;

                ubicacion_Ctrl.setData(data_set[1]);
                direccionInmueble_Ctrl.setData(data_set[2]);                
            }
            else {
                direccionInmueble_Ctrl.fillData();
            }

            fillTipoInmueble("<%= tipoInmueble_DDList.ClientID %>");
            fillRegimenPropiedad("<%= regimenPropiedad_DDList.ClientID %>");
        }

        // Llenado de datos
        function fillData() {
            fillTipoInmueble("<%= tipoInmueble_DDList.ClientID %>");
            fillRegimenPropiedad("<%= regimenPropiedad_DDList.ClientID %>");
            direccionInmueble_Ctrl.fillData();
        }

        // Validación
        function validate() {
            var validated = true
            if (!this.validator.validate())
                validated = false;
            if (!direccionInmueble_Ctrl.validate())
                validated = false;
            if (!ubicacion_Ctrl.validate())
                validated = false;

            return validated;
        }

        // Obtención de datos
        function getIdTipo() {
            return $get("<%= tipoInmueble_DDList.ClientID %>").value;
        }
    }

    this["<%= ID %>"] = new Inmueble();
   
</script>

