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
        var num_bloques_datos = 2;

        // Inicialización
        function setupForm() {
            $get("ctl00_menu_Ctrl_avaluo_LkBtn").removeAttribute("href");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get("form_datos_generales"));
            disableControls($get("form_declaraciones"));
        }

        // Llenado de datos
        function fillData() {
            fillAvaluoData();
            fillDireccionData();
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosAvaluo();
            loadDatosDeclaraciones();
        }
        function loadDatosAvaluo() {
            var callBackList = new Array();
            callBackList[0] = loadForm_Success;
            callBackList[1] = setDatosAvaluo;
            callBackList[2] = setDatosCredito;
            callBackList[3] = setDatosSolicitante;
            callBackList[4] = setDatosDireccion;

            loadDatosAvaluoAsync(idAvaluo, callBackList);
        }
        function loadDatosDeclaraciones() {
            //TODO: Cargar datos de declaraciones y advertencias
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
            if ($get("<%= guardar_datos_generales_ImBtn.ClientID %>").style.display != "none")
                saveDatosGenerales();
            if ($get("<%= guardar_declaraciones_ImBtn.ClientID %>").style.display == "block")
                saveDeclaraciones();
        }

        function saveDatosGenerales() {
            saveAvaluoAsync(
                idAvaluo
                , getDatosAvaluo()
                , getDatosCredito()
                , getDatosSolicitante()
                , getDatosDireccion()
                , saveAvaluo_Success
            );
        }

        function saveAvaluo_Success() {
            terminateEdit("form_datos_generales",
                "<%= editar_datos_generales_ImBtn.ClientID %>",
                "<%= guardar_datos_generales_ImBtn.ClientID %>",
                "<%= cancelar_datos_generales_ImBtn.ClientID %>");
            showMessage("Datos guardados");
        }

        function saveDeclaraciones() {
            disableControls($get("form_declaraciones"));
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
            <asp:ScriptReference Path="~/Scripts/Entities/Avaluos.js" />
            <asp:ScriptReference Path="~/Scripts/Forms.js" />
        </Scripts>
    </asp:ScriptManager>
    <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server" />
    <h1>
        Datos del expediente</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_datos_generales_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_datos_generales" class="formulario">
        <h2>
            Datos generales del avalúo</h2>
        <SIGEA:DatosGeneralesAvaluo ID="datosAvaluo_Ctrl" runat="server" />
        <h2>
            Datos del solicitante
        </h2>
        <SIGEA:DatosSolicitante ID="datosSolicitante_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_datos_generales_ImBtn" runat="server" SkinID="Save"
            CssClass="hidden" />
        <asp:ImageButton ID="cancelar_datos_generales_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
    <hr />
    <h1>Declaraciones y advertencias</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_declaraciones_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_declaraciones" class="formulario">
        <h2>
            Declaraciones
        </h2>
        <SIGEA:DatosDeclaraciones ID="datosDeclaraciones_Ctrl" runat="server" />
        <h2>
            Advertencias
        </h2>
        <SIGEA:DatosAdvertencias ID="datosAdvertencias_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_declaraciones_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_declaraciones_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
</asp:Content>
