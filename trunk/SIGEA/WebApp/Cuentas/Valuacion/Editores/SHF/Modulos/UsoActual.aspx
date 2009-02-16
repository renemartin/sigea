<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UsoActual.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_Modulos_UsoActual" %>

<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosUsoActualDistribucion.ascx"
    TagName="DatosDistribucion" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosUsoActualRecamaras.ascx" TagName="DatosRecamara"
    TagPrefix="SIGEA" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head runat="server">
    <title>SIGEA - Editor SHF - Uso actual</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/Tables.js" />
        </Scripts>
    </asp:ScriptManager>
    <div class="modulo">
        <h1>
            Uso actual</h1>
        <div class="formulario">
            <h2>
                Distribución</h2>
            <SIGEA:DatosDistribucion ID="distribucion_Ctrl" runat="server" />
            <h2>
                Recamaras
            </h2>
            <SIGEA:DatosRecamara ID="recamaras_Ctrl" runat="server" />
            <h2>
                Plantas
            </h2>
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
        </div>
        <div class="barraMenu">
            <asp:ImageButton ID="save_ImBtn" runat="server" SkinID="Save" />
        </div>
    </div>
    </form>
</body>
</html>
