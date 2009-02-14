<%@ Page Title="SIGEA - Bandejas de avalúos" Language="C#" MasterPageFile="~/Cuentas/Valuacion/Valuacion.master"
    AutoEventWireup="true" CodeFile="Bandejas.aspx.cs" Inherits="Cuentas_Valuacion_Bandejas" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">          
        // Acciones
        //// Búsqueda por IDE
        function verificarExistenciaAvaluo() {
            var IDE = $get("<%= IDE_TBox.ClientID %>").value;

            verificarExistenciaAvaluoPorIDEAsync(IDE, verificarExistenciAvaluo_Success);
        }
        function verificarExistenciAvaluo_Success(result) {
            var exists = result[0];
            var idAvaluo = result[1];

            if (exists) {
                mostrarRegistroAvaluo(idAvaluo);
            }
            else {
                showMessage("El IDE especificado no fué encontrado");
            }
        }

        //// Cargar registro de avaluo
        function mostrarRegistroAvaluo(idAvaluo) {
            var result = openModalWindow("AvaluoRegistro.aspx?idAvaluo=" + idAvaluo, 400, 500);
            if (result != undefined) {
                recargarDatos();
            }
        }

        //// Cancelar avalúo
        function cancelarAvaluo(sender, idAvaluo) {
            if (requestConfirmation("¿Desea cancelar el avalúo especificado?")) {
                cancelarAvaluoAsync(sender, idAvaluo, cancelarAvaluo_Success);
            }
        }
        function cancelarAvaluo_Success(sender) {
            hideRow(sender);
            showMessage("Avalúo cancelado");
        }
        function hideRow(cellChild) {
            var row = cellChild.parentNode.parentNode;
            row.style.display = "none";
        }

        // Actualizacion
        function recargarDatos() {
            __doPostBack("'<%= avaluos_UpPanel.ClientID %>'", "");
        }
    </script>

</asp:Content>
<asp:Content ID="mainContent" ContentPlaceHolderID="main" runat="Server" EnableViewState="false">
    <asp:ScriptManager runat="server">
        <Services>
            <asp:ServiceReference Path="~/Services/EntityWrappers.asmx" />
        </Services>
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/Utils.js" />
            <asp:ScriptReference Path="~/Scripts/AsyncCalls.js" />
            <asp:ScriptReference Path="~/Scripts/Entities/Avaluos.js" />
        </Scripts>
    </asp:ScriptManager>
    <h1>
        Bandejas de avalúos inmobiliarios</h1>
    <table class="tablaExtendida">
        <tr>
            <td class="bandejas" valign="top">
                <div class="celdaHeader">
                    Bandejas
                </div>
                <asp:UpdatePanel ID="bandejas_UpPanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="noAsignados_LkBtn" runat="server">No asignados</asp:LinkButton>
                                </td>
                                <td>
                                    <asp:Label ID="noAsignados_Lbl" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="enProceso_LkBtn" runat="server">En proceso</asp:LinkButton>
                                </td>
                                <td>
                                    <asp:Label ID="enProceso_Lbl" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="enCorreccion_LkBtn" runat="server">En corrección</asp:LinkButton>
                                </td>
                                <td>
                                    <asp:Label ID="enCoreccion_Lbl" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="enRevision_LkBtn" runat="server">En revisión</asp:LinkButton>
                                </td>
                                <td>
                                    <asp:Label ID="enRevision_Lbl" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="completados_LkBtn" runat="server">Completados</asp:LinkButton>
                                </td>
                                <td>
                                    <asp:Label ID="completados_Lbl" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <asp:Timer ID="bandejasCount_Timer" runat="server" Interval="5000">
                        </asp:Timer>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
                <div class="panel">
                    <table class="tablaExtendida">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td class="celdaTitulo">
                                            IDE:
                                        </td>
                                        <td class="celdaValor">
                                            <asp:TextBox ID="IDE_TBox" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="search_ImBtn" runat="server" SkinID="Search" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="refresh_ImBtn" runat="server" SkinID="Refresh" />
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:UpdatePanel ID="avaluos_UpPanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="avaluos_GridView" runat="server" Width="100%" AllowPaging="True"
                            AutoGenerateColumns="False" PageSize="20" DataSourceID="bandejas_DS">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image ID="foto_Ima" runat="server" ImageUrl='<%# ValidateUrlFoto(Eval("urlFoto").ToString())%>'
                                            CssClass="foto" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="IDE" DataField="IDE" SortExpression="IDE" />
                                <asp:TemplateField HeaderText="Datos del inmueble" SortExpression="datosInmueble">
                                    <ItemTemplate>
                                        <span class="textoChico">
                                            <%# Eval("datosInmueble") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Fecha de alta" DataField="fechaAlta" SortExpression="fechaAlta"
                                    DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <img alt="Ver detalles" src="../../Images/Icons/Consultar.gif" class="botonImagen"
                                            onclick="mostrarRegistroAvaluo(<%# Eval("idAvaluo") %>);" />
                                        <img alt="Cancelar avalúo" src="../../Images/Icons/Eliminar.gif" class="botonImagen"
                                            onclick="cancelarAvaluo(this, <%# Eval("idAvaluo") %>);" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="sinDatos">
                                    <%# GetMensajeSinDatos() %>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="noAsignados_LkBtn" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="enProceso_LkBtn" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="enCorreccion_LkBtn" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="enRevision_LkBtn" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="completados_LkBtn" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="refresh_ImBtn" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:ObjectDataSource ID="bandejas_DS" runat="server" SelectMethod="GetBandeja" TypeName="SIGEA.Classes.Entities.Bandejas">
                    <SelectParameters>
                        <asp:SessionParameter Name="tipo" SessionField="tipoBandeja" Type="Object" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
