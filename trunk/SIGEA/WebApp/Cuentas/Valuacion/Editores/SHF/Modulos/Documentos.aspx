<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Documentos.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_Modulos_Documentos" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head id="Head1" runat="server">
    <title>SIGEA - Editor SHF - Documentos del avalúo</title>
    <base target="_self" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <div class="modulo">
        <br />
        <div class="formulario">
            <div>
                <span class="textoInstruccion">Seleccione un archivo para el documento y presione el
                    icono de guardar para cargarlo </span>
                <table>
                    <tr>
                        <td class="celdaTituloSec">
                            Archivo:
                        </td>
                        <td class="celdaValor">
                            <asp:Button ID="cambiarDocumento_Btn" runat="server" Text="Cambiar archivo" 
                                OnClientClick="setCambioArchivo(); return false;" CssClass="hidden" />
                            <asp:Button ID="descargarDocumento_Btn" runat="server" Text="Descargar" 
                                OnClientClick="descargaArchivo(); return false;" CssClass="hidden" />                                
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
                            <asp:DropDownList ID="tipo_DDList" runat="server" 
                                DataSourceID="tipoDocumento_DS" DataTextField="descripcion" 
                                DataValueField="idTipoDocumentoAvaluo"></asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <div class="barraMenu">
                    <asp:ImageButton ID="subir_ImBtn" runat="server" SkinID="Save" ToolTip="Subir documento"
                        OnClientClick="callLoadingMode();" OnClick="subir_ImBtn_Click" />&nbsp;
                    <asp:ImageButton ID="eliminar_ImBtn" runat="server" SkinID="Delete" ToolTip="Eliminar documento"
                        OnClientClick="return validarEliminacion();" OnClick="eliminar_ImBtn_Click" CssClass="hidden" />&nbsp;
                    <asp:ImageButton ID="cancelar_ImBtn" runat="server" SkinID="Cancel" ToolTip="Cancelar edición"
                        OnClick="cancelar_ImBtn_Click" CssClass="hidden" />&nbsp; 
                        <span id="modLoading" runat="server" class="hidden">
                            <img alt="" src="../../../../../Images/Cargando.gif" />
                        </span>
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
    </div>
    
    <asp:LinqDataSource ID="tipoDocumento_DS" runat="server" 
        ContextTypeName="SIGEA.Classes.Entities.SIGEADataContext" 
        Select="new (idTipoDocumentoAvaluo, descripcion)" 
        TableName="TipoDocumentoAvaluo">
    </asp:LinqDataSource>
    
    <asp:HiddenField ID="idAvaluo_HF" runat="server" Value="0" />
    <asp:HiddenField ID="idDocumento_HF" runat="server" Value="0" />
    <asp:HiddenField ID="urlDocumento_HF" runat="server" Value="" />
    <asp:HiddenField ID="cambioDocumento_HF" runat="server" Value="True" />
    
    </form>
</body>
</html>
