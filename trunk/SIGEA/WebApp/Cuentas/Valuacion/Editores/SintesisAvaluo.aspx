<%@ Page Title="" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Valuacion.master"
    AutoEventWireup="true" CodeFile="SintesisAvaluo.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SintesisAvaluo" %>

<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosSintesisAvaluo.ascx" TagName="DatosSintesisAvaluo"
    TagPrefix="SIGEA" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/MethodCallers.asmx" />
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/DataFillers.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Avaluos.js" />
        </Scripts>
    </asp:ScriptManager>
    
    
    <h1>
        Síntesis del avalúo</h1>
    <div class="formulario">
        <SIGEA:DatosSintesisAvaluo ID="datosSintesis_Ctrl" runat="server" />
    </div>
</asp:Content>
