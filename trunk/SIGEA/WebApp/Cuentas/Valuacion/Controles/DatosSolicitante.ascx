<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosSolicitante.ascx.cs"
    Inherits="Cuentas_Valuacion_DatosSolicitante" %>
<%@ Register Src="~/Controles/DatosDireccion.ascx" TagName="DatosDireccion" TagPrefix="SIGEA" %>
<link href="../../../App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<table>
    <tr>
        <td class="celdaTitulo">
            Nombre:
        </td>
        <td class="celdaValor" colspan="4">
            <asp:TextBox ID="nombre_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            NSS:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="NSS_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>

        <td class="celdaTitulo">
            RFC:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="RFC_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            CURP:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="CURP_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>
<SIGEA:DatosDireccion ID="direccionSolicitante_Ctrl" runat="server" />

<script type="text/javascript">

    function Solicitante() {
        
        // Inicialización
        if(typeof(Solicitante_Init) == "undefined") {
            Solicitante_Init = true;
            Solicitante.prototype.fillData = fillData;
            Solicitante.prototype.getData = getData;
            Solicitante.prototype.setData = setData;
            Solicitante.prototype.validate = validate;
        }
        
        // Inicialización de validador
        this.controls = new Array(
            $get("<%= nombre_TBox.ClientID %>"),    // 0
            $get("<%= NSS_TBox.ClientID %>"),       // 1
            $get("<%= RFC_TBox.ClientID %>"),       // 2
            $get("<%= CURP_TBox.ClientID %>")       // 3         
        );
        this.validator = new ControlValidator(this.controls);
        this.validator.addOptionalField(1);        
        this.validator.addOptionalField(2);
        this.validator.addOptionalField(3);

        // Llenado de datos
        function fillData() {
            direccionSolicitante_Ctrl.fillData();
        }

        // DataBindings
        function getData() {
            var data_set = new Array();

            data_set[0] = new Object();
            data_set[0].nombre = $get("<%= nombre_TBox.ClientID %>").value;
            data_set[0].NSS = $get("<%= NSS_TBox.ClientID %>").value;
            data_set[0].RFC = $get("<%= RFC_TBox.ClientID %>").value;
            data_set[0].CURP = $get("<%= CURP_TBox.ClientID %>").value;

            data_set[1] = direccionSolicitante_Ctrl.getData();

            return data_set;
        }
        
        function setData(data_set) {
            if(data_set != null) {
                if (data_set[0] != null) {
                    $get("<%= nombre_TBox.ClientID %>").value = data_set[0].nombre;
                    $get("<%= NSS_TBox.ClientID %>").value = data_set[0].NSS;
                    $get("<%= RFC_TBox.ClientID %>").value = data_set[0].RFC
                    $get("<%= CURP_TBox.ClientID %>").value = data_set[0].CURP;
                }

                direccionSolicitante_Ctrl.setData(data_set[1]);           
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
            if (!direccionSolicitante_Ctrl.validate())
                validated = false;

            return validated;
        }
        
    }
    
    this["<%= ID %>"] = new Solicitante();

</script>