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
            var link = $get("ctl00_menu_Ctrl_elementos_LkBtn")
            link.removeAttribute("href");
            link.setAttribute("class", "current");
            link.setAttribute("className", "current");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_estructuras'));
            disableControls($get('form_acabados'));
            disableControls($get('form_instalaciones'));

            setupTablaSuperficiesAdicionales("<%= instalacionesPrivativas_Ctrl.ClientID %>");
            setupTablaSuperficiesAdicionales("<%= instalacionesComunes_Ctrl.ClientID %>");
        }

        // Llenado de datos
        function fillData() {
            fillEstructurasData();
            fillInstalacionesData();
            fillInstalacionesAdicionalesData("<%= instalacionesPrivativas_Ctrl.ClientID %>");
            fillInstalacionesAdicionalesData("<%= instalacionesComunes_Ctrl.ClientID %>");
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosEstructuras();
            loadDatosAcabados();
            loadDatosInstalaciones();
            loadDatosInstalacionesAdicionales();
        }
        function loadDatosEstructuras() {
            var callBackList = new Array();
            
            callBackList[0] = loadForm_Success;
            callBackList[1] = setDatosEstructuras;
            
            loadEstructurasAsync(idAvaluo, callBackList);
        }
        function loadDatosAcabados() {
            var callBackList = new Array();
            
            callBackList[0] = loadForm_Success;
            callBackList[1] = setDatosAcabados;
            
            loadAcabadosAsync(idAvaluo, callBackList);
        }
        function loadDatosInstalaciones() {
            var callBackList = new Array();
            
            callBackList[0] = loadForm_Success;
            callBackList[1] = setDatosInstalaciones;
            
            loadInstalacionesAsync(idAvaluo, callBackList);
        }
        function loadDatosInstalaciones() {
            var callBackList = new Array();
            
            callBackList[0] = loadForm_Success;
            callBackList[1] = setDatosInstalacionesAdicionales;
            
            loadInstalacionesAdicionalesAsync(idAvaluo, callBackList);
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
            if (getVisibility($get("<%= guardar_estructuras_ImBtn.ClientID %>")))
                saveDatosEstructuras();
            if (getVisibility($get("<%= guardar_acabados_ImBtn.ClientID %>")))
                saveDatosAcabados();
            if (getVisibility($get("<%= guardar_instalaciones_ImBtn.ClientID %>")))
                saveDatosInstalaciones();
        }
        function saveDatosEstructuras() {
            saveDatosEstructurasAsync(
                idAvaluo
                , getDatosEstructuras()
                , saveDatosEstructuras_Success()
                );
        }
        function saveDatosEstructuras_Success() {
            terminateEdit("form_estructuras",
                "<%= editar_estructuras_ImBtn.ClientID %>",
                "<%= guardar_estructuras_ImBtn.ClientID %>",
                "<%= cancelar_estructuras_ImBtn.ClientID %>");
        }

        function saveDatosAcabados() {
            saveDatosAcabadosAsync(
                idAvaluo
                , getDatosAcabados()
                , saveDatosAcabados_Success()
                );
        }
        function saveDatosAcabados_Success() {
            terminateEdit("form_acabados",
                "<%= editar_acabados_ImBtn.ClientID %>",
                "<%= guardar_acabados_ImBtn.ClientID %>",
                "<%= cancelar_acabados_ImBtn.ClientID %>");
        }

        function saveDatosInstalaciones() {
            saveDatosInstalacionesConstruccionAsync(
                idAvaluo
                , getDatosInstalaciones()
                , getDatosInstalacionesAdicionales("<%= instalacionesPrivativas_Ctrl.ClientID %>")
                , getDatosInstalacionesAdicionales("<%= instalacionesComunes_Ctrl.ClientID %>")
                , saveDatosInstalaciones_Success()
                );
        }
        function saveDatosInstalaciones_Success() {
            terminateEdit("form_instalaciones",
                "<%= editar_instalaciones_ImBtn.ClientID %>",
                "<%= guardar_instalaciones_ImBtn.ClientID %>",
                "<%= cancelar_instalaciones_ImBtn.ClientID %>");
        }

        // Visibilidad secciones
        function setVisibilidadCondominal(visible) {
            setVisibility($get("seccion_instalaciones_condominio"), visible);
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
            <asp:ScriptReference Path="~/Scripts/Entities/Construcciones.js" />
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
    </div>
    <div id="form_estructuras" class="formulario">
        <SIGEA:DatosEstructuras ID="datosEstructuras_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_estructuras_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_estructuras_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <hr />
    <h2>
        Acabados
    </h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_acabados_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_acabados" class="formulario">
        <SIGEA:DatosAcabados ID="datosAcabados_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_acabados_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_acabados_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <div id="seccion_instalaciones_condominio" style="display: none;">
        <hr />
        <h1>
            Instalaciones
        </h1>
        <div class="barraAcciones">
            <asp:ImageButton ID="editar_instalaciones_ImBtn" runat="server" SkinID="Edit" />
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
        <div class="barraAcciones">
            <asp:ImageButton ID="guardar_instalaciones_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
            <asp:ImageButton ID="cancelar_instalaciones_ImBtn" runat="server" SkinID="Cancel"
                CssClass="hidden" />
        </div>
    </div>
</asp:Content>
