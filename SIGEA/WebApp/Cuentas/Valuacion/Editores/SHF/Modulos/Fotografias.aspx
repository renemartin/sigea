﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fotografias.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_Modulos_Fotografias" %>

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
        function loadPhoto(idFotografia, idArchivo, idArchivoThumbnail, urlFoto, urlThumbnail, titulo, principal) {
            $get("<%= idFotografia_HF.ClientID %>").value = idFotografia;
            $get("<%= idArchivo_HF.ClientID %>").value = idArchivo;
            $get("<%= idThumbnail_HF.ClientID %>").value = idArchivoThumbnail;
            $get("<%= urlFoto_HF.ClientID %>").value = urlFoto;
            $get("<%= urlThumbnail_HF.ClientID %>").value = urlThumbnail;
            $get("<%= cambioFoto_HF.ClientID %>").value = "";

            $get("<%= descripcion_TBox.ClientID %>").value = titulo;
            $get("<%= principal_CBox.ClientID %>").checked = principal;
            $get("<%= cancelar_ImBtn.ClientID %>").style.display = "inline";
            $get("<%= eliminar_ImBtn.ClientID %>").style.display = "inline";
            $get("<%= cambiarFoto_Btn.ClientID %>").style.display = "inline";
            $get("divFileUpload").style.display = "none";
            
            showPhoto(urlFoto);
        }

        function setCambioFoto() {
            $get("<%= cambiarFoto_Btn.ClientID %>").style.display = "none";
            $get("divFileUpload").style.display = "block";
            $get("<%= cambioFoto_HF.ClientID %>").value = "True";
        }

        function validarEliminacion() {
            var eliminar = confirm("¿Realmente desea eliminar la fotografía seleccionada?");
            if (eliminar) {
                callLoadingMode();
            }
            return eliminar;
        }

        function showPhoto(urlFoto) {
            var ima = $get("<%= foto_Ima.ClientID %>")
            ima.src = "../../../../../" + urlFoto;
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
                            <asp:Button ID="cambiarFoto_Btn" runat="server" Text="Cambiar foto" 
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
                        OnClientClick="callLoadingMode();" OnClick="subir_ImBtn_Click" />&nbsp;
                    <asp:ImageButton ID="eliminar_ImBtn" runat="server" SkinID="Delete" ToolTip="Eliminar fotografía"
                        OnClientClick="return validarEliminacion();" OnClick="eliminar_ImBtn_Click" CssClass="hidden" />&nbsp;
                    <asp:ImageButton ID="cancelar_ImBtn" runat="server" SkinID="Cancel" ToolTip="Cancelar edición"
                        OnClick="cancelar_ImBtn_Click" CssClass="hidden" />&nbsp; <span id="modLoading" runat="server"
                            class="hidden">
                            <img alt="" src="../../../../../Images/Cargando.gif" />
                        </span>
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
                                        Eval("urlFoto").ToString(), Eval("urlThumbnail").ToString(), Eval("titulo").ToString(), (bool)Eval("principal")) %>' />
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
    <asp:HiddenField ID="urlFoto_HF" runat="server" Value="" />
    <asp:HiddenField ID="urlThumbnail_HF" runat="server" Value="" />
    <asp:HiddenField ID="cambioFoto_HF" runat="server" Value="True" />
    
    </form>
</body>
</html>
