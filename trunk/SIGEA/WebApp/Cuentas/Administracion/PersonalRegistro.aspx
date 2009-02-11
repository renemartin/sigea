<%@ Page Title="SIGEA - Datos del usuario personal" Language="C#" MasterPageFile="~/Cuentas/Administracion/Administracion.master"
    AutoEventWireup="true" CodeFile="PersonalRegistro.aspx.cs" Inherits="Cuentas_Administracion_PersonalRegistro" %>

<%@ Register Src="../../Controles/DatosUsuario.ascx" TagName="DatosUsuario" TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idPersonal = 0;

        // Databindings
        function getDatosPersonales() {
            var data = new Object();
            var fecha_alta = $get("<%= fechaAlta_TBox.ClientID %>").value;

            data["nombre"] = $get("<%= nombre_TBox.ClientID %>").value;
            data["fechaAlta"] = fecha_alta == "" ? null : getDate(fecha_alta);

            return data;
        }
        function setDatosPersonales(data) {
            $get("<%= nombre_TBox.ClientID %>").value = data["nombre"];
            setFechaAlta(data["fechaAlta"]);
        }
        function setFechaAlta(date) {
            $get("<%= fechaAlta_TBox.ClientID %>").value = getDateString(date);
        }

        // Guardar
        function savePersonal() {
            savePersonalAsync(
                idPersonal
                , getDatosPersonales()
                , getDatosUsuario()
                , savePersonal_Success
            );
        }
        function savePersonal_Success(id) {
            idPersonal = id;
            setControlsVisibility()
            setFechaAlta(new Date());
            showMessage("Datos guardados");
        }

        // Cargar
        function loadPersonal(key_id) {
            if (key_id != 0) {
                idPersonal = key_id;

                var callBackList = new Array();
                callBackList[0] = loadPersonal_Success;
                callBackList[1] = setDatosPersonales;
                callBackList[2] = setDatosUsuario;

                loadPersonalAsync(idPersonal, callBackList);
            }
            else {
                loadPersonal_Success();
            }
        }
        function loadPersonal_Success() {
            setControlsVisibility();
        }

        // Navegación
        function setControlsVisibility() {
            if (idPersonal != 0) {
                $get("ficha").style.display = "block";
            }
        }
    </script>

</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="Server">
    <asp:ScriptManager ID="scriptManager" runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Personal.js" />
        </Scripts>
    </asp:ScriptManager>
    <h1>
        Datos del usuario</h1>
    <div class="formulario">
        <table style="width: 100%">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td class="celdaTitulo">
                                Nombre:
                            </td>
                            <td class="celdaValor">
                                <asp:TextBox ID="nombre_TBox" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top">
                    <div id="ficha" style="display: none;">
                        Fecha de alta:
                        <br />
                        <asp:TextBox ID="fechaAlta_TBox" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>
        </table>
        <SIGEA:DatosUsuario ID="usuario_Ctrl" runat="server" />
        <div class="barraMenu">
            <asp:ImageButton ID="save_ImBtn" runat="server" SkinID="Save" />
        </div>
        <asp:ValidationSummary runat="server" />
    </div>
</asp:Content>
