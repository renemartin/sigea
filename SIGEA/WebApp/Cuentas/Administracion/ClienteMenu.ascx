<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ClienteMenu.ascx.cs" Inherits="Cuentas_Administracion_ClienteMenu" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<div class="submenu" id="submenu_cliente">
    <ul>
        <li>
            <asp:LinkButton ID="registro_LkBtn" runat="server" Text="Datos generales" PostBackUrl="~/Cuentas/Administracion/ClienteRegistro.aspx" /></li>
        <li>
            <asp:LinkButton ID="paqueteria_LkBtn" runat="server" Text="Paquetería" /></li>
        <li>
            <asp:LinkButton ID="facturacion_LkBtn" runat="server" Text="Facturación" /></li>
        <li>
            <asp:LinkButton ID="depositos_LkBtn" runat="server" Text="Depósitos" /></li>
    </ul>
</div>
