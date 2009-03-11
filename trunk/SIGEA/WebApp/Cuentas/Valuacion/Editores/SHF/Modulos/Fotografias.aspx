<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fotografias.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_Modulos_Fotografias" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head runat="server">
    <title>SIGEA - Editor SHF - Fotografías del avalúo</title>
    <base target="_self" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>

    <script type="text/javascript" src="../../../../../Scripts/Utils.js"></script>
    <script type="text/javascript">
        function showPhoto(idFotografia, idArchivo, idArchivoThumbnail, urlFoto, titulo, principal) {
            $get("<%= idFotografia_HF.ClientID %>").value = idFotografia;
            $get("<%= idArchivo_HF.ClientID %>").value = idArchivo;
            $get("<%= idThumbnail_HF.ClientID %>").value = idArchivoThumbnail;
            $get("<%= descripcion_TBox.ClientID %>").value = titulo;
            $get("<%= principal_CBox.ClientID %>").checked = principal;
            $get("<%= eliminar_ImBtn.ClientID %>").style.display = "inline";
            
            var ima = $get("<%= foto_Ima.ClientID %>")
            ima.src = "../../../../../" + urlFoto;
            ima.style.display = "block";

            window.scrollTo(0, 0);
        }
    </script>

    <div class="modulo">
        <br />
        <div class="formulario">
            <div>
                <span class="textoInstruccion">Seleccione una imagen para el inmueble y presione el
                    icono de guardar para cargarla </span>
                <div class="foto" align="center">
                    <asp:Image ID="foto_Ima" runat="server" Width="350px" CssClass="hidden" />
                </div>
                <table>
                    <tr>
                        <td class="celdaTituloSec">
                            Archivo:
                        </td>
                        <td class="celdaValor">
                            <asp:FileUpload ID="file_Fup" runat="server" Width="400px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="celdaTituloSec">
                            Descripción:
                        </td>
                        <td class="celdaValor">
                            <asp:TextBox ID="descripcion_TBox" runat="server" Width="400px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="celdaTituloSec">
                            Tipo:
                        </td>
                        <td>
                            <asp:CheckBox ID="principal_CBox" runat="server" Text="Fotografía principal" />
                        </td>
                    </tr>
                </table>
                <div class="barraMenu">
                    <asp:ImageButton ID="subir_ImBtn" runat="server" SkinID="Save" ToolTip="Subir fotografía"
                        OnClick="subir_ImBtn_Click" />&nbsp;
                    <asp:ImageButton ID="eliminar_ImBtn" runat="server" SkinID="Delete" ToolTip="Eliminar fotografía"
                        OnClick="eliminar_ImBtn_Click" CssClass="hidden" />&nbsp;
                </div>
            </div>
            <div style="margin: 5px; overflow: auto; height: 230px" class="contenedor">
                <asp:DataList ID="fotos_View" runat="server" DataSourceID="fotos_DS" RepeatColumns="4"
                    RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="foto" style="margin: 5px;">
                            <div>
                                <asp:ImageButton ID="foto_Ima" runat="server" ImageUrl='<%# Eval("urlThumbnail", "../../../../../{0}") %>'
                                    OnClientClick='<%# GetShowMethod((int)Eval("idFotografia"), (int)Eval("idArchivo"), (int)Eval("idArchivoThumbnail"), 
                                        Eval("urlFoto").ToString(), Eval("titulo").ToString(), (bool)Eval("principal")) %>' />
                            </div>
                            <%# Eval("titulo") %>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
    <asp:ObjectDataSource ID="fotos_DS" runat="server" SelectMethod="GetThumbnails" TypeName="SIGEA.Classes.Entities.FotografiaInmueble">
        <SelectParameters>
            <asp:ControlParameter ControlID="idInmueble_HF" Name="idInmueble" PropertyName="Value"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="idInmueble_HF" runat="server" Value="0" />
    <asp:HiddenField ID="idFotografia_HF" runat="server" Value="0" />
    <asp:HiddenField ID="idArchivo_HF" runat="server" Value="0" />
    <asp:HiddenField ID="idThumbnail_HF" runat="server" Value="0" />
    </form>
</body>
</html>
