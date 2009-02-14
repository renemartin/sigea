<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosPropietario.ascx.cs" Inherits="Cuentas_Valuacion_DatosPropietario" %>
<%@ Register Src="~/Controles/DatosDireccion.ascx" TagName="DatosDireccion" TagPrefix="SIGEA" %>

<script type="text/javascript">
    // DataBindings
    function getDatosPropietario() {
        var data = new Object();

        data["nombre"] = $get("<%= nombre_TBox.ClientID %>").value;
        data["RFC"] = $get("<%= RFC_TBox.ClientID %>").value;
        data["CURP"] = $get("<%= CURP_TBox.ClientID %>").value;

        return data;
    }
    function setDatosPropietario(data) {
        $get("<%= nombre_TBox.ClientID %>").value = data["nombre"];
        $get("<%= RFC_TBox.ClientID %>").value = data["RFC"];
        $get("<%= CURP_TBox.ClientID %>").value = data["CURP"]
    }
</script>

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
            RFC:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="RFC_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            CURP
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="CURP_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>
<SIGEA:DatosDireccion ID="direccion_Ctrl" runat="server" />
