<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEnfoqueCostosTablaConstrucciones.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosEnfoqueCostosTablaConstrucciones" %>

<table class="tablaCompactaExtendida">
    <tr>
        <td class="celdaTituloSec">
            Descripción
        </td>
        <td class="celdaTituloSec">
            Superficie (m²)
        </td>
        <td class="celdaTituloSec">
            Valor unitario de reposición nuevo
        </td>
        <td class="celdaTituloSec">
            Depreciación
        </td>
        <td class="celdaTituloSec">
            Valor unitario Neto de Reposición
        </td>
        <td class="celdaTituloSec">
            Valor Parcial
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:Label ID="descripcion_Label" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">
            <asp:Label ID="superficie_Label" runat="server"></asp:Label>
            &nbsp;<span class="textoChico"> m²</span>
        </td>
        <td class="celdaValor">            
           <asp:TextBox ID="valorUnitarioReposicionNuevo_Label" runat="server" 
                SkinID="Compacto"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <asp:Label ID="depreciacion_Label" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">            
            <asp:Label ID="valorUnitarioNetoReposicion_Label" runat="server"></asp:Label>
        </td>
        <td class="celdaValor">            
            <asp:Label ID="valorParcial_Label" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="celdaValor" colspan="6">
            <asp:CheckBox ID="aplicarIndiviso_CBox" Text="¿Aplicar el indiviso?" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo" align="right" colspan="5">
            Valor total:        
        </td>
        <td class="celdaValor">            
            <asp:Label ID="VCC_Label" runat="server"></asp:Label>
        </td>
    </tr>    
</table>