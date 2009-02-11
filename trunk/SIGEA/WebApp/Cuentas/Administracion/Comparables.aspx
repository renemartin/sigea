<%@ Page Title="SIGEA - Comparables" Language="C#" MasterPageFile="~/Cuentas/Administracion/Administracion.master"
    AutoEventWireup="true" CodeFile="Comparables.aspx.cs" Inherits="Cuentas_Administracion_Comparables" %>


<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="server">
    <asp:ScriptManager ID="scriptManager" runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/MethodCallers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Comparables.js" />
             <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/SelectFiller.js" />
        </Scripts>
    </asp:ScriptManager>
    
    <script type ="text/javascript">
        var tipoComparable_ID = '<%= filtroComparables_DDList.ClientID %>';
//        fillTipoComparables(tipoComparable_ID);
    </script>
    <h1>Comparables</h1>
    <table>
        <tr>
            <td class="celdaTitulo">
                Comparables:
            </td>
            <td class="celdaValor">
                <asp:DropDownList ID="filtroComparables_DDList" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</asp:Content>