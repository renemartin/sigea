<%@ Page Title ="SIGEA - Tipos de Comparables" Language="C#" MasterPageFile="~/Cuentas/Administracion/Administracion.master"
AutoEventWireup="true" CodeFile="TipoComparable.aspx.cs" Inherits="Cuentas_Administracion_TipoComparable" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="server">
    <h1>Tipos de Comparables</h1>
    <table>
        <tr>
            <td class="celdaTitulo">
                Comparable:
            </td>
            <td class="celdaValor">
                <asp:DropDownList ID="filter_TipoComparable_DDList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    
</asp:Content>