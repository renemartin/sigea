<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorSHFMenu.ascx.cs"
    Inherits="Cuentas_Valuacion_Editores_SHF_EditorSHFMenu" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<div class="menu">
    <ul>
        <li>
            <asp:LinkButton ID="avaluo_LkBtn" runat="server" Text="Datos avalúo" PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/DatosAvaluo.aspx" /></li>
        <li>
            <asp:LinkButton ID="inmueble_LkBtn" runat="server" Text="Datos inmueble" PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/DatosInmueble.aspx" /></li>
        <li>
            <asp:LinkButton ID="entorno_LkBtn" runat="server" Text="Datos entorno" PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/Entorno.aspx" /></li>
        <li>
            <asp:LinkButton ID="construcciones_LkBtn" runat="server" Text="Descripción construcciones"
                PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/Construcciones.aspx" /></li>
        <li>
            <asp:LinkButton ID="elementos_LkBtn" runat="server" Text="Elementos construcción"
                PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/ElementosConstruccion.aspx" /></li>
    </ul>
</div>
