<%@ Page Title="SIGEA - Editor SHF - Elementos construcción" Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master" CodeFile="ElementosConstruccion.aspx.cs"
    Inherits="Cuentas_Valuacion_Editores_SHF_ElementosConstruccion" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosAcabados.ascx" TagName="DatosAcabados"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEstructuras.ascx" TagName="DatosEstructuras"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosInstalaciones.ascx" TagName="DatosInstalaciones"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosInstalacionesAdicionales.ascx"
    TagName="InstalacionesAdicionales" TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;
        var num_bloques_datos = 3;

        // Inicialización
        function setupForm() {
            $get("ctl00_menu_Ctrl_elementos_LkBtn").removeAttribute("href");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_estructuras'));
            disableControls($get('form_acabados'));
            disableControls($get('form_instalaciones'));
        }

        // Llenado de datos
        function fillData() {
            fillEstructurasData();
            fillInstalacionesData();
            fillInstalacionesAdicionalesData("<%= instalacionesPrivativas_Ctrl.ClientID %>");
            fillInstalacionesAdicionalesData("<%= instalacionesComunes_Ctrl.ClientID %>");
            setupTablaSuperficiesAdicionales("<%= instalacionesPrivativas_Ctrl.ClientID %>");
            setupTablaSuperficiesAdicionales("<%= instalacionesComunes_Ctrl.ClientID %>");
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosEstructuras();
            loadDatosAcabados();
            loadDatosInstalaciones();
        }
        function loadDatosEstructuras() {
            //TODO: Cargar datos de estructuras
            loadForm_Success() // Temporal
        }
        function loadDatosAcabados() {
            //TODO: Cargar datos de acabados
            loadForm_Success() // Temporal
        }
        function loadDatosInstalaciones() {
            //TODO: Cargar datos de instalaciones
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
            if ($get("form_estructuras").style.display == "block")
                saveDatosEstructuras();
            if ($get("form_acabados").style.display == "block")
                saveDatosAcabados();
            if ($get("form_instalaciones").style.display == "block")
                saveDatosInstalaciones();
        }
        function saveDatosEstructuras() {
        }
        function saveDatosAcabados() {
        }
        function saveDatosInstalaciones() {
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
    <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server" />
    <h1>
        Acabados y estructuras
    </h1>
    <h2>
        Estructuras
    </h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_estructuras_ImBtn" runat="server" SkinID="Edit" />
        <asp:ImageButton ID="guardar_estructuras_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_estructuras_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <div id="form_estructuras" class="formulario">
        <SIGEA:DatosEstructuras ID="datosEstructuras_Ctrl" runat="server" />
    </div>
    <h2>
        Acabados
    </h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_acabados_ImBtn" runat="server" SkinID="Edit" />
        <asp:ImageButton ID="guardar_acabados_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_acabados_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <div id="form_acabados" class="formulario">
        <SIGEA:DatosAcabados ID="datosAcabados_Ctrl" runat="server" />
    </div>
    <h1>
        Instalaciones
    </h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_instalaciones_ImBtn" runat="server" SkinID="Edit" />
        <asp:ImageButton ID="guardar_instalaciones_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_instalaciones_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
    <div id="form_instalaciones" class="formulario">
        <SIGEA:DatosInstalaciones ID="instalaciones_Ctrl" runat="server" />
        <h2>
            Instalaciones especiales</h2>
        <h3>
            Instalaciones privativas</h3>
        <SIGEA:InstalacionesAdicionales ID="instalacionesPrivativas_Ctrl" runat="server" />
        <h2>
            Obras complementarias</h2>
        <h3>
            Instalaciones comúnes</h3>
        <SIGEA:InstalacionesAdicionales ID="instalacionesComunes_Ctrl" runat="server" />
    </div>
</asp:Content>
