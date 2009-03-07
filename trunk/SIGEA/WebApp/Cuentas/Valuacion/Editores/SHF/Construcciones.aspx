<%@ Page Title="SIGEA - Editor SHF - Construcciones" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master"
    AutoEventWireup="true" CodeFile="Construcciones.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_Construcciones" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosConstrucciones.ascx" TagName="Construcciones"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosConstruccionesClasificacion.ascx"
    TagName="ConstruccionesClasificacion" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosSuperficies.ascx" TagName="Superficies"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosCondominio.ascx" TagName="Condominio"
    TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;

        // Inicialización
        function setupForm() {
            var link = $get("ctl00_menu_Ctrl_construcciones_LkBtn")
            link.removeAttribute("href");
            link.setAttribute("class", "current");
            link.setAttribute("className", "current");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_construcciones'));
            disableControls($get('form_superficies'));
            disableControls($get('form_condominio'));
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosConstrucciones();
            loadDatosSuperficies();
            loadDatosCondominio();
            getDescripcionUsoActual(
                idAvaluo, $get("<%= descripcionUsoActual_Lbl.ClientID %>"));
        }
        function loadDatosConstrucciones() {
            loadDatosConstruccionesAsync(idAvaluo, construcciones_Ctrl);
            loadTiposConstruccionesAsync(idAvaluo, construccionesClasificacion_Ctrl);
        }
        function loadDatosSuperficies() {
            loadSuperficiesInmuebleAsync(idAvaluo, superficies_Ctrl);
        }
        function loadDatosCondominio() {
            loadDatosCondominioAsync(idAvaluo, condominio_Ctrl);
        }

        // Guardado de registros
        function saveForm() {
            if (getVisibility($get("<%= guardar_construcciones_ImBtn.ClientID %>")))
                saveDatosConstrucciones(false);
            if (getVisibility($get("<%= guardar_superficies_ImBtn.ClientID %>")))
                saveSuperficies(false);
            if (getVisibility($get("<%= guardar_condominio_ImBtn.ClientID %>")))
                saveCondominio(false);
        }

        function saveDatosConstrucciones(mostrarAlertas) {
            var clasificacion_valid = construccionesClasificacion_Ctrl.validate()
            var construcciones_valid = construcciones_Ctrl.validate()

            if (clasificacion_valid && construcciones_valid) {
                saveDatosConstruccionesAsync(
                    idAvaluo
                    , construccionesClasificacion_Ctrl.getData()
                    , construcciones_Ctrl.getData()
                    , saveDatosConstrucciones_Success);
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

        function saveSuperficies(mostrarAlertas) {
            if (superficies_Ctrl.validate()) {
                saveSuperficiesInmuebleAsync(
                    idAvaluo, superficies_Ctrl.getData(), saveSuperficies_Success);
            }
            else {
                if (mostrarAlertas != false) {
                    showMessage("El bloque de datos contiene campos inválidos");

                }
            }
        }
        function saveSuperficies_Success() {        
            terminateEdit("form_superficies",
                "<%= editar_superficies_ImBtn.ClientID %>",
                "<%= guardar_superficies_ImBtn.ClientID %>",
                "<%= cancelar_superficies_ImBtn.ClientID %>");
        }

        function saveCondominio(mostrarAlertas) {
            if (condominio_Ctrl.validate()) {
                saveDatosCondominioAsync(
                    idAvaluo, condominio_Ctrl.getData(), saveCondominio_Success);
            }
            else {
                if (mostrarAlertas != false) {
                    showMessage("El bloque de datos contiene campos inválidos");

                }
            }
        }
        function saveCondominio_Success() {
            terminateEdit("form_condominio",
                "<%= editar_condominio_ImBtn.ClientID %>",
                "<%= guardar_condominio_ImBtn.ClientID %>",
                "<%= cancelar_condominio_ImBtn.ClientID %>");
        }
    </script>

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
            <asp:ScriptReference Path="~/Scripts/Validation.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Construcciones.js" />
        </Scripts>
    </asp:ScriptManager>    
    <h1>
        Descripción de las construcciones
    </h1>
    <div class="etiqueta1">
        <span class="textoNegritas">Descripción de uso actual:</span>
        <asp:Label ID="descripcionUsoActual_Lbl" CssClass="textoChico" runat="server" />
    </div>
    <h2>
        Clasificación de las construcciones privativas</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_construcciones_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_construcciones" class="formulario">
        <SIGEA:ConstruccionesClasificacion ID="construccionesClasificacion_Ctrl" runat="server" />
        <hr />
        <h2>
            Datos generales de las construcciones</h2>
        <SIGEA:Construcciones ID="construcciones_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_construcciones_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_construcciones_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
    <hr />
    <h2>
        Datos de superficies</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_superficies_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_superficies" class="formulario">
        <SIGEA:Superficies ID="superficies_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_superficies_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_superficies_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <hr />
    <h1>
        Datos del condominio</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_condominio_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_condominio" class="formulario">
        <SIGEA:Condominio ID="condominio_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_condominio_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_condominio_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server"
        AnteriorURL="UsoActual.aspx" SiguienteURL="ElementosConstruccion.aspx" />
</asp:Content>
