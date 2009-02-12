<%@ Page Title="SIGEA - Editor SHF - Elementos construcción" Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master" CodeFile="ElementosConstruccion.aspx.cs"
    Inherits="Cuentas_Valuacion_Editores_SHF_ElementosConstruccion" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosAcabados.ascx" TagName="DatosAcabados"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEstructuras.ascx" TagName="DatosEstructuras"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosInstalaciones.ascx" TagName="DatosInstalaciones"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosInstalacionesAdicionales.ascx"
    TagName="InstalacionesAdicionales" TagPrefix="SIGEA" %>
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
            <asp:ScriptReference Path="~/Scripts/Tables.js" />
            <asp:ScriptReference Path="~/Scripts/Forms.js" />
        </Scripts>
    </asp:ScriptManager>
    <div id="form_actions" class="barraAcciones">
        <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server" VisiblidadGuardar="false"
            VisiblidadCancelar="false" />
    </div>
    <h1>
        Acabados y estructuras
    </h1>
    <div id="form_acabados" class="formulario">
        <h2>
            Estructuras
        </h2>
        <SIGEA:DatosEstructuras ID="datosEstructuras_Ctrl" runat="server" />
        <h2>
            Acabados
        </h2>
        <SIGEA:DatosAcabados ID="datosAcabados_Ctrl" runat="server" />
    </div>
    <h1>
        Instalaciones
    </h1>
    <div id="form_instalaciones" class="formulario">
        <SIGEA:DatosInstalaciones ID="instalaciones_Ctrl" runat="server" />
        <h2>
            Instalaciones especiales</h2>
        <h3>
            Instalaciones privativas</h3>
        <SIGEA:InstalacionesAdicionales ID="instalacionesPrivativas_Ctrl" runat="server" />
        <h2>
            Obras complementarias</h2>
        <h3>
            Instalaciones comúnes</h3>
        <SIGEA:InstalacionesAdicionales ID="instalacionesComunes_Ctrl" runat="server" />
    </div>
</asp:Content>
