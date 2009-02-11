<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosTerreno.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosTerreno" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillTerrenoData() {        
        fillUbicacion("<%= ubicacion_DDList.ClientID %>");
        fillTopografia("<%= topografia_DDList.ClientID %>");
        fillCaracPanoramicas("<%= caracPanoramicas_DDList.ClientID %>");
        fillUsoSuelo("<%= usoSuelo_DDList.ClientID %>");
        fillFuente("<%= fuenteDensidad_DDList.ClientID %>");
        fillServidumbre("<%= servidumbre_DDList.ClientID %>");
    }   
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Frentes:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="frentes_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Configuración:
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="configuracionRegular_CBox" runat="server" Text="Regular" />
        </td>
        <td class="celdaTituloSec">
            Lados:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="lados_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Ubicación:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="ubicacion_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Topografía:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="topografia_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Caracteristicas panoramicas:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="caracPanoramicas_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Uso de suelo:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="usoSuelo_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Densidad habitacional:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="densidadHabitacional_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Fuente de densidad habitacional:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="fuenteDensidad_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Habitantes por hectárea:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="habHectarea_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Viviendas por hectárea:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="vivHectarea_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Servidumbre y/o restricciones:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:DropDownList ID="servidumbre_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
</table>
