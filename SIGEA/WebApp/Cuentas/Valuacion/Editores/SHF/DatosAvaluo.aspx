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
            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get("form"));
            $get("ctl00_menu_Ctrl_avaluo_LkBtn").removeAttribute("href");
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
            //TODO: Llamadas a funciones de guardado
            saveForm_Success(); // Temporal
        }
        function saveForm_Success() {
            showMessage("Datos guardados");
        }

        // Edición de formulario
        function editForm() {
            $get("<%= navegador_Ctrl.ClientID %>_guardar_ImBtn").style.display = "inline";
            $get("<%= navegador_Ctrl.ClientID %>_cancelar_ImBtn").style.display = "inline";

            form_editing = true;
            enableControls($get("form"));
        }
        function cancelEdit() {
            $get("<%= navegador_Ctrl.ClientID %>_guardar_ImBtn").style.display = "none";
            $get("<%= navegador_Ctrl.ClientID %>_cancelar_ImBtn").style.display = "none";
        
            form_editing = false;
            disableControls($get("form"));
            loadForm(idAvaluo);
        }

        // Llenado de datos
        function fillData() {
            fillAvaluoData();
            fillDireccionData();            
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
    <h1>
        Datos del expediente</h1>
    <div id="form_actions" class="barraAcciones">
    <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server" VisiblidadGuardar="false" VisiblidadCancelar="false" />
    </div>
    <div id="form" class="formulario">
        <h2>
            Datos generales del avalúo</h2>
        <SIGEA:DatosGeneralesAvaluo ID="datosAvaluo_Ctrl" runat="server" />
        <h2>
            Datos del solicitante
        </h2>
        <SIGEA:DatosSolicitante ID="datosSolicitante_Ctrl" runat="server" />
        <h2>
            Declaraciones
        </h2>
        <SIGEA:DatosDeclaraciones ID="datosDeclaraciones_Ctrl" runat="server" />
        <h2>
            Advertencias
        </h2>
        <SIGEA:DatosAdvertencias ID="datosAdvertencias_Ctrl" runat="server" />
    </div>
</asp:Content>
