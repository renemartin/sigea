<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosUsuario.ascx.cs"
    Inherits="Controles_DatosUsuario" %>

<script type="text/javascript">
    var idUsuario = 0;

    function getDatosUsuario() {
        var data = new Object();

        data["idUsuario"] = idUsuario;
        data["nombreUsuario"] = $get("<%= usuario_TBox.ClientID %>").value;
        data["password"] = $get("<%= password_TBox.ClientID %>").value;
        data["email"] = $get("<%= email_TBox.ClientID %>").value;
        
        data["roles"] = getRoles();

        return data;
    }
    function setDatosUsuario(data) {
        if (data == null)
            return;
            
        idUsuario = data["idUsuario"];
    
        $get("<%= usuario_TBox.ClientID %>").value = data["nombreUsuario"];
        $get("<%= password_TBox.ClientID %>").value = data["password"];
        $get("<%= passwordConfirm_TBox.ClientID %>").value = data["password"];
        $get("<%= email_TBox.ClientID %>").value = data["email"];        

        setRoles(data["roles"]);
    }

    function getRoles() {
        var roles = new Array();
        return roles;
    }
    function setRoles(roles) {
    }

</script>

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
