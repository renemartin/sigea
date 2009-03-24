<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEnfoqueCostosHomologacion.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosValorUnitarioTerreno" %>

<div style="padding-bottom:10px">
    <span class="textoNegritas">Tipo de homologación</span>
    <asp:RadioButton ID="homologacionLoteTipo_RButton" Text="Homologación a lote tipo" Checked="true" GroupName="Homologacion" runat="server"/>
    <asp:RadioButton ID="homologacionSujeto_RButton" Text="Homologación a sujeto" GroupName="Homologacion" runat="server"/>
</div>

<table class="tablaExtendida glosario">
    <tr>
        <td class="termino">
            FZo
        </td>
        <td class="definicion">
            Factor de zona
        </td>
        <td class="termino">
            FFo
        </td>
        <td class="definicion">
            Factor de forma
        </td>
        <td class="termino">
            Fus
        </td>
        <td class="definicion">
            Factor de uso suelo
        </td>
    </tr>
    <tr>
        <td class="termino">
            FUb
        </td>
        <td class="definicion">
            Factor de ubicación (No. frentes)
        </td>
        <td class="termino">
            FSu
        </td>
        <td class="definicion">
            Factor de superficie
        </td>
        <td class="termino">
            FLo
        </td>
        <td class="definicion">
            Factor de localización (Tipo de colonia)
        </td>
    </tr>
    <tr>
        <td class="termino">
            FFr
        </td>
        <td class="definicion">
            Factor de frente
        </td>
        <td class="termino">
            FTo
        </td>
        <td class="definicion">
            Factor de topografía
        </td>
        <td class="termino">
            Fre
        </td>
        <td class="definicion">
            Factor resultante
        </td>
    </tr>
</table>

<table class="tablaCompactaExtendida">
    <tr class="filaHeader">
        <td rowspan="2">
            FCom
        </td>
        <td rowspan="2">
            Valor ajustado del terreno
        </td>
        <td rowspan="2">
            Valor unitario del terreno
        </td>
        <td colspan="8">
            Factores de homologación
        </td>
        <td rowspan="2">
            FRe
        </td>
        <td rowspan="2">
            1/FRe
        </td>
        <td rowspan="2">
            Valor unitario de terreno homologado
        </td>
        <tr class="filaHeader">
            <td>
                Fzo
            </td>
            <td>
                FUb
            </td>
            <td>
                FFr
            </td>
            <td>
                FFo
            </td>
            <td>
                FSu
            </td>
            <td>
                FTo
            </td>
            <td>
                FUs
            </td>
            <td>
                FLo
            </td>
        </tr>
        <tr>
            <td class="celdaValor">
                <asp:TextBox ID="FCom_TBox" Text="1.00" runat="server" SkinID="NumeroCompacto">1.00</asp:TextBox>            
            </td>
            <td class="celdaValor">
                <asp:Label ID="VATNumero_Lbl" runat="server"></asp:Label>
            </td>
            <td class="celdaValor">
                <asp:Label ID="VUTNumero_Lbl" runat="server"></asp:Label>
            </td>
            <td class="celdaValor">
                <asp:DropDownList ID="FZo_DDList" runat="server" SkinID="Compacto">
                    <asp:ListItem Selected="True" Text="1.00"></asp:ListItem>
                    <asp:ListItem Text="0.80"></asp:ListItem>
                    <asp:ListItem Text="1.20"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="celdaValor">
                <asp:DropDownList ID="FUb_DDList" runat="server" SkinID="Compacto">
                    <asp:ListItem Selected="True" Text="1.00"></asp:ListItem>
                    <asp:ListItem Text="1.15"></asp:ListItem>
                    <asp:ListItem Text="1.25"></asp:ListItem>
                    <asp:ListItem Text="1.35"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="celdaValor">
                <asp:DropDownList ID="FFR_DDList" runat="server" SkinID="Compacto">
                    <asp:ListItem Text="0.60"></asp:ListItem>
                    <asp:ListItem Text="0.80"></asp:ListItem>
                    <asp:ListItem Text="1.00" Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="celdaValor">
                <asp:TextBox ID="FFO_TBox" Text="1.00" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
            </td>
            <td class="celdaValor">
                <asp:TextBox ID="FSu_TBox" Text="1.00" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
            </td>
            <td class="celdaValor">
                <asp:TextBox ID="FTo_TBox" Text="1.00" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
            </td>
            <td class="celdaValor">
                <asp:TextBox ID="FUs" Text="1.00" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
            </td>
            <td class="celdaValor">
                <asp:TextBox ID="FLo_TBox" Text="1.00" runat="server" SkinID="NumeroCompacto"></asp:TextBox>
            </td>
            <td class="celdaValor">
                <asp:Label ID="FRe_Lbl" runat="server"></asp:Label>
            </td>
            <td class="celdaValor">
                <asp:Label ID="FRER_Lbl" runat="server"></asp:Label>
            </td>
            <td class="celdaValor">
                <asp:Label ID="VUTH_Lbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="celdaTituloSec" align="right" colspan="13">
                Valor unitario de terreno homologado:
            </td>
            <td class="celdaValor">
                <asp:Label ID="VUTHP_Lbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="celdaTituloSec" align="right" colspan="13">
                Valor unitario de terreno a aplicar:
            </td>
            <td class="celdaValor">
                <asp:Label ID="VUTHA_Lbl" runat="server"></asp:Label>
            </td>
        </tr>
</table>
