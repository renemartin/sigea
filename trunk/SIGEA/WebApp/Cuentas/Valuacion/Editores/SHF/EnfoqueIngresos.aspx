<%@ Page Title="SIGEA - Editor SHF - Enfoque de ingresos" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master" AutoEventWireup="true" CodeFile="EnfoqueIngresos.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_EnfoqueIngresos" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueIngresosHomologacion.ascx" TagName="Homologacion" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueIngresosAnalisisCapitalizacion.ascx" TagName="Capitalizacion" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueIngresosAnalisisDeducciones.ascx" TagName="Deducciones" TagPrefix="SIGEA" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript">
        // Variables
        var idAvaluo = 0;

        // Inicialización
        function setupForm() {
            var link = $get("ctl00_menu_Ctrl_enfoqueIngresos_LkBtn")
            link.removeAttribute("href");
            link.setAttribute("class", "current");
            link.setAttribute("className", "current");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_homologacion'));
            disableControls($get('form_capitalizacion'));
            disableControls($get('form_deducciones'));
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosHomologacion();
            loadDatosCapitalizacion();
            loadDatosDeducciones();
        }
        function loadDatosHomologacion() {
            loadIngresosHomologacionAsync(idAvaluo, homologacion_Ctrl);
        }
        function loadDatosCapitalizacion() {
            loadIngresosCapitalizacionAsync(idAvaluo, capitalizacion_Ctrl);
        }
        function loadDatosDeducciones() {
            loadIngresosDeduccionesAsync(idAvaluo, deducciones_Ctrl);
        }

        // Guardado de registros
        function saveForm() {
            if (getVisibility($get("<%= guardar_homologacion_ImBtn.ClientID %>")))
                saveDatosHomologacion(false);
            if (getVisibility($get("<%= guardar_capitalizacion_ImBtn.ClientID %>")))
                saveDatosCapitalizacion(false);
            if (getVisibility($get("<%= guardar_deducciones_ImBtn.ClientID %>")))
                saveDatosDeducciones(false);
        }
        //// Homologación
        function saveDatosHomologacion(mostrarAlertas) {
            if (homologacion_Ctrl.validate()) {
                saveIngresosHomologacionAsync(
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
        //// Capitalización
        function saveDatosCapitalizacion(mostrarAlertas) {
            if (capitalizacion_Ctrl.validate()) {
                saveIngresosCapitalizacionAsync(
                    idAvaluo, capitalizacion_Ctrl.getData(), saveDatosCapitalizacion_Success);
            }
            else {
                if (mostrarAlertas != false) {
                    showMessage("El bloque de datos contiene campos inválidos");
                }
            }
        }
        function saveDatosCapitalizacion_Success() {
            terminateEdit("form_capitalizacion",
                "<%= editar_capitalizacion_ImBtn.ClientID %>",
                "<%= guardar_capitalizacion_ImBtn.ClientID %>",
                "<%= cancelar_capitalizacion_ImBtn.ClientID %>");
        }
        //// Deducciones
        function saveDatosDeducciones(mostrarAlertas) {
            if (deducciones_Ctrl.validate()) {
                saveIngresosDeduccionesAsync(
                    idAvaluo, deducciones_Ctrl.getData(), saveDatosDeducciones_Success);
            }
            else {
                if (mostrarAlertas != false) {
                    showMessage("El bloque de datos contiene campos inválidos");
                }
            }
        }
        function saveDatosDeducciones_Success() {
            terminateEdit("form_deducciones",
                "<%= editar_deducciones_ImBtn.ClientID %>",
                "<%= guardar_deducciones_ImBtn.ClientID %>",
                "<%= cancelar_deducciones_ImBtn.ClientID %>");
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
    
    <div class="etiqueta1">
        <span class="textoNegritas">Resultado del enfoque:</span>
        <asp:Label ID="resultado_Lbl" runat="server"></asp:Label>
    </div>
    
    <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server"
        AnteriorURL="EnfoqueMercado.aspx" SiguienteVisible="false" />

</asp:Content>

