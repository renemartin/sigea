<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosAcabados.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosAcabados" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<table>
    <tr class="filaHeader">
        <td>
        </td>
        <td>
            Pisos
        </td>
        <td>
            Muros
        </td>
        <td>
            Plafones
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Sala:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="pisosSala_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="murosSala_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="plafonesSala_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Comedor:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="pisosComedor_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="murosComedor_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="plafonesComedor_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Cocina:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="pisosCocina_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="murosCocina_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="plafonesCocina_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Recámaras:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="pisosRecamaras_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="murosRecamaras_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="plafonesRecamaras_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Baños:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="pisosBanos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="murosBanos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="plafonesBanos_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Patios:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="pisosPatios_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="murosPatios_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="plafonesPatios_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Estacionamiento:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="pisosEstacionamiento_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="murosEstacionamiento_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="plafonesEstacionamiento_TBox" runat="server" 
                TextMode="MultiLine" SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Fachada:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="fachada_TBox" runat="server" TextMode="MultiLine" 
                SkinID="MultiLine"></asp:TextBox>
        </td>
    </tr>
</table>
