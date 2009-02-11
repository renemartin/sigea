<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosDireccionInmueble.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosDireccionInmueble" %>

<script type="text/javascript">
    // DataBindings
    function getDatosUbicacionInmueble() {
        var data = new Object();

        data["edificio"] = $get("<%= edificio_TBox.ClientID%>").value;
        data["lote"] = $get("<%= lote_TBox.ClientID%>").value;
        data["manzana"] = $get("<%= manzana_TBox.ClientID%>").value;
        data["superManzana"] = $get("<%= superManzana_TBox.ClientID%>").value;
        data["condominio"] = $get("<%= condominio_TBox.ClientID%>").value;

        return data;
    }

    function setDatosUbicacionInmueble(data) {
        $get("<%= edificio_TBox.ClientID%>").value = data["edificio"];
        $get("<%= lote_TBox.ClientID%>").value = data["lote"];
        $get("<%= manzana_TBox.ClientID%>").value = data["manzana"];
        $get("<%= superManzana_TBox.ClientID%>").value = data["superManzana"];
        $get("<%= condominio_TBox.ClientID%>").value = data["condominio"];
    }
</script>

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
