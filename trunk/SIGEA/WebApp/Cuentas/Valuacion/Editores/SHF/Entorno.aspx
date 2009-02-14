<%@ Page Title="SIGEA - Editor SHF - Entorno" Language="C#" AutoEventWireup="true"
    CodeFile="Entorno.aspx.cs" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master"
    Inherits="Cuentas_Valuacion_Editores_SHF_Entorno" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEntorno.ascx" TagName="DatosEntorno"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEntornoInfraestructura.ascx"
    TagName="Infraestructura" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEntornoServicios.ascx" TagName="Servicios"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEntornoEquipamiento.ascx" TagName="Equipamiento"
    TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;
        var num_bloques_datos = 4;

        // Inicialización
        function setupForm() {
            $get("ctl00_menu_Ctrl_entorno_LkBtn").removeAttribute("href");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_entorno'));
            disableControls($get('form_infraestructura'));
            disableControls($get('form_servicios'));
            disableControls($get('form_equipamiento'));
        }

        // Llenado de datos
        function fillData() {
            fillEntornoData(0);
            fillEntornoViasAccesoData();
            fillEntornoInfraestructuraData();
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosEntorno();
            loadDatosInfraestructura();
            loadDatosServicios();
            loadDatosEquipamiento();
        }
        function loadDatosEntorno() {
            //TODO: Cargar datos de entorno
            loadForm_Success() // Temporal
        }
        function loadDatosInfraestructura() {
            //TODO: Cargar datos de infraestructura
            loadForm_Success() // Temporal
        }
        function loadDatosServicios() {
            //TODO: Cargar datos de servicios
            loadForm_Success() // Temporal
        }
        function loadDatosEquipamiento() {
            //TODO: Cargar datos de equipamiento
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
            if ($get("form_entorno").style.display == "block")
                saveDatosEntorno();
            if ($get("form_infraestructura").style.display == "block")
                saveDatosInfraestructura();
            if ($get("form_servicios").style.display == "block")
                saveDatosServicios();
            if ($get("form_equipamiento").style.display == "block")
                saveDatosEquipamiento();                
        }
        function saveDatosEntorno() {
        }
        function saveDatosInfraestructura() {
        }
        function saveDatosServicios() {
        }
        function saveDatosEquipamiento() {
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
        Datos del entorno</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_entorno_ImBtn" runat="server" SkinID="Edit" />
        <asp:ImageButton ID="guardar_entorno_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_entorno_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <div id="form_entorno" class="formulario">
        <SIGEA:DatosEntorno ID="datosEntorno_Ctrl" runat="server" />
    </div>
    <h2>
        Infraestructura disponible en la zona
    </h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_infraestructura_ImBtn" runat="server" SkinID="Edit" />
        <asp:ImageButton ID="guardar_infraestructura_ImBtn" runat="server" SkinID="Save"
            CssClass="hidden" />
        <asp:ImageButton ID="cancelar_infraestructura_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
    <div id="form_infraestructura" class="formulario">
        <SIGEA:Infraestructura ID="infraestructura_Ctrl" runat="server" />
    </div>
    <h2>
        Otros Servicios</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_servicios_ImBtn" runat="server" SkinID="Edit" />
        <asp:ImageButton ID="guardar_servicios_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_servicios_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <div id="form_servicios" class="formulario">
        <SIGEA:Servicios ID="servicios_Ctrl" runat="server" />
    </div>
    <h2>
        Equipamiento urbano</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_equipamiento_ImBtn" runat="server" SkinID="Edit" />
        <asp:ImageButton ID="guardar_equipamiento_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_equipamiento_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
    <div id="form_equipamiento" class="formulario">
        <SIGEA:Equipamiento ID="equipamiento_Ctrl" runat="server" />
    </div>
</asp:Content>
