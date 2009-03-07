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
        
        function loadConstruccion(idAvaluo) {
            checarConstruccion(idAvaluo, checarTipoConstruccion);
        }
        
        function checarTipoConstruccion(enable, key_id) {
            
            if (enable == false) {
                setVisibility($get("<%= editar_estructuras_ImBtn.ClientID %>"), false);
                setVisibility($get("<%= editar_acabados_ImBtn.ClientID %>"), false);
                setVisibility($get("<%= editar_instalaciones_ImBtn.ClientID %>"), false);
                showMessage("El avalúo debe contar con un tipo de construcción.\n Debe capturar la descripción de las construcciones.");
            }
            else
                loadForm(key_id);
        }
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
            loadEstructurasAsync(idAvaluo, datosEstructuras_Ctrl);
        }
        function loadDatosAcabados() {
            loadAcabadosAsync(idAvaluo, datosAcabados_Ctrl);
            loadFachadaAsync(idAvaluo, datosAcabados_Ctrl);
        }
        function loadDatosInstalaciones() {
            loadInstalacionesAsync(idAvaluo, instalaciones_Ctrl);
        }
        function loadDatosInstalacionesAdicionales() {
            loadInstalacionesAdicionalesAsync(idAvaluo, false, instalacionesPrivativas_Ctrl);
            loadInstalacionesAdicionalesAsync(idAvaluo, true, instalacionesComunes_Ctrl);
        }

        // Guardado de registros
        function saveForm() {
            if (getVisibility($get("<%= guardar_estructuras_ImBtn.ClientID %>")))
                saveDatosEstructuras(false);
            if (getVisibility($get("<%= guardar_acabados_ImBtn.ClientID %>")))
                saveDatosAcabados();
            if (getVisibility($get("<%= guardar_instalaciones_ImBtn.ClientID %>")))
                saveDatosInstalaciones(false);
        }
        function saveDatosEstructuras(mostrarAlertas) {
            if (datosEstructuras_Ctrl.validate()) {
                saveDatosEstructurasAsync(
                idAvaluo
                , datosEstructuras_Ctrl.getData()
                , saveDatosEstructuras_Success);
            }
            else if (mostrarAlertas != false) {
                showMessage("El bloque de datos contiene campos inválidos");
            }
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
                , datosAcabados_Ctrl.getData()
                , saveDatosAcabados_Success);
                
            saveDatosFachadaAsync(
                idAvaluo
                , datosAcabados_Ctrl.getFachada()
                , saveDatosAcabados_Success);
        }
        function saveDatosAcabados_Success() {
            terminateEdit("form_acabados",
                "<%= editar_acabados_ImBtn.ClientID %>",
                "<%= guardar_acabados_ImBtn.ClientID %>",
                "<%= cancelar_acabados_ImBtn.ClientID %>");
        }

        function saveDatosInstalaciones(mostrarAlertas) {
            var validated = true;
            if (!instalaciones_Ctrl.validate())
                validated = false;
            if (!instalacionesPrivativas_Ctrl.validate())
                validated = false;
            if (!instalacionesComunes_Ctrl.validate())
                validated = false;
            if (validated) {
                saveDatosInstalacionesConstruccionAsync(
                idAvaluo
                , instalaciones_Ctrl.getData()
                , instalacionesPrivativas_Ctrl.getData()
                , instalacionesComunes_Ctrl.getData()
                , saveDatosInstalaciones_Success);
            }
            else if (mostrarAlertas != false) {
                showMessage("El bloque de datos contiene campos inválidos");
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
            <asp:ScriptReference Path="~/Scripts/Entities/Avaluos.js" />
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
    <div id="seccion_instalaciones_condominio">
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
