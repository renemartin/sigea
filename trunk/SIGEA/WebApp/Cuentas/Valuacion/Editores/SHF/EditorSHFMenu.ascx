<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorSHFMenu.ascx.cs"
    Inherits="Cuentas_Valuacion_Editores_SHF_EditorSHFMenu" %>

<div class="menu">
    <ul>
        <li>
            <asp:LinkButton ID="avaluo_LkBtn" runat="server" Text="Datos avalúo" 
                PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/DatosAvaluo.aspx" /></li>
        <li>
            <asp:LinkButton ID="inmueble_LkBtn" runat="server" Text="Datos inmueble" 
                PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/DatosInmueble.aspx" /></li>
        <li>
            <asp:LinkButton ID="entorno_LkBtn" runat="server" Text="Datos entorno" 
                PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/Entorno.aspx" /></li>
        <li>
            <asp:LinkButton ID="usoActual_LkBtn" runat="server" Text="Uso actual" 
                PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/UsoActual.aspx" /></li>
        <li>
            <asp:LinkButton ID="construcciones_LkBtn" runat="server" Text="Descripción construcciones"
                PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/Construcciones.aspx" /></li>
        <li>
            <asp:LinkButton ID="elementos_LkBtn" runat="server" Text="Elementos construcción"
                PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/ElementosConstruccion.aspx" /></li>
        <li>
            <asp:LinkButton ID="enfoqueCostos_LkBtn" runat="server" Text="Enfoque costos"
                PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/EnfoqueCostos.aspx" /></li>
        <li>
            <asp:LinkButton ID="enfoqueMercado_LkBtn" runat="server" Text="Enfoque mercado"
                PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/EnfoqueMercado.aspx" /></li>
        <li>
            <asp:LinkButton ID="enfoqueIngresos_LkBtn" runat="server" Text="Enfoque ingresos"
                PostBackUrl="~/Cuentas/Valuacion/Editores/SHF/EnfoqueIngresos.aspx" /></li>                                                
    </ul>
</div>
