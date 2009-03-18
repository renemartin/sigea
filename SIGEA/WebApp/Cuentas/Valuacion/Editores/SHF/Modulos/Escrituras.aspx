<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Escrituras.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_Modulos_Escrituras" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head runat="server">
    <title>SIGEA - Editor SHF - Escrituras del avalúo</title>
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
            <asp:ScriptReference Path="~/Scripts/Validation.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Inmuebles.js" />
        </Scripts>
    </asp:ScriptManager>
    
    <script type="text/javascript">
        //Variables
        var idAvaluo = 0;
        var validator = null;

        // Databindings
        function getDatosEscrituras() {
            var data = new Object();
            var fecha = $get("<%= fecha_TBox.ClientID %>").value;

            data.numero = $get("<%= numero_TBox.ClientID %>").value;
            data.libro = $get("<%= libro_TBox.ClientID %>").value;
            data.volumen = $get("<%= volumen_TBox.ClientID %>").value;
            data.notario = $get("<%= notario_TBox.ClientID %>").value;
            data.notaria = $get("<%= notaria_TBox.ClientID %>").value;
            data.plaza = $get("<%= plaza_TBox.ClientID %>").value;
            data.fecha = fecha == "" ? null : getDate(fecha);
            return data;
        }
        function setDatosEscrituras(data) {
            if (data != null) {
                $get("<%= numero_TBox.ClientID %>").value = data.numero;
                $get("<%= libro_TBox.ClientID %>").value = data.libro;
                $get("<%= volumen_TBox.ClientID %>").value = data.volumen;
                $get("<%= notario_TBox.ClientID %>").value = data.notario;
                $get("<%= notaria_TBox.ClientID %>").value = data.notaria;
                $get("<%= plaza_TBox.ClientID %>").value = data.plaza;
                $get("<%= fecha_TBox.ClientID %>").value = getDateString(data.fecha);
            }
        }

        // Guardar
        function saveEscrituras() {
            if (validate()) {
                saveEscriturasAsync(
                    idAvaluo
                    , getDatosEscrituras()
                    , saveEscrituras_Success
                );
            }
            else {
                showMessage("El bloque de datos contiene campos inválidos");
            }
        }
        function saveEscrituras_Success() {
            showMessage("Datos guardados");
        }
        //Cargar
        function loadEscrituras(key_id) {
            idAvaluo = key_id;
            loadEscriturasAsync(idAvaluo, setDatosEscrituras);
        }


        // Validación
        function setupValidator() {
            var controls = new Array(
            $get("<%= numero_TBox.ClientID %>"),    // 0
            $get("<%= libro_TBox.ClientID %>"),     // 1
            $get("<%= volumen_TBox.ClientID %>"),   // 2
            $get("<%= notario_TBox.ClientID %>"),   // 3
            $get("<%= notaria_TBox.ClientID %>"),   // 4
            $get("<%= plaza_TBox.ClientID %>"),     // 5
            $get("<%= fecha_TBox.ClientID %>")      // 6
        );
            validator = new ControlValidator(controls);
        }
        function validate() {
            var validated = true;
            if (validator == null || !validator.validate())
                validated = false;
            return validated;
        } 
    </script>
    
    <div class="modulo">
        <br />
        <div class="formulario">
            <table>
                <tr>
                    <td class="celdaTitulo">
                        <asp:Label ID="numero_Lbl" runat="server" Text="Número de escritura:"></asp:Label>
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="numero_TBox" runat="server" MaxLength="25"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        <asp:Label ID="libro_Lbl" runat="server" Text="Libro:"></asp:Label>
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="libro_TBox" runat="server" MaxLength="10"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        <asp:Label ID="volumen_Lbl" runat="server" Text="Volumen:"></asp:Label>
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="volumen_TBox" runat="server" MaxLength="10"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        <asp:Label ID="notario_Lbl" runat="server" Text="Notario:"></asp:Label>
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="notario_TBox" runat="server" MaxLength="50"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        <asp:Label ID="notaria_Lbl" runat="server" Text="Notaría:"></asp:Label>
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="notaria_TBox" runat="server" MaxLength="30"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        <asp:Label ID="plaza_Lbl" runat="server" Text="Plaza:"></asp:Label>
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="plaza_TBox" runat="server" MaxLength="50"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="celdaTitulo">
                        <asp:Label ID="fecha_Lbl" runat="server" Text="Fecha:"></asp:Label>
                    </td>
                    <td class="celdaValor">
                        <asp:TextBox ID="fecha_TBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="barraMenu">
            <asp:ImageButton ID="save_ImBtn" runat="server" SkinID="Save" />
        </div>
    </div>
    </form>
</body>
</html>
