﻿<%@ Page Title="SIGEA - Editor SHF - Enfoque de mercado" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master" AutoEventWireup="true" CodeFile="EnfoqueMercado.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_EnfoqueMercado" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueMercadoHomologacion.ascx" TagName="Homologacion" TagPrefix="SIGEA" %>  

<asp:Content ID="headContent" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" Runat="Server">

    <h1>Enfoque de mercado</h1>
    
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

    <div class="etiqueta1">
        <span class="textoNegritas">Resultado del enfoque:</span>
        <asp:Label ID="resultado_Lbl" runat="server"></asp:Label>
    </div>
    
    <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server"
        AnteriorURL="EnfoqueCostos.aspx" SiguienteURL="EnfoqueIngresos.aspx" />

</asp:Content>
