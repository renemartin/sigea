<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEnfoqueMercadoHomologacion.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosEnfoqueMercadoHomologacion" %>

<table class="tablaExtendida glosario">
    <tr>
        <td class="termino">
            FCom
        </td>
        <td class="definicion">
            Factor de Comercialización
        </td>
        <td class="termino">
            FCl
        </td>
        <td class="definicion">
            Factor de Clase
        </td>
        <td class="termino">
            FLo
        </td>
        <td class="definicion">
            Factor de Localización (Tipo de Colonia)
        </td>
    </tr>
    <tr>
        <td class="termino">
            FEd
        </td>
        <td class="definicion">
            Factor de Edad
        </td>
        <td class="termino">
            FUb
        </td>
        <td class="definicion">
            Factor de Ubicación en la Manzana (No. de Frentes)
        </td>
        <td class="termino">
            FSu
        </td>
        <td class="definicion">
            Factor de Superficie
        </td>
    </tr>
    <tr>
        <td class="termino">
            FCo
        </td>
        <td class="definicion">
            Factor de Conservación
        </td>
        <td class="termino">
            FPr
        </td>
        <td class="definicion">
            Factor de Proyecto o Avance de Obra
        </td>
        <td class="termino">
            FUs
        </td>
        <td class="definicion">
            Factor de Uso de Suelo
        </td>
    </tr>
</table>

<table class="tablaCompactaExtendida">
    <tr class="filaHeader">
        <td rowspan="2">
            FCom
        </td>
        <td rowspan="2">
            Valor ajustado
        </td>
        <td rowspan="2">
            Sup. vendible (m²)
        </td>
        <td rowspan="2">
            Valor unitario ajustado de venta
        </td>
        <td colspan="8">
            Factores de homologación
        </td>
        <td rowspan="2">
            FRe
        </td>
        <td rowspan="2">
            Valor unitario de venta homologado
        </td>
    </tr>
    <tr class="filaHeader">
        <td>
            FEd
        </td>
        <td>
            FCo
        </td>
        <td>
            FCl
        </td>
        <td>
            FUb
        </td>
        <td>
            FPr
        </td>
        <td>
            FLo
        </td>
        <td>
            FSu
        </td>
        <td>
            FUs
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:TextBox ID="FCom_TBox" runat="server" SkinID="NumeroCompacto">1.00</asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:Label ID="VA_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="supVendible_Lbl" runat="server"></asp:Label>
            &nbsp;(m²)</td>
        <td class="celdaValor">
            <asp:Label ID="VUAV_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FEd_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FCo_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FCl_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FUb_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="FPr_TBox" runat="server" SkinID="NumeroCompacto">1.00</asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="FLo_TBox" runat="server" SkinID="NumeroCompacto">1.00</asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="FSu_TBox" runat="server" SkinID="NumeroCompacto">1.00</asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="FUs_TBox" runat="server" SkinID="NumeroCompacto">1.00</asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:Label ID="FRe_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="VUVH_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="13" class="celdaTituloSec" align="right">
            Valor unitario de venta homologado promedio:
        </td>
        <td class="celdaValor">            
            <asp:Label ID="VUVHP_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="13" class="celdaTituloSec" align="right">
            Valor unitario de venta a aplicar:
        </td>
        <td class="celdaValor">
            <asp:Label ID="VUVA_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
    </table>

<div style="padding-top: 20px; padding-bottom: 20px;">
    <table>
        <tr>
            <td class="celdaTituloSec">
                Detalle sobre la utilización del factor de proyecto:
            </td>
        </tr>
        <tr>
            <td class="celdaValor">
                <asp:TextBox ID="detalleFactorProyecto_TBox" runat="server" Height="50px" TextMode="MultiLine"
                    Width="350px"></asp:TextBox>
            </td>
        </tr>
    </table>
</div>

<table class="tablaExtendida">
    <tr class="filaHeader">
        <td>
            Valor unitario de venta homologado promedio
        </td>
        <td>
            Valor unitario de venta aplicado
        </td>
        <td>
            Superficie vendible 
            &nbsp;<span class="textoChico">(m²)</span>
        </td>
        <td>
            Descripción
        </td>
        <td>
            Valor parcial
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:Label ID="valorUVHP_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="valorUVA_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="valorSupVendible_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="descripcion_Lbl" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="VP_Lbl" runat="server"></asp:Label>
        </td>
    </tr>
</table>