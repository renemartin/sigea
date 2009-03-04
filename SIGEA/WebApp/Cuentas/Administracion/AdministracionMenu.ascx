<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdministracionMenu.ascx.cs"
    Inherits="Cuentas_Administracion_AdministracionMenu" %>
    
<div class="menu" id="menu_administracion">
<ul>
    <li><asp:LinkButton ID="valuadores_LkBtn" runat="server" Text="Valuadores" PostBackUrl="~/Cuentas/Administracion/Valuadores.aspx" /></li>
    <li>
        <asp:LinkButton ID="clientes_LkBtn" runat="server" Text="Clientes" PostBackUrl="~/Cuentas/Administracion/Clientes.aspx" /></li>
    <li>
        <asp:LinkButton ID="personal_LkBtn" runat="server" Text="Personal" PostBackUrl="~/Cuentas/Administracion/Personal.aspx" /></li>
    </ul>
</div>
