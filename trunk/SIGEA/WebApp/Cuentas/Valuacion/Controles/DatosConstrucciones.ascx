<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosConstrucciones.ascx.cs"
    Inherits="Cuentas_Valuacion_DatosConstrucciones" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    // Llenado de datos
    function fillConstruccionesData() {
        fillCalidadProyecto("<%= calidadProy_DDList.ClientID %>");
        fillClaseInmueble("<%= claseGral_DDList.ClientID %>");
        fillEstadoConservacion("<%= estadoConservacionGral_DDList.ClientID %>");
    }   
</script>

<table>
    <tr>
        <td class="celdaTitulo">
            Calidad del proyecto:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="calidadProy_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Avance de obra general:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="avanceObraGral_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">%</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Clase general:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="claseGral_DDList" runat="server">
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Estado de conservación general:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="estadoConservacionGral_DDList" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Unidades rentables:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="unidadesRentables_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="celdaTitulo">
            Avance de obra en áreas comúnes en condominios:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="avanceAComunes_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">%</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Unidades rentables en el núcleo de construcción:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="unidRentNucleo_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Unidades rentables del conjunto:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="unidRentConjunto_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
</table>
