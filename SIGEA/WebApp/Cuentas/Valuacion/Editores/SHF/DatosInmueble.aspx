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
        var num_bloques_datos = 2;

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

        // Llenado de datos
        function fillData() {
            fillInmuebleData();
            fillTerrenoData();
            fillTerrenoCallesData();
            fillDireccionData_Aux("<%= datosInmueble_Ctrl.DireccionID %>");
            fillDireccionData_Aux("<%= datosPropietario_Ctrl.DireccionID %>");
        }

        // Carga de registros
        function loadForm(key_id) {
            idAvaluo = key_id;

            loadDatosInmueble();
            loadDatosTerreno();
        }
        function loadDatosInmueble() {
            var callBackList = new Array();
            callBackList[0] = loadForm_Success;
            callBackList[1] = setDatosInmueble;
            callBackList[2] = setDatosUbicacionInmueble;
            callBackList[3] = setDatosDireccionInmueble;
            callBackList[4] = setDatosPropietario;
            callBackList[5] = setDatosDireccionPropietario;

            loadInmuebleAsync(idAvaluo, callBackList);
        }
        function setDatosDireccionInmueble(data) {
            setDatosDireccion_Aux("<%= datosInmueble_Ctrl.DireccionID %>", data);
        }
        function setDatosDireccionPropietario(data) {
            setDatosDireccion_Aux("<%= datosPropietario_Ctrl.DireccionID%>", data);
        }
        function loadDatosTerreno() {
            var callBackList = new Array();
            callBackList[0] = loadForm_Success;
            callBackList[1] = setDatosTerrenoCalles;
            callBackList[2] = setDatosTerreno;

            loadUbicacionInmuebleAsync(idAvaluo, callBackList);
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
            if (getVisibility($get("<%= guardar_inmueble_ImBtn.ClientID %>")))
                saveDatosInmueble();
            if (getVisibility($get("<%= guardar_terreno_ImBtn.ClientID %>")))
                saveDatosTerreno();
        }
        function saveDatosInmueble() {
            saveInmuebleAsync(
                idAvaluo
                , getDatosInmueble()
                , getDatosUbicacionInmueble()
                , getDatosDireccion("<%= datosInmueble_Ctrl.DireccionID %>")
                , getDatosPropietario()
                , getDatosDireccion_Aux("<%= datosPropietario_Ctrl.DireccionID%>")
                , saveDatosInmueble_Success);
        }
        function saveDatosInmueble_Success() {
            terminateEdit("form_inmueble",
                "<%= editar_inmueble_ImBtn.ClientID %>",
                "<%= guardar_inmueble_ImBtn.ClientID %>",
                "<%= cancelar_inmueble_ImBtn.ClientID %>");
        }

        function saveDatosTerreno() {
            saveUbicacionInmuebleAsync(
                idAvaluo
                , getDatosTerrenoCalles()
                , getDatosTerreno()
                , saveDatosTerreno_Success);
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
        <SIGEA:DatosGeneralesInmueble ID="datosInmueble_Ctrl" runat="server" />
        <h2>
            Datos del propietario</h2>
        <SIGEA:DatosPropietario ID="datosPropietario_Ctrl" runat="server" />
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
        <SIGEA:DatosTerrenoCalles ID="datosTerrenoCalles_Ctrl" runat="server" />
        <SIGEA:DatosTerreno ID="datosTerreno_Ctrl" runat="server" />
    </div>
    <div class="barraAcciones">
        <asp:ImageButton ID="guardar_terreno_ImBtn" runat="server" SkinID="Save" CssClass="hidden" />
        <asp:ImageButton ID="cancelar_terreno_ImBtn" runat="server" SkinID="Cancel" CssClass="hidden" />
    </div>
</asp:Content>
