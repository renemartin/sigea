<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEnfoqueCostosTablaInstalaciones.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosEnfoqueCostosTablaInstalaciones" %>

<table class="tablaCompactaExtendida">
    <tr>
        <td class="celdaTituloSec">
            Descripción
        </td>
        <td class="celdaTituloSec">
            Cantidad
        </td>
        <td class="celdaTituloSec">
            Unidad
        </td>
        <td class="celdaTituloSec">
            Valor unitario de reposición nuevo
        </td>
        <td class="celdaTituloSec">
            Depreciación
        </td>
        <td class="celdaTituloSec">
            Valor unitario neto de reposición
        </td>
        <td class="celdaTituloSec">
            Valor parcial
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:Label ID="Descripcion_Label" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="Cantidad_Label" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="Unidad_Label" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="ValorUnitarioReposicionNuevo_TBox" runat="server" 
                SkinID="Compacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:Label ID="Depreciacion_Label" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="ValorUnitarioNetoReposicion_Label" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="ValorParcial_Label" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo" align="right" colspan="6">
            Valor total:
        </td>    
        <td class="celdaValor">
            <asp:Label ID="ValorTotalInstalaciones_Label" runat="server"></asp:Label>
        </td>
    </tr>
</table>