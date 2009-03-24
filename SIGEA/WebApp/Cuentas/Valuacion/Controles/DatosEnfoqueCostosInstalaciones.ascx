<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEnfoqueCostosInstalaciones.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosInstalaciones" %>

<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueCostosTablaInstalaciones.ascx" TagName="TablaInstalaciones" TagPrefix="SIGEA" %>

<h3>Instalaciones privativas</h3>
<SIGEA:TablaInstalaciones ID="instalacionesPrivativas_Ctrl" runat="server" />

<h3>Instalaciones comúnes</h3>
<SIGEA:TablaInstalaciones ID="instalacionesComunes_Ctrl" runat="server" />

<div style="text-align: right; padding-top:10px;">
    <span class="textoNegritas">Valor total de las instalaciones:</span>
    <asp:Label ID="totalInstalaciones_Lbl" runat="server"></asp:Label>
</div>
