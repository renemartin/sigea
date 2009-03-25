<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Mapas.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_Modulos_Mapas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>SIGEA - Editor SHF - Mapas de geolocalización del inmueble</title>
    <base target="_self" />
</head>
<body>
    <form id="fomr1" runat="server">
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>

    <script type="text/javascript" src="../../../../../Scripts/Utils.js"></script>

    <script type="text/javascript">
        function callLoadingMode(esMacro) {
            setTimeout("setLoadingMode(" + esMacro + ");", 100);
        }
        function setLoadingMode(esMacro) {
            if (esMacro) {
                $get("modMacroLoading").style.display = "inline";
                $get("<%= subirMacro_ImBtn.ClientID %>").disabled = "disabled";
                if ($get("<%= eliminarMacro_ImBtn.ClientID %>") != null)
                    $get("<%= eliminarMacro_ImBtn.ClientID %>").disabled = "disabled";
            }
            else {
                $get("modMicroLoading").style.display = "inline";
                $get("<%= subirMicro_ImBtn.ClientID %>").disabled = "disabled";
                if ($get("<%= eliminarMicro_ImBtn.ClientID %>") != null)
                    $get("<%= eliminarMicro_ImBtn.ClientID %>").disabled = "disabled";
            }
        }
        function validarEliminacion(esMacro) {
            var eliminar = confirm("¿Realmente desea eliminar el mapa seleccionado?");
            if (eliminar) {
                callLoadingMode(esMacro);
            }
            return eliminar;
        }
        function editarGeoreferencias(){
            openModalWindow('Georeferencias.aspx?idAvaluo=<%= Page.Request.QueryString["idAvaluo"]%>', 550, 250);
            return false;
        }
    </script>

    <div class="modulo">
        <br />
        <div class="formulario">
            <div class="etiqueta1">
                <span class="textoNegritas">Georeferencias del inmueble:</span>
                <asp:Label ID="georeferencias_Lbl" CssClass="textoChico" runat="server" />
                &nbsp;
                <asp:ImageButton ID="editarGeoreferencias_ImBtn" runat="server" 
                    SkinID="Edit" ToolTip="Editar georeferencias" OnClientClick="editarGeoreferencias()" />
            </div>
            <div>
                <table>
                    <tr>
                        <td class="celdaTitulo" colspan="2">
                            Micro localización
                        </td>
                        <td class="celdaTitulo" colspan="2">
                            Macro localización
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 210px">
                            <div class="foto" align="center">
                                <asp:Image ID="mapaMicrolocalizacion_Ima" runat="server" />
                            </div>
                        </td>
                        <td colspan="2" style="height: 210px">
                            <div class="foto" align="center">
                                <asp:Image ID="mapaMacrolocalizacion_Ima" runat="server" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="celdaTituloSec">
                            Archivo:
                        </td>
                        <td class="celdaValor">
                            <asp:Button ID="cambiarMapaMicro_Btn" runat="server" Text="Cambiar mapa" OnClientClick="setCambioMapa(); return false;"
                                CssClass="hidden" />
                            <div id="divFileUploadMicro">
                                <asp:FileUpload ID="fileMicro_Fup" runat="server" Width="300px" />
                            </div>
                        </td>
                        <td class="celdaTituloSec">
                            Archivo:
                        </td>
                        <td class="celdaValor">
                            <asp:Button ID="cambiarMapaMacro_Btn" runat="server" Text="Cambiar mapa" OnClientClick="setCambioMapa(); return false;"
                                CssClass="hidden" />
                            <div id="divFileUploadMacro">
                                <asp:FileUpload ID="fileMacro_Fup" runat="server" Width="300px" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="barraMenu">
                                <asp:ImageButton ID="subirMicro_ImBtn" runat="server" SkinID="Save" ToolTip="Subir mapa micro localización"
                                    OnClientClick="callLoadingMode(false);" OnClick="subirMicro_ImBtn_Click" />&nbsp;
                                <asp:ImageButton ID="eliminarMicro_ImBtn" runat="server" SkinID="Delete" ToolTip="Eliminar mapa micro localización"
                                    OnClientClick="return validarEliminacion(false);" OnClick="eliminarMicro_ImBtn_Click" />&nbsp;
                                <span id="modMicroLoading" runat="server" class="hidden">
                                    <img alt="" src="../../../../../Images/Cargando.gif" />
                                </span>
                            </div>
                        </td>
                        <td colspan="2">
                            <div class="barraMenu">
                                <asp:ImageButton ID="subirMacro_ImBtn" runat="server" SkinID="Save" ToolTip="Subir mapa macro localización"
                                    OnClientClick="callLoadingMode(true);" OnClick="subirMacro_ImBtn_Click" />&nbsp;
                                <asp:ImageButton ID="eliminarMacro_ImBtn" runat="server" SkinID="Delete" ToolTip="Eliminar mapa macro localización"
                                    OnClientClick="return validarEliminacion(true);" OnClick="eliminarMacro_ImBtn_Click" />&nbsp;
                                <span id="modMacroLoading" runat="server" class="hidden">
                                    <img alt="" src="../../../../../Images/Cargando.gif" />
                                </span>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="idInmueble_HF" runat="server" Value="0" />
    <asp:HiddenField ID="idMapaMicro_HF" runat="server" Value="0" />
    <asp:HiddenField ID="idMapaMacro_HF" runat="server" Value="0" />
    <asp:HiddenField ID="idArchivoMicro_HF" runat="server" Value="0" />
    <asp:HiddenField ID="idArchivoMacro_HF" runat="server" Value="0" />
    <asp:HiddenField ID="URLMicro_HF" runat="server" Value="" />
    <asp:HiddenField ID="URLMacro_HF" runat="server" Value="" />
    </form>
</body>
</html>
