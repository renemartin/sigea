<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosPropietario.ascx.cs" Inherits="Cuentas_Valuacion_DatosPropietario" %>
<%@ Register Src="~/Controles/DatosDireccion.ascx" TagName="DatosDireccion" TagPrefix="SIGEA" %>

<table>
    <tr>
        <td class="celdaTitulo">
            Nombre:
        </td>
        <td class="celdaValor" colspan="4">
            <asp:TextBox ID="nombre_TBox" runat="server" MaxLength="100"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            RFC:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="RFC_TBox" runat="server" MaxLength="30"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            CURP
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="CURP_TBox" runat="server" MaxLength="30"></asp:TextBox>
        </td>
    </tr>
</table>
<SIGEA:DatosDireccion ID="direccionPropietario_Ctrl" runat="server" />

<script type="text/javascript">

    function Propietario() {

        // Inicialización
        if (typeof (Propietario_Init) == "undefined") {
            Propietario.prototype.fillData = fillData;
            Propietario.prototype.getData = getData;
            Propietario.prototype.setData = setData;
            Propietario.prototype.validate = validate;
        }

        // Inicialización de validador
        this.controls = new Array(
            $get("<%= nombre_TBox.ClientID %>"),    // 0
            $get("<%= RFC_TBox.ClientID %>"),       // 1
            $get("<%= CURP_TBox.ClientID %>")       // 2
        );
        this.validator = new ControlValidator(this.controls);
        this.validator.addOptionalField(1);
        this.validator.addOptionalField(2);

        // Llenado de datos
        function fillData() {
            direccionPropietario_Ctrl.fillData()
        }
        
        // DataBindings
        function getData() {
            var data_set = new Array();

            data_set[0] = new Object();
            data_set[0].nombre = $get("<%= nombre_TBox.ClientID %>").value;
            data_set[0].RFC = $get("<%= RFC_TBox.ClientID %>").value;
            data_set[0].CURP = $get("<%= CURP_TBox.ClientID %>").value;

            data_set[1] = direccionPropietario_Ctrl.getData();

            return data_set;
        }
        function setData(data_set) {
            if (data_set != null) {
                if (data_set[0] != null) {
                    $get("<%= nombre_TBox.ClientID %>").value = data_set[0].nombre;
                    $get("<%= RFC_TBox.ClientID %>").value = data_set[0].RFC;
                    $get("<%= CURP_TBox.ClientID %>").value = data_set[0].CURP;
                }

                direccionPropietario_Ctrl.setData(data_set[1]);
            }
            else {
                this.fillData();
            }
        }

        // Validación
        function validate() {
            var validated = true;
            
            if (!this.validator.validate())
                validated = false;
            if (!direccionPropietario_Ctrl.validate())
                validated = false;
            
            return validated;
        }
        
    }

    this["<%= ID %>"] = new Propietario();
    
</script>