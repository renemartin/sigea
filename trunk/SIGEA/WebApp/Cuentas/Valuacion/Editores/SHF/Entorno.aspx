<%@ Page Title="SIGEA - Editor SHF - Entorno" Language="C#" AutoEventWireup="true"
    CodeFile="Entorno.aspx.cs" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master"
    Inherits="Cuentas_Valuacion_Editores_SHF_Entorno" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEntorno.ascx" TagName="DatosEntorno"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEntornoInfraestructura.ascx"
    TagName="Infraestructura" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosEntornoEquipamiento.ascx" TagName="Equipamiento"
    TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;
        var num_bloques_datos = 4;

        // Inicialización
        function setupForm() {
            var link = $get("ctl00_menu_Ctrl_entorno_LkBtn")
            link.removeAttribute("href");
            link.setAttribute("class", "current");
            link.setAttribute("className", "current");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_entorno'));
            disableControls($get('form_infraestructura'));
            disableControls($get('form_equipamiento'));

            setupTablaVias();
        }

        // Llenado de datos
        function fillData() {
            fillEntornoData(0);
            fillEntornoInfraestructuraData();
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosEntorno();
            loadDatosInfraestructura();
            loadDatosEquipamiento();
        }
        function loadDatosEntorno() {
            var callBackList1 = new Array();
            callBackList1[0] = loadForm_Success;
            callBackList1[1] = setDatosEntorno;
            loadEntornoInmuebleAsync(idAvaluo, callBackList1);

            var callBackList2 = new Array();
            callBackList2[0] = loadForm_Success;
            callBackList2[1] = setDatosViasAcceso;
            loadViasAccesoInmuebleAsync(idAvaluo, callBackList2);
        }
        function loadDatosInfraestructura() {
            var callBackList = new Array();
            callBackList[0] = loadForm_Success;
            callBackList[1] = setDatosEntornoInfraestructura;
            callBackList[2] = setDatosEntornoServicios;
            loadInfraestructuraInmuebleAsync(idAvaluo, callBackList);
        }
        function loadDatosEquipamiento() {
            var callBackList = new Array();
            callBackList[0] = loadForm_Success;
            callBackList[1] = setDatosEntornoEquipamiento;
            loadEquipamientoInmuebleAsync(idAvaluo, callBackList);
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
            if (getVisibility($get("<%= guardar_entorno_ImBtn.ClientID %>")))
                saveDatosEntorno();
            if (getVisibility($get("<%= guardar_infraestructura_ImBtn.ClientID %>")))
                saveDatosInfraestructura();
            if (getVisibility($get("<%= guardar_equipamiento_ImBtn.ClientID %>")))
                saveDatosEquipamiento();
        }
        function saveDatosEntorno() {
            saveEntornoInmuebleAsync(
                idAvaluo
                , getDatosEntorno()
                , getDatosViasAcceso()
                , saveDatosEntorno_Success);
        }
        function saveDatosEntorno_Success() {
            terminateEdit("form_entorno",
                "<%= editar_entorno_ImBtn.ClientID %>",
                "<%= guardar_entorno_ImBtn.ClientID %>",
                "<%= cancelar_entorno_ImBtn.ClientID %>");
        }

        function saveDatosInfraestructura() {
            saveInfraestructuraInmuebleAsync(
                idAvaluo
                , getDatosEntornoInfraestructura()
                , getDatosEntornoServicios()
                , saveDatosInfraestructura_Success);
        }
        function saveDatosInfraestructura_Success() {
            terminateEdit("form_infraestructura",
                "<%= editar_infraestructura_ImBtn.ClientID %>",
                "<%= guardar_infraestructura_ImBtn.ClientID %>",
                "<%= cancelar_infraestructura_ImBtn.ClientID %>");
        }

        function saveDatosEquipamiento() {
            saveEquipamientoInmuebleAsync(
                idAvaluo
                , getDatosEntornoEquipamiento()
                , saveDatosEquipamiento_Success);
        }
        function saveDatosEquipamiento_Success() {
            terminateEdit("form_equipamiento",
                "<%= editar_equipamiento_ImBtn.ClientID %>",
                "<%= guardar_equipamiento_ImBtn.ClientID %>",
                "<%= cancelar_equipamiento_ImBtn.ClientID %>");
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
        </Scripts>
    </asp:ScriptManager>
    <SIGEA:EditorSHFNavegador ID="navegador_Ctrl" runat="server" />
    <h1>
        Datos del entorno</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_entorno_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_entorno" class="formulario">
        <SIGEA:DatosEntorno ID="datosEntorno_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_entorno_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_entorno_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <hr />
    <h2>
        Infraestructura disponible en la zona
    </h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_infraestructura_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_infraestructura" class="formulario">
        <SIGEA:Infraestructura ID="infraestructura_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_infraestructura_ImBtn" runat="server" SkinID="Save"
            CssClass="hidden" />
        <asp:ImageButton ID="cancelar_infraestructura_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
    <hr />
    <h2>
        Equipamiento urbano</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_equipamiento_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_equipamiento" class="formulario">
        <SIGEA:Equipamiento ID="equipamiento_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_equipamiento_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_equipamiento_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
</asp:Content>
