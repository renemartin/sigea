<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosInstalacionesAdicionales.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_InstalacionesAdicionales" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillInstalacionesAdicionalesData(parent_id) {
        fillUnidad(parent_id + "_unidad_DDList_1");
        fillEstadoConservacion(parent_id + "_conservacion_DDList_1");
    }

    function setupTablaSuperficiesAdicionales(parent_id) {
        tabla = $get(parent_id + "_tabla_instalaciones");
        addCloningTable(tabla, 1, 5);
    }
    
</script>

<table id="<%= ClientID %>_tabla_instalaciones" >
    <tr class="filaHeader">
        <td>
            Descripción
        </td>
        <td>
            Cantidad
        </td>
        <td>
            Unidad
        </td>
        <td>
            Edad
            <span class="textoChico">(años)</span>
        </td>
        <td>
            Estado de conservación
        </td>
        <td>
            <asp:ImageButton ID="agregarFila_ImBtn" runat="server" SkinID="AddSmall" />
            <asp:ImageButton ID="removerFila_ImBtn" runat="server" SkinID="RemoveSmall" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:TextBox ID="descripcion_TBox_1" runat="server"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cantidad_TBox_1" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="unidad_DDList_1" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="edad_TBox_1" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="conservacion_DDList_1" runat="server">
            </asp:DropDownList>
        </td>
        <td></td>
    </tr>
</table>
