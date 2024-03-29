﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Documentos.aspx.cs" Inherits="Cuentas_Valuacion_Editores_SHF_Modulos_Documentos" %>

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
    
    <script type="text/javascript" src="../../../../../Scripts/Utils.js"></script>
    <script type="text/javascript">
        function loadDocumento(idDocumento, idArchivo, urlArchivo, titulo) {
            $get("<%= idDocumento_HF.ClientID %>").value = idDocumento;
            $get("<%= idArchivo_HF.ClientID %>").value = idArchivo;
            $get("<%= urlDocumento_HF.ClientID %>").value = urlArchivo;

            $get("<%= descripcion_TBox.ClientID %>").value = titulo;
            $get("<%= cancelar_ImBtn.ClientID %>").style.display = "inline";
            $get("<%= eliminar_ImBtn.ClientID %>").style.display = "inline";
            $get("<%= cambiarDocumento_Btn.ClientID %>").style.display = "inline";
            $get("<%= descargarDocumento_Btn.ClientID %>").style.display = "inline";
            $get("divFileUpload").style.display = "none";
        }

        function descargaArchivo() {
            window.open("../../../../../" + $get("<%= urlDocumento_HF.ClientID %>").value, "descargaDocumento",
                "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,copyhistory=no,width=200,height=300", true);
        }

        function setCambioArchivo() {
            $get("<%= cambiarDocumento_Btn.ClientID %>").style.display = "none";
            $get("<%= descargarDocumento_Btn.ClientID %>").style.display = "none";
            $get("divFileUpload").style.display = "block";
            $get("<%= cambioDocumento_HF.ClientID %>").value = "True";
        }

        function validarEliminacion() {
            var eliminar = confirm("¿Realmente desea eliminar el documento seleccionado?");
            if (eliminar) {
                callLoadingMode();
            }
            return eliminar;
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
                            <asp:DropDownList ID="tipo_DDList" runat="server" DataSourceID="tipoDocumento_DS"
                                DataTextField="descripcion" DataValueField="idTipoDocumentoAvaluo" AppendDataBoundItems="true">
                                <asp:ListItem Text="Seleccione..." Value="0" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
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
                
                <div style="margin: 5px; overflow: auto; height: 190px" class="contenedor">
                    <asp:DataList ID="documentos_View" runat="server" DataSourceID="documentos_DS" RepeatColumns="8"
                        RepeatDirection="Horizontal">
                        <ItemTemplate>                            
                            <div style="margin:5px">
                                <asp:ImageButton ID="dcumento_Ima" runat="server" ImageUrl="~/Images/Icons/Documento.gif"
                                    OnClientClick='<%# GetShowMethod((int)Eval("idDocumento"), (int)Eval("idArchivo"),
                                    Eval("urlDocumento").ToString(), Eval("titulo").ToString()) %>' />
                                <br />                            
                                <%# Eval("titulo") %>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
    </div>
    
    <asp:ObjectDataSource ID="documentos_DS" runat="server" SelectMethod="GetLista" TypeName="SIGEA.Classes.Entities.DocumentoAvaluo">
        <SelectParameters>
            <asp:ControlParameter ControlID="idAvaluo_HF" Name="idAvaluo" PropertyName="Value"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:LinqDataSource ID="tipoDocumento_DS" runat="server" 
        ContextTypeName="SIGEA.Classes.Entities.SIGEADataContext" 
        Select="new (idTipoDocumentoAvaluo, descripcion)" 
        TableName="TipoDocumentoAvaluo"
         OnContextCreating="SetupContext">
    </asp:LinqDataSource>
    
    <asp:HiddenField ID="idAvaluo_HF" runat="server" Value="0" />
    <asp:HiddenField ID="idDocumento_HF" runat="server" Value="0" />
    <asp:HiddenField ID="idArchivo_HF" runat="server" Value="0" />
    <asp:HiddenField ID="urlDocumento_HF" runat="server" Value="" />
    <asp:HiddenField ID="cambioDocumento_HF" runat="server" Value="True" />
    
    </form>
</body>
</html>
