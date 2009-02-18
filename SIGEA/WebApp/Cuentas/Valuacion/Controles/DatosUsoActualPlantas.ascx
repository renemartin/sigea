<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosUsoActualPlantas.ascx.cs"
    Inherits="Cuentas_Valuacion_Controles_DatosUsoActualPlantas" %>
<table>
    <tr>
        <td class="celdaHeader" colspan="4">
            Planta baja
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="PB_vestibuloIngreso_CBox" Text="Vestibulo de ingreso" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PB_escaleraPrincipal_CBox" Text="Escalera principal" runat="server" />
        </td>
        <td class="celdaValor" colspan="2">
            <asp:CheckBox ID="PB_sala_CBox" Text="Sala" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="PB_cuartoServicio_CBox" Text="Cuarto de servicio" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PB_cuartoLavado_CBox" Text="Cuarto de lavado" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PB_areaServicioDescubierta_CBox" Text="Area de servicio descubierta"
                runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PB_escaleraServicio_CBox" Text="Escalera de servicio" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaHeader" colspan="4">
            Planta alta
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="PA_cuartoServicio_CBox" Text="Cuarto de servicio" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PA_cuartoLavado_CBox" Text="Cuarto de lavado" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PA_areaServicioDescubierta_CBox" Text="Area de servicio descubierta"
                runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="PA_escaleraServicio_CBox" Text="Escalera de servicio" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaHeader" colspan="4">
            Otros niveles
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="ON_cuartoServicio_CBox" Text="Cuarto de servicio" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="ON_cuartoLavado_CBox" Text="Cuarto de lavado" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="ON_areaServicioDescubierta_CBox" Text="Area de servicio descubierta"
                runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="ON_escaleraServicio_CBox" Text="Escalera de servicio" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="celdaHeader" colspan="3">
            Sotano
        </td>
    </tr>
    <tr>
        <td class="celdaValor">
            <asp:CheckBox ID="SOT_cuartoServicio_CBox" Text="Cuarto de servicio" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="SOT_cuartoLavado_CBox" Text="Cuarto de lavado" runat="server" />
        </td>
        <td class="celdaValor">
            <asp:CheckBox ID="SOT_escaleraServicio_CBox" Text="Escalera de servicio" runat="server" />
        </td>
    </tr>
</table>
