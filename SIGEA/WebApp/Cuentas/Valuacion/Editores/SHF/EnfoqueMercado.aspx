<%@ Page Title="SIGEA - Editor SHF - Enfoque de mercado" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master" AutoEventWireup="true" CodeFile="EnfoqueMercado.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_EnfoqueMercado" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueMercadoHomologacion.ascx" TagName="Homologacion" TagPrefix="SIGEA" %>  

<asp:Content ID="headContent" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript">
        // Variables
        var idAvaluo = 0;

        // Inicialización
        function setupForm() {
            var link = $get("ctl00_menu_Ctrl_enfoqueMercado_LkBtn")
            link.removeAttribute("href");
            link.setAttribute("class", "current");
            link.setAttribute("className", "current");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_homologacion'));
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;
            loadDatosHomologacion();
        }
        function loadDatosHomologacion() {
            loadMercadoHomologacionAsync(idAvaluo, homologacion_Ctrl);
        }
        
        // Guardado de registros
        function saveForm() {
            if (getVisibility($get("<%= guardar_homologacion_ImBtn.ClientID %>")))
                saveDatosHomologacion(false);
        }
        
        function saveDatosHomologacion(mostrarAlertas) {
            if (homologacion_Ctrl.validate()) {
                saveMercadoHomologacionAsync(
                    idAvaluo, homologacion_Ctrl.getData(), saveDatosHomologacion_Success);
            }
            else {
                if (mostrarAlertas != false) {
                    showMessage("El bloque de datos contiene campos inválidos");
                }
            }
        }
        function saveDatosHomologacion_Success() {
            terminateEdit("form_homologacion",
                "<%= editar_homologacion_ImBtn.ClientID %>",
                "<%= guardar_homologacion_ImBtn.ClientID %>",
                "<%= cancelar_homologacion_ImBtn.ClientID %>");
        }            
        
    </script>

</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" Runat="Server">
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
            <asp:ScriptReference Path="~/Scripts/Validation.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Enfoques.js" />
        </Scripts>
    </asp:ScriptManager>
  
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

