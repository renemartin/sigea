<%@ Page Title="SIGEA - Alta de avalúo" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Valuacion.master"
    AutoEventWireup="true" CodeFile="AvaluoAlta.aspx.cs" Inherits="Cuentas_Valuacion_AvaluoAlta" %>

<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosGeneralesAvaluo.ascx" TagName="DatosGeneralesAvaluo"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosSolicitante.ascx" TagName="DatosSolicitante"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosGeneralesInmueble.ascx" TagName="DatosGeneralesInmueble"
    TagPrefix="SIGEA" %>
<%@ Register Src="~/Cuentas/Valuacion/Controles/DatosPropietario.ascx" TagName="DatosPropietario"
    TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;
        var idValuador = null;

        // Modo
        function setModoPersonal() {
            showSeccionPromocion();
        }
        function setModoValuador(id) {
            idValuador = id;
        }

        // Guardar
        function saveAvaluo() {
            var validated = true;
            if (!datosAvaluo_Ctrl.validate())
                validated = false;
            if (!datosSolicitante_Ctrl.validate())
                validated = false;
            if (!datosInmueble_Ctrl.validate())
                validated = false;
            if (!datosPropietario_Ctrl.validate())
                validated = false;

            if (validated) {
                saveAvaluoInmuebleAsync(
                    idAvaluo
                    , datosAvaluo_Ctrl.getData()
                    , datosSolicitante_Ctrl.getData()
                    , datosInmueble_Ctrl.getData()
                    , datosPropietario_Ctrl.getData()
                    , saveAvaluo_Success
                );
            }
            else {
               
                    showMessage("El bloque de datos contiene campos inválidos");
            }
        }
        function saveAvaluo_Success(id) {
            idAvaluo = id;
            if (idValuador != null) {
                //TODO: Falta asignar automaticamente el valuador
                showMessage("Datos guardados");                
            }
            else {
                if (requestConfirmation("Datos guardados\n\n¿Desea establecer las asignaciones?")) {
                    openModalWindow("AvaluoAsignacion.aspx?idAvaluo=" + idAvaluo, 450, 180);
                }
            }
            window.location.href = "Bandejas.aspx";
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
            <asp:ScriptReference Path="~/Scripts/Validation.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Avaluos.js" />
        </Scripts>
    </asp:ScriptManager>
    <h1>
        Alta de avalúo inmobiliario</h1>
    <div class="formulario">
        <h2>
            Datos generales del avalúo</h2>
        <SIGEA:DatosGeneralesAvaluo ID="datosAvaluo_Ctrl" runat="server" />
        <h2>
            Datos del solicitante
        </h2>
        <SIGEA:DatosSolicitante ID="datosSolicitante_Ctrl" runat="server" />
        <h2>
            Datos del inmueble</h2>
        <SIGEA:DatosGeneralesInmueble ID="datosInmueble_Ctrl" runat="server" />
        <h2>
            Datos del propietario</h2>
        <SIGEA:DatosPropietario ID="datosPropietario_Ctrl" runat="server" />
        <div class="barraMenu">
            <asp:ImageButton ID="guardar_ImBtn" runat="server" SkinID="Save" />
        </div>
    </div>
</asp:Content>
