<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosDireccionInmueble.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosDireccionInmueble" %>
<link href="../../../App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<table>
    <tr>
        <td class="celdaTitulo">
            Edificio:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="edificio_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Lote:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="lote_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Manzana:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="manzana_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Super manzana:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="superManzana_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Condominio:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="condominio_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>

<script type="text/javascript">
    function UbicacionInmueble() {

        // Inicialización
        if (typeof (UbicacionInmueble_Init) == "undefined") {
            UbicacionInmueble_Init = true;
            UbicacionInmueble.prototype.getData = getData;
            UbicacionInmueble.prototype.setData = setData;
            UbicacionInmueble.prototype.validate = validate;
        }

        // Inicialización de validador
        this.controls = new Array(
            $get("<%= edificio_TBox.ClientID%>"),       // 0
            $get("<%= lote_TBox.ClientID%>"),           // 1
            $get("<%= manzana_TBox.ClientID%>"),        // 2
            $get("<%= superManzana_TBox.ClientID%>"),   // 3
            $get("<%= condominio_TBox.ClientID%>")      // 4
        );
        this.validator = new ControlValidator(this.controls);
        this.validator.addOptionalField(0);
        this.validator.addOptionalField(1);
        this.validator.addOptionalField(2);
        this.validator.addOptionalField(3)
        this.validator.addOptionalField(4);
                
        // DataBindings
        function getData() {
            var data = new Object();

            data.edificio = $get("<%= edificio_TBox.ClientID%>").value;
            data.lote = $get("<%= lote_TBox.ClientID%>").value;
            data.manzana = $get("<%= manzana_TBox.ClientID%>").value;
            data.superManzana = $get("<%= superManzana_TBox.ClientID%>").value;
            data.condominio = $get("<%= condominio_TBox.ClientID%>").value;

            return data;
        }

        function setData(data) {
            if (data != null) {
                $get("<%= edificio_TBox.ClientID%>").value = data.edificio;
                $get("<%= lote_TBox.ClientID%>").value = data.lote;
                $get("<%= manzana_TBox.ClientID%>").value = data.manzana;
                $get("<%= superManzana_TBox.ClientID%>").value = data.superManzana;
                $get("<%= condominio_TBox.ClientID%>").value = data.condominio;
            }
        }

        // Validación
        function validate() {
            return this.validator.validate();
        }
    }

    this["<%= ID %>"] = new UbicacionInmueble();
    
</script>