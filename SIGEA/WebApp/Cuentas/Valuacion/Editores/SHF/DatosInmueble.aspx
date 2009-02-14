<%@ Page Title="SIGEA - Editor SHF - Datos Inmueble" Language="C#" AutoEventWireup="true"
    CodeFile="DatosInmueble.aspx.cs" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master"
    Inherits="Cuentas_Valuacion_Editores_SHF_DatosInmueble" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador"
    TagPrefix="SIGEA" %>
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

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;
        var num_bloques_datos = 3;

        // Inicialización
        function setupForm() {
            $get("ctl00_menu_Ctrl_inmueble_LkBtn").removeAttribute("href");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_inmueble'));
            disableControls($get('form_terreno'));
            disableControls($get('form_colindancias'));
        }

        // Llenado de datos
        function fillData() {
            fillInmuebleData();
            fillTerrenoData();
            fillTerrenoCallesData();
            fillTerrenoColindanciasData();
            fillDireccionData_Aux("<%= datosInmueble_Ctrl.DireccionID %>");
            fillDireccionData_Aux("<%= datosPropietario_Ctrl.DireccionID %>");
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosInmueble();
            loadDatosTerreno();
            loadDatosColindancias();
        }
        function loadDatosInmueble() {
            //TODO: Cargar datos de inmueble
            loadForm_Success() // Temporal
        }
        function loadDatosTerreno() {
            //TODO: Cargar datos de terreno
            loadForm_Success() // Temporal
        }
        function loadDatosColindancias() {
            //TODO: Cargar datos de Colindancias
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
            if ($get("form_inmueble").style.display == "block")
                saveDatosInmueble();
            if ($get("form_terreno").style.display == "block")
                saveDatosTerreno();
            if ($get("form_colindancias").style.display == "block")
                saveColindancias();                
        }
        function saveDatosInmueble() {
        }
        function saveDatosTerreno() {
        }
        function saveColindancias() {
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
            <asp:ScriptReference Path="~/Scripts/Forms.js" />
        </Scripts>
    </asp:ScriptManager>
    <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server" />
    <h1>
        Datos del inmueble</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_inmueble_ImBtn" runat="server" SkinID="Edit" />
        <asp:ImageButton ID="guardar_inmueble_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_inmueble_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <div id="form_inmueble" class="formulario">
        <SIGEA:DatosGeneralesInmueble ID="datosInmueble_Ctrl" runat="server" />
        <h2>
            Datos del propietario</h2>
        <SIGEA:DatosPropietario ID="datosPropietario_Ctrl" runat="server" />
    </div>
    <h1>
        Caracteristicas del terreno</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_terreno_ImBtn" runat="server" SkinID="Edit" />
        <asp:ImageButton ID="guardar_terreno_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_terreno_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <div id="form_terreno" class="formulario">
        <SIGEA:DatosTerrenoCalles ID="datosTerrenoCalles_Ctrl" runat="server" />
        <SIGEA:DatosTerreno ID="datosTerreno_Ctrl" runat="server" />
    </div>
    <h2>
        Medidas y colindancias
    </h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_colindancias_ImBtn" runat="server" SkinID="Edit" />
        <asp:ImageButton ID="guardar_colindancias_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_colindancias_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
    <div id="form_colindancias" class="formulario">
        <SIGEA:Colindancias ID="Colindancias_Ctrl" runat="server" />
    </div>
</asp:Content>
