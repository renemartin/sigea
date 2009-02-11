<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEntornoServicios.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosServicios" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />

<table>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="gasNatural_CBox" Text="Gas natural" runat="server" />
        </td>
        <td class="celdaValor" colspan="4">
            <asp:CheckBox ID="gasNaturalSuministro_CBox" Text="Con suministro" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="redTelefonica_CBox" Text="Red telefónica" runat="server" />
        </td>
        <td class="celdaValor" colspan="4">
            <asp:CheckBox ID="redTelefonicaAerea_CBox" Text="Aérea" runat="server" />
            <asp:CheckBox ID="redTelefonicaAcometida_CBox" Text="Con acometida" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor" colspan="5">
            <asp:CheckBox ID="senalizacionNomenclatura_CBox" Text="Señalización y nomenclatura"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="transUrbano" Text="Transporte urbano" runat="server" />
        </td>
        <td class="subCampo">
            Distancia
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="transUrbanoDistancia_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m.</span>
        </td>
        <td class="subCampo">
            Frecuencia
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="transUrbanoFrecuencia_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">mins.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="transSuburbano" Text="Transporte suburbano" runat="server" />
        </td>
        <td class="subCampo">
            Distancia
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="transSuburbanoDistancia_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">m.</span>
        </td>
        <td class="subCampo">
            Frecuencia
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="transSuburbanoFrecuencia_TBox" runat="server" SkinID="Numero"></asp:TextBox>
            <span class="textoChico">mins.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="vigilancia_CBox" Text="Vigilancia" runat="server" />
        </td>
        <td class="celdaValor" colspan="4">
            <asp:CheckBox ID="vigilanciaMunicipal_CBox" Text="Municipal" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor" colspan="5">
            <asp:CheckBox ID="recoleccionBasura_CBox" Text="Recolección de basura municipal ó privada"
                runat="server" />
        </td>
    </tr>
</table>
