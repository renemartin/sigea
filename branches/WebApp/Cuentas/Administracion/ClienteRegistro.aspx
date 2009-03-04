<%@ Page Title="SIGEA - Datos del cliente" Language="C#" MasterPageFile="~/Cuentas/Administracion/Administracion.master"
    AutoEventWireup="true" CodeFile="ClienteRegistro.aspx.cs" Inherits="Cuentas_Administracion_ClienteRegistro" %>

<%@ Register Src="ClienteMenu.ascx" TagName="ClienteMenu" TagPrefix="SIGEA" %>
<%@ Register Src="../../Controles/DatosContacto.ascx" TagName="DatosContacto" TagPrefix="SIGEA" %>
<%@ Register Src="../../Controles/DatosDireccion.ascx" TagName="DatosDireccion" TagPrefix="SIGEA" %>
<%@ Register Src="../../Controles/DatosUsuario.ascx" TagName="DatosUsuario" TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idCliente = 0;
        var validator = null;

        // Databindings
        function getDatosPersonales() {
            var data = new Object();
            var fecha_alta = $get("<%= fechaAlta_TBox.ClientID %>").value;

            data["nombre"] = $get("<%= nombre_TBox.ClientID %>").value;
            data["paginaWeb"] = $get("<%= paginaWeb_TBox.ClientID %>").value;
            data["fechaAlta"] = fecha_alta == "" ? null : getDate(fecha_alta);

            return data;
        }
        function setDatosPersonales(data) {
            $get("<%= nombre_TBox.ClientID %>").value = data["nombre"];
            $get("<%= paginaWeb_TBox.ClientID %>").selectedValue = data["paginaWeb"];
            setFechaAlta(data["fechaAlta"]);
        }
        function setFechaAlta(date) {
            $get("<%= fechaAlta_TBox.ClientID %>").value = getDateString(date);
        }

        // Guardar
        function saveCliente() {
            if (validate()) {
                saveClienteAsync(
                    idCliente
                    , getDatosPersonales()
                    , contacto_Ctrl.getData()
                    , direccion_Ctrl.getData()
                    , usuario_Ctrl.getData()
                    , saveCliente_Success
                );
            }
            else {

                showMessage("El bloque de datos contiene campos inválidos");


            }
        }
        function saveCliente_Success(id) {
            idCliente = id;
            setControlsVisibility()
            setFechaAlta(new Date());
            showMessage("Datos guardados");
        }

        // Cargar
        function loadCliente(key_id) {
            if (key_id != 0) {
                idCliente = key_id;

                var callBackList = new Array();
                callBackList[0] = loadCliente_Success;
                callBackList[1] = setDatosPersonales;
                callBackList[2] = setDatosContacto;
                callBackList[3] = setDatosDireccion;
                callBackList[4] = setDatosUsuario;

                loadClienteAsync(idCliente, callBackList);
            }
            else {
                loadCliente_Success();
            }
        }
        function setDatosContacto(data) {
            contacto_Ctrl.setData(data);
        }
        function setDatosDireccion(data) {
            direccion_Ctrl.setData(data);
        }
        function setDatosUsuario(data) {
            usuario_Ctrl.setData(data);
        }
        function loadCliente_Success() {
            loadFotografia();
            fillClienteData();
            setControlsVisibility();
        }

        // Datos de controles
        function fillClienteData() {
            direccion_Ctrl.fillData();
        }

        // Navegación
        function setControlsVisibility() {
            if (idCliente != 0) {
                $get("ficha").style.display = "block";
                $get("menu").style.display = "block";
            }
        }

        // Fotografia del Cliente
        function loadFotografia() {
            getUrlFotoClienteAsync(idCliente, setFotografia);
        }
        function changeFotografia() {
            openModalWindow("ClienteLogo.aspx?idCliente=" + idCliente, 430, 300);
            loadFotografia();
        }
        function setFotografia(url) {
            if (url != "") {
                $get("foto").src = "../../" + url;
            }
        }

        // Validación
        function setupValidator() {
            var controls = new Array(
                $get("<%= nombre_TBox.ClientID %>")
            );
            validator = new ControlValidator(controls);
        }
        function validate() {
            var validated = true;
            if (validator == null || !validator.validate())
                validated = false;
            if (!contacto_Ctrl.validate())
                validated = false;
            if (!direccion_Ctrl.validate())
                validated = false;
            if (!usuario_Ctrl.validate())
                validated = false;

            return validated;
        }
    </script>

</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="Server">
    <asp:ScriptManager ID="scriptManager" runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/MethodCallers.asmx" />
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/DataFillers.js" />
            <asp:ScriptReference Path="~/Scripts/Validation.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Clientes.js" />
        </Scripts>
    </asp:ScriptManager>
    <h1>
        Datos del Cliente
    </h1>
    <div id="menu" style="display: none;">
        <SIGEA:ClienteMenu ID="menuCliente_Ctrl" runat="server" />
    </div>
    <div class="formulario">
        <h2>
            Datos personales</h2>
        <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
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
                        <tr>
                            <td class="celdaTitulo">
                                Pagina web:
                            </td>
                            <td class="celdaValor">
                                <asp:TextBox ID="paginaWeb_TBox" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <SIGEA:DatosContacto ID="contacto_Ctrl" runat="server" />
                </td>
                <td valign="top">
                    <div id="ficha" style="display: none;">
                        <div>
                            <img id="foto" class="foto" alt="Cambiar imagen" src="../../Images/NoDisponible.jpg"
                                style="cursor: pointer;" onclick="changeFotografia()" />
                        </div>
                        <br />
                        Fecha de alta:
                        <br />
                        <asp:TextBox ID="fechaAlta_TBox" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>
        </table>
        <h2>
            Datos de ubicación
        </h2>
        <SIGEA:DatosDireccion ID="direccion_Ctrl" runat="server" />
        <h2>
            Datos de usuario
        </h2>
        <SIGEA:DatosUsuario ID="usuario_Ctrl" runat="server" />
        <div class="barraMenu">
            <asp:ImageButton ID="save_ImBtn" runat="server" SkinID="Save" />
        </div>
        <asp:ValidationSummary runat="server" />
    </div>
</asp:Content>
