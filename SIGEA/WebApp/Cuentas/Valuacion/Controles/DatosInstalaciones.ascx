<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosInstalaciones.ascx.cs" Inherits="Cuentas_Valuacion_Controles_Instalaciones" %>


<table>
    <tr>
        <td class="celdaTitulo">
            Hidráulicas:</td>
        <td class="celdaValor">
            <asp:TextBox ID="hidraulicas_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox>
        </td>
        </tr>
    <tr>
        <td class="celdaTitulo">
            Sanitarias:</td>
        <td class="celdaValor">
            <asp:TextBox ID="sanitarias_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox>
        </td>
        </tr>
    <tr>
        <td class="celdaTitulo">
             Eléctricas:  
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="electricas_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox> 
        </td>
    </tr>
    <tr>
        <td class="celdaHeader" colspan="2">
            Cancelería y comunicaciones</td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Carpinteria:</td>
        <td class="celdaValor">
            <asp:TextBox ID="carpinteria_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Herrería:</td>
        <td class="celdaValor">
            <asp:TextBox ID="herreria_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Cancelería:</td>
        <td class="celdaValor">
            <asp:TextBox ID="canceleria_TBox" runat="server" TextMode="MultiLine" SkinID="MultiLine">
            </asp:TextBox>
        </td>
    </tr>
</table>

<script type="text/javascript">

    function Instalaciones() {

        // Inicialización
        Instalaciones.prototype.setData = setData;
        Instalaciones.prototype.getData = getData;
        Instalaciones.prototype.validate = validate;

        // Inicialización de validador
        this.controls = new Array(
            $get("<%= hidraulicas_TBox.ClientID %>"),   // 0
            $get("<%= sanitarias_TBox.ClientID %>"),    // 1
            $get("<%= electricas_TBox.ClientID %>"),    // 2
            $get("<%= carpinteria_TBox.ClientID %>"),   // 3
            $get("<%= herreria_TBox.ClientID %>"),      // 4
            $get("<%= canceleria_TBox.ClientID %>")     // 5
        );
        this.validator = new ControlValidator(this.controls);

        // Databindings
        function setData(data) {
            if (data == null)
                return;

            $get("<%= hidraulicas_TBox.ClientID %>").value = data.hidraulicas;
            $get("<%= sanitarias_TBox.ClientID %>").value = data.sanitarias;
            $get("<%= electricas_TBox.ClientID %>").value = data.electricas;
            $get("<%= carpinteria_TBox.ClientID %>").value = data.carpinteria;
            $get("<%= herreria_TBox.ClientID %>").value = data.herreria;
            $get("<%= canceleria_TBox.ClientID %>").value = data.canceleria;
        }

        function getData() {
            var data = null;
            data = new Object();

            data.hidraulicas = $get("<%= hidraulicas_TBox.ClientID %>").value;
            data.sanitarias = $get("<%= sanitarias_TBox.ClientID %>").value;
            data.electricas = $get("<%= electricas_TBox.ClientID %>").value;
            data.carpinteria = $get("<%= carpinteria_TBox.ClientID %>").value;
            data.herreria = $get("<%= herreria_TBox.ClientID %>").value;
            data.canceleria = $get("<%= canceleria_TBox.ClientID %>").value;

            return data;
        }

        // Validación
        function validate() {
            return this.validator.validate();
        }
    }

    this["<%= ID %>"] = new Instalaciones();
    
</script>