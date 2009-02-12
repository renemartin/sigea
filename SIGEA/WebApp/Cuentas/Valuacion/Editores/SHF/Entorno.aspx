<%@ Page Title="SIGEA - Editor SHF - Entorno" Language="C#" AutoEventWireup="true"
    CodeFile="Entorno.aspx.cs" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master"
    Inherits="Cuentas_Valuacion_Editores_SHF_Entorno" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEntorno.ascx" TagName="DatosEntorno"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEntornoInfraestructura.ascx"
    TagName="Infraestructura" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEntornoServicios.ascx" TagName="Servicios"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEntornoEquipamiento.ascx" TagName="Equipamiento"
    TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="Server">
    <asp:ScriptManager ID="ScriptManager" runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/MethodCallers.asmx" />
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/DataFillers.js" />
            <asp:ScriptReference Path="~/Scripts/Forms.js" />
        </Scripts>
    </asp:ScriptManager>
    <div id="form_actions" class="barraAcciones">
        <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server" VisiblidadGuardar="false"
            VisiblidadCancelar="false" />
    </div>
    <h1>
        Datos del entorno</h1>
    <div id="form" class="formulario">
        <SIGEA:DatosEntorno ID="datosEntorno_Ctrl" runat="server" />
        <h2>
            Infraestructura disponible en la zona
        </h2>
        <SIGEA:Infraestructura ID="infraestructura_Ctrl" runat="server" />
        <h2>
            Otros Servicios</h2>
        <SIGEA:Servicios ID="servicios_Ctrl" runat="server" />
        <h2>
            Equipamiento urbano</h2>
        <SIGEA:Equipamiento ID="equipamiento_Ctrl" runat="server" />
    </div>
</asp:Content>
