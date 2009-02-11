<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AvaluoAsignacion.aspx.cs"
    Inherits="Cuentas_Valuacion_AvaluoAsignacion" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head runat="server">
    <title>SIGEA - Asignación de avalúo</title>
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
        function getEstadoInmuebleAvaluo() {
            getEstadoInmuebleAvaluoAsync(idAvaluo, getEstadoInmuebleAvaluo_Success);
        }
        function getEstadoInmuebleAvaluo_Success(estado) {
            claveEstado = estado.claveEstado;
            $get("<%= estado_Lbl.ClientID %>").innerHTML = estado.nombreEstado;
        }

        // Guardado de datos
        function saveAsignacionAvaluo() {
            saveAsignacionAvaluoAsync(
                idAvaluo
                , getDatosAsignacion()
                , saveAsignacionAvaluo_Success);
        }
        function saveAsignacionAvaluo_Success() {
            showMessage("Datos guardados");
            closeWindow();
        }

        // Eliminación
        function deleteAsignacionAvaluo() {
            if (requestConfirmation("¿Desea eliminar las asignaciones de este avalúo?"))
            {
                deleteAsignacionAvaluoAsync(idAvaluo, deleteAsignacionAvaluo_Success);
            }
        }
        function deleteAsignacionAvaluo_Success() {
            $get("<%= valuador_TBox.ClientID %>").value = "";
            $get("<%= controlador_TBox.ClientID %>").value = "";
            $get("<%= eliminar_ImBtn.ClientID %>").style.display = "none";
            
            showMessage("Asignaciones eliminadas");
        }
        
    </script>

    <div class="modulo">
        <div class="formulario">
            <div class="etiqueta1">
                <span class="textoNegritas">Filtro:</span> Estado de
                <asp:Label ID="estado_Lbl" runat="server" />
                &nbsp;y estados colindantes
            </div>
            <table class="tablaCompactaExtendida">
                <tr>
                    <td class="celdaTitulo">
                        Valuador asignado:
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="valuador_TBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        Controlador asignado:
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="controlador_TBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="barraMenu">
            <asp:ImageButton ID="guardar_ImBtn" runat="server" SkinID="Save" />
            <asp:ImageButton ID="eliminar_ImBtn" runat="server" SkinID="Delete" CssClass="hidden" />
        </div>
    </div>
    </form>
</body>
</html>
