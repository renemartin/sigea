<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosEnfoqueCostosConstrucciones.ascx.cs" Inherits="Cuentas_Valuacion_Controles_DatosEnfoqueCostosConstrucciones" %>

<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueCostosTablaConstrucciones.ascx" TagName="TablaConstrucciones" TagPrefix="SIGEA"  %>

<h3>Construcciones privativas</h3>
<SIGEA:TablaConstrucciones ID="construccionesPrivativas_Ctrl" runat="server" />

<h3>Construcciones comunes</h3>
<SIGEA:TablaConstrucciones ID="construccionesComunes_Ctrl" runat="server" />

<div style="text-align: right; padding-top:10px;">
    <span class="textoNegritas">Valor total de las construcciones:</span>
    <asp:Label ID="valorTotalConstrucciones_Lbl" runat="server"></asp:Label>
</div>