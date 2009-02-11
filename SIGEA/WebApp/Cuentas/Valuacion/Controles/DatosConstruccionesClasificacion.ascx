<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosConstruccionesClasificacion.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosConstruccionesClasificacion" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillConstruccionesClasificacionData() {
        fillClaseInmueble("<%= clase_DDList_1.ClientID %>");
        fillFuente("<%= fuente_DDList_1.ClientID %>");
        fillEstadoConservacion("<%= estadoCons_DDList_1.ClientID %>");
    }

    function setupTablaConstrucciones() {
        addCloningTable($get("tabla_construcciones"), 1, 5);
    }

</script>

<table id="tabla_construcciones" class="tablaCompactaExtendida">
    <tr class="filaHeader">
        <td>
            Tipo
        </td>
        <td>
            Descripción
        </td>
        <td>
            Clase
        </td>
        <td>
            Superficie (m²)
        </td>
        <td>
            Fuente
        </td>
        <td>
            # Niv. tipo
        </td>
        <td>
            # Niv. cuerpo
        </td>
        <td>
            Edad (años)
        </td>
        <td>
            Avance obra (%)
        </td>
        <td>
            Vida útil (años)
        </td>
        <td>
            Estado cons.
        </td>
        <td>
            <asp:ImageButton ID="agregarFila_ImBtn" runat="server" SkinID="AddSmall" />
            <asp:ImageButton ID="removerFila_ImBtn" runat="server" SkinID="RemoveSmall" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="tipo_CBox_1" Text="Const." runat="server" />
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="descripcion_TBox_1" runat="server" SkinID="Compacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="clase_DDList_1" runat="server" SkinID="Compacto">
            </asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="superficie_TBox_1" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="fuente_DDList_1" runat="server" SkinID="Compacto">
            </asp:DropDownList>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="nivelesTipo_TBox_1" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="nivelesCuerpo_TBox_1" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="edad_TBox_1" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="avance_TBox_1" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="vidaUtil_TBox_1" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="estadoCons_DDList_1" runat="server" SkinID="Compacto">
            </asp:DropDownList>
        </td>
        <td>
        </td>
    </tr>
</table>
