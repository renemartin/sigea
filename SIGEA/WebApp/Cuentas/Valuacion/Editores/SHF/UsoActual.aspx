<%@ Page Language="C#" Title="SIGEA - Editor SHF - Uso actual" AutoEventWireup="true"
    CodeFile="UsoActual.aspx.cs" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master"
    Inherits="Cuentas_Valuacion_Editores_SHF_UsoActual" %>

<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosUsoActualDistribucion.ascx"
    TagName="DatosDistribucion" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosUsoActualRecamaras.ascx" TagName="DatosRecamara"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosUsoActualPlantas.ascx" TagName="DatosPlantas"
    TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;
        var num_bloques_datos = 3;

        // Inicialización
        function setupForm() {
            var link = $get("ctl00_menu_Ctrl_usoActual_LkBtn")
            link.removeAttribute("href");
            link.setAttribute("class", "current");
            link.setAttribute("className", "current");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_uso_actual'));

            setupTablaRecamaras();
        }

        // Llenado de datos
        function fillData() {
            // Noop;
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosDistribucion();
            loadDatosRecamaras();
            loadDatosPlantas();
        }
        function loadDatosUsoActualDistribucion() {
            var callBackList = new Array();
            
            callBackList[0] = loadForm_Success;
            callBackList[1] = setDatosUsoActualDistribucion;
            
            loadDatosUsoActualDistribucionAync(idAvaluo, callBackList);
        }
        
        function loadDatosUsoActualRecamaras() {
            var callBackList = new Array();
        
            callBackList[0] = loadForm_Success;
            callBackList[1] = setDatosUsoActualRecamaras;

            loadDatosUsoActualRecamarasAync(idAvaluo, callBackList);
        }
        
        function loadDatosUsoActualPlantas() {
            var callBackList = new Array();
            
            callBackList[0] = loadForm_Success;
            callBackList[1] = setDatosUsoActualPlantas;
            
            loadDatosUsoActualPlantasAync(idAvaluo, callBackList);
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
            if (getVisibility($get("<%= guardar_uso_actual_ImBtn.ClientID %>")))
                saveUsoActual();
        }
        
        function saveUsoActual() {
            saveUsoActualAsync(
                idAvaluo
                , getDatosUsoActualDistribucion()
                , getDatosUsoActualRecamaras()
                , getDatosUsoActualPlanta()
                , saveUsoActual_Success()
             );
        }
        
        function saveUsoActual_Success() {
            terminateEdit("form_uso_actual",
                "<%= editar_uso_actual_ImBtn.ClientID %>",
                "<%= guardar_uso_actual_ImBtn.ClientID %>",
                "<%= cancelar_uso_actual_ImBtn.ClientID %>");
        }

    </script>

</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Services>
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
    <h1>
        Uso actual</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_uso_actual_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_uso_actual" class="formulario">
        <h2>
            Distribución</h2>
        <SIGEA:DatosDistribucion ID="distribucion_Ctrl" runat="server" />
        <h2>
            Recamaras
        </h2>
        <SIGEA:DatosRecamara ID="recamaras_Ctrl" runat="server" />
        <h2>
            Plantas
        </h2>
        <SIGEA:DatosPlantas ID="plantas_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_uso_actual_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_uso_actual_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
</asp:Content>