<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Planos.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_Modulos_Planos" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>

<head runat="server">
    <title>SIGEA - Editor SHF - Planos del avalúo</title>
    <base target="_self" />
</head>
<body>
    <form id="form1" runat="server">
    
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>

    <script type="text/javascript" src="../../../../../Scripts/Utils.js"></script>
    <script type="text/javascript">
        function loadPhoto(idPlano, idArchivo, idArchivoThumbnail, urlImagen, urlThumbnail, titulo) {
            $get("<%= idPlano_HF.ClientID %>").value = idPlano;
            $get("<%= idArchivo_HF.ClientID %>").value = idArchivo;
            $get("<%= idThumbnail_HF.ClientID %>").value = idArchivoThumbnail;
            $get("<%= urlImagen_HF.ClientID %>").value = urlImagen;
            $get("<%= urlThumbnail_HF.ClientID %>").value = urlThumbnail;
            $get("<%= cambioImagen_HF.ClientID %>").value = "";

            $get("<%= descripcion_TBox.ClientID %>").value = titulo;
            $get("<%= cancelar_ImBtn.ClientID %>").style.display = "inline";
            $get("<%= eliminar_ImBtn.ClientID %>").style.display = "inline";
            $get("<%= cambiarImagen_Btn.ClientID %>").style.display = "inline";
            $get("divFileUpload").style.display = "none";

            showPhoto(urlImagen);
        }

        function setCambioFoto() {
            $get("<%= cambiarImagen_Btn.ClientID %>").style.display = "none";
            $get("divFileUpload").style.display = "block";
            $get("<%= cambioImagen_HF.ClientID %>").value = "True";
        }

        function validarEliminacion() {
            var eliminar = confirm("¿Realmente desea eliminar el plano seleccionada?");
            if (eliminar) {
                callLoadingMode();
            }
            return eliminar;
        }

        function showPhoto(urlImagen) {
            var ima = $get("<%= imagen_Ima.ClientID %>")
            ima.src = "../../../../../" + urlImagen;
            ima.style.display = "block";

            window.scrollTo(0, 0);
        }

        function callLoadingMode() {
            setTimeout("setLoadingMode();", 100);
        }
        function setLoadingMode() {
            $get("modLoading").style.display = "inline";
            $get("<%= subir_ImBtn.ClientID %>").disabled = "disabled";
            $get("<%= eliminar_ImBtn.ClientID %>").disabled = "disabled";
        }        
    </script>

    <div class="modulo">
        <br />
        <div class="formulario">
            <div>
                <span class="textoInstruccion">Seleccione una imagen para el plano y presione el
                    icono de guardar para cargarla </span>
                <div class="foto" align="center">
                    <asp:Image ID="imagen_Ima" runat="server" Width="500px" CssClass="hidden" />
                </div>
                <table>
                    <tr>
                        <td class="celdaTituloSec">
                            Archivo:
                        </td>
                        <td class="celdaValor">
                            <asp:Button ID="cambiarImagen_Btn" runat="server" Text="Cambiar foto" 
                                OnClientClick="setCambioFoto(); return false;" CssClass="hidden" />
                            <div id="divFileUpload">
                                <asp:FileUpload ID="file_Fup" runat="server" Width="400px" />
                            </div>
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
                </table>
                <div class="barraMenu">
                    <asp:ImageButton ID="subir_ImBtn" runat="server" SkinID="Save" ToolTip="Subir imagne de plano"
                        OnClientClick="callLoadingMode();" OnClick="subir_ImBtn_Click" />&nbsp;
                    <asp:ImageButton ID="eliminar_ImBtn" runat="server" SkinID="Delete" ToolTip="Eliminar plano"
                        OnClientClick="return validarEliminacion();" OnClick="eliminar_ImBtn_Click" CssClass="hidden" />&nbsp;
                    <asp:ImageButton ID="cancelar_ImBtn" runat="server" SkinID="Cancel" ToolTip="Cancelar edición"
                        OnClick="cancelar_ImBtn_Click" CssClass="hidden" />&nbsp; <span id="modLoading" runat="server"
                            class="hidden">
                            <img alt="" src="../../../../../Images/Cargando.gif" />
                        </span>
                </div>
            </div>
            <div style="margin: 5px; overflow: auto; height: 230px" class="contenedor">
                <asp:DataList ID="planos_View" runat="server" DataSourceID="imagenes_DS" RepeatColumns="4"
                    RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="foto" style="margin: 5px;">
                            <div>
                                <asp:ImageButton ID="plano_Ima" runat="server" ImageUrl='<%# Eval("urlThumbnail", "../../../../../{0}") %>'
                                    OnClientClick='<%# GetShowMethod((int)Eval("idPlano"), (int)Eval("idArchivo"), (int)Eval("idArchivoThumbnail"), 
                                        Eval("urlImagen").ToString(), Eval("urlThumbnail").ToString(), Eval("titulo").ToString()) %>' />
                            </div>
                            <%# Eval("titulo") %>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
    <asp:ObjectDataSource ID="imagenes_DS" runat="server" SelectMethod="GetThumbnails" TypeName="SIGEA.Classes.Entities.PlanoInmueble">
        <SelectParameters>
            <asp:ControlParameter ControlID="idInmueble_HF" Name="idInmueble" PropertyName="Value"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:HiddenField ID="idInmueble_HF" runat="server" Value="0" />
    <asp:HiddenField ID="idPlano_HF" runat="server" Value="0" />
    <asp:HiddenField ID="idArchivo_HF" runat="server" Value="0" />
    <asp:HiddenField ID="idThumbnail_HF" runat="server" Value="0" />
    <asp:HiddenField ID="urlImagen_HF" runat="server" Value="" />
    <asp:HiddenField ID="urlThumbnail_HF" runat="server" Value="" />
    <asp:HiddenField ID="cambioImagen_HF" runat="server" Value="True" />
    
    </form>
</body>
</html>
