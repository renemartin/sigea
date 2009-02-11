<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosSuperficiesAdicionales.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosSuperficiesAdicionales" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    function setupTablaSuperficiesAdicionales(parent_id) {
        tabla = $get(parent_id + "_tabla_adicionales");
        addCloningTable(tabla, 1, 5);
    }
</script>

<table id="<%= ClientID %>_tabla_adicionales">
    <tr class="filaHeader">
        <td>
            Concepto
        </td>
        <td>
            Superficie
        </td>
        <td>
            <asp:ImageButton ID="agregarFila_ImBtn" runat="server" SkinID="AddSmall" />
            <asp:ImageButton ID="removerFila_ImBtn" runat="server" SkinID="RemoveSmall" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:TextBox ID="Concepto_TBox_1" runat="server"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="Superficie_TBox_1" runat="server"></asp:TextBox>
            <span class="textoChico">m²</span>
        </td>
        <td></td>
    </tr>
</table>
