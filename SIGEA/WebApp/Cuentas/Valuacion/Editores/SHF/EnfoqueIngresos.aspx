<%@ Page Title="SIGEA - Editor SHF - Enfoque de ingresos" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master" AutoEventWireup="true" CodeFile="EnfoqueIngresos.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_EnfoqueIngresos" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueIngresosHomologacion.ascx" TagName="Homologacion" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueIngresosAnalisisCapitalizacion.ascx" TagName="Capitalizacion" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueIngresosAnalisisDeducciones.ascx" TagName="Deducciones" TagPrefix="SIGEA" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" Runat="Server">

    <h1>Enfoque de ingresos</h1>
    
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
    
    <h2>Análisis de capitalización</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_capitalizacion_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_capitalizacion" class="formulario">        
        <SIGEA:Capitalizacion ID="capitalizacion_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_capitalizacion_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_capitalizacion_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <hr />
    
    <h2>Análisis de deducciones</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_deducciones_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_deducciones" class="formulario">        
        <SIGEA:Deducciones ID="deducciones_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_deducciones_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_deducciones_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <hr />

    <div class="etiqueta1">
        <span class="textoNegritas">Resultado del enfoque:</span>
        <asp:Label ID="resultado_Lbl" runat="server"></asp:Label>
    </div>
    
    <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server"
        AnteriorURL="EnfoqueMercado.aspx" SiguienteVisible="false" />

</asp:Content>

