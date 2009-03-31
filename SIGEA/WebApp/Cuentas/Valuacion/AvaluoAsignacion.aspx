<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AvaluoAsignacion.aspx.cs"
    Inherits="Cuentas_Valuacion_AvaluoAsignacion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head runat="server">
    <title>SIGEA - Asignación de avalúo</title>
    <base target="_self" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Avaluos.js" />
        </Scripts>
    </asp:ScriptManager>

    <script type="text/javascript">
        // Variables
        var idAvaluo = 0;
        var claveEstado = null;

        // Databindings
        function getDatosAsignacion() {
            var data = new Object();

            data.nombreValuador = $get("<%= valuador_TBox.ClientID %>").value;
            data.nombreControlador = $get("<%= controlador_TBox.ClientID %>").value;

            return data;
        }
        function setDatosAsignacion(data) {
            if (data != null) {
                idValuador = data.idValuador;
                idControlador = data.idControlador;

                $get("<%= valuador_TBox.ClientID %>").value = data.nombreValuador;
                $get("<%= controlador_TBox.ClientID %>").value = data.nombreControlador;
                $get("<%= eliminar_ImBtn.ClientID %>").style.display = "inline";
            }
        }

        // Filtros
        function getEstadoInmuebleAvaluo() {
            getEstadoInmuebleAvaluoAsync(idAvaluo, getEstadoInmuebleAvaluo_Success);
        }
        function getEstadoInmuebleAvaluo_Success(estado) {
            claveEstado = estado.claveEstado;
            $get("<%= estado_Lbl.ClientID %>").innerHTML =
                "Estado de " + estado.nombreEstado + " y estados colindantes";

            $get("<%= valuador_TBox.ClientID %>").AutoCompleteBehavior.set_contextKey(claveEstado);
            $get("<%= controlador_TBox.ClientID %>").AutoCompleteBehavior.set_contextKey(claveEstado);
        }

        function agregarFiltro() {
            getEstadoInmuebleAvaluo();
            setVisibility($get("<%= removerFiltro_ImBtn.ClientID %>"), true, "inline");
            setVisibility($get("<%= agregarFiltro_ImBtn.ClientID %>"), false);
        }
        function removerFiltro() {
            $get("<%= estado_Lbl.ClientID %>").innerHTML = "No asignado";
            $get("<%= valuador_TBox.ClientID %>").AutoCompleteBehavior.set_contextKey("");
            $get("<%= controlador_TBox.ClientID %>").AutoCompleteBehavior.set_contextKey("");
            setVisibility($get("<%= agregarFiltro_ImBtn.ClientID %>"), true, "inline");
            setVisibility($get("<%= removerFiltro_ImBtn.ClientID %>"), false);
        }

        // Carga de datos
        function loadAsignacionAvaluo(id) {
            if (id != 0) {
                idAvaluo = id;
                loadAsignacionAvaluoAsync(idAvaluo, loadAsignacionAvaluo_Success);
            }
        }
        function loadAsignacionAvaluo_Success(data) {
            setDatosAsignacion(data);
        }

        // Guardado de datos
        function saveAsignacionAvaluo() {
            saveAsignacionAvaluoAsync(
                idAvaluo
                , getDatosAsignacion()
                , saveAsignacionAvaluo_Success);
        }
        function saveAsignacionAvaluo_Success(errors) {
            if (errors) {
                showMessage(errors);
            }
            else {
                showMessage("Datos guardados");
                window.returnValue = "recargar";
                closeWindow();
            }
        }

        // Eliminación
        function deleteAsignacionAvaluo() {
            if (requestConfirmation("¿Desea eliminar las asignaciones de este avalúo?")) {
                deleteAsignacionAvaluoAsync(idAvaluo, deleteAsignacionAvaluo_Success);
            }
        }
        function deleteAsignacionAvaluo_Success() {
            $get("<%= valuador_TBox.ClientID %>").value = "";
            $get("<%= controlador_TBox.ClientID %>").value = "";
            $get("<%= eliminar_ImBtn.ClientID %>").style.display = "none";

            showMessage("Asignaciones eliminadas");
            window.returnValue = "recargar";
        }
        
    </script>

    <div class="modulo">
        <br />
        <div class="formulario">
            <div class="etiqueta1">
                <span class="textoNegritas">Filtro:</span>
                <asp:Label ID="estado_Lbl" runat="server" />
                &nbsp;
                <asp:ImageButton ID="removerFiltro_ImBtn" runat="server" SkinID="DeleteSmall" ToolTip="Remover filtro" />
                <asp:ImageButton ID="agregarFiltro_ImBtn" runat="server" SkinID="SearchSmall" ToolTip="Agregar filtro"
                    CssClass="hidden" />
            </div>
            <table class="tablaCompactaExtendida">
                <tr>
                    <td class="celdaTitulo">
                        Valuador asignado:
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="valuador_TBox" runat="server"></asp:TextBox>
                        <cc1:AutoCompleteExtender ID="valuador_TBox_AutoCompleteExtender" runat="server"
                            TargetControlID="valuador_TBox" ServicePath="~/Services/MethodCallers.asmx" ServiceMethod="GetNombresValuadores"
                            CompletionInterval="500" FirstRowSelected="True" MinimumPrefixLength="0" UseContextKey="True"
                            ContextKey="">
                        </cc1:AutoCompleteExtender>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Controlador asignado:
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="controlador_TBox" runat="server"></asp:TextBox>
                        <cc1:AutoCompleteExtender ID="controlador_TBox_AutoCompleteExtender" runat="server"
                            TargetControlID="controlador_TBox" ServicePath="~/Services/MethodCallers.asmx"
                            ServiceMethod="GetNombresControladores" CompletionInterval="500" FirstRowSelected="True"
                            MinimumPrefixLength="0" UseContextKey="True" ContextKey="">
                        </cc1:AutoCompleteExtender>
                    </td>
                </tr>
            </table>
            <div class="textoInstruccion">
                Presione el icono de 
                <img alt="" src="../../Images/Icons/EliminarChico.gif" /> para autocompletar la 
                captura con los valuadores de todos los estados ó 
                <img alt="" src="../../Images/Icons/BuscarChico.gif" />
                para filtrar por el estado del inmueble
            </div>
        </div>
        <div class="barraMenu">
            <asp:ImageButton ID="guardar_ImBtn" runat="server" SkinID="Save" />
            <asp:ImageButton ID="eliminar_ImBtn" runat="server" SkinID="Delete" CssClass="hidden" />
        </div>
    </div>
    </form>
</body>
</html>
