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
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;
        var num_bloques_datos = 3;

        // Inicialización
        function setupForm() {
            var link = $get("ctl00_menu_Ctrl_construcciones_LkBtn")
            link.removeAttribute("href");
            link.setAttribute("class", "current");
            link.setAttribute("className", "current");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_clasificacion'));
            disableControls($get('form_construcciones'));
            disableControls($get('form_superficies'));

            setupTablaConstrucciones();
            setupTablaSuperficiesAdicionales("<%= superficies_Ctrl.SuperficiesConstruccionesID %>");
            setupTablaSuperficiesAdicionales("<%= superficies_Ctrl.SuperficiesObrasID %>");
        }

        // Llenado de datos
        function fillData() {
            fillConstruccionesData();
            fillConstruccionesClasificacionData();
            fillSuperficiesData();
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosClasificaciones();
            loadDatosConstrucciones();
            loadDatosSuperficies();
        }
        function loadDatosClasificaciones() {
            //TODO: Cargar datos de clasificaciones
            loadForm_Success() // Temporal
        }
        function loadDatosConstrucciones() {
            //TODO: Cargar datos de construcciones
            loadForm_Success() // Temporal
        }
        function loadDatosSuperficies() {
            //TODO: Cargar datos de superficies
            loadForm_Success() // Temporal
        }
        function loadForm_Success() {
            if (num_bloques_cargados != undefined) {
                num_bloques_cargados++;
                if (num_bloques_cargados == num_bloques_datos) {
                    getInmuebleEscondominalAsync(
                        idAvaluo, setVisibilidadCondominal);
                    fillData();
                }
            }
        }

        // Guardado de registros
        function saveForm() {
            if (getVisibility($get("<%= guardar_clasificacion_ImBtn.ClientID %>")))
                saveClasificacion();
            if (getVisibility($get("<%= guardar_construcciones_ImBtn.ClientID %>")))
                saveConstrucciones();
            if (getVisibility($get("<%= guardar_superficies_ImBtn.ClientID %>")))
                saveSuperficies();
        }
        function saveClasificacion() {
        }
        function saveClasificacion_Success() {
            terminateEdit("form_clasificacion",
                "<%= editar_clasificacion_ImBtn.ClientID %>",
                "<%= guardar_clasificacion_ImBtn.ClientID %>",
                "<%= cancelar_clasificacion_ImBtn.ClientID %>");
        }

        function saveConstrucciones() {
        }
        function saveConstrucciones_Success() {
            terminateEdit("form_construcciones",
                "<%= editar_construcciones_ImBtn.ClientID %>",
                "<%= guardar_construcciones_ImBtn.ClientID %>",
                "<%= cancelar_construcciones_ImBtn.ClientID %>");
        }

        function saveSuperficies() {
        }
        function saveSuperficies_Success() {
            terminateEdit("form_superficies",
                "<%= editar_superficies_ImBtn.ClientID %>",
                "<%= guardar_superficies_ImBtn.ClientID %>",
                "<%= cancelar_superficies_ImBtn.ClientID %>");
        }

        // Visibilidad secciones
        function setVisibilidadCondominal(visible) {
            if (visible) {
                showDatosConstruccionesCondominio();
                showDatosSuperficiesCondominio();
            }
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
            <asp:ScriptReference Path="~/Scripts/Entities/Inmuebles.js" />
        </Scripts>
    </asp:ScriptManager>
    <SIGEA:EditorSHFNavegador ID="EditorSHFNavegador1" runat="server" />
    <h1>
        Descripción de las construcciones
    </h1>
    <div class="etiqueta1">
        <span class="textoNegritas">Descripción de uso actual:</span>
        <asp:Label ID="descripcion_Lbl" runat="server">No especificada...</asp:Label>        
    </div>
    <h2>Clasificación de las construcciones privativas</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_clasificacion_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_clasificacion" class="formulario">
        <SIGEA:ConstruccionesClasificacion ID="construccionesClasificacion_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_clasificacion_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_clasificacion_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
    <hr />
    <h2>Datos generales de las construcciones</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_construcciones_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_construcciones" class="formulario">
        <SIGEA:Construcciones ID="construcciones_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_construcciones_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_construcciones_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
    <hr />
    <h2>Datos de superficies</h2>
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
</asp:Content>
