<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosUsuario.ascx.cs"
    Inherits="Controles_DatosUsuario" %>

<table>
    <tr>
        <td class="celdaTitulo">
            Usuario:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="usuario_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Contraseña:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="password_TBox" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:TextBox ID="passwordConfirm_TBox" runat="server" TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Email:
        </td>
        <td class="celdaValor">
            <asp:TextBox ID="email_TBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="celdaTitulo">
            Roles:
        </td>
        <td class="celdaValor">
            <asp:CheckBoxList ID="roles_ChkList" runat="server">
            </asp:CheckBoxList>
        </td>
    </tr>
</table>

<script type="text/javascript">

    function DatosUsuario() {
        
        this.idUsuario = 0;
        
        // Inicialización
        DatosUsuario.prototype.getData = getData;
        DatosUsuario.prototype.setData = setData;
        DatosUsuario.prototype.getRoles = getRoles;
        DatosUsuario.prototype.setRoles = setRoles;
        DatosUsuario.prototype.validate = validate;

        // Inicialización de validador
        this.controls = new Array(
            $get("<%= usuario_TBox.ClientID %>"),
            $get("<%= password_TBox.ClientID %>"),
            $get("<%= passwordConfirm_TBox.ClientID %>"),
            $get("<%= email_TBox.ClientID %>")
        );
        this.validator = new ControlValidator(this.controls);
        
        // Databindings
        function getData() {
            var data = new Object();

            data.idUsuario = this.idUsuario;
            data.nombreUsuario = $get("<%= usuario_TBox.ClientID %>").value;
            data.password = $get("<%= password_TBox.ClientID %>").value;
            data.email = $get("<%= email_TBox.ClientID %>").value;

            data.roles = this.getRoles();

            return data;
        }
        function setData(data) {
            if (data == null)
                return;

            this.idUsuario = data.idUsuario;

            $get("<%= usuario_TBox.ClientID %>").value = data.nombreUsuario;
            $get("<%= password_TBox.ClientID %>").value = data.password;
            $get("<%= passwordConfirm_TBox.ClientID %>").value = data.password;
            $get("<%= email_TBox.ClientID %>").value = data.email;

            this.setRoles(data.roles);
        }

        function getRoles() {
            var roles = new Array();
            return roles;
        }
        function setRoles(roles) {
        }

        // Validación
        function validate() {
            return this.validator.validate();
        }

    }

    this["<%= ID %>"] = new DatosUsuario();
    
</script>