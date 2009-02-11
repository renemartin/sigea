<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEntornoEquipamiento.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosEntornoEquipamiento" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<table>
    <tr>
        <td class="celdaTitulo">
            Iglesia:</td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaIglesia_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Mercado:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaMercado_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Plaza pública:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaPlaza_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Escuela:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaEscuela_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Hospital:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaHospital_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Parque/Jardín:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaParque_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Banco:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaBanco_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Parada tranporte:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="distanciaTransporte_TBox" runat="server" SkinID="Numero" />
            <span class="textoChico">m.</span>
        </td>
    </tr>
    <tr>
        <td class="celdaValor" colspan="2">
            <div class="etiqueta2">
                <span class="textoNegritas">Proximidad general:</span>
                <asp:Label ID="proximidadGeneral_Lbl" runat="server"></asp:Label>
                <span class="textoChico">&nbsp;%</span>
            </div>
            <div class="etiqueta2">
                <span class="textoNegritas">Nivel de equipamiento urbano:</span>
                <asp:Label ID="nivelEquipamiento_Lbl" runat="server"></asp:Label>
            </div>           
        </td>
    </tr>
</table>
