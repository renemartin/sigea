﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ValuadorMenu.ascx.cs"
    Inherits="Cuentas_Administracion_ValuadorMenu" %>
<div class="submenu" id="submenu_valuador" style="display:none;">
    <ul>
        <li>
            <asp:LinkButton ID="registro_LkBtn" runat="server" Text="Datos generales" PostBackUrl="~/Cuentas/Administracion/ValuadorRegistro.aspx" /></li>
        <li>
            <asp:LinkButton ID="formacion_LkBtn" runat="server" Text="Formación" /></li>
        <li>
            <asp:LinkButton ID="paqueteria_LkBtn" runat="server" Text="Paquetería" /></li>
        <li>
            <asp:LinkButton ID="facturacion_LkBtn" runat="server" Text="Facturación" /></li>
        <li>
            <asp:LinkButton ID="depositos_LkBtn" runat="server" Text="Depósitos" /></li>
    </ul>
</div>
