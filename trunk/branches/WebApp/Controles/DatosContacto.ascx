<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosContacto.ascx.cs"
    Inherits="Controles_DatosContacto" %>

<table>
    <tr>
        <td class="celdaTitulo">
            Telefono 1:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="telefono1_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <span class="subCampo">Ext.</span>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="ext1_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Telefono 2:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="telefono2_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <span class="subCampo">Ext:</span>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="ext2_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Fax:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="fax_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Celular:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="celular_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Nextel:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="nextel_TBox" runat="server"></asp:TextBox>
        </td>
        <td class="celdaValor">
            <span class="subCampo">Clave:</span>
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="claveNextel_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Email 1:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="email1_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Email 2:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="email2_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Messenger
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="messenger_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Skype:
        </td>
        <td class="celdaValor" colspan="3">
            <asp:TextBox ID="skype_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>

<script type="text/javascript">

    function Contacto() {

        // Inicialización
        Contacto.prototype.setData = setData;
        Contacto.prototype.getData = getData;
        Contacto.prototype.validate = validate;

        // Inicialización de validador
        this.controls = new Array(
            $get("<%= telefono1_TBox.ClientID %>")
        );
        this.validator = new ControlValidator(this.constructor);

        // Databindings
        function getData() {
            var data = new Object();

            data.telefono1 = $get("<%= telefono1_TBox.ClientID %>").value;
            data.extensionTel1 = $get("<%= ext1_TBox.ClientID %>").value;
            data.telefono2 = $get("<%= telefono2_TBox.ClientID %>").value;
            data.extensionTel2 = $get("<%= ext2_TBox.ClientID %>").value;
            data.fax = $get("<%= fax_TBox.ClientID %>").value;
            data.celular = $get("<%= celular_TBox.ClientID %>").value;
            data.nextel = $get("<%= nextel_TBox.ClientID %>").value;
            data.claveNextel = $get("<%= claveNextel_TBox.ClientID %>").value;
            data.email1 = $get("<%= email1_TBox.ClientID %>").value;
            data.email2 = $get("<%= email2_TBox.ClientID %>").value;
            data.messenger = $get("<%= messenger_TBox.ClientID %>").value;
            data.skype = $get("<%= skype_TBox.ClientID %>").value;

            return data;
        }

        function setData(data) {
            $get("<%= telefono1_TBox.ClientID %>").value = data.telefono1;
            $get("<%= ext1_TBox.ClientID %>").value = data.extensionTel1;
            $get("<%= telefono2_TBox.ClientID %>").value = data.telefono2;
            $get("<%= ext2_TBox.ClientID %>").value = data.extensionTel2;
            $get("<%= fax_TBox.ClientID %>").value = data.fax;
            $get("<%= celular_TBox.ClientID %>").value = data.celular;
            $get("<%= nextel_TBox.ClientID %>").value = data.nextel;
            $get("<%= claveNextel_TBox.ClientID %>").value = data.claveNextel;
            $get("<%= email1_TBox.ClientID %>").value = data.email1;
            $get("<%= email2_TBox.ClientID %>").value = data.email2;
            $get("<%= messenger_TBox.ClientID %>").value = data.messenger;
            $get("<%= skype_TBox.ClientID %>").value = data.skype;
        }

        // Validación
        function validate() {
            return this.validator.validate();
        }
    }

    this["<%= ID %>"] = new Contacto();
    
</script>