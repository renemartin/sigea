<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosSuperficies.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosSuperficies" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillSuperficiesData() {
        fillFuente("<%= fuenteTerreno_DDList.ClientID %>");
        fillFuente("<%= fuenteIndiviso_DDList.ClientID %>");
        fillFuente("<%= fuentePrivativo_DDList.ClientID %>");
    }   
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Superficie del terreno:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="superficieTerreno_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m²</span>
        </td>
        <td class="celdaTituloSec">
            Fuente:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="fuenteTerreno_DDList" runat="server">
            </asp:DropDownList>
            <div id="seccion_fuente_terreno" style="display: none;">
                <span class="subCampo">Especifique:</span>
                <asp:TextBox ID="especFuenteTerreno_TBox" runat="server"></asp:TextBox></div>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Frente del lote:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="superficieFrente_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m.</span>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="celdaTitulo">
            Indiviso:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="Indiviso_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">%</span>
            <div class="etiqueta2">
                <asp:Label ID="proporcional_Lbl" runat="server"></asp:Label>
            </div>
        </td>
        <td class="celdaTituloSec" valign="top">
            Fuente:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="fuenteIndiviso_DDList" runat="server">
            </asp:DropDownList>
            <div id="seccion_fuente_indiviso" style="display: none;">
                <span class="subCampo">Especifique:</span>
                <asp:TextBox ID="especFuenteIndiviso_TBox" runat="server"></asp:TextBox></div>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Lote privativo
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="LotePrivativo_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m²</span>
        </td>
        <td class="celdaTituloSec" valign="top">
            Fuente:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="fuentePrivativo_DDList" runat="server">
            </asp:DropDownList>
            <div id="seccion_fuente_privativo" style="display: none;">
                <span class="subCampo">Especifique:</span>
                <asp:TextBox ID="especFuentePrivativo_TBox" runat="server"></asp:TextBox></div>
        </td>
    </tr>
</table>
