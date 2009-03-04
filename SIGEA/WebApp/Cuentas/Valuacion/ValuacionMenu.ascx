<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ValuacionMenu.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_ValuacionMenu" %>
<div class="menuPrincipal">
    <asp:Image ID="logo_Ima" runat="server" ImageUrl="~/Images/VIASC.gif" CssClass="logo" />
    <div class="item">
        <span class="l"></span>
        <span class="m">
            <asp:Image ID="bandejas_Ima" runat="server" ImageUrl="~/Images/Icons/Bandejas.gif" />
            <asp:LinkButton ID="bandejas_LkBtn" runat="server" Text="Bandejas" PostBackUrl="~/Cuentas/Valuacion/Bandejas.aspx" />
        </span>
        <span class="r"></span>
    </div>
    <div class="item">
        <span class="l"></span>
        <span class="m">
            <asp:Image ID="alta_Ima" runat="server" ImageUrl="~/Images/Icons/AltaAvaluo.gif" />
            <asp:LinkButton ID="alta_LkBtn" runat="server" Text="Alta avalúo" PostBackUrl="~/Cuentas/Valuacion/AvaluoAlta.aspx" />
        </span>
        <span class="r"></span>            
    </div>
</div>
