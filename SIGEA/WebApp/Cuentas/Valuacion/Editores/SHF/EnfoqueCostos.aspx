<%@ Page Title="SIGEA - Editor SHF - Enfoque de costos" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master"
    AutoEventWireup="true" CodeFile="EnfoqueCostos.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_EnfoqueCostos" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueCostosHomologacion.ascx" TagName="Homologacion" TagPrefix="SIGEA" %>  
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueCostosTerreno.ascx" TagName="Terreno" TagPrefix="SIGEA" %>  
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueCostosConstrucciones.ascx" TagName="Construcciones" TagPrefix="SIGEA" %>  
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEnfoqueCostosInstalaciones.ascx" TagName="Instalaciones" TagPrefix="SIGEA" %>  

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;

        // Inicialización
        function setupForm() {
            var link = $get("ctl00_menu_Ctrl_enfoqueCostos_LkBtn")
            link.removeAttribute("href");
            link.setAttribute("class", "current");
            link.setAttribute("className", "current");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_homologacion'));
            disableControls($get('form_terreno'));
            disableControls($get('form_construcciones'));
            disableControls($get('form_instalaciones'));
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosHomologacion();
            loadDatosTerreno();
            loadDatosConstrucciones();
            loadDatosInstalaciones();
        }
        function loadDatosHomologacion() {
            loadDatosCostosHomologacionAsync(idAvaluo, homologacion_Ctrl);
        }
        function loadDatosTerreno() {
            loadDatosCostosTerrenoAsync(idAvaluo, terreno_Ctrl);
        }
        function loadDatosConstrucciones() {
            loadDatosCostosConstruccionesAsync(idAvaluo, construcciones_Ctrl);
        }
        function loadDatosInstalaciones() {
            loadDatosCostosInstalacionesAsync(idAvaluo, instalaciones_Ctrl);
        }

        // Guardado de registros
        function saveForm() {
            if (getVisibility($get("<%= guardar_homologacion_ImBtn.ClientID %>")))
                saveDatosHomologacion(false);
            if (getVisibility($get("<%= guardar_terreno_ImBtn.ClientID %>")))
                saveDatosTerreno(false);
            if (getVisibility($get("<%= guardar_construcciones_ImBtn.ClientID %>")))
                saveDatosConstrucciones(false);
            if (getVisibility($get("<%= guardar_instalaciones_ImBtn.ClientID %>")))
                saveDatosInstalaciones(false);
        }
        //// Homologación
        function saveDatosHomologacion(mostrarAlertas) {
            if (homologacion_Ctrl.validate()) {
                saveCostosHomologacionAsync(
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
        //// Terreno
        function saveDatosTerreno(mostrarAlertas) {
            if (terreno_Ctrl.validate()) {
                saveCostosTerrenoAsync(
                    idAvaluo, terreno_Ctrl.getData(), saveDatosTerreno_Success);
            }
            else {
                if (mostrarAlertas != false) {
                    showMessage("El bloque de datos contiene campos inválidos");
                }
            }
        }
        function saveDatosTerreno_Success() {
            terminateEdit("form_terreno",
                "<%= editar_terreno_ImBtn.ClientID %>",
                "<%= guardar_terreno_ImBtn.ClientID %>",
                "<%= cancelar_terreno_ImBtn.ClientID %>");
        }
        //// Construcciones
        function saveDatosConstrucciones(mostrarAlertas) {
            if (construcciones_Ctrl.validate()) {
                saveCostosConstruccionesAsync(
                    idAvaluo, construcciones_Ctrl.getData(), saveDatosConstrucciones_Success);
            }
            else {
                if (mostrarAlertas != false) {
                    showMessage("El bloque de datos contiene campos inválidos");
                }
            }
        }
        function saveDatosConstrucciones_Success() {
            terminateEdit("form_construcciones",
                "<%= editar_construcciones_ImBtn.ClientID %>",
                "<%= guardar_construcciones_ImBtn.ClientID %>",
                "<%= cancelar_construcciones_ImBtn.ClientID %>");
        }
        // Instalaciones
        function saveDatosInstalaciones(mostrarAlertas) {
            if (instalaciones_Ctrl.validate()) {
                saveCostosInstalacionesAsync(
                    idAvaluo, instalaciones_Ctrl.getData(), saveDatosInstalaciones_Success);
            }
            else {
                if (mostrarAlertas != false) {
                    showMessage("El bloque de datos contiene campos inválidos");

                }
            }
        }
        function saveDatosInstalaciones_Success() {
            terminateEdit("form_instalaciones",
                "<%= editar_instalaciones_ImBtn.ClientID %>",
                "<%= guardar_instalaciones_ImBtn.ClientID %>",
                "<%= cancelar_instalaciones_ImBtn.ClientID %>");
        }       
        
    </script>

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
        <asp:ImageButton ID="guardar_instalaciones_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_instalaciones_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <hr />
        
    <div class="etiqueta1">
        <span class="textoNegritas">Resultado del enfoque:</span>
        <asp:Label ID="resultado_Lbl" runat="server"></asp:Label>
    </div>
        
    <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server"
        AnteriorURL="ElementosConstruccion.aspx" SiguienteURL="EnfoqueMercado.aspx" />        
        
</asp:Content>
