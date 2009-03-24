<%@ Page Title="SIGEA - Editor SHF - Enfoque de costos" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master"
    AutoEventWireup="true" CodeFile="EnfoqueCostos.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_EnfoqueCostos" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueCostosHomologacion.ascx" TagName="Homologacion" TagPrefix="SIGEA" %>  
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueCostosTerreno.ascx" TagName="Terreno" TagPrefix="SIGEA" %>  
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueCostosConstrucciones.ascx" TagName="Construcciones" TagPrefix="SIGEA" %>  
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueCostosInstalaciones.ascx" TagName="Instalaciones" TagPrefix="SIGEA" %>  

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="Server">
    
    <h1>Enfoque de costos</h1>
    
    <h2>Homologación</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_homologacion_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_homologacion" class="formulario">        
        <SIGEA:Homologacion ID="homologacion_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_homologacion_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_homologacion_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <hr />
    
    <h1>Aplicación del enfoque</h1>
    
    <h2>Terreno</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_terreno_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_terreno" class="formulario">
        <SIGEA:Terreno ID="terreno_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_terreno_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_terreno_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <hr />
    
    <h2>Construcciones</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_construcciones_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_construcciones" class="formulario">
        <SIGEA:Construcciones ID="construcciones_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_construcciones_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_construcciones_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <hr />
    
    <h2>Instalaciones</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_instalaciones_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_instalaciones" class="formulario">
        <SIGEA:Instalaciones ID="instalaciones_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_instalaciones_Ctrl" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_instalaciones_Ctrl" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <hr />
        
    <div class="etiqueta1">
        <span class="textoNegritas">Resultado del enfoque:</span>
        <asp:Label ID="resultado_Lbl" runat="server"></asp:Label>
    </div>
        
    <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server"
        AnteriorURL="ElementosConstruccion.aspx" SiguienteURL="EnfoqueMercado.aspx" />        
        
</asp:Content>
