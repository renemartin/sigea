<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosConstrucciones.ascx.cs"
    Inherits="Cuentas_Valuacion_DatosConstrucciones" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<table>
    <tr>
        <td class="celdaTitulo">
            Calidad del proyecto:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="calidadProy_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Avance de obra general:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="avanceObraGral_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">%</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Clase general:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="claseGral_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Estado de conservación general:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="estadoConservacionGral_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Unidades rentables:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="unidadesRentables_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Tipo construcción
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="horizontal_CBox" Text="Horizontal" runat="server" />
            <asp:CheckBox ID="vertical_CBox" Text="Vertical" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Niveles construccion:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="nivelesConstruccion_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Nivel en edificio:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="nivelEdificio_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Constructor:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="constructor_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>

<script type="text/javascript">
    function DatosConstrucciones() {

        // Inicialización
        if (typeof (DatosConstrucciones_Init) == 'undefined') {
            DatosConstrucciones_Init = true;
            DatosConstrucciones.prototype.getData = getData;
            DatosConstrucciones.prototype.setData = setData;
            DatosConstrucciones.prototype.fillData = fillData;
            DatosConstrucciones.prototype.validate = validate;
        }
        
        // Inicialización de validador
        this.controls = new Array(
            $get("<%= claseGral_DDList.ClientID %>"),               // 0
            $get("<%= estadoConservacionGral_DDList.ClientID %>"),  // 1
            $get("<%= calidadProy_DDList.ClientID %>"),             // 2
            $get("<%= constructor_TBox.ClientID %>"),               // 3
            $get("<%= avanceObraGral_TBox.ClientID %>"),            // 4
            $get("<%= nivelesConstruccion_TBox.ClientID %>"),       // 5
            $get("<%= nivelEdificio_TBox.ClientID %>"),             // 6
            $get("<%= horizontal_CBox.ClientID %>"),                // 7
            $get("<%= vertical_CBox.ClientID %>"),                  // 8
            $get("<%= unidadesRentables_TBox.ClientID %>")          // 9
        );        
        this.validator = new ControlValidator(this.controls);
        this.validator.addOptionalField(3);
        this.validator.addNumericField(4, true);
        this.validator.addNumericField(5, false);
        this.validator.addNumericField(6, false);
        this.validator.addNumericField(9, false);

        // Databindings
        function getData() {
            var data = new Object();

            data.idClaseGeneral = $get("<%= claseGral_DDList.ClientID %>").value;
            data.idConservacionGeneral = $get("<%= estadoConservacionGral_DDList.ClientID %>").value;
            data.idCalidadProyecto = $get("<%= calidadProy_DDList.ClientID %>").value;
            data.nombreConstructor = $get("<%= constructor_TBox.ClientID %>").value;
            data.avanceObraGeneral = $get("<%= avanceObraGral_TBox.ClientID %>").value;
            data.nivelesConstruccion = $get("<%= nivelesConstruccion_TBox.ClientID %>").value;
            data.nivelEdificio = $get("<%= nivelEdificio_TBox.ClientID %>").value;
            data.horizontal = $get("<%= horizontal_CBox.ClientID %>").checked;
            data.vertical = $get("<%= vertical_CBox.ClientID %>").checked;
            data.unidadesRentables = $get("<%= unidadesRentables_TBox.ClientID %>").value;

            return data;
        }

        function setData(data) {
            if (data != null) {
                $get("<%= claseGral_DDList.ClientID %>").selectedValue = data.idClaseGeneral;
                $get("<%= estadoConservacionGral_DDList.ClientID %>").selectedValue = data.idConservacionGeneral;
                $get("<%= calidadProy_DDList.ClientID %>").selectedValue = data.idCalidadProyecto;
                $get("<%= constructor_TBox.ClientID %>").value = data.nombreConstructor;
                $get("<%= avanceObraGral_TBox.ClientID %>").value = data.avanceObraGeneral;
                $get("<%= nivelesConstruccion_TBox.ClientID %>").value = data.nivelesConstruccion;
                $get("<%= nivelEdificio_TBox.ClientID %>").value = data.nivelEdificio;
                $get("<%= horizontal_CBox.ClientID %>").checked = data.horizontal;
                $get("<%= vertical_CBox.ClientID %>").checked = data.vertical;
                $get("<%= unidadesRentables_TBox.ClientID %>").value = data.unidadesRentables;
            }
            
            this.fillData();
        }

        // Llenado de datos
        function fillData() {
            fillCalidadProyecto("<%= calidadProy_DDList.ClientID %>");
            fillClaseInmueble("<%= claseGral_DDList.ClientID %>");
            fillEstadoConservacion("<%= estadoConservacionGral_DDList.ClientID %>");
        }
        
        // Validación
        function validate() {
            return this.validator.validate();
        }
    }

    this["<%= ID %>"] = new DatosConstrucciones();

</script>

