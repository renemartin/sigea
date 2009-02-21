<%@ Page Title="SIGEA - Editor SHF - Construcciones" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Editores/SHF/EditorSHF.master"
    AutoEventWireup="true" CodeFile="Construcciones.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_Construcciones" %>

<%@ Register Src="~/Cuentas/Valuacion/Editores/SHF/EditorSHFNavegador.ascx" TagName="EditorSHFNavegador"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosConstrucciones.ascx" TagName="Construcciones"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosConstruccionesClasificacion.ascx"
    TagName="ConstruccionesClasificacion" TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosSuperficies.ascx" TagName="Superficies"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosCondominio.ascx" TagName="Condominio"
    TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;
        var num_bloques_datos = 6;

        // Inicialización
        function setupForm() {
            var link = $get("ctl00_menu_Ctrl_construcciones_LkBtn")
            link.removeAttribute("href");
            link.setAttribute("class", "current");
            link.setAttribute("className", "current");

            window.onbeforeunload = function() {
                beforeUnload(saveForm)
            };

            disableControls($get('form_construcciones'));
            disableControls($get('form_superficies'));
            disableControls($get('form_condominio'));

            setupTablaConstrucciones();
            setupTablaSuperficiesAdicionales("<%= condominio_Ctrl.SuperficiesConstruccionesID %>");
            setupTablaSuperficiesAdicionales("<%= condominio_Ctrl.SuperficiesObrasID %>");
        }

        // Llenado de datos
        function fillData() {
            fillConstruccionesData();
            fillConstruccionesClasificacionData();
            fillSuperficiesData();
            fillCondominiosData();
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosConstrucciones();
            loadDatosSuperficies();
            loadDatosCondominio();
        }
        function loadDatosConstrucciones() {
            var callBackList1 = new Array();
            callBackList1[0] = loadForm_Success;
            callBackList1[1] = setDatosConstrucciones;
            loadDatosConstruccionesAsync(idAvaluo, callBackList1);

            var callBackList2 = new Array();
            callBackList2[0] = loadForm_Success;
            callBackList2[1] = setDatosConstruccionesClasificacion;
            loadTiposConstruccionesAsync(idAvaluo, callBackList2);
        }
        function loadDatosSuperficies() {
            var callBackList = new Array();
            callBackList[0] = loadForm_Success;
            callBackList[1] = setDatosSuperficies;
            loadSuperficiesInmuebleAsync(idAvaluo, callBackList);
        }
        function loadDatosCondominio() {
            var callBackList1 = new Array();
            callBackList1[0] = loadForm_Success;
            callBackList1[1] = setDatosCondominio;
            callBackList1[2] = setDatosSuperficiesCondominio;
            loadDatosCondominioAsync(idAvaluo, callBackList1);

            var callBackList2 = new Array();
            callBackList2[0] = loadForm_Success;
            callBackList2[1] = setDatosSuperficiesCond;
            loadDatosSuperficiesCondominioAsync(idAvaluo, false, callBackList2);

            var callBackList3 = new Array();
            callBackList3[0] = loadForm_Success;
            callBackList3[1] = setDatosSuperficiesCondComp;
            loadDatosSuperficiesCondominioAsync(idAvaluo, true, callBackList3);
        }
        function setDatosSuperficiesCond(data) {
            setDatosSuperficiesAdicionales("<%= condominio_Ctrl.SuperficiesConstruccionesID %>", data);
        }
        function setDatosSuperficiesCondComp(data) {
            setDatosSuperficiesAdicionales("<%= condominio_Ctrl.SuperficiesObrasID %>", data);
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
            if (getVisibility($get("<%= guardar_construcciones_ImBtn.ClientID %>")))
                saveDatosConstrucciones();
            if (getVisibility($get("<%= guardar_superficies_ImBtn.ClientID %>")))
                saveSuperficies();
            if (getVisibility($get("<%= guardar_condominio_ImBtn.ClientID %>")))
                saveCondominio();
        }

        function saveDatosConstrucciones() {
            saveDatosConstruccionesAsync(
                idAvaluo
                , getDatosConstruccionesClasificacion()
                , getDatosConstrucciones()
                , saveDatosConstrucciones_Success);
        }
        function saveDatosConstrucciones_Success() {
            terminateEdit("form_construcciones",
                "<%= editar_construcciones_ImBtn.ClientID %>",
                "<%= guardar_construcciones_ImBtn.ClientID %>",
                "<%= cancelar_construcciones_ImBtn.ClientID %>");
        }

        function saveSuperficies() {
            saveSuperficiesInmuebleAsync(
                idAvaluo
                , getDatosSuperficies()
                , saveSuperficies_Success);
        }
        function saveSuperficies_Success() {
            terminateEdit("form_superficies",
                "<%= editar_superficies_ImBtn.ClientID %>",
                "<%= guardar_superficies_ImBtn.ClientID %>",
                "<%= cancelar_superficies_ImBtn.ClientID %>");
        }

        function saveCondominio() {
            saveDatosCondominioAsync(
                idAvaluo
                , getDatosCondominio()
                , getDatosSuperficiesCondominio()
                , getDatosSuperficiesAdicionales("<%= condominio_Ctrl.SuperficiesConstruccionesID %>")
                , getDatosSuperficiesAdicionales("<%= condominio_Ctrl.SuperficiesObrasID %>")
                , saveCondominio_Success);
        }
        function saveCondominio_Success() {
            terminateEdit("form_condominio",
                "<%= editar_condominio_ImBtn.ClientID %>",
                "<%= guardar_condominio_ImBtn.ClientID %>",
                "<%= cancelar_condominio_ImBtn.ClientID %>");
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
            <asp:ScriptReference Path="~/Scripts/Entities/Construcciones.js" />
        </Scripts>
    </asp:ScriptManager>
    <SIGEA:EditorSHFNavegador ID="EditorSHFNavegador1" runat="server" />
    <h1>
        Descripción de las construcciones
    </h1>
    <div class="etiqueta1">
        <span class="textoNegritas">Descripción de uso actual:</span>
        <asp:Label ID="descripcion_Lbl" runat="server">No especificada...</asp:Label>
    </div>
    <h2>
        Clasificación de las construcciones privativas</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_construcciones_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_construcciones" class="formulario">
        <SIGEA:ConstruccionesClasificacion ID="construccionesClasificacion_Ctrl" runat="server" />
        <hr />
        <h2>
            Datos generales de las construcciones</h2>
        <SIGEA:Construcciones ID="construcciones_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_construcciones_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_construcciones_ImBtn" runat="server" SkinID="Cancel"
            CssClass="hidden" />
    </div>
    <hr />
    <h2>
        Datos de superficies</h2>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_superficies_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_superficies" class="formulario">
        <SIGEA:Superficies ID="superficies_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_superficies_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_superficies_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
    <hr />
    <h1>
        Datos del condominio</h1>
    <div class="barraAcciones">
        <asp:ImageButton ID="editar_condominio_ImBtn" runat="server" SkinID="Edit" />
    </div>
    <div id="form_condominio" class="formulario">
        <SIGEA:Condominio ID="condominio_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_condominio_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_condominio_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
</asp:Content>
