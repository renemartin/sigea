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
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosSuperficiesAdicionales.ascx"
    TagName="SuperficiesAdicionales" TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;
        var num_bloques_datos = 3;

        // Inicialización
        function setupForm() {
            $get("ctl00_menu_Ctrl_construcciones_LkBtn").removeAttribute("href");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_clasificacion'));
            disableControls($get('form_construcciones'));
            disableControls($get('form_superficies'));
        }

        // Llenado de datos
        function fillData() {
            fillConstruccionesData();
            fillConstruccionesClasificacionData();
            fillSuperficiesData();

            setupTablaConstrucciones();
            setupTablaSuperficiesAdicionales("<%= superficiesConstrucciones_Ctrl.ClientID %>");
            setupTablaSuperficiesAdicionales("<%= superficiesObras_Ctrl.ClientID %>");
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
                    fillData();
                }
            }
        }

        // Guardado de registros
        function saveForm() {
            if ($get("form_clasificacion").style.display == "block")
                saveClasificacion();
            if ($get("form_construcciones").style.display == "block")
                saveConstrucciones();
            if ($get("form_superficies").style.display == "block")
                saveSuperficies();
        }
        function saveClasificacion() {
        }
        function saveConstrucciones() {
        }
        function saveSuperficies() {
        }

        // Uso actual
        function editUsoActual() {
            openModalWindow("Modulos/UsoActual.aspx", 750, 480);
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
        </Scripts>
    </asp:ScriptManager>
    <SIGEA:EditorSHFNavegador ID="EditorSHFNavegador1" runat="server" />
    <h1>
        Descripción de las construcciones
    </h1>
    <div class="etiqueta1">
        <span class="textoNegritas">Descripción de uso actual:</span>
        <asp:Label ID="descripcion_Lbl" runat="server">No especificada...</asp:Label>&nbsp;
        <asp:ImageButton ID="editar_uso_actual_ImBtn" runat="server" SkinID="EditSmall" />
    </div>
    <h2>
        Clasificación de las construcciones privativas</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_clasificacion_ImBtn" runat="server" SkinID="Edit" />
        <asp:ImageButton ID="guardar_clasificacion_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_clasificacion_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <div id="form_clasificacion" class="formulario">
        <SIGEA:ConstruccionesClasificacion ID="construccionesClasificacion_Ctrl" runat="server" />
    </div>
    <h2>
        Datos generales de las construcciones</h2>
            <div class="barraAcciones">
        <asp:ImageButton ID="editar_construcciones_ImBtn" runat="server" SkinID="Edit" />
        <asp:ImageButton ID="guardar_construcciones_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_construcciones_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <div id="form_construcciones" class="formulario">
        <SIGEA:Construcciones ID="construcciones_Ctrl" runat="server" />
    </div>
    <h2>
        Datos de superficies</h2>
            <div class="barraAcciones">
        <asp:ImageButton ID="editar_superficies_ImBtn" runat="server" SkinID="Edit" />
        <asp:ImageButton ID="guardar_superficies_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_superficies_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <div id="form_superficies" class="formulario">
        <SIGEA:Superficies ID="superficies_Ctrl" runat="server" />
        <table>
            <tr class="celdaHeader">
                <td>
                    Áreas cubiertas
                </td>
                <td>
                    Obras complementarias
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <SIGEA:SuperficiesAdicionales ID="superficiesConstrucciones_Ctrl" runat="server" />
                </td>
                <td valign="top">
                    <SIGEA:SuperficiesAdicionales ID="superficiesObras_Ctrl" runat="server" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
