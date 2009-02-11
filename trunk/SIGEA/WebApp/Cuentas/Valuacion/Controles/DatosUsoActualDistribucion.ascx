<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosUsoActualDistribucion.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosDistribucion" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<table>
    <tr>
        <td class="celdaTitulo">
            Tipo estacionamiento:
        </td>
        <td class="celdaValor">
            <asp:DropDownList ID="tipoEstacionamiento_DDList" runat="server">
                <asp:ListItem Value="0" Selected="True">Selecione...</asp:ListItem>                
                <asp:ListItem Value="1">COCHERA DESCUBIERTA</asp:ListItem>
                <asp:ListItem Value="2">COCHERA SEMIDESCUBIERTA</asp:ListItem>
                <asp:ListItem Value="3">COCHERA CUBIERTA</asp:ListItem>                
            </asp:DropDownList>
        </td>
        <td class="celdaTituloSec">
            Cupo de carros:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="cupoCarros_TBox" runat="server" SkinID="Numero"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="celdaTitulo" valign="top">
            Jardines:
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="jardin_CBox" Text="Tiene jardines" runat="server" /><br />
            <asp:CheckBox ID="jardinFondo_CBox" Text="Tiene jardín al fondo" runat="server" /><br />
            <asp:CheckBox ID="jardinLateral_CBox" Text="Tiene jardín lateral" runat="server" />
        </td>
        <td class="celdaTituloSec" valign="top">
            Elevador:</td>
        <td class="celdaValor" valign="top">
            <asp:CheckBox ID="elevador_CBox" Text="Tiene elevador" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaTituloSec">
            Baños completos:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosCompletos_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
        <td class="celdaTituloSec">
            Baños medios:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="banosMedios_TBox" runat="server" SkinID="Numero"></asp:TextBox>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td class="celdaTitulo" valign="top">
            Cocina:</td>
        <td class="celdaValor" valign="top">
            <asp:CheckBox ID="cuentaCocina_CBox" Text="Cuenta con cocina" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:RadioButton ID="conTarja_RBtn" Text="Con tarja" runat="server" />
            <br />
            <asp:RadioButton ID="mueblesCocina_RBtn" Text="Muebles de cocina" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:RadioButton ID="cocinaIntegral_RBtn" Text="Cocina integral" runat="server" />
            <br />
            <asp:RadioButton ID="forjadaSitio_RBtn" Text="Forjada en sitio" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="2"></td>
        <td class="celdaValor">
            <asp:CheckBox ID="comedor_CBox" Text="Comedor" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="despensa_CBox" Text="Despensa" runat="server" />
        </td>
    </tr>
</table>
