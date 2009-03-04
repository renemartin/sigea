<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ValuacionMenu.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_ValuacionMenu" %>
<link href="~/App_Themes/Default/DefaultStyle.css" rel="stylesheet" type="text/css" />
<div class="menu">
    <ul>
        <li>
            <asp:LinkButton ID="bandejas_LkBtn" runat="server" Text="Bandejas" PostBackUrl="~/Cuentas/Valuacion/Bandejas.aspx" /></li>
        <li>
            <asp:LinkButton ID="alta_LkBtn" runat="server" Text="Alta avalúo" PostBackUrl="~/Cuentas/Valuacion/AvaluoAlta.aspx" /></li>
    </ul>
</div>
