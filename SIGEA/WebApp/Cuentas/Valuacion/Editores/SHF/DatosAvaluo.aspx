<%@ Page Title="SIGEA - Editor SHF - Datos Avalúo" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master"
    AutoEventWireup="true" CodeFile="DatosAvaluo.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_DatosAvaluo" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosGeneralesAvaluo.ascx" TagName="DatosGeneralesAvaluo"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosSolicitante.ascx" TagName="DatosSolicitante"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosDeclaraciones.ascx" TagName="DatosDeclaraciones"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosAdvertencias.ascx" TagName="DatosAdvertencias"
    TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;

        // Inicialización
        function setupForm() {
            var link = $get("ctl00_menu_Ctrl_avaluo_LkBtn")
            link.removeAttribute("href");
            link.setAttribute("class", "current");
            link.setAttribute("className", "current");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get("form_datos_generales"));
            disableControls($get("form_declaraciones"));
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosAvaluo();
            loadDatosDeclaraciones();
        }
        function loadDatosAvaluo() {
            loadDatosAvaluoAsync(idAvaluo, avaluo_Ctrl);
            loadDatosSolicitanteAsync(idAvaluo, solicitante_Ctrl);
        }
        function loadDatosDeclaraciones() {
            loadDeclaracionesAsync(idAvaluo, declaraciones_Ctrl);
            loadAdvertenciasAsync(idAvaluo, advertencias_Ctrl);
        }

        // Guardado de registros
        function saveForm() {
            if (getVisibility($get("<%= guardar_datos_generales_ImBtn.ClientID %>")))
                saveDatosGenerales(false);
            if (getVisibility($get("<%= guardar_declaraciones_ImBtn.ClientID %>")))
                saveDeclaraciones();
        }

        function saveDatosGenerales(mostrarAlertas) {
            var validated = true;

            if (!avaluo_Ctrl.validate())
                validated = false;
            if (!solicitante_Ctrl.validate())
                validated = false;

            if (validated) {
                saveAvaluoAsync(
                    idAvaluo
                    , avaluo_Ctrl.getData()
                    , solicitante_Ctrl.getData()
                    , saveDatosAvaluo_Success
                );
            }
            else if (mostrarAlertas != false) {
                showMessage("El bloque de datos contiene campos inválidos");
            }
        }
        function saveDatosAvaluo_Success() {
            terminateEdit("form_datos_generales",
                "<%= editar_datos_generales_ImBtn.ClientID %>",
                "<%= guardar_datos_generales_ImBtn.ClientID %>",
                "<%= cancelar_datos_generales_ImBtn.ClientID %>");
        }

        function saveDeclaraciones(mostrarAlertas) {
            saveDeclaracionesAsync(
                idAvaluo
                , declaraciones_Ctrl.getData()
                , advertencias_Ctrl.getData()
                , saveDeclaraciones_Success
            );

        }
        function saveDeclaraciones_Success() {
            terminateEdit("form_declaraciones",
                "<%= editar_declaraciones_ImBtn.ClientID %>",
                "<%= guardar_declaraciones_ImBtn.ClientID %>",
                "<%= cancelar_declaraciones_ImBtn.ClientID %>");
        }

    </script>

</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="Server">
    <asp:ScriptManager runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/MethodCallers.asmx" />
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/DataFillers.js" />
            <asp:ScriptReference Path="~/Scripts/Forms.js" />
            <asp:ScriptReference Path="~/Scripts/Validation.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Avaluos.js" />
        </Scripts>
    </asp:ScriptManager>    
    <h1>
        Datos del expediente</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_datos_generales_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_datos_generales" class="formulario">
        <h2>
            Datos generales del avalúo</h2>
        <SIGEA:DatosGeneralesAvaluo ID="avaluo_Ctrl" runat="server" />
        <h2>
            del solicitante
        </h2>
        <SIGEA:DatosSolicitante ID="solicitante_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_datos_generales_ImBtn" runat="server" SkinID="Save"
            CssClass="hidden" />
        <asp:ImageButton ID="cancelar_datos_generales_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
    <hr />
    <h1>
        Declaraciones y advertencias</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_declaraciones_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_declaraciones" class="formulario">
        <h2>
            Declaraciones
        </h2>
        <SIGEA:DatosDeclaraciones ID="declaraciones_Ctrl" runat="server" />
        <h2>
            Advertencias
        </h2>
        <SIGEA:DatosAdvertencias ID="advertencias_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_declaraciones_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_declaraciones_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
    <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server" 
        AnteriorVisible="False" SiguienteURL="DatosInmueble.aspx"/>
</asp:Content>
