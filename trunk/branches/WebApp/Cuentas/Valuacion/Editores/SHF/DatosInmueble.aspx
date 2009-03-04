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
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;

        // Inicialización
        function setupForm() {
            var link = $get("ctl00_menu_Ctrl_inmueble_LkBtn")
            link.removeAttribute("href");
            link.setAttribute("class", "current");
            link.setAttribute("className", "current");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_inmueble'));
            disableControls($get('form_terreno'));
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosInmueble();
            loadDatosTerreno();
        }
        function loadDatosInmueble() {
            loadInmuebleAsync(idAvaluo, inmueble_Ctrl);
            loadPropietarioAsync(idAvaluo, propietario_Ctrl);
        }
        function loadDatosTerreno() {
            loadDatosTerrenoCallesAsync(idAvaluo, terrenoCalles_Ctrl);
            loadDatosTerrenoAsync(idAvaluo, terreno_Ctrl);
        }

        // Guardado de registros
        function saveForm() {
            if (getVisibility($get("<%= guardar_inmueble_ImBtn.ClientID %>")))
                saveDatosInmueble(false);
            if (getVisibility($get("<%= guardar_terreno_ImBtn.ClientID %>")))
                saveDatosTerreno(false);
        }
        function saveDatosInmueble(mostrarAlertas) {
            var validated = true;
            if (!inmueble_Ctrl.validate())
                validated = false;
            if (!propietario_Ctrl.validate())
                validated = false;
        
            if (validated) {
                saveInmuebleAsync(
                    idAvaluo
                    , inmueble_Ctrl.getData()
                    , propietario_Ctrl.getData()
                    , saveDatosInmueble_Success);
            }
            else {
                if (mostrarAlertas != false) {
                    showMessage("El bloque de datos contiene campos inválidos");

                }
            }
        }
        function saveDatosInmueble_Success() {
            terminateEdit("form_inmueble",
                "<%= editar_inmueble_ImBtn.ClientID %>",
                "<%= guardar_inmueble_ImBtn.ClientID %>",
                "<%= cancelar_inmueble_ImBtn.ClientID %>");
        }

        function saveDatosTerreno(mostrarAlertas) {
            var validated = true;
            if (!terrenoCalles_Ctrl.validate())
                validated = false;
            if (!terreno_Ctrl.validate())
                validated = false;

            if (validated) {
                saveUbicacionInmuebleAsync(
                    idAvaluo
                    , terrenoCalles_Ctrl.getData()
                    , terreno_Ctrl.getData()
                    , saveDatosTerreno_Success);
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
            <asp:ScriptReference Path="~/Scripts/Validation.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Inmuebles.js" />
        </Scripts>
    </asp:ScriptManager>
    <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server" />
    <h1>
        Datos del inmueble</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_inmueble_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_inmueble" class="formulario">
        <SIGEA:DatosGeneralesInmueble ID="inmueble_Ctrl" runat="server" />
        <h2>
            Datos del propietario</h2>
        <SIGEA:DatosPropietario ID="propietario_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_inmueble_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_inmueble_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <hr />
    <h1>
        Caracteristicas del terreno</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_terreno_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_terreno" class="formulario">
        <SIGEA:DatosTerrenoCalles ID="terrenoCalles_Ctrl" runat="server" />
        <SIGEA:DatosTerreno ID="terreno_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_terreno_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_terreno_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
</asp:Content>
