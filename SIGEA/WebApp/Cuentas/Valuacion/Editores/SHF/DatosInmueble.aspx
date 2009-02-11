<%@ Page Title="SIGEA - Editor SHF - Datos Inmueble" Language="C#" AutoEventWireup="true"
    CodeFile="DatosInmueble.aspx.cs" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master"
    Inherits="Cuentas_Valuacion_Editores_SHF_DatosInmueble" %>

<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosGeneralesInmueble.ascx" TagName="DatosGeneralesInmueble"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosPropietario.ascx" TagName="DatosPropietario"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosTerreno.ascx" TagName="DatosTerreno"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosTerrenoCalles.ascx" TagName="DatosTerrenoCalles"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosTerrenoColindancias.ascx" TagName="Colindancias"
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
    <h1>
        Datos del inmueble</h1>
    <div id="form_inmueble" class="formulario">
        <SIGEA:DatosGeneralesInmueble ID="datosInmueble_Ctrl" runat="server" />
        <h2>
            Datos del propietario</h2>
        <SIGEA:DatosPropietario ID="datosPropietario_Ctrl" runat="server" />
    </div>
    <h1>
        Caracteristicas del terreno</h1>
    <div id="form_terreno" class="formulario">
        <SIGEA:DatosTerrenoCalles ID="datosTerrenoCalles_Ctrl" runat="server" />
        <SIGEA:DatosTerreno ID="datosTerreno_Ctrl" runat="server" />
        <h2>
            Medidas y colindancias
        </h2>
        <SIGEA:Colindancias ID="Colindancias_Ctrl" runat="server" />
    </div>
</asp:Content>
