<%@ Page Title="SIGEA - Datos del valuador" Language="C#" MasterPageFile="~/Cuentas/Administracion/Administracion.master"
    AutoEventWireup="true" CodeFile="ValuadorRegistro.aspx.cs" Inherits="Cuentas_Administracion_ValuadorRegistro"
    EnableViewState="false" %>

<%@ Register Src="ValuadorMenu.ascx" TagName="ValuadorMenu" TagPrefix="SIGEA" %>
<%@ Register Src="../../Controles/DatosContacto.ascx" TagName="DatosContacto" TagPrefix="SIGEA" %>
<%@ Register Src="../../Controles/DatosDireccion.ascx" TagName="DatosDireccion" TagPrefix="SIGEA" %>
<%@ Register Src="../../Controles/DatosUsuario.ascx" TagName="DatosUsuario" TagPrefix="SIGEA" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        // Variables
        var idValuador = 0;
        var validator = null;

        // Databindings
        function getDatosPersonales() {
            var data = new Object();
            var fecha_alta = $get("<%= fechaAlta_TBox.ClientID %>").value;

            data.nombre = $get("<%= nombre_TBox.ClientID %>").value;
            data.idTipoValuador = $get("<%= tipo_DDList.ClientID %>").value;
            data.nombreAsistente = $get("<%= nombreAsistente_TBox.ClientID %>").value;
            data.emailAsistente = $get("<%= emailAsistente_TBox.ClientID %>").value;
            data.externo = $get("<%= externo_CBox.ClientID %>").checked;
            data.fechaAlta = fecha_alta == "" ? null : getDate(fecha_alta);

            return data;
        }
        function setDatosPersonales(data) {
            $get("<%= nombre_TBox.ClientID %>").value = data.nombre;
            $get("<%= tipo_DDList.ClientID %>").selectedValue = data.idTipoValuador;
            $get("<%= nombreAsistente_TBox.ClientID %>").value = data.nombreAsistente;
            $get("<%= emailAsistente_TBox.ClientID %>").value = data.emailAsistente;
            $get("<%= externo_CBox.ClientID %>").checked = data.externo;
            setFechaAlta(data.fechaAlta);
        }
        function setFechaAlta(date) {
            $get("<%= fechaAlta_TBox.ClientID %>").value = getDateString(date);
        }

        // Guardar
        function saveValuador() {
            if (validate()) {
                saveValuadorAsync(
                    idValuador
                    , getDatosPersonales()
                    , contacto_Ctrl.getData()
                    , direccion_Ctrl.getData()
                    , usuario_Ctrl.getData()
                    , saveValuador_Success
                );
            }
            else {
                showMessage("El bloque de datos contiene campos inválidos");
            }
        }
        function saveValuador_Success(id) {
            idValuador = id;
            setControlsVisibility();
            setFechaAlta(new Date());

            showMessage("Datos guardados");
        }

        // Cargar
        function loadValuador(key_id) {
            if (key_id != 0) {
                idValuador = key_id;

                var callBackList = new Array();
                callBackList[0] = loadValuador_Success;
                callBackList[1] = setDatosPersonales;
                callBackList[2] = setDatosContacto;
                callBackList[3] = setDatosDireccion;
                callBackList[4] = setDatosUsuario;

                loadValuadorAsync(idValuador, callBackList);
            }
            else {
                loadValuador_Success();
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

        function loadValuador_Success() {
            loadFotografia();
            fillValuadorData();
            setControlsVisibility();
        }

        // Datos de controles
        function fillValuadorData() {
            fillTiposValuador("<%= tipo_DDList.ClientID %>");
            direccion_Ctrl.fillData();
        }

        // Navegación
        function setControlsVisibility() {
            if (idValuador != 0) {
                $get("ficha").style.display = "block";
                $get("menu").style.display = "block";
            }
        }

        // Fotografia del valuador
        function loadFotografia() {
            getUrlFotoValuadorAsync(idValuador, setFotografia);
        }
        function changeFotografia() {
            openModalWindow("ValuadorFoto.aspx?idValuador=" + idValuador, 430, 300);
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
                $get("<%= nombre_TBox.ClientID %>"),
                $get("<%= tipo_DDList.ClientID %>")
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
            <asp:ScriptReference Path="~/Scripts/Entities/Valuadores.js" />
        </Scripts>
    </asp:ScriptManager>
    <h1>
        Datos del valuador
    </h1>
    <div id="menu" style="display: none;">
        <SIGEA:ValuadorMenu ID="menuValuador_Ctrl" runat="server" />
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
                                Tipo:
                            </td>
                            <td class="celdaValor">
                                <asp:DropDownList ID="tipo_DDList" runat="server">
                                </asp:DropDownList>
                                &nbsp;
                                <asp:CheckBox ID="externo_CBox" runat="server" Text="Externo" />
                            </td>
                        </tr>
                    </table>
                    <SIGEA:DatosContacto ID="contacto_Ctrl" runat="server" />
                    <table>
                        <tr>
                            <td class="celdaTitulo">
                                Nombre asistente
                            </td>
                            <td class="celdaValor">
                                <asp:TextBox ID="nombreAsistente_TBox" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="celdaTitulo">
                                Email asistente
                            </td>
                            <td class="celdaValor">
                                <asp:TextBox ID="emailAsistente_TBox" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top">
                    <div id="ficha" style="display: none;">
                        <div>
                            <img id="foto" alt="Cambiar imagen" class="foto" src="../../Images/NoDisponible.jpg"
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
    </div>
</asp:Content>
